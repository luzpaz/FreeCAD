# -*- coding: utf-8 -*-
# AddonManager gui init module
# (c) 2001 Jürgen Riegel
# License LGPL

import AddonManager
import AddonManager_rc

FreeCADGui.addLanguagePath(":/translations")
FreeCADGui.addCommand('Std_AddonMgr', AddonManager.CommandAddonManager())
