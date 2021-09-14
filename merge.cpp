#include <stdio.h>
#include <string.h>

static char out_buffer[16 * 0x100000];
static int out_buffer_ptr = 0;

static char temp_buffer[0x100000];

int main(int argc, char **argv)
{
	int merge_mode = 0;
	if(!strcmp(argv[2], "old")) merge_mode = 1;
	if(!strcmp(argv[2], "new")) merge_mode = 2;
	if(!strcmp(argv[2], "both")) merge_mode = 3;



	FILE *fp = fopen(argv[1], "r");
	int diff_mode = 0;

	while(!feof(fp)) {
		bool print = false;

		temp_buffer[0] = 0;
		fgets(temp_buffer, 0x100000, fp);

		switch(diff_mode) {
		case 0:
			if(strlen(temp_buffer) >= 7 && !strncmp(temp_buffer, "<<<<<<<", 7))
				diff_mode = 1;
			else
				print = true;
			break;


		case 1:
			if(strlen(temp_buffer) >= 7 && !strncmp(temp_buffer, "=======", 7))
				diff_mode = 2;

			else if(merge_mode == 1 || merge_mode == 3)
				print = true;
			break;


		case 2:
			if(strlen(temp_buffer) >= 7 && !strncmp(temp_buffer, ">>>>>>>", 7))
				diff_mode = 0;

			else if(merge_mode == 2 || merge_mode == 3)
				print = true;
			break;
		}


		if(print) {
			sprintf(out_buffer + out_buffer_ptr, "%s", temp_buffer);
			out_buffer_ptr += strlen(temp_buffer);
		}
	}

	fclose(fp);



	fp = fopen(argv[1], "wb");
	fwrite(out_buffer, 1, out_buffer_ptr, fp);
	fclose(fp);

	return 0;
}