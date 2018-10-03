#!/bin/bash
function oldrun(){
	in="$1"
	shift
	echo "  --- Running 'cat $in | $*'"
	cat $in | $*
}

function run(){
	in="chart.$1.in"
	type="$2"
	out="chart.$1.png"
	id="$1"
	shift 2
	#echo "  --- Running 'cat in/$in | chart $type out/$out $* $SETS'"
	echo "  --- ($id) $type : $in -> $out"
	cat in/$in | chart $type out/$out $* $SETS
}

shopt -s extglob
case $1 in
	(+([0-9])) tests="$1"; shift;;
	*) tests="00" ;;
esac

SETS=$*
errors=""
r=0
for i in $(seq -f "%02g" 1 15); do
	[ $tests -eq 0 -o $tests -eq $i ] || continue
	case $i in
		01) s="pie header" ;;
		02) s="pie labels dark" ;;
		03) s="sidebar overlay" ;;
		04) s="bar dontload fit" ;;
		05) s="barcount noheader labels" ;;
		06) s="topbar labels transparent" ;;
		07) s="topbar squarefit crystal" ;;
		08) s="summarybar dontload" ;;
		09) s="plot tabs grid dark" ;;
		10) s="plotstaggered tabs dark transparent" ;;
		11) s="plotscatter tabs grid cubefit dark dontload" ;;
		12) s="plotscatter grid noheader linearfit dontload" ;;
		13) s="plotscatter log grid crystal" ;;
		14) s="plotscatter log dark grid crystal" ;;
		*) continue
	esac
	r=$(( $r + 1 ))
	run $i $s 2>&1
	status=$?
	[ $status -ne 0 ] && errors="$errors $i:$status"
done

echo "  --- DONE"
res="${errors//[^ ]}"
res="${#res}"
o=$(($r-$res))
echo Completed $o/$r
echo
if [ $res -gt 0 ]; then
	echo $errors | sed -E 's/([0-9]+):([0-9]+)\s*/Test \1 failed with return code \2\n/g'
fi
