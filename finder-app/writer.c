#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

#define EXIT_FAILURE 1
#define EXIT_SUCCESS 0

void w_str_in_file(const char *file_path, const char *str)
{
    FILE *file = fopen(file_path, "w");
    // check if the file is opend correctly, or path doesn't exist!
    if (file == NULL)
    {
        syslog(LOG_ERR, "Failed to open file: %s", file_path);
        return;
    }
    // File opened successfully.
    fprintf(file, "%s", str);
    // Close file
    fclose(file);

    syslog(LOG_DEBUG, "Writing \"%s\" to %s", str, file_path);
}

int main(int argc, char *argv[])
{
    openlog("writer", LOG_PID | LOG_CONS | LOG_NDELAY, LOG_USER);

    if (argc < 3)
    {
        syslog(LOG_ERR, "Invalid arguments number. Usage: writer <file> <str>");
        closelog();
        // return 1 as indication to an error has occured
        return 1;
    }

    const char *file_path = argv[1];
    const char *str = argv[2];

    w_str_in_file(file_path, str);

    closelog();
    return 0;
}