# -*- coding: utf-8 -*-

# AwesomeTTS text-to-speech add-on for Anki
# Copyright (C) 2010-Present  Anki AwesomeTTS Development Team
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

"""
Service implementation for Wiktionary single word pronunciations
"""

import os
import re

from .base import Service
from .common import Trait

__all__ = ['Wiktionary']


RE_NONWORD = re.compile(r'\W+', re.UNICODE)
DEFINITE_ARTICLES = ['das', 'der', 'die', 'el', 'gli', 'i', 'il', 'l', 'la',
                     'las', 'le', 'les', 'lo', 'los', 'the']

TEXT_SPACE_LIMIT = 1
TEXT_LENGTH_LIMIT = 75


class Wiktionary(Service):
    """
    Provides a Service-compliant implementation for Wiktionary
    """

    __slots__ = [
    ]

    NAME = "Wiktionary"

    TRAITS = [Trait.INTERNET]

    # In order of size as of Nov 6 2016
    _LANGUAGE_CODES = {
        'en': 'English', 'mg': 'Malagasy', 'fr': 'French',
        'sh': 'Serbo-Croatian', 'es': 'Spanish', 'zh': 'Chinese',
        'ru': 'Russian', 'lt': 'Lithuanian', 'de': 'German',
        'nl': 'Dutch', 'sv': 'Swedish', 'pl': 'Polish',
        'ku': 'Kurdish', 'el': 'Greek', 'it': 'Italian',
        'ta': 'Tamil', 'tr': 'Turkish', 'hu': 'Hungarian',
        'fi': 'Finnish', 'ko': 'Korean', 'io': 'Ido',
        'kn': 'Kannada', 'vi': 'Vietnamese', 'ca': 'Catalan',
        'pt': 'Portuguese', 'chr': 'Cherokee', 'sr': 'Serbian',
        'hi': 'Hindi', 'ja': 'Japanese', 'hy': 'Armenian',
        'ro': 'Romanian', 'no': 'Norwegian', 'th': 'Thai',
        'ml': 'Malayalam', 'id': 'Indonesian', 'et': 'Estonian',
        'uz': 'Uzbek', 'li': 'Limburgish', 'my': 'Burmese',
        'or': 'Oriya', 'te': 'Telugu',
    }

    def desc(self):
        """
        Returns a short, static description.
        """

        return "Wiktionary single word translations"

    def options(self):
        """
        Provides access to different language versions of Wiktionary.
        """

        return [
            dict(
                key='voice',
                label="Voice",
                values=[(code, name)
                        for code, name in sorted(self._LANGUAGE_CODES.items(),
                                                 key=lambda x: x[1])],
                transform=lambda x: x,
                test_default='en'
            ),
        ]

    def modify(self, text):
        """
        Remove punctuation but leave case as-is (sometimes it matters).

        If the input is multiple words and the first word is a definite
        article, drop it.
        """

        text = RE_NONWORD.sub('_', text).replace('_', ' ').strip()

        tokenized = text.split(' ', 1)
        if len(tokenized) == 2:
            first, rest = tokenized
            if first in DEFINITE_ARTICLES:
                return rest

        return text

    def run(self, text, options, path):
        """
        Downloads from Wiktionary directly to an OGG, and then
        converts to MP3.

        Many words (and all phrases) are not listed on Wiktionary.
        Thus, this will fail often.
        """

        if text.count(' ') > TEXT_SPACE_LIMIT:
            raise IOError("Wiktionary does not support phrases")
        elif len(text) > TEXT_LENGTH_LIMIT:
            raise IOError("Wiktionary only supports short input")

        # Execute search using the text *as is* (i.e. no lowercasing) so that
        # Wiktionary can pick the best page (i.e. decide whether case matters)
        webpage = self.net_stream(
            (
                'https://%s.wiktionary.org/w/index.php' % options['voice'],
                dict(
                    search=text,
                    title='Special:Search',
                ),
            ),
            require=dict(mime='text/html'),
        ).decode()

        # Now parse the page, looking for the ogg file.  This will
        # find at most one match, as we expect there to be no more
        # than one pronunciation on the wiktionary page for any
        # given word.  This is sometimes violated if the word has
        # multiple pronunciations, but since there is no trivial
        # way to choose between them, this should be good enough
        # for now.
        matcher = re.search(r'"(//upload.wikimedia.org/[^"]+\.ogg)"', webpage)

        if not matcher:
            raise IOError("Wiktionary doesn't have any audio for this input.")

        ogg_url = "https:" + matcher.group(1)
        mp3_url = ogg_url.replace('/commons/', '/commons/transcoded/') + \
                  '/' + os.path.basename(ogg_url) + '.mp3'

        self.net_download(path, mp3_url,
                          require=dict(mime='audio/mpeg', size=1024))
