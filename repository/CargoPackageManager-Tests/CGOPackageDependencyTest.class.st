Class {
	#name : #CGOPackageDependencyTest,
	#superclass : #CGOTest,
	#category : 'CargoPackageManager-Tests-Model'
}

{ #category : #accessing }
CGOPackageDependencyTest class >> resources [
	^ #()
]

{ #category : #'tests-accessing' }
CGOPackageDependencyTest >> testCanCreateDependencyFromNonScopedPackage [
	| dependency |
	dependency := CGOPackageDependency on: #Package.
	
	self 
		assert: dependency targetedPackage 
		equals: 'Package'.
	self assert: dependency scope isNil
]

{ #category : #'tests-accessing' }
CGOPackageDependencyTest >> testCanCreateDependencyFromScopedPackage [
	| dependency |
	dependency := CGOPackageDependency on: #Project::Package.
	
	self 
		assert: dependency targetedPackage 
		equals: 'Package'.
	self 
		assert: dependency scope
		equals: 'Project'
]

{ #category : #'tests-creation' }
CGOPackageDependencyTest >> testCreateDependencyFromCollectionOfContstraintsShouldCreateSeveralConstraints [

	| dependency |
	dependency := CGOPackageDependency newFrom: #A -> #('=1.1.1' '=1.1.2' '=1.1.3').
	self assert: dependency constraints size equals: 3
]

{ #category : #'tests-creation' }
CGOPackageDependencyTest >> testCreateDependencyFromExactFeatureDependencyNumberShouldHaveFixedVersionConstraint [

	| dependency |
	dependency := CGOPackageDependency newFrom: #A -> #('=1.1').
	
	self assert: dependency constraints first isFixed
]

{ #category : #'tests-creation' }
CGOPackageDependencyTest >> testCreateDependencyFromExactFeatureDependencyNumberShouldSucceed [

	CGOPackageDependency newFrom: #A -> #('=1.1')
]

{ #category : #'tests-creation' }
CGOPackageDependencyTest >> testCreateDependencyFromExactMajorDependencyNumberShouldHaveFixedVersionConstraint [

	| dependency |
	dependency := CGOPackageDependency newFrom: #A -> #('=1').
	
	self assert: dependency constraints first isFixed
]

{ #category : #'tests-creation' }
CGOPackageDependencyTest >> testCreateDependencyFromExactMajorDependencyNumberShouldSucceed [

	CGOPackageDependency newFrom: #A -> #('=1')
]

{ #category : #'tests-creation' }
CGOPackageDependencyTest >> testCreateDependencyFromExactPatchDependencyNumberShouldHaveFixedVersionConstraint [

	| dependency |
	dependency := CGOPackageDependency newFrom: #A -> #('=1.1.1').
	
	self assert: dependency constraints first isFixed
]

{ #category : #'tests-creation' }
CGOPackageDependencyTest >> testCreateDependencyFromExactPatchDependencyNumberShouldSucceed [

	CGOPackageDependency newFrom: #A -> #('=1.1.1')
]

{ #category : #'tests-accessing' }
CGOPackageDependencyTest >> testCreateDependencyFromScopedPackage [
	| dependency |
	dependency := CGOPackageDependency on: #Project::Package.
	
	self 
		assert: dependency targetedPackage 
		equals: 'Package'.
	self 
		assert: dependency scope
		equals: 'Project'
]

{ #category : #'tests-creation' }
CGOPackageDependencyTest >> testCreateDependencyWithNoConstraintsShouldCreateNoConstraints [
	| dependency |
	dependency := CGOPackageDependency newFrom: #A -> #().
	
	self assert: dependency constraints isEmpty
]

{ #category : #'tests-creation' }
CGOPackageDependencyTest >> testCreateDependencyWithoutEqualGeneratesAConstraint [
	| dep |

	dep := CGOPackageDependency newFrom: #A -> #('1.1.1').

	self assert: dep constraints size equals: 1.
	self assert: dep constraints anyOne class equals: CGOFixedVersionConstraint.
	self deny: dep constraints anyOne version isInvalid.
]

{ #category : #'tests-serialization' }
CGOPackageDependencyTest >> testDependencyLiteralReprensentationWithNoConstraintsShouldBeDependencyAssociationWithEmptyConstraintCollection [
	| dependency |
	dependency := CGOPackageDependency newFrom: #A -> #().

	self assert: dependency asLiteral equals: #A
]

{ #category : #'tests-serialization' }
CGOPackageDependencyTest >> testDependencyLiteralRepresentationShouldBeDependencyAssociation [
	| dependency |
	dependency := CGOPackageDependency newFrom: #A -> #('=1.0.0').

	self assert: dependency asLiteral equals: #A -> #('1.0.0')
]

{ #category : #'tests-version comparison' }
CGOPackageDependencyTest >> testFeatureDependencyNumberShouldSemanticVersionEquivalent [

	| dependency |
	dependency := CGOPackageDependency newFrom: #A -> #('=1.1').
	
	self assert: dependency constraints first version equals: '1.1.0' asSemanticVersion.
]

{ #category : #'tests-version comparison' }
CGOPackageDependencyTest >> testMajorDependencyNumberShouldSemanticVersionEquivalent [

	| dependency |
	dependency := CGOPackageDependency newFrom: #A -> #('=1').
	
	self assert: dependency constraints first version equals: '1.0.0' asSemanticVersion.
]

{ #category : #'tests-version comparison' }
CGOPackageDependencyTest >> testPatchDependencyNumberShouldSemanticVersionEquivalent [

	| dependency |
	dependency := CGOPackageDependency newFrom: #A -> #('=1.1.1').
	
	self assert: dependency constraints first version equals: '1.1.1' asSemanticVersion.
]
