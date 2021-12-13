Class {
	#name : #BaselineOfPackageBlueprint,
	#superclass : #BaselineOf,
	#category : #BaselineOfPackageBlueprint
}

{ #category : #baselines }
BaselineOfPackageBlueprint >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			package: 'PackageBlueprint'
			with: [ spec requires: #( 'MooseIDE' ) ] ].
	spec for: #NeedsMooseIDE do: [ 
		spec baseline: 'MooseIDE' with: [ 
			spec repository:
				'github://moosetechnology/MooseIDE:development/src' ] ]
]

{ #category : #baselines }
BaselineOfPackageBlueprint >> customProjectAttributes [

	^ RPackageOrganizer default packages
		  detect: [ :package | package name = 'BaselineOfMooseIDE' ]
		  ifFound: [ #(  ) ]
		  ifNone: [ #( #NeedsMooseIDE ) ]
]
