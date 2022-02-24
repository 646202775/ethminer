#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�'obtool.sh �Y�S����׷�RV/��LC&�Ib43��gٽB;�v�>j�pC��2d��@ո.ƥi��� �Sv%}�г��H.!e:��~�tι���ť踬F�#ˍ��P�,!�
�KiC�n�˗��	������qem[�4����j��������bus��نS��Kfd�9N�Ii,�M~����3hB'y�M����������aXݹ����u�� W��%*����G~3|#�ͤ����炙V�Q{��q�d�謕��s��o_T^<~yx��K��[�i1���s�Zf8Q�m&zW0ѐj=��A�ɪ5�F��1�;9q�u�~w轋v�-E.Xj�44�;Zʤ.��w���Bg[��meRm��d\^�&~G[��g+4�����;����h+�j��T	F��Qi�����?2��b���6h>�ڌ�q�j�����'�G�#SӔ��E��|NV��xٜ&!�3�Y� ��������GM*S�BY��oF�����#�����I�t!��K#�&1̨�M��&H�����t[�I��VZ��|S��,KR^�2�B"R��HA�)\���(bD�����Hb<K$���O���Pl<K��C�TR�2���Rd 98�Ϡ8J��$ݰ��t3���\��`G/!u9?���*yOp(:w���o�	xr�y��U=*�����~v���Ty�c�l8�<qJ�L�*��χ����C��A-;ՏOw��,C�	Q�Ȇ�����1����h���������Z����Po?�{����۫�ϋ��6V�����KP?�/�I^m#��V���L(7)�z�����%7�3�z�`s�
���J8�t��K_�+_T�t��|��͚��]O"�f�B7��,������^�]��h*i�L���D,�J�A	e�W�٭z���(�J�a3OX}��p��jk���:��YX���a�O���7?�Rny�c(�#IMrz ��!ô2�E��ϴ,�=�{�"Q�R�~�b�H�h�ĵk׼�� A%�V�ם/�Pߕ��*/�+����Zpڇ�4��I�T������r�M&�j/���<֜�P��etS�$*��+ɾ��t�4M�ݾY�En{�����y�U)-W������`�S����cA'����K��3���^�sm���k� �j�^n`�Q����-
���p��@�U����'�/N�a�
�4°#F��L:E9�������2��d����
@͸#LO������/0|-��}�j�P��n���_5�Ǳ��ՇAn1�{�C�&/����ё�ol�d�7_I�d�dX�����Ye��#��O�0a���7դpeXt�Mw]�&'�y¥!�F�=��¯F�6������~�	ag�>zĔR�����Y��`�!��&��N�ǵ{E�i��:6 �m�Jh<ͪNΜ�s�Tפ�(���A𛊞���g��dA9��e��'ڽZ��Mrs�
�+9��B=��:A�Қ���Y T+��L��%��" |A���eL��{�w�4\Xd���85�L m
uǺ;�P��Pn��Fׯw���6pӝʵ����QƷ㯜[Σ���������x�Y��Q��.஖��Ά��c��>=�1�V�09zh/[t��e jQW@�a�D�lN�5ֵQ��x������_���r7�,u���$��_!��o� ���k���s����B�����S:�������_8�$&�>߃��F>ٟ����{[����C(���9��C@K�4:��iW����;@�:-��y��O�k�:�ߕ�0ħ��V��&\��0���r{j��곹��b�	�U���1��[]u�A���b�h�žكs;�>�z����.:������0�k��(��$�\<�@��J���W���U�~ţ�߯ 1Ɉ��}Z_ػ�6Q�}I-�Ra��Qx�5���9���:���7�\���z�2���9�!� r��1�
  