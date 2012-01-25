""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cakephp.vim
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Authors:      Kota Sakoda <cohtan AT cpan DOT org>
"               Andy Dawson <andydawson76 AT yahoo DOT co DOT uk>
" Version:      1.$Revision$
" ModifiedBy:   $LastChangedBy$
" Last Change:  $Date$
" Licence:      http://www.opensource.org/licenses/mit-license.php
"               The MIT License
" URL:          http://trac.codecheck.in/
"
"-----------------------------------------------------------------------------
"
" Section: Documentation {{{1
"
" Provides functions to aide developing with the CakePHP framework.
"
" Documentation functionality originally based upon PDV by Tobias Schlitt
" <toby AT php DOT net> , in turn inspired by phpDoc script by Vidyut Luther
" (http://www.phpcult.com)
"
" Command Documentation {{{2
"
" Mapping Documentation {{{2
"
" Optional Documentation {{{2
"
" Event documentation {{{2
"
" Section: Plugin header {{{1
"
" loaded_cakephp is set to 1 when initialization begins, and 2 when it
" completes.

if exists('loaded_cakephp')
	finish
endif
let loaded_cakephp=1

" Section: Event group setup {{{1

augroup CakeCommand
augroup END

" Section: Plugin initialization {{{1
"
" look for the projects file and if it doesn't exist create one (if possible)

let mapleader = "_"
try
	"source ~/.vim/cakephp_projects.vim
catch /E484:/
	try
		:o ~/.vim/cakephp_projects.vim
	catch /E482:/
		echo '~/.vim/cakephp_projects.vim was not found and couldn''t be created'.
	endtry
endtry

" Section: Script variable initialization {{{1

" Inflector rules {{{2
let s:irregularPlural = { 'atlas' : 'atlases',
			\       'beef' : 'beefs',
			\       'brother' : 'brothers',
			\       'child' : 'children',
			\       'corpus' : 'corpuses',
			\       'cow' : 'cows',
			\       'ganglion' : 'ganglions',
			\       'genie' : 'genies',
			\       'genus' : 'genera',
			\       'graffito' : 'graffiti',
			\       'hoof' : 'hoofs',
			\       'loaf' : 'loaves',
			\       'man' : 'men',
			\       'money' : 'monies',
			\       'mongoose' : 'mongooses',
			\       'move' : 'moves',
			\       'mythos' : 'mythoi',
			\       'numen' : 'numina',
			\       'occiput' : 'occiputs',
			\       'octopus' : 'octopuses',
			\       'opus' : 'opuses',
			\       'ox' : 'oxen',
			\       'penis' : 'penises',
			\       'person' : 'people',
			\       'sex' : 'sexes',
			\       'soliloquy' : 'soliloquies',
			\       'testis' : 'testes',
			\       'trilby' : 'trilbys',
			\       'turf' : 'turfs' }

let s:pluralRules = { '\(s\)tatus$' :  '\1\2tatuses',
			\       '\(quiz\)$' :  '\1zes',
			\       '^\(ox\)$' :  '\1\2en',
			\       '\([m\|l]\)ouse$' :  '\1ice',
			\       '\(matr\|vert\|ind\)\(ix\|ex\)$'  :  '\1ices',
			\       '\(x\|ch\|ss\|sh\)$' :  '\1es',
			\       '\([^aeiouy]\|qu\)y$' :  '\1ies',
			\       '\(hive\)$' :  '\1s',
			\       '\(?:\([^f]\)fe\|\([lr]\)f\)$' :  '\1\2ves',
			\       'sis$' :  'ses',
			\       '\([ti]\)um$' :  '\1a',
			\       '\(p\)erson$' :  '\1eople',
			\       '\(m\)an$' :  '\1en',
			\       '\(c\)hild$' :  '\1hildren',
			\       '\(buffal\|tomat\)o$' :  '\1\2oes',
			\       '\(alumn\|bacill\|cact\|foc\|fung\|nucle\|radi\|stimul\|syllab\|termin\|vir\)us$' :  '\1i',
			\       'us$g' :  'uses',
			\       '\(alias\)$' :  '\1es',
			\       '\(ax\|cri\|test\)is$' :  '\1es',
			\       's$' :  's',
			\       '$' :  's' }

