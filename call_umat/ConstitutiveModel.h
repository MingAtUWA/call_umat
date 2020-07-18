#ifndef __Constitutive_Model_H__
#define __Constitutive_Model_H__

#include "ConstitutiveModelType.h"

class ConstitutiveModel;
typedef int (*__Constitutive_Model_Integration_Func__)(ConstitutiveModel *_self, double dstrain[6]);

class ConstitutiveModelList;

class ConstitutiveModel
{
public:
	typedef __Constitutive_Model_Integration_Func__ CMIntFunc;

	ConstitutiveModelType type;

	union // stress
	{
		double stress[6];
		struct { double s11, s22, s33, s12, s23, s31; };
	};
	union // stress increment
	{
		double dstress[6];
		struct { double ds11, ds22, ds33, ds12, ds23, ds31; };
	};
	union // elastic strain increment
	{
		double dstrain_e[6];
		struct { double dee11, dee22, dee33, dee12, dee23, dee31; };
	};
	union // plastic strain increment
	{
		double dstrain_p[6];
		struct { double dep11, dep22, dep33, dep12, dep23, dep31; };
	};
	union // Elastic stiffness
	{
		double De_mat[6][6];
		double De_mat_array[36];
	};
	union // Elasto-plastic stiffness
	{
		double Dep_mat[6][6];
		double Dep_mat_array[36];
	};

	CMIntFunc integration_func;
	
	ConstitutiveModel(CMIntFunc _inte_func = nullptr,
		ConstitutiveModelType _type = ConstitutiveModelType::InvalidType):
		integration_func(_inte_func), type(_type) {}
	~ConstitutiveModel() {}

	inline int integrate(double dstrain[6]) { return (*integration_func)(this, dstrain); }
	
	inline const double *get_stress(void)    noexcept { return stress; }
	inline const double *get_dstress(void)   noexcept { return dstress; }
	inline const double *get_dstrain_e(void) noexcept { return dstrain_e; }
	inline const double *get_dstrain_p(void) noexcept { return dstrain_p; }
	inline const double *get_De_mat(void)  noexcept { return De_mat_array; }
	inline const double *get_Dep_mat(void) noexcept { return Dep_mat_array; }

// pointer to external data
public:
	union
	{
		void *ext_data;
		unsigned long long ext_data_ull;
		long long ext_data_ll;
		double ext_data_d;
	};

protected:
	friend ConstitutiveModelList;
	ConstitutiveModel *next;
};

class ConstitutiveModelList
{
protected:
	ConstitutiveModel *head;
	size_t num;

public:
	ConstitutiveModelList() : head(nullptr), num(0) {}
	~ConstitutiveModelList() { reset(); }
	inline void reset(void) { head = nullptr; num = 0; }
	inline void add_cm(ConstitutiveModel &cm)
	{
		cm.next = head;
		head = &cm;
		++num;
	}
	inline size_t get_num(void) { return num; }
	inline ConstitutiveModel *first(void) { return head; }
	inline ConstitutiveModel *next(ConstitutiveModel *cm) { return cm->next; }
};

#endif