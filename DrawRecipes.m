(* ::Package:: *)

(* ::Text:: *)
(*If this doesn' t run from the command line, try converting cells to initialization cells OR uncomment them in the .m file ...*)


(* ::Input:: *)
(*testRecipeTitle = "this is a test"; (* usually the filename *)*)
(*testRecipe = {"Do a whole shitload of crap. Process C is realllly fuckin long",*)
(*{"processB", "ingredient 1", "ingredient 2", "ingredient 3"},*)
(*{None, "ingredient X", "ingredient Y", {"processA", "ingredient 1", "ingredient 2" ,"ingredient 3"}}*)
(*};*)


MakeBoxes[bracket[obj_],fmt_]:=StyleBox[RowBox[{obj~ToBoxes~fmt,"]"}],SpanMaxSize->Infinity,SpanSymmetric->True];


DrawSingleLevel[element_]:=
Row@List[
bracket[
Column[
element[[2;;]],
Spacings->1,
ItemSize->Automatic,
Alignment -> Right,
BaselinePosition->Automatic
]
],
Style[
Column[
List@element[[1]],
ItemSize :>  ((Automatic /. Automatic :>  8 /; StringLength@element[[1]]>15)) (* linewrap processes that are too long, NB it doesn't actually wrap to the length that you set it!!! *)
],
LineIndent -> 0
]
]


WriteRecipe[recipe_]:=Module[
{recipe2 = recipe/. None->""},
where=Sort[Position[recipe2,List],Length[#1]>Length[#2]&];where=Take[where,1;;-2] ;
Map[
(recipe2 = ReplacePart[recipe2,Take[#,1;;-2]-> DrawSingleLevel[Extract[recipe2,Take[#,1;;-2]]]])&,
where
];
recipe2 = DrawSingleLevel[recipe2];
Text[recipe2, BaseStyle -> {Large,FontFamily-> "Times"}]
]


TitleRecipe[recipe_,title_]:= Column[{Text[title,BaseStyle -> {Large,FontFamily-> "Times"}],recipe}, Alignment->Center,Spacings->2]


Processor[filename_]:= Module[{name=filename,recipe = ReadList[filename][[1]],
 inputDir = "/text/",pngDir="/png/",svgDir="/svg/"},
recipe = WriteRecipe@recipe;
recipe= TitleRecipe[recipe,FileNameTake[name,-1]];
Export[Directory[]<>svgDir<>FileNameTake[name,-1]<>".svg",Framed[recipe,FrameStyle -> White]] ;
Export[Directory[]<>pngDir<>FileNameTake[name,-1]<>".png", recipe];
]


Main:= Module[{dir = Directory[],inputDir = "/text/"},
Processor /@FileNames["*",dir<>inputDir]
]


Print["Beginning in directory "<>Directory[]]
Main
Print["A tiny strawberry..."]
Exit[] (* for conversion to commmand line *)