let s:singularRules = {'\(s\)tatuses$' : '\1\2tatus',
			\       '^\(.*\)\(menu\)s$' : '\1\2',
			\       '\(quiz\)zes$' : '\1',
			\       '\(matr\)ices$' : '\1ix',
			\       '\(vert\|ind\)ices$' : '\1ex',
			\       '^\(ox\)en' : '\1',
			\       '\(alias\)\(es\)*$' : '\1',
			\       '\(alumn\|bacill\|cact\|foc\|fung\|nucle\|radi\|stimul\|syllab\|termin\|viri?\)i$' : '\1us',
			\       '\(cris\|ax\|test\)es$' : '\1is',
			\       '\(shoe\)s$' : '\1',
			\       '\(o\)es$' : '\1',
			\       'ouses$' : 'ouse',
			\       'uses$' : 'us',
			\       '\([m\|l]\)ice$' : '\1ouse',
			\       '\(x\|ch\|ss\|sh\)es$' : '\1',
			\       '\(m\)ovies$' : '\1\2ovie',
			\       '\(s\)eries$' : '\1\2eries',
			\       '\([^aeiouy]\|qu\)ies$' : '\1y',
			\       '\([lr]\)ves$' : '\1f',
			\       '\(tive\)s$' : '\1',
			\       '\(hive\)s$' : '\1',
			\       '\(drive\)s$' : '\1',
			\       '\([^f]\)ves$' : '\1fe',
			\       '\(^analy\)ses$' : '\1sis',
			\       '\(\(a\)naly\|\(b\)a\|\(d\)iagno\|\(p\)arenthe\|\(p\)rogno\|\(s\)ynop\|\(t\)he\)ses$' : '\1\2sis',
			\       '\([ti]\)a$' : '\1um',
			\       '\(p\)eople$' : '\1\2erson',
			\       '\(m\)en$' : '\1an',
			\       '\(c\)hildren$' : '\1\2hild',
			\       '\(n\)ews$' : '\1\2ews',
			\       '^\(.*us\)$' : '\1',
			\       's$' : ''}

let s:uninflectedPlural = ['.*[nrlm]ese', '.*deer', '.*fish', '.*measles', '.*ois', '.*pox', '.*sheep', '.*ss', 'Amoyese',
			\       'bison', 'Borghese', 'bream', 'breeches', 'britches', 'buffalo', 'cantus', 'carp', 'chassis', 'clippers',
			\       'cod', 'coitus', 'Congoese', 'contretemps', 'corps', 'debris', 'diabetes', 'djinn', 'eland', 'elk',
			\       'equipment', 'Faroese', 'flounder', 'Foochowese', 'gallows', 'Genevese', 'Genoese', 'Gilbertese', 'graffiti',
			\       'headquarters', 'herpes', 'hijinks', 'Hottentotese', 'information', 'innings', 'jackanapes', 'Kiplingese',
			\       'Kongoese', 'Lucchese', 'mackerel', 'Maltese', 'media', 'mews', 'moose', 'mumps', 'Nankingese', 'news',
			\       'nexus', 'Niasese', 'Pekingese', 'Piedmontese', 'pincers', 'Pistoiese', 'pliers', 'Portuguese', 'proceedings',
			\       'rabies', 'rice', 'rhinoceros', 'salmon', 'Sarawakese', 'scissors', 'sea[- ]bass', 'series', 'Shavese', 'shears',
			\       'siemens', 'species', 'swine', 'testes', 'trousers', 'trout', 'tuna', 'Vermontese', 'Wenchowese',
			\       'whiting', 'wildebeest', 'Yengeese']

" Config variables {{{2

let g:CakeRoot = ''
let s:configProject = ''
let s:configProjectBase = ''
let s:configProjectOverride = 0
let s:configpaste = 1
let s:configpaste_prev = ''

" Buffer specific variables {{{2
let b:AppDir = ''
let b:Model = ''
let b:View = ''
let b:Controller = ''


" Option variables {{{2
" Whether to create @uses tags for implementation of interfaces and inheritance
let s:configUses = 1
" Wether for PHP5 code PHP4 tags should be set, like @access,... (1|0)?
let s:configphp4always = 0

" CommentBlock variables {{{2
let s:commentHead = "/**"
let s:comment1 = " * "
let s:commentn = " * "
let s:commentTail = " */"
let s:commentSingle = "//"

" Shortcuts for editing the text:
let s:cmdBOL = "norm! o"
let s:cmdBOLA = "norm! A"
let s:cmdBOLO = "norm! O"
let s:cmdBOLR = "norm! 0R"
let s:cmdEOL = ""

