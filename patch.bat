@echo off

:: For this to work, open the asm with this and make sure the rom is called "kpl.gb".
:: Oh, and rgbds is expected to be defined in your PATH environment.


echo Assembling specified file...
rgbasm -o ".\%~n1.obj" %1
echo Patching kpl.gb...
rgblink -O kpl.gb -o ".\kpl_%~n1.gb" ".\%~n1.obj"
echo Compressing modded gfx into specified file...
::BACKGROUND/MIDDLE SLOT
:: Intro/title gfx
inhal ./modded_bg/bg00.2bpp kpl_%~n1.gb 0x1CBC8
inhal ./modded_bg/bg01.2bpp kpl_%~n1.gb 0x1C630
:: Kracko bonus stage gfx
inhal ./modded_bg/bg11.2bpp kpl_%~n1.gb 0x1E302
:: Whispy stage top Kirbys
inhal ./modded_bg/bg18.2bpp kpl_%~n1.gb 0x0E6E3
:: Whispy stage Kirby slot image
inhal ./modded_bg/bg21.2bpp kpl_%~n1.gb 0x0EF86
::Whispy stage bottom Kirbys
inhal ./modded_bg/bg23.2bpp kpl_%~n1.gb 0x284EF
:: Kracko stage middle Kirby
::Did the -fast argument on bg28 because the game loaded it improperly for some reason if done without
inhal -fast ./modded_bg/bg28.2bpp kpl_%~n1.gb 0x16F1B
inhal ./modded_bg/bg29.2bpp kpl_%~n1.gb 0x16C00
::Kracko stage bottom Kirbys
inhal ./modded_bg/bg31.2bpp kpl_%~n1.gb 0x1314E
::Poppy stage middle Kirbys
inhal ./modded_bg/bg36.2bpp kpl_%~n1.gb 0x1622E
::poppy stage Mr. Frosty
inhal ./modded_bg/bg38.2bpp kpl_%~n1.gb 0x32E8B
::Poppy stage bottom Kirbys
inhal ./modded_bg/bg39.2bpp kpl_%~n1.gb 0x32AB6
::SPRITE SLOT
inhal ./modded_spr/spr03.2bpp kpl_%~n1.gb 0x0EA92
inhal ./modded_spr/spr06.2bpp kpl_%~n1.gb 0x0DD71
inhal ./modded_spr/spr08.2bpp kpl_%~n1.gb 0x11F47
inhal ./modded_spr/spr10.2bpp kpl_%~n1.gb 0x12C69
inhal ./modded_spr/spr11.2bpp kpl_%~n1.gb 0x16691
inhal ./modded_spr/spr13.2bpp kpl_%~n1.gb 0x14C9E
inhal ./modded_spr/spr14.2bpp kpl_%~n1.gb 0x15905
inhal ./modded_spr/spr15.2bpp kpl_%~n1.gb 0x325E9
inhal ./modded_spr/spr16.2bpp kpl_%~n1.gb 0x1F842
inhal ./modded_spr/spr19.2bpp kpl_%~n1.gb 0x28000
echo Fixing the new rom's checksum...
rgbfix -f gh ".\kpl_%~n1.gb"