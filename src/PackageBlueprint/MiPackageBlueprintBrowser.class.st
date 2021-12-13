Class {
	#name : #MiPackageBlueprintBrowser,
	#superclass : #MiAbstractBrowser,
	#instVars : [
		'visualization'
	],
	#category : #'PackageBlueprint-Implementation'
}

{ #category : #specs }
MiPackageBlueprintBrowser class >> defaultSpec [


	^ super defaultSpec
		  add: #visualization;
		  yourself
]

{ #category : #specs }
MiPackageBlueprintBrowser class >> open [

	<script>
	^ super open
]

{ #category : #specs }
MiPackageBlueprintBrowser class >> title [

	^ 'PackageBlueprintVisualisation'
]

{ #category : #testing }
MiPackageBlueprintBrowser >> canFollowEntity: anEntity [
	^ (self needUpdate: anEntity) and: [ 
		  (anEntity asMooseSpecializedGroup isKindOf: FamixTypeGroup) ]
]

{ #category : #testing }
MiPackageBlueprintBrowser >> canReceiveEntity: anEntity [
	^ (self needUpdate: anEntity) and: [ 
		  (anEntity asMooseSpecializedGroup isKindOf: FamixTypeGroup) ]
]

{ #category : #actions }
MiPackageBlueprintBrowser >> followEntity: anEntity [

	^ visualization entities: anEntity
]

{ #category : #initialization }
MiPackageBlueprintBrowser >> initializePresenters [


	super initializePresenters.
	visualization := self instantiate: MiPackageBlueprintVisualization.
]

{ #category : #testing }
MiPackageBlueprintBrowser >> miSelectedItem [

	^ visualization selected ifNil: [ visualization entities ]
]

{ #category : #testing }
MiPackageBlueprintBrowser >> needUpdate: anEntity [

	^ anEntity ~= visualization entities
]
