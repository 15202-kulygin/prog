#include <stdlib.h>
#include <time.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

#include "header.h"

int main() {
    if (putenv("TZ=:America/Los_Angeles") != PUTENV_ERROR) { // /usr/share/zoneinfo
        perror("Set TZ error");
        return EXIT_FAILURE;
    }
    //tzset();

    time_t rawtime = 0;
    if (time(&rawtime) == TIME_ERROR) {
        perror("Retrieve the calendar time error");
        return EXIT_FAILURE;
    }

    char *strTime = ctime(&rawtime); //equivalent to asctime(localtime(t))
    if(strTime == NULL) {
        fprintf(stderr, "Cannot convert time to string\n");
        return EXIT_FAILURE;
    }

    printf("Current local time and date in California: %s", strTime);

    return EXIT_SUCCESS;
}

//struct tm {
//    int tm_sec;         /* seconds */
//    int tm_min;         /* minutes */
//    int tm_hour;        /* hours */
//    int tm_mday;        /* day of the month */
//    int tm_mon;         /* month */
//    int tm_year;        /* year */
//    int tm_wday;        /* day of the week */
//    int tm_yday;        /* day in the year */
//    int tm_isdst;       /* daylight saving time */
//};