" Default values
let s:configType = "mixed"
let s:configPackage = ""
let s:configSubPackage = ""
let s:configSince = "v 1.0"
let s:configVersion = "$id$"
let s:configAuthor = "Andy Dawson (AD7six)"
let s:configCopyright = "Copyright (c) 2008, Andy Dawson"
let s:configCopyrightLink = "www.ad7six.com"
let s:configLicense = "http://www.opensource.org/licenses/mit-license.php The MIT License"
let s:configReturnVal = "void"

" Regular expressions {{{2
let s:Expressioncomment = '^\s*/\?\*'
" (private|protected|public)
let s:Expressionscope = '\(private\|protected\|public\)'
" (static)
let s:Expressionstatic = '\(static\)'
" (abstract)
let s:Expressionabstract = '\(abstract\)'
" (final)
let s:Expressionfinal = '\(final\)'
" [:space:]*(private|protected|public|static|abstract)*[:space:]+[:identifier:]+\([:params:]\)
let s:Expressionfunc = '^\s*\([a-zA-Z ]*\)function\s\+\([^ (]\+\)\s*(\s*\(.*\)\s*)\s*[{;]\?\s*'
" [:typehint:]*[:space:]*$[:identifier]\([:space:]*=[:space:]*[:value:]\)?
let s:Expressionparam = ' *\([^ &]*\) *&\?\$\([A-Za-z_][A-Za-z0-9_]*\) *=\? *\(.*\)\?\s*'
" [:space:]*(private|protected|public\)[:space:]*$[:identifier:]+\([:space:]*=[:space:]*[:value:]+\)*;
let s:Expressionattribute = '^\s*\(\(private \|public \|protected \|var \|static \)\+\)\s*\$\([^ ;=]\+\)[ =]*\([^;]*\);\?\s*'
" [:space:]*(abstract|final|)[:space:]*(class|interface)+[:space:]+\(extends ([:identifier:])\)?[:space:]*\(implements ([:identifier:][, ]*)+\)?
let s:Expressionclass = '^\s*\([a-zA-Z]*\)\s*\(interface\|class\)\s*\([^ ]\+\)\s*\(extends\)\?\s*\([a-zA-Z0-9_]*\)\?\s*\(implements*\)\? *\([a-zA-Z0-9_ ,]*\)\?.*$'
let s:Expressionhead = '^<?php'
let s:Expressionarray  = "^array *(.*"
let s:Expressionfloat  = '^[0-9]*\.[0-9]\+'
let s:Expressionint    = '^[0-9]\+'
let s:Expressionstring = "['\"].*"
let s:Expressionbool = '\(true\|false\)'
let s:Expressionindent = '^\s*'
" Section: Utility functions {{{1

" Function: InflectPlural() {{{2
" For the passed singular word, return the plural inflection.

function s:InflectPlural(singular)
	for uninflected in s:uninflectedPlural
		if a:singular =~ uninflected
			return a:singular
		endif
	endfor
	return a:singular . 's' " temp
	for [test, value] in items(s:irregularPlural)
		if a:singular =~ '^' . test . '$'
			return value
		endif
	endfor
	for [test, regex] in items(s:pluralRules)
		echom regex
		if a:singular =~ regex
			return substitute(a:singular, test, regex, 'gi')
		endif
	endfor
	return a:singular
endfunction

" Function: InflectSingular() {{{2
" For the passed plural word, return the singular inflection.

function s:InflectSingular(plural)
	for test in s:uninflectedPlural
		if a:plural =~ test
			return a:plural
		endif
	endfor
	for [value, test] in items(s:irregularPlural) " Note inverted test
		if a:plural =~ '^' . test . '$'
			echom a:plural . 'matches ' . test
			return value
		endif
	endfor
	for [test, regex] in items(s:singularRules)
		if a:plural =~ test
			return substitute(a:plural, test, regex, 'gi')
		endif
	endfor
	return a:plural
endfunction

" Function: DetectMVC() {{{2
" Using the current path and filenames, determine the names for each of MVC.
" TODO action detection in controller (find first delcared function above line being edited)

function s:DetectMVC()
	:call SetProject()
	let b:Model = ''
	let b:View = ''
	let b:Controller = ''
	let l:filename = substitute (expand("%:p"), '^.*\/', '', "")
	let l:folder = substitute (expand("%:p"), '\/' . l:filename, '', "")
	let l:folder = substitute (l:folder, '.*\/', '', "")
	if l:folder =~ "models"
		let b:Model = substitute(l:filename, '\.php', "", "g")
	elseif expand("%:p") =~ "views"
		let b:Model = s:InflectSingular(l:folder)
		let b:View = substitute(l:filename, '.ctp', "", "g")
	elseif l:folder =~ "controllers"
		let plural = substitute(l:filename, '_controller.php', "", "g")
		let b:Model = s:InflectSingular(plural)
	endif
	let b:Controller = s:InflectPlural(b:Model)
