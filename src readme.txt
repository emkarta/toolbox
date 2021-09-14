This is the asm source code to Kirby's Pinball Land DX.

Build requirements:
-RGBDS - https://github.com/gbdev/rgbds
-exhal - https://github.com/devinacker/exhal

I had RGBDS in my PATH environment, but just plopped exhal/inhal into the project directory.

To build a DX rom:
1. Put an unmodified Kirby's Pinball Land (CRC32 of 31CB6526) called "kpl.gb" into this directory.
2. In a command prompt, run "./patch.bat palettehijack.asm".
If everything went well, kpl_palettehijack.gb will be created.