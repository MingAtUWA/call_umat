#ifndef __Constitutive_Model_Type_H__
#define __Constitutive_Model_Type_H__

enum class ConstitutiveModelType : unsigned short
{
	InvalidType = 0,
	LinearElasticity = 1,
	ModifiedCamClay  = 2,
	SandHypoplasticityFromUMAT = 3
};

#endif