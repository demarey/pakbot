comparing
= anotherProject

	self species = anotherProject	species
		ifFalse: [ ^ false ].
		
	self name = anotherProject name
		ifFalse: [ ^ false ].

	self version = anotherProject version
		ifFalse: [ ^ false ].
		
	self repository = anotherProject repository
		ifFalse: [ ^ false ].
		
	^ true