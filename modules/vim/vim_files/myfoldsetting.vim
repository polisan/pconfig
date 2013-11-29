"syn region myFold start="<head" end="/head>" transparent fold
syn region myFold start="<html"         end="/html>"            transparent fold keepend extend containedin=ALLBUT,htmlComment 
syn region myFold start="<head"         end="/head>"            transparent fold keepend extend containedin=ALLBUT,htmlComment 
syn region myFold start="<body"         end="/body>"            transparent fold keepend extend containedin=ALLBUT,htmlComment 
syn region myFold start="<div"          end="/div>"             transparent fold keepend extend containedin=ALLBUT,htmlComment 
syn region myFold start="<script"   end="/script>"      transparent fold keepend extend containedin=ALLBUT,htmlComment 
syn region myFold start="<style"        end="/style>"           transparent fold keepend extend containedin=ALLBUT,htmlComment 
syn region myFold start="<object"       end="/object>"      transparent fold keepend extend containedin=ALLBUT,htmlComment 
syn region myFold start="<!--"          end="-->"                   transparent fold keepend extend containedin=ALLBUT,htmlComment 
syn region myFold start="{"         end="}"           transparent fold keepend extend containedin=ALLBUT,htmlComment
syn sync fromstart
set foldmethod=syntax
set foldcolumn=10