endfunction

" Section: Auto-navigation functions {{{1

" Function: Controller() {{{2
" Open the controller file that is associated with whatever is currently being
" edited

function s:Controller()
	call s:DetectMVC()
	exe 'chdir ' . b:AppDir
" 	exe "sp controllers/" . b:Controller . "_controller.php"
	exe "e controllers/" . b:Controller . "_controller.php"
	if (b:View) 
		call search('function ' .  b:View)
	endif
endfunction

" Function: Model() {{{2
" Open the model file that is associated with whatever is currently being
" edited.

function s:Model()
	call s:DetectMVC()
	exe 'chdir ' . b:AppDir
	exe "sp models/" . b:Model . ".php"
endfunction

" Function: View() {{{2
" Open the view file that is associated with whatever is currently being
" edited. If the specific view file cannot be opened the folder is opened to
" allow the user to select the appropriate view file to edit.

function s:View()
	call s:DetectMVC()
	exe 'chdir ' . b:AppDir
	if (b:View) 
"		exe "sp views/" . b:Controller . "/" . b:View . ".ctp"
		exe "e views/" . b:Controller . "/" . b:View . ".ctp"
	else
"		exe "sp views/" . b:Controller . "/"
		exe "e views/" . b:Controller . "/"
	endif
endfunction

" Section: Public functions {{{1

" Function: SetProject() {{{2
" Based on the current path, derive the app dir location to be able to set project and sub project variables.

func SetProject()
	let b:AppDir = substitute(expand("%:p"), '^\(.*\)\/app\/.*$', '\1', "")
	echom b:AppDir
	if b:AppDir != expand("%:p")
		let b:AppDir = b:AppDir . '/app'
	else
		let b:AppDir = substitute(expand("%:p"), '^\(.*\)\/\(config\|controllers\|locale\|models\|plugins\|views\|weboot\).*$', '\1', "")
	endif
	let l:relativePath = substitute (expand("%:p"), b:AppDir . '\/', '', "")
	let s:configPackage = substitute (b:AppDir, '.*\/\([^\/]\+\)$', '\1', "")
	if s:configPackage =~ 'app'
		let s:configPackage = substitute (b:AppDir, '.*\/\([^\/]*\)\/[^\/]\+$', '\1', "")
	endif
	if l:relativePath =~ '/'
		let s:configSubPackage = s:configPackage . '.' . substitute (l:relativePath, '\/.*$', '', "")
	else
		let s:configSubPackage = s:configPackage
	endif
	let s:configSubPackage = substitute (s:configSubPackage, '/', '.', "g")
endfunc

" Function: DocSingle() {{{2
" Document a single line of code ( does not check if doc block already exists )

function s:Docsingle()
	:call SetProject()
	:call s:DocPaste(1)
	let l:endline = line(".") + 1
	if line(".") == 1
		call s:DocHead()
	else
		call s:Doc()
	endif
	:call s:DocPaste(0)
	exe "norm! " . l:endline . "G$"
endfunc

" Function: DocRange() {{{2
" Documents a whole range of code lines ( does not add defualt doc block to
" unknown types of lines ). Skips elements where a docblock is already
" present.

function s:Docrange() range
	:call SetProject()
	:call s:DocPaste(1)
	" expand all folds
	norm zR
	let l:line = a:firstline
	let l:endLine = a:lastline
	let l:runToEnd = 0
	if l:endLine == line("$")
		let l:runToEnd = 1
	endif
	let l:elementName = ""
	while l:line <= l:endLine
		if (getline(l:line) =~ s:Expressionfunc || getline(l:line) =~ s:Expressionattribute || getline(l:line) =~ s:Expressionclass) && getline(l:line - 1) !~ s:Expressioncomment
			" Ensure we are on the correct line to run Doc()
			exe "norm! " . l:line . "G$"
			" No matter what, this returns the element name
			let l:elementName = s:Doc()
			" echom 'adding doc block for ' . l:elementName
			if l:runToEnd == 1
				let l:endLine = line('$')
			endif
		endif
		let l:line = l:line + 1
	endwhile
	" check for file header
	if a:firstline == 1
		let l:line = 1
		let l:endline = line("$")
		let l:commentsFound = 0
		let l:foundClass = 0
		let l:foundClassLine = 0
		let l:foundSvn = 0
		while l:line <= l:endline
			if l:foundClass == 0
				if getline(l:line) == s:commentHead
					let l:commentsFound = l:commentsFound + 1
				elseif getline(l:line) =~ '.*SVN FILE:.*'
					let l:foundSvn = 1
				elseif getline(l:line) =~ s:Expressionclass
					let l:foundClass = 1
					let l:foundClassLine = l:line
				endif
			endif
			let l:line = l:line + 1
		endwhile
		if l:foundClass == 1 && l:commentsFound < 2
			if l:foundSvn == 1
				exe "norm! " . l:foundClassLine . "G$"
				call s:Doc()
			else
				norm gg
				call s:DocHead()
			endif
		elseif l:foundSvn == 0
			norm gg
			call s:DocHead()
		endif
	endif
	call s:DocPaste(0)
	" back to the first line
	exe "norm! " . a:firstline . 'G'
