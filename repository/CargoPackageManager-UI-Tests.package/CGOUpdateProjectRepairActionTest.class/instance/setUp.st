running
setUp
	super setUp.
	registry := CGOPackageRegistry new.
	project := registry newProjectNamed:'ATestProject'.

	dependencyToProject := (PBMetacelloConfigurationProjectDependency   
		name: 'CargoTestExample'
		repositoryUrl: 'http://smalltalkhub.com/mc/Pharo/CargoTestRepository/main'
		version: '2.0').

	project newPackageUnit: #APackage.
	project addDependency: dependencyToProject