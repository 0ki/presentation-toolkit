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
	echo -n "  --- ($id) $type : $in -> $out lines:$(wc -l in/$in | cut -d \  -f 1) sec:"
	cat in/$in | /usr/bin/time -f %e chart $type out/$out $* $SETS
}

shopt -s extglob
case $1 in
	(+([0-9])) tests="$1"; shift;;
	*) tests="00" ;;
esac

SETS=$*
errors=""
diffs=""
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
		07) s="topbar squarefit crystal underspace" ;;
		08) s="summarybar dontload underspace" ;;
		09) s="plot tabs grid dark" ;;
		10) s="plotstaggered tabs dark transparent" ;;
		11) s="plotscatter tabs grid cubefit dark dontload" ;;
		12) s="plotscatter grid noheader linearfit dontload" ;;
		13) s="plotscatter log grid crystal" ;;
		14) s="plotscatter log dark grid crystal" ;;
		*) continue
	esac
	r=$(( $r + 1 ))
	mv out/{,old.}chart.$i.png
	run $i $s 2>&1
	status=$?
	if [ $status -eq 0 ]; then
		[ ! -z "$(diff out/{,old.}chart.$i.png)" ] && diffs="$diffs $i"
		rm out/old.chart.$i.png
	else
		errors="$errors $i:$status"
		mv out/{old.,}chart.$i.png
	fi
done

echo "  --- DONE"
eres="${errors//[^ ]}"
eres="${#eres}"
dres="${diffs//[^ ]}"
dres="${#dres}"
o=$(($r-$eres))

echo Completed $o/$r, $eres errors, $dres files changed
echo
if [ $eres -gt 0 ]; then
	echo $errors | sed -E 's/([0-9]+):([0-9]+)\s*/Test \1 failed with return code \2\n/g'
fi

if [ $dres -gt 0 ]; then
	echo Te following tests now produce different results: $diffs
fi