endfunc

" Function: Doc() {{{2
" Detects what the current line is (1st line of a file, class declaration,
" property, method or unknown) and calls the method for the type of doc block
" required.

function s:Doc()
	let l:line = getline(".")
	let l:result = ""
	if l:line == 1
		let l:result = s:DocHead()
	elseif l:line =~ s:Expressionclass
		let l:result = s:DocClass()
	elseif l:line =~ s:Expressionattribute
		let l:result = s:DocProperty()
	elseif l:line =~ s:Expressionfunc
		let l:result = s:DocMethod()
	else
		let l:result = s:DocDefault()
	endif

	return l:result
endfunc

" Function: DocHead() {{{2
" Write a doc block for a file

function s:DocHead()
	echom expand ("%:e")
	if expand("%:e") != 'php'
		if line(".") !~ s:Expressionhead
			exe s:cmdBOLO . "<?php /* SVN FILE: $Id$ */ ?>" . s:cmdEOL
		elseif line(".") !~ '<\?php\s*\?>$'
			exe s:cmdBOLO . "<?php /* SVN FILE: $Id$ */ ?>" . s:cmdEOL
		else
			exe s:cmdBOLR . "<?php /* SVN FILE: $Id$ */" . s:cmdEOL
		endif
		return
	endif
	exe s:cmdBOL . "/* SVN FILE: $Id$ */" . s:cmdEOL
	exe s:cmdBOL . s:commentHead . s:cmdEOL
	exe s:cmdBOL . s:commentn . "Short description for " . expand("%:t") . s:cmdEOL
	exe s:cmdBOL . s:commentn . s:cmdEOL
	exe s:cmdBOL . s:commentn . "Long description for " . expand("%:t") . s:cmdEOL
	exe s:cmdBOL . s:commentn . s:cmdEOL
	exe s:cmdBOL . s:commentn . "PHP versions 4 and 5" . s:cmdEOL
	exe s:cmdBOL . s:commentn . s:cmdEOL
	exe s:cmdBOL . s:commentn . s:configCopyright . s:cmdEOL
	exe s:cmdBOL . s:commentn . s:cmdEOL
	if (s:configLicense == "http://www.opensource.org/licenses/mit-license.php The MIT License")
		exe s:cmdBOL . s:commentn . "Licensed under The MIT License" . s:cmdEOL
	else
		exe s:cmdBOL . s:commentn . "Licensed under " . s:configLicense . s:cmdEOL
	endif
	exe s:cmdBOL . s:commentn . "Redistributions of files must retain the above copyright notice." . s:cmdEOL
	exe s:cmdBOL . s:commentn . s:cmdEOL
	exe s:cmdBOL . s:commentn . "@filesource" . s:cmdEOL
	exe s:cmdBOL . s:commentn . "@copyright            " . s:configCopyright . s:cmdEOL
	exe s:cmdBOL . s:commentn . "@link                 " . s:configCopyrightLink . s:cmdEOL
	exe s:cmdBOL . s:commentn . "@package              " . s:configPackage . s:cmdEOL
	exe s:cmdBOL . s:commentn . "@subpackage           " . s:configSubPackage . s:cmdEOL
	exe s:cmdBOL . s:commentn . "@since                " . s:configSince . s:cmdEOL
	exe s:cmdBOL . s:commentn . "@version              $Revision$" . s:cmdEOL
	exe s:cmdBOL . s:commentn . "@modifiedBy           $LastChangedBy$" . s:cmdEOL
	exe s:cmdBOL . s:commentn . "@lastModified         $Date$" . s:cmdEOL
	exe s:cmdBOL . s:commentn . "@license              " . s:configLicense . s:cmdEOL
	exe s:cmdBOL . s:commentTail . s:cmdEOL
