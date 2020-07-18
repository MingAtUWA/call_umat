#include "stdafx.h"

#include <iostream>

extern "C"
{
	int _cdecl FACT(int n);
	void __cdecl PYTHAGORAS(float a, float b, float *c);
}

void test_call_fortran_dll()
{
	int res = FACT(7);
	std::cout << "func res: " << res << std::endl;

	float res_f;
	PYTHAGORAS(30, 40, &res_f);
	std::cout << "subrou res: " << res_f << std::endl;
}