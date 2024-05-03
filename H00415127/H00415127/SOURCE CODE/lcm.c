#include <stdio.h>
#include <assert.h>
#include <stdint.h>
extern int findLCM(int64_t x, int64_t y, int64_t big);

int main() {
	/* we are using the assert function to get this into assembly and we are giving values ourselves to check the assembly and so we have taken few scenarios to check its working*/
	assert(findLCM(4, 12, 12) == 12); 
    	assert(findLCM(2, 8, 8) == 8);
    	assert(findLCM(10, 20, 20) == 20);
    	assert(findLCM(20, 10, 20) == 20);
    	assert(findLCM(50, 5, 50) == 50);
    	printf("findLCM OK\n");
	
	return 0;
}