endfunc

" Function: DocClass() {{{2
" Write a doc block for a class

function s:DocClass()
	" Line for the comment to begin
	let commentline = line (".") - 1
	let l:name = substitute (getline ("."), '^\(.*\)\/\/.*$', '\1', "")

	" No indentation ever for comments
	let l:indent = "" "matchstr(l:name, s:Expressionindent)

	" Now we have to split DECL in three parts:
	" \[(scopemodifier\)]\(classname\)\(parameters\)
	let l:modifier = substitute (l:name, s:Expressionclass, '\1', "g")
	let l:classname = substitute (l:name, s:Expressionclass, '\3', "g")
	let l:extends = s:configUses == 1 ? substitute (l:name, s:Expressionclass, '\5', "g") : ""
	let l:interfaces = s:configUses == 1 ? substitute (l:name, s:Expressionclass, '\7', "g") . "," : ""

	let l:abstract = s:configphp4always == 1 ? matchstr(l:modifier, s:Expressionabstract) : ""
	let l:final = s:configphp4always == 1 ?  matchstr(l:modifier, s:Expressionfinal) : ""

	exe "norm! " . commentline . "G$"

	" Local indent
	let l:txtBOL = s:cmdBOL . l:indent
	let l:txtBOLA = s:cmdBOLA . l:indent
	if getline(".") =~ '^\s*$'
		exe l:txtBOLA . s:commentHead . s:cmdEOL
	else
		exe l:txtBOL . s:commentHead . s:cmdEOL
	endif

	exe l:txtBOL . s:comment1 . l:classname . " class" . s:cmdEOL
	exe l:txtBOL . s:commentn . s:cmdEOL
	if l:extends != "" && l:extends != "implements"
		exe l:txtBOL . s:commentn . "@uses                 " . l:extends . s:cmdEOL
	endif

	while (l:interfaces != ",") && (l:interfaces != "")
		" Save 1st parameter
		let interface = substitute (l:interfaces, '\([^, ]*\) *, *\(.*\)', '\1', "")
		" Remove this one from list
		let l:interfaces = substitute (l:interfaces, '\([^, ]*\) *, *\(.*\)', '\2', "")
		exe l:txtBOL . s:commentn . "@uses                 " . l:interface . s:cmdEOL
	endwhile

	if l:abstract != ""
		exe l:txtBOL . s:commentn . "@abstract" . s:cmdEOL
	endif
	if l:final != ""
		exe l:txtBOL . s:commentn . "@final" . s:cmdEOL
	endif
	exe l:txtBOL . s:commentn . "@package              " . s:configPackage . s:cmdEOL
	exe l:txtBOL . s:commentn . "@subpackage           " . s:configSubPackage . s:cmdEOL

	" Close the comment block.
	exe l:txtBOL . s:commentTail . s:cmdEOL
	return l:modifier ." ". l:classname
endfunc

" Function: DocProperty() {{{2
" Write a doc block for a property

function s:DocProperty()
	" Line for the comment to begin
	let commentline = line (".") - 1

	let l:name = substitute (getline ("."), '^\(.*\)\/\/.*$', '\1', "")

	" No indentation ever for comments
	let l:indent = "" "matchstr(l:name, s:Expressionindent)

	" Now we have to split DECL in three parts:
	" \[(scopemodifier\)]\(funcname\)\(parameters\)
	let l:modifier = substitute (l:name, s:Expressionattribute, '\1', "g")
	let l:varname = substitute (l:name, s:Expressionattribute, '\3', "g")
	let l:default = substitute (l:name, s:Expressionattribute, '\4', "g")
	let l:scope = s:DocScope(l:modifier, l:varname)
	" strip leading underscores
	let l:varname = substitute (l:varname, '^_*', '', "")

	let l:static = s:configphp4always == 1 ? matchstr(l:modifier, s:Expressionstatic) : ""

	let l:type = s:DocType(l:default)

	exe "norm! " . commentline . "G$"

	" Local indent
	let l:txtBOL = s:cmdBOL . l:indent
	let l:txtBOLA = s:cmdBOLA . l:indent
	if getline(".") =~ '^\s*$'
		exe l:txtBOLA . s:commentHead . s:cmdEOL
	else
		exe l:txtBOL . s:commentHead . s:cmdEOL
	endif
	exe l:txtBOL . s:comment1 . l:varname . " property" . s:cmdEOL
	exe l:txtBOL . s:commentn . s:cmdEOL
	if l:static != ""
		exe l:txtBOL . s:commentn . "@static" . s:cmdEOL
	endif
	if l:type != 'array'
		exe l:txtBOL . s:commentn . "@var " . l:type . " " . l:default . s:cmdEOL
	else
		exe l:txtBOL . s:commentn . "@var " . l:type . s:cmdEOL
	endif
	if l:scope != ""
		exe l:txtBOL . s:commentn . "@access " . l:scope . s:cmdEOL
	endif

	" Close the comment block.
	exe l:txtBOL . s:commentTail . s:cmdEOL
	return l:modifier ." ". l:varname
