; MIT License
;
; Copyright (c) 2018 Raymond Velasquez
;
; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:
;
; The above copyright notice and this permission notice shall be included in all
; copies or substantial portions of the Software.
;
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
; SOFTWARE.

#SingleInstance force

APPID=DontCloseMyIM
VERSION=1.0.0
GoSub, MENU

; if ESC is pressed in an Lync/Skype chat window, ask for confirmation
#IfWinActive ahk_class LyncConversationWindowClass
Escape::
    OPTIONS := (4+32+8192)
    ;  4   = Yes/No
    ; 32   = Question Icon
    ; 8192 = Task Modal
    MsgBox, % OPTIONS, Confirmation, Do you want to close this conversation?
    IfMsgBox, Yes
        Send, {ESC}
Return
#IfWinActive

MENU:
    Menu,Tray,DeleteAll
    Menu,Tray,NoStandard
    Menu,Tray,Add,&About %APPID%,About
    Menu,Tray,Add
    Menu,Tray,Add,E&xit,EXIT
Return

EXIT:
    ExitApp
Return

About:
    Gui -SysMenu
    Gui, Add, Text, x66 y7 w150 h28, %APPID%
    Gui, Add, Picture, x6 y7 w50 h50 , %A_ScriptDir%\%APPID%.exe
    Gui, Add, Text, x66 y27 w160 h20 , Version %VERSION%
    Gui, Add, Button, x160 y90 w50 h20 default , OK
    Gui, Font, underline
    Gui, Add, Text, x66 y47 w160 h20 cBlue gLaunchWebsite,https://supermamon.com
    Gui, Font, normal
    Gui, Add, Text, x66 y67 w50 h20 , Icon from
    Gui, Font, underline
    Gui, Add, Text, x116 y67 w90 h20 cBlue gIconSite, https://icons8.com
    Gui, Show, h120 w220, About %APPID%
Return

GuiClose:
GuiEscape:
ButtonOK:
    Gui, Destroy
RETURN

LaunchWebsite:
    Run, https://supermamon.com
Return

IconSite:
    Run, https://icons8.com
Return
