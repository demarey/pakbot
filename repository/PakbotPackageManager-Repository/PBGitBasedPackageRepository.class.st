"
I am a package repository used to host the meta data of Packbot packages / projects.
I use a git repository as backend.

root will be the root of the git working copy.
"
Class {
	#name : #PBGitBasedPackageRepository,
	#superclass : #PBPackageRepository,
	#instVars : [
		'repository'
	],
	#category : #'PakbotPackageManager-Repository'
}

{ #category : #initialization }
PBGitBasedPackageRepository class >> defaultGitUrl [
	^ 'git@github.com:pharo-pkg/project-repository.git'
]

{ #category : #'instance creation' }
PBGitBasedPackageRepository class >> newLocalRepositoryIn: aFileReference [ 
	^ self basicNew 
		root: aFileReference;
		initialize;
		yourself
]

{ #category : #accessing }
PBGitBasedPackageRepository >> head [
	^ self iceRepository head
]

{ #category : #private }
PBGitBasedPackageRepository >> iceRepository [
	^ repository iceRepository
]

{ #category : #initialization }
PBGitBasedPackageRepository >> initialize [
	repository := PBGitRepositoryCreator new
		githubUrl: self class defaultGitUrl;
		location: root;
		createAndClone.
	root := self workingCopy fileSystem
]

{ #category : #saving }
PBGitBasedPackageRepository >> saveProject: aPBProject [
	super saveProject: aPBProject.
	self iceRepository commitIndexWithMessage: aPBProject name, ' ', aPBProject version asString
		andParents: { self iceRepository headCommit }.
]

{ #category : #accessing }
PBGitBasedPackageRepository >> workingCopy [
	^ self iceRepository workingCopy
]