endfunc

" Function: DocMethod() {{{2
" Write a doc block for a method

function s:DocMethod()
	" Line for the comment to begin
	let commentline = line (".") - 1
	let l:name = substitute (getline ("."), '^\(.*\)\/\/.*$', '\1', "")
	" No indentation ever for comments
	let l:indent = "" "matchstr(l:name, s:Expressionindent)

	" Now we have to split DECL in three parts:
	" \[(scopemodifier\)]\(funcname\)\(parameters\)
	let l:modifier = substitute (l:name, s:Expressionfunc, '\1', "g")
	let l:funcname = substitute (l:name, s:Expressionfunc, '\2', "g")
	let l:funcname = substitute (l:name, s:Expressionfunc, '\2', "g")
	let l:parameters = substitute (l:name, s:Expressionfunc, '\3', "g") . ","
	let l:scope = s:DocScope(l:modifier, l:funcname)
	let l:funcname = substitute (l:funcname, '^_*', '', "")
	let l:static = s:configphp4always == 1 ? matchstr(l:modifier, s:Expressionstatic) : ""
	let l:abstract = s:configphp4always == 1 ? matchstr(l:modifier, s:Expressionabstract) : ""
	let l:final = s:configphp4always == 1 ? matchstr(l:modifier, s:Expressionfinal) : ""

	exe "norm! " . commentline . "G$"

	" Local indent
	let l:txtBOL = s:cmdBOL . l:indent
	let l:txtBOLA = s:cmdBOLA . l:indent
	if getline(".") =~ '^\s*$'
		exe l:txtBOLA . s:commentHead . s:cmdEOL
	else
		exe l:txtBOL . s:commentHead . s:cmdEOL
	endif
	exe l:txtBOL . s:comment1 . funcname . " method" . s:cmdEOL
	exe l:txtBOL . s:commentn . s:cmdEOL

	while (l:parameters != ",") && (l:parameters != "")
		" Save 1st parameter
		let _p = substitute (l:parameters, '\([^,]*\) *, *\(.*\)', '\1', "")
		" Remove this one from list
		let l:parameters = substitute (l:parameters, '\([^,]*\) *, *\(.*\)', '\2', "")
		" PHP5 type hint?
		let l:paramtype = substitute (_p, s:Expressionparam, '\1', "")
		" Parameter name
		let l:paramname = substitute (_p, s:Expressionparam, '\2', "")
		" Parameter default
		let l:paramdefault = substitute (_p, s:Expressionparam, '\3', "")

		if l:paramtype == ""
			let l:paramtype = s:DocType(l:paramdefault)
		endif

		if l:paramtype != ""
			let l:paramtype = " " . l:paramtype
		endif
		exe l:txtBOL . s:commentn . "@param" . l:paramtype . " $" . l:paramname . " " . s:cmdEOL
	endwhile

	if l:static != ""
		exe l:txtBOL . s:commentn . "@static" . s:cmdEOL
	endif
	if l:abstract != ""
		exe l:txtBOL . s:commentn . "@abstract" . s:cmdEOL
	endif
	if l:final != ""
		exe l:txtBOL . s:commentn . "@final" . s:cmdEOL
	endif
	exe l:txtBOL . s:commentn . "@return " . s:configReturnVal . s:cmdEOL
	if l:scope != ""
		exe l:txtBOL . s:commentn . "@access " . l:scope . s:cmdEOL
	endif

	" Close the comment block.
	exe l:txtBOL . s:commentTail . s:cmdEOL
	return l:modifier ." ". l:funcname
endfunc

" Function: DocDefault() {{{2
" Write a default doc block

