# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file './syntax_settings.ui'
#
# Created by: PyQt5 UI code generator 5.14.2
#
# WARNING! All changes made in this file will be lost!


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_Dialog(object):
    def setupUi(self, Dialog):
        Dialog.setObjectName("Dialog")
        Dialog.setWindowModality(QtCore.Qt.ApplicationModal)
        Dialog.resize(814, 903)
        self.gridLayout = QtWidgets.QGridLayout(Dialog)
        self.gridLayout.setObjectName("gridLayout")
        self.verticalLayout = QtWidgets.QVBoxLayout()
        self.verticalLayout.setObjectName("verticalLayout")
        self.wid_shortcut = QtWidgets.QWidget(Dialog)
        self.wid_shortcut.setObjectName("wid_shortcut")
        self.gridLayout_4 = QtWidgets.QGridLayout(self.wid_shortcut)
        self.gridLayout_4.setObjectName("gridLayout_4")
        self.horizontalLayout_2 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_2.setObjectName("horizontalLayout_2")
        self.lab_shortcut = QtWidgets.QLabel(self.wid_shortcut)
        self.lab_shortcut.setObjectName("lab_shortcut")
        self.horizontalLayout_2.addWidget(self.lab_shortcut)
        self.le_shortcut = QtWidgets.QLineEdit(self.wid_shortcut)
        self.le_shortcut.setObjectName("le_shortcut")
        self.horizontalLayout_2.addWidget(self.le_shortcut)
        self.gridLayout_4.addLayout(self.horizontalLayout_2, 0, 0, 1, 1)
        self.verticalLayout.addWidget(self.wid_shortcut)
        self.cb_showPreCode = QtWidgets.QCheckBox(Dialog)
        self.cb_showPreCode.setObjectName("cb_showPreCode")
        self.verticalLayout.addWidget(self.cb_showPreCode)
        self.cb_center = QtWidgets.QCheckBox(Dialog)
        self.cb_center.setObjectName("cb_center")
        self.verticalLayout.addWidget(self.cb_center)
        self.cb_usecss = QtWidgets.QCheckBox(Dialog)
        self.cb_usecss.setObjectName("cb_usecss")
        self.verticalLayout.addWidget(self.cb_usecss)
        self.wid_css = QtWidgets.QWidget(Dialog)
        self.wid_css.setObjectName("wid_css")
        self.gridLayout_3 = QtWidgets.QGridLayout(self.wid_css)
        self.gridLayout_3.setObjectName("gridLayout_3")
        self.verticalLayout_6 = QtWidgets.QVBoxLayout()
        self.verticalLayout_6.setObjectName("verticalLayout_6")
        self.horizontalLayout_9 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_9.setObjectName("horizontalLayout_9")
        spacerItem = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout_9.addItem(spacerItem)
        self.cb_one_class_per_style = QtWidgets.QCheckBox(self.wid_css)
        self.cb_one_class_per_style.setObjectName("cb_one_class_per_style")
        self.horizontalLayout_9.addWidget(self.cb_one_class_per_style)
        spacerItem1 = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout_9.addItem(spacerItem1)
        self.verticalLayout_6.addLayout(self.horizontalLayout_9)
        self.horizontalLayout_3 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_3.setObjectName("horizontalLayout_3")
        spacerItem2 = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout_3.addItem(spacerItem2)
        self.pb_edit_css_file = QtWidgets.QPushButton(self.wid_css)
        self.pb_edit_css_file.setObjectName("pb_edit_css_file")
        self.horizontalLayout_3.addWidget(self.pb_edit_css_file)
        spacerItem3 = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout_3.addItem(spacerItem3)
        self.verticalLayout_6.addLayout(self.horizontalLayout_3)
        self.horizontalLayout_8 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_8.setObjectName("horizontalLayout_8")
        spacerItem4 = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout_8.addItem(spacerItem4)
        self.pb_updateTemplates = QtWidgets.QPushButton(self.wid_css)
        self.pb_updateTemplates.setObjectName("pb_updateTemplates")
        self.horizontalLayout_8.addWidget(self.pb_updateTemplates)
        spacerItem5 = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout_8.addItem(spacerItem5)
        self.verticalLayout_6.addLayout(self.horizontalLayout_8)
        self.gridLayout_3.addLayout(self.verticalLayout_6, 0, 0, 1, 1)
        self.verticalLayout.addWidget(self.wid_css)
        self.cb_linenum = QtWidgets.QCheckBox(Dialog)
        self.cb_linenum.setObjectName("cb_linenum")
        self.verticalLayout.addWidget(self.cb_linenum)
        self.cb_remove_leading_spaces = QtWidgets.QCheckBox(Dialog)
        self.cb_remove_leading_spaces.setObjectName("cb_remove_leading_spaces")
        self.verticalLayout.addWidget(self.cb_remove_leading_spaces)
        self.horizontalLayout_7 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_7.setObjectName("horizontalLayout_7")
        self.lab_Font = QtWidgets.QLabel(Dialog)
        self.lab_Font.setObjectName("lab_Font")
        self.horizontalLayout_7.addWidget(self.lab_Font)
        self.lab_Font_selected = QtWidgets.QLabel(Dialog)
        self.lab_Font_selected.setObjectName("lab_Font_selected")
        self.horizontalLayout_7.addWidget(self.lab_Font_selected)
        self.pb_setFont = QtWidgets.QPushButton(Dialog)
        self.pb_setFont.setObjectName("pb_setFont")
        self.horizontalLayout_7.addWidget(self.pb_setFont)
        self.pb_resetFont = QtWidgets.QPushButton(Dialog)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Minimum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.pb_resetFont.sizePolicy().hasHeightForWidth())
        self.pb_resetFont.setSizePolicy(sizePolicy)
        self.pb_resetFont.setMaximumSize(QtCore.QSize(100, 16777215))
        self.pb_resetFont.setObjectName("pb_resetFont")
        self.horizontalLayout_7.addWidget(self.pb_resetFont)
        self.verticalLayout.addLayout(self.horizontalLayout_7)
        self.horizontalLayout_5 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_5.setObjectName("horizontalLayout_5")
        self.lab_style = QtWidgets.QLabel(Dialog)
        self.lab_style.setObjectName("lab_style")
        self.horizontalLayout_5.addWidget(self.lab_style)
        self.lab_style_selected = QtWidgets.QLabel(Dialog)
        self.lab_style_selected.setObjectName("lab_style_selected")
        self.horizontalLayout_5.addWidget(self.lab_style_selected)
        self.pb_setstyle = QtWidgets.QPushButton(Dialog)
        self.pb_setstyle.setObjectName("pb_setstyle")
        self.horizontalLayout_5.addWidget(self.pb_setstyle)
        self.verticalLayout.addLayout(self.horizontalLayout_5)
        self.horizontalLayout_6 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_6.setObjectName("horizontalLayout_6")
        self.label_3 = QtWidgets.QLabel(Dialog)
        self.label_3.setObjectName("label_3")
        self.horizontalLayout_6.addWidget(self.label_3)
        self.ql_deflang = QtWidgets.QLabel(Dialog)
        self.ql_deflang.setText("")
        self.ql_deflang.setObjectName("ql_deflang")
        self.horizontalLayout_6.addWidget(self.ql_deflang)
        self.pb_setDefLang = QtWidgets.QPushButton(Dialog)
        self.pb_setDefLang.setObjectName("pb_setDefLang")
        self.horizontalLayout_6.addWidget(self.pb_setDefLang)
        self.verticalLayout.addLayout(self.horizontalLayout_6)
        self.cb_defaultlangperdeck = QtWidgets.QCheckBox(Dialog)
        self.cb_defaultlangperdeck.setObjectName("cb_defaultlangperdeck")
        self.verticalLayout.addWidget(self.cb_defaultlangperdeck)
        self.wid_deckdefaults = QtWidgets.QWidget(Dialog)
        self.wid_deckdefaults.setObjectName("wid_deckdefaults")
        self.gridLayout_2 = QtWidgets.QGridLayout(self.wid_deckdefaults)
        self.gridLayout_2.setObjectName("gridLayout_2")
        self.verticalLayout_3 = QtWidgets.QVBoxLayout()
        self.verticalLayout_3.setObjectName("verticalLayout_3")
        self.label_2 = QtWidgets.QLabel(self.wid_deckdefaults)
        self.label_2.setObjectName("label_2")
        self.verticalLayout_3.addWidget(self.label_2)
        self.horizontalLayout = QtWidgets.QHBoxLayout()
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.verticalLayout_4 = QtWidgets.QVBoxLayout()
        self.verticalLayout_4.setObjectName("verticalLayout_4")
        spacerItem6 = QtWidgets.QSpacerItem(20, 40, QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Expanding)
        self.verticalLayout_4.addItem(spacerItem6)
        self.pb_deck_def_add = QtWidgets.QPushButton(self.wid_deckdefaults)
        self.pb_deck_def_add.setMaximumSize(QtCore.QSize(50, 16777215))
        self.pb_deck_def_add.setObjectName("pb_deck_def_add")
        self.verticalLayout_4.addWidget(self.pb_deck_def_add)
        self.pb_deck_def_del = QtWidgets.QPushButton(self.wid_deckdefaults)
        self.pb_deck_def_del.setMaximumSize(QtCore.QSize(50, 16777215))
        self.pb_deck_def_del.setObjectName("pb_deck_def_del")
        self.verticalLayout_4.addWidget(self.pb_deck_def_del)
        spacerItem7 = QtWidgets.QSpacerItem(20, 40, QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Expanding)
        self.verticalLayout_4.addItem(spacerItem7)
        self.horizontalLayout.addLayout(self.verticalLayout_4)
        self.lw_deckdefaults = QtWidgets.QListWidget(self.wid_deckdefaults)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.lw_deckdefaults.sizePolicy().hasHeightForWidth())
        self.lw_deckdefaults.setSizePolicy(sizePolicy)
        self.lw_deckdefaults.setObjectName("lw_deckdefaults")
        self.horizontalLayout.addWidget(self.lw_deckdefaults)
        self.verticalLayout_3.addLayout(self.horizontalLayout)
        self.gridLayout_2.addLayout(self.verticalLayout_3, 1, 0, 1, 1)
        self.verticalLayout.addWidget(self.wid_deckdefaults)
        self.wid_favs = QtWidgets.QWidget(Dialog)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Preferred, QtWidgets.QSizePolicy.Preferred)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.wid_favs.sizePolicy().hasHeightForWidth())
        self.wid_favs.setSizePolicy(sizePolicy)
        self.wid_favs.setObjectName("wid_favs")
        self.gridLayout_5 = QtWidgets.QGridLayout(self.wid_favs)
        self.gridLayout_5.setObjectName("gridLayout_5")
        self.verticalLayout_2 = QtWidgets.QVBoxLayout()
        self.verticalLayout_2.setObjectName("verticalLayout_2")
        self.label_5 = QtWidgets.QLabel(self.wid_favs)
        self.label_5.setObjectName("label_5")
        self.verticalLayout_2.addWidget(self.label_5)
        self.horizontalLayout_4 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_4.setObjectName("horizontalLayout_4")
        self.verticalLayout_5 = QtWidgets.QVBoxLayout()
        self.verticalLayout_5.setObjectName("verticalLayout_5")
        spacerItem8 = QtWidgets.QSpacerItem(20, 40, QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Expanding)
        self.verticalLayout_5.addItem(spacerItem8)
        self.pb_up = QtWidgets.QPushButton(self.wid_favs)
        self.pb_up.setMaximumSize(QtCore.QSize(50, 16777215))
        self.pb_up.setObjectName("pb_up")
        self.verticalLayout_5.addWidget(self.pb_up)
        self.pb_down = QtWidgets.QPushButton(self.wid_favs)
        self.pb_down.setMaximumSize(QtCore.QSize(50, 16777215))
        self.pb_down.setObjectName("pb_down")
        self.verticalLayout_5.addWidget(self.pb_down)
        self.pb_add = QtWidgets.QPushButton(self.wid_favs)
        self.pb_add.setMaximumSize(QtCore.QSize(50, 16777215))
        self.pb_add.setObjectName("pb_add")
        self.verticalLayout_5.addWidget(self.pb_add)
        self.pb_delete = QtWidgets.QPushButton(self.wid_favs)
        self.pb_delete.setMaximumSize(QtCore.QSize(50, 16777215))
        self.pb_delete.setObjectName("pb_delete")
        self.verticalLayout_5.addWidget(self.pb_delete)
        spacerItem9 = QtWidgets.QSpacerItem(20, 40, QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Expanding)
        self.verticalLayout_5.addItem(spacerItem9)
        self.horizontalLayout_4.addLayout(self.verticalLayout_5)
        self.lw_favs = QtWidgets.QListWidget(self.wid_favs)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)
        sizePolicy.setHorizontalStretch(1)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.lw_favs.sizePolicy().hasHeightForWidth())
        self.lw_favs.setSizePolicy(sizePolicy)
        self.lw_favs.setObjectName("lw_favs")
        self.horizontalLayout_4.addWidget(self.lw_favs)
        self.verticalLayout_2.addLayout(self.horizontalLayout_4)
        self.gridLayout_5.addLayout(self.verticalLayout_2, 0, 0, 1, 1)
        self.verticalLayout.addWidget(self.wid_favs)
        self.gridLayout.addLayout(self.verticalLayout, 2, 0, 1, 1)
        self.buttonBox = QtWidgets.QDialogButtonBox(Dialog)
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtWidgets.QDialogButtonBox.Cancel|QtWidgets.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName("buttonBox")
        self.gridLayout.addWidget(self.buttonBox, 3, 0, 1, 1)

        self.retranslateUi(Dialog)
        self.buttonBox.accepted.connect(Dialog.accept)
        self.buttonBox.rejected.connect(Dialog.reject)
        QtCore.QMetaObject.connectSlotsByName(Dialog)

    def retranslateUi(self, Dialog):
        _translate = QtCore.QCoreApplication.translate
        Dialog.setWindowTitle(_translate("Dialog", "Anki Add-on: Syntax Highlighting Settings"))
        self.lab_shortcut.setText(_translate("Dialog", "shortcut"))
        self.cb_showPreCode.setText(_translate("Dialog", "show unformatted (<pre>, <code>)"))
        self.cb_center.setText(_translate("Dialog", "center"))
        self.cb_usecss.setText(_translate("Dialog", "use css"))
        self.cb_one_class_per_style.setText(_translate("Dialog", "different css class for each style"))
        self.pb_edit_css_file.setText(_translate("Dialog", "Edit css file in media folder"))
        self.pb_updateTemplates.setText(_translate("Dialog", "Select Templates to update"))
        self.cb_linenum.setText(_translate("Dialog", "show line numbers"))
        self.cb_remove_leading_spaces.setText(_translate("Dialog", "remove leading spaces if possible"))
        self.lab_Font.setText(_translate("Dialog", "Font"))
        self.lab_Font_selected.setText(_translate("Dialog", "default - unset"))
        self.pb_setFont.setText(_translate("Dialog", "Select Font"))
        self.pb_resetFont.setText(_translate("Dialog", "Reset Font"))
        self.lab_style.setText(_translate("Dialog", "Style: "))
        self.lab_style_selected.setText(_translate("Dialog", "needs to be configured"))
        self.pb_setstyle.setText(_translate("Dialog", "Change"))
        self.label_3.setText(_translate("Dialog", "Default Language"))
        self.pb_setDefLang.setText(_translate("Dialog", "Select Default Language"))
        self.cb_defaultlangperdeck.setText(_translate("Dialog", "defaultlangperdeck"))
        self.label_2.setText(_translate("Dialog", "Default Language per Deck"))
        self.pb_deck_def_add.setText(_translate("Dialog", "Add"))
        self.pb_deck_def_del.setText(_translate("Dialog", "Delete"))
        self.label_5.setText(_translate("Dialog", "Favorite Languages"))
        self.pb_up.setText(_translate("Dialog", "Up"))
        self.pb_down.setText(_translate("Dialog", "Down"))
        self.pb_add.setText(_translate("Dialog", "Add"))
        self.pb_delete.setText(_translate("Dialog", "Del"))
