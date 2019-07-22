#!/usr/bin/env bash 
#describe: get data youtube.com
#autor: GumblarZ < Jc0d3001@outlook.com >
#version: 0.1
#license: MIT License

#titulo: grep '<title>' video.html | sed 's/<[^>]*>//g'
#view: grep 'watch-view-count' video.html | sed 's/<[^>]*>//g'
#like: grep 'like-button-renderer-like-button' video.html | sed -n 1p | sed 's/<[^>]*>//g;s/ //g'
#dislike: grep 'like-button-renderer-dislike-button' video.html | sed -n 1p | sed 's/<[^>]*>//g;s/ //g'
#id do canal: sed 's/channel/\n&g' video.html | grep '^channel' | sed -n 1p | sed 's/isCrawlable.*//g;s..,.*"//g'
#titulo do canal: sed -n '/subscriber-count/{p; q;}' canal.html | sed 's/<title> //g'
#numero de inscritos: sed -n 'subscriber-count/{p; q;}' canal.html | sed 's/.*subscriber-count//g' | sed 's/<[^>]*>//g'



function youtube() {
	local _video=$(mktemp)
	local _channel=$(mktemp)

	wget "$1" -O "$_video" 2>/dev/null  #diretorio q executa em obsoleto

	local _title=$(grep '<title>' "$_video" | sed 's/<[^>]*>//g')
	local _views=$(grep 'watch-view-count' "$_video" | sed 's/<[^>]*>//g')
	local _likes=$(grep 'like-button-renderer-like-button' "$_video" | sed -n 1p | sed 's/<[^>]*>//g;s/ //g')

	echo "Titulo do video : $_title"
	echo "Visualizacoes do video : $_views"
	echo "Likes do video: $_likes"
	
}

youtube "$1"