function s:DocDefault()
	let commentline = line (".") - 1
	let l:indent = matchstr(getline("."), '^\ *')

	exe "norm! " . commentline . "G$"

	let l:txtBOL = s:cmdBOL . l:indent
	let l:txtBOLA = s:cmdBOLA . l:indent
	if getline(".") =~ '^\s*$'
		exe l:txtBOLA . s:commentHead . s:cmdEOL
	else
		exe l:txtBOL . s:commentHead . s:cmdEOL
	endif
	exe l:txtBOL . s:commentn . " " . s:cmdEOL

	exe l:txtBOL . s:commentTail . s:cmdEOL
endfunc

" Function: DocScope(modifiers, identifier) {{{2
" Detect and return the scope of the passed identifier

function s:DocScope(modifiers, identifier)
	" exe s:cmdBOL . DEBUG: . a:modifiers . s:cmdEOL
	let l:scope  = ""
	if  matchstr (a:modifiers, s:Expressionscope) != ""
		if s:configphp4always == 1
			let l:scope = matchstr (a:modifiers, s:Expressionscope)
		else
			return ''
		endif
	endif
	if l:scope =~ "^\s*$"
		if a:identifier[0] == "_"
			if a:identifier[1] == "_"
				let l:scope = 'private'
			else
				let l:scope = "protected"
			endif
		else
			let l:scope = "public"
		endif
	endif
	return l:scope
endfunc

" Function: DocType(string) {{{2
" Detect and return the type of variable passed

function s:DocType(typeString)
	if a:typeString =~ s:Expressionarray
		return "array"
	endif
	if a:typeString =~ s:Expressionfloat
		return "float"
	endif
	if a:typeString =~ s:Expressionint
		return "int"
	endif
	if a:typeString =~ s:Expressionstring
		return "string"
	endif
	if a:typeString =~ s:Expressionbool
		return "bool"
	endif
	return s:configType
endfunc

" Function: DocPaste(start) {{{2
" Disable any other enhancements before generating doc blocks, and reset the
" paste function thereafter.
" Prevents (for example) ever increasing comment indentation

function s:DocPaste(start)
	if a:start == 1
		let s:configpaste_prev = &g:paste
		let &g:paste = s:configpaste == 1 ? 1 : &g:paste
	elseif s:configpaste == 1
		let &g:paste = s:configpaste_prev
	endif
endfunc

" Function: DocFindComments() {{{2
" Debug function used to scan the current buffer and echo out any found
" comments

function s:DocFindComments()
	let l:line = 1
	let l:endLine = line("$")
	while l:line <= l:endLine
		if getline(l:line) =~ s:Expressioncomment
			echom getline(l:line)
		endif
		let l:line = l:line + 1
	endwhile
endfunc

" Section: Command definitions {{{1
" Section: Primary commands {{{2
" Section: Plugin command mappings {{{1

"if !exists(":Spc") 
"	command -bar -narg=0 Spc call s:Controller()
"endif
"if !exists(":Spm") 
"	command -bar -narg=0 Spm call s:Model()
"endif
"if !exists(":Spv") 
"	command -bar -narg=0 Spv call s:View()
"endif
if !exists(":Ec") 
	command -bar -narg=0 Spc call s:Controller()
endif
if !exists(":Ev") 
	command -bar -narg=0 Spv call s:View()
endif
if !exists(":CakeDocument") 
	command -nargs=1 CakeDocument :%call s:Docrange()
endif

" Section: Default mappings {{{1

if !hasmapto('<Plug>Controller')
	map <buffer> <unique> <Leader>c <Plug>Controller
endif
if !hasmapto('<Plug>Model')
	map <buffer> <unique> <Leader>m <Plug>Model
endif
if !hasmapto('<Plug>View')
	map <buffer> <unique> <Leader>v <Plug>View
endif

if !hasmapto('<Plug>Docsingle')
	map <buffer> <unique> <Leader>s <Plug>Docsingle
endif
if !hasmapto('<Plug>Docrange')
	map <buffer> <unique> <Leader>r <Plug>Docrange
	map <buffer> <unique> <Leader>a %<Plug>Docrange
endif

inoremap <buffer> <C-P> <Esc>:call <SID>Docsingle()<CR>i
nnoremap <buffer> <C-P> :call <SID>Docsingle()<CR>
vnoremap <buffer> <C-P> :call <SID>Docrange()<CR>
nnoremap <buffer> <F9> :%call <SID>Docrange()<CR>
nnoremap <buffer> <F12> :bufdo! :%call <SID>Docrange()<CR>

" Section: Menu items {{{1

noremenu <script> Plugin.CakePHP.Check\ Documentation <SID>Docs

" Section: Autocommands to restore vimdiff state {{{1
" Section: Event group setup {{{1
" Section: Plugin completion {{{1
let loaded_cakephp=2
