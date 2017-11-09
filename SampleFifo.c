#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>

// Simple FIFO reading example 
int main (int argc, char * argv[])
{
        int fd = 0;
        char str[2];

        // Create FIFO + read
        mkfifo("/tmp/myfifo", 0666);
        fd = open("/tmp/morpho-suspend-fifo", O_RDONLY);
        printf("FIFO created\n");
        for(;;)
        {
                memset((void *)str,0,sizeof(str));
                read(fd,str,sizeof(str));
                printf("%s", str);
                sleep(1);
        }

        close(fd);

        unlink("/tmp/morpho-suspend-fifo");

        return EXIT_SUCCESS;
}
