#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <wait.h>
#include "header.h"

int main (){
	pid_t process_id = fork();

	if (process_id == FORK_ERROR){
		perror("Error fork");
		return EXIT_FAILURE;
	}

	if (process_id == CHILD_ID){
		execl("/bin/cat", "cat", "long_text", NULL);
		perror("Error exec");
		return EXIT_FAILURE;
	}

	process_id = wait(NULL);
	if (process_id == FORK_ERROR){
		perror("Error wait");
		return EXIT_FAILURE;
	}

	printf ("I am parent\n");

	return EXIT_SUCCESS;
}

