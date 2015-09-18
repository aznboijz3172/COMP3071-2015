s(A-C):- np(A-B), vp(B-C).
np(A-C):- det(A-B), n(B-C). 
vp(A-C):- v(A-B), np(B-C). 
vp(A-C):- v(A-C).
det([the|W]-W).           
det([a|W]-W). 
n([man|W]-W).    
n([woman|W]-W).      
v([shoots|W]-W).
