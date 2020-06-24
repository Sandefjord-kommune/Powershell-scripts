#Script for generating random passwords

$alphabet = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"
$num = 0..9
$char = "!,),@,(,/,*,$,&,<,>,[,],%"
$arr = @()
$arr+= $alphabet.Split(',') | Get-Random -Count "Set count to a number"
$arr[0] = $arr[0].toupper()
$arr[-1] = $arr[-1].toupper()
$arr += $num | Get-Random -Count "Set count to a number"
$arr += $char.Split(',') | Get-Random -Count "Set count to a number"
($arr | Get-Random -Count $arr.count) -join""

