#include "gif.h"

extern void print_gif_picture_data(FILE *file, GifPicture *pic);

int main()
{
	Gif *gif = read_gif_file("pic.gif");

	FILE *out = fopen("pic.raw", "wb");
	print_gif_picture_data(out, gif->blocks[0]->pic);
	fclose(out);

	out = fopen("pic.pal", "wb");
	print_gif_palette(out, gif->screen->cmap);
	fclose(out);

	return 0;
}


/*
mrboom_libretro.retro_reset+10 - 0FB6 05 421AE168      - movzx eax,byte ptr [mrboom_libretro.dll+111A42] { (9) }
mrboom_libretro.retro_reset+17 - 57                    - push edi
mrboom_libretro.retro_reset+18 - 0FB6 15 431AE168      - movzx edx,byte ptr [mrboom_libretro.dll+111A43] { (11) }
mrboom_libretro.retro_reset+1F - 56                    - push esi
mrboom_libretro.retro_reset+20 - 0FB6 0D 441AE168      - movzx ecx,byte ptr [mrboom_libretro.dll+111A44] { (437061140) }
mrboom_libretro.retro_reset+27 - 53                    - push ebx

eax = 09
edx = 0b
ecx = 14
242c50


do
{
   matrixPalette[z / 3] = ((m.vgaPalette[z] * 4) << 16) | ((m.vgaPalette[z + 1] * 4) << 8) | (m.vgaPalette[z + 2] * 4);
   z += 3;
} while (z != NB_COLORS_PALETTE * 3);


mrboom_libretro.retro_reset+28 - BB ABAAAAAA           - mov ebx,AAAAAAAB { -1431655765 }
mrboom_libretro.retro_reset+2D - C1 E0 12              - shl eax,12 { 18 }
mrboom_libretro.retro_reset+30 - C1 E2 0A              - shl edx,0A { 10 }
mrboom_libretro.retro_reset+33 - C1 E1 02              - shl ecx,02 { 2 }
mrboom_libretro.retro_reset+36 - 09 D0                 - or eax,edx
mrboom_libretro.retro_reset+38 - 09 C8                 - or eax,ecx
mrboom_libretro.retro_reset+3A - B9 03000000           - mov ecx,00000003 { 3 }
mrboom_libretro.retro_reset+3F - A3 40C35769           - mov [mrboom_libretro.dll+87C340],eax { (00242C50) }
*/
