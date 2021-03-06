Class {
	#name : #PBOpenProjectWorkingCopyCommand,
	#superclass : #PBProjectCommand,
	#category : #'CargoPackageManager-Calypso-Browser-Commands'
}

{ #category : #accessing }
PBOpenProjectWorkingCopyCommand class >> canBeExecutedInContext: aToolContext [

	^ (aToolContext isProjectSelected and: [ aToolContext selectedProjectItems size = 1 ])
		and: [ aToolContext selectedProjectItems first actualObject project hasRepository ]
]

{ #category : #accessing }
PBOpenProjectWorkingCopyCommand class >> defaultMenuIconName [
	^ #komitterSmalltalkhubRemote
]

{ #category : #activation }
PBOpenProjectWorkingCopyCommand class >> systemBrowserMenuActivator [
	<classAnnotation>
	
	^ CmdContextMenuActivation
		byItemOf: PBSCMMenuGroup
		order: 10000
		for: PBProjectUIItem asCalypsoItemContext 
]

{ #category : #activation }
PBOpenProjectWorkingCopyCommand class >> systemBrowserShortcutActivator [
	<classAnnotation>
	
	^ CmdShortcutActivation by: $o meta for: PBProjectUIItem asCalypsoItemContext 
]

{ #category : #activation }
PBOpenProjectWorkingCopyCommand class >> systemBrowserToolbarActivator [
	<classAnnotation>
	
	^ ClyToolbarActivation
		byItemOf: ClyButtonToolbarGroup
		order: 1010
		for: PBProjectUIItem asCalypsoItemContext , ClyEmptyClassSelectionContext new
]

{ #category : #initialization }
PBOpenProjectWorkingCopyCommand >> defaultMenuItemName [
	^ 'Repository'
]

{ #category : #execution }
PBOpenProjectWorkingCopyCommand >> execute [
	
	(IceTipWorkingCopyBrowser onRepository: project repository iceRepository) openWithSpec
]
