
if(posz<=64){posz=64;zvel=0}
if(keyboard_check(vk_space) && posz<=79){
	zvel+=5;
}
else{
zvel-=1;
}

posz+=zvel;