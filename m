From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 08/10] Clean up invocation of fdt{get,put} tests
Date: Fri, 3 Feb 2012 07:47:03 -0800
Message-ID: <CAPnjgZ0QC_fNqcczGY_FAYj8cdoV=y_PO4gMhXFjcfw7ARqRdg@mail.gmail.com>
References: <1328245929-15443-1-git-send-email-david@gibson.dropbear.id.au>
 <1328245929-15443-9-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1328245929-15443-9-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

On Thu, Feb 2, 2012 at 9:12 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> This patch cleans up how the fdtget and fdtput tests are invoked.
> Specifically we no longer hide the full command lines with a wrapper
> function - this makes it possible to distinguish fdtget from similar
> fdtput tests and makes it easier to work out how to manually invoke an
> individual failing test.
>
> In addition, we remove the testing for errors from the
> fdt{get,put}-runtest.sh script, instead using an internal wrapper
> analagous to run_wrap_test which can test for any program invocation
> that's expected to return an error.
>
> For a couple of the fdtput tests this would result in printing out
> ludicrously large command lines. =A0Therefore we introduce a new
> mechanism to cut those down to something reasonable.
>
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> ---
> =A0tests/fdtget-runtest.sh | =A0 11 +---
> =A0tests/fdtput-runtest.sh | =A0 16 +----
> =A0tests/run_tests.sh =A0 =A0 =A0| =A0144 ++++++++++++++++++++++++++-----=
----------------
> =A0tests/tests.sh =A0 =A0 =A0 =A0 =A0| =A0 19 ++++++
> =A04 files changed, 104 insertions(+), 86 deletions(-)

Well after 15mins of reading through it looks good to me. Would be
easier to understand as three commits I think:

- changing arg order for run_fdtget/put_test
- the shorten_echo feature
- moving to verbose_run_log_check

Thanks for tidying this up. I was not happy with the test invocation
setup I had (and the ugliness of shell variables / quoting /
arguments) and moving the argument to the front makes this much
cleaner.

Regards,
Simon
>
> diff --git a/tests/fdtget-runtest.sh b/tests/fdtget-runtest.sh
> index 42dc00c..75e7503 100755
> --- a/tests/fdtget-runtest.sh
> +++ b/tests/fdtget-runtest.sh
> @@ -8,17 +8,10 @@ rm -f $LOG $EXPECT
> =A0trap "rm -f $LOG $EXPECT" 0
>
> =A0expect=3D"$1"
> -echo "$expect" >$EXPECT
> +echo $expect >$EXPECT
> =A0shift
>
> -verbose_run_log "$LOG" $VALGRIND "$DTGET" "$@"
> -ret=3D"$?"
> -
> -if [ "$ret" -ne 0 -a "$expect" =3D "ERR" ]; then
> - =A0 =A0 =A0 PASS
> -fi
> -
> -FAIL_IF_SIGNAL $ret
> +verbose_run_log_check "$LOG" $VALGRIND $DTGET "$@"
>
> =A0diff $EXPECT $LOG
> =A0ret=3D"$?"
> diff --git a/tests/fdtput-runtest.sh b/tests/fdtput-runtest.sh
> index 9178d2f..dbd9c0d 100644
> --- a/tests/fdtput-runtest.sh
> +++ b/tests/fdtput-runtest.sh
> @@ -14,7 +14,7 @@ rm -f $LOG $EXPECT
> =A0trap "rm -f $LOG $EXPECT" 0
>
> =A0expect=3D"$1"
> -echo "$expect" >$EXPECT
> +echo $expect >$EXPECT
> =A0dtb=3D"$2"
> =A0node=3D"$3"
> =A0property=3D"$4"
> @@ -23,20 +23,10 @@ shift 5
> =A0value=3D"$@"
>
> =A0# First run fdtput
> -verbose_run $VALGRIND "$DTPUT" "$dtb" "$node" "$property" $value $flags
> -ret=3D"$?"
> -
> -if [ "$ret" -ne 0 -a "$expect" =3D "ERR" ]; then
> - =A0 =A0 =A0 PASS
> -fi
> -
> -FAIL_IF_SIGNAL $ret
> +verbose_run_check $VALGRIND "$DTPUT" "$dtb" "$node" "$property" $value $=
flags
>
> =A0# Now fdtget to read the value
> -verbose_run_log "$LOG" $VALGRIND "$DTGET" "$dtb" "$node" "$property" $fl=
ags
> -ret=3D"$?"
> -
> -FAIL_IF_SIGNAL $ret
> +verbose_run_log_check "$LOG" $VALGRIND "$DTGET" "$dtb" "$node" "$propert=
y" $flags
>
> =A0diff $EXPECT $LOG
> =A0ret=3D"$?"
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 37c173c..999c882 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -36,6 +36,20 @@ base_run_test() {
> =A0 =A0 fi
> =A0}
>
> +shorten_echo () {
> + =A0 =A0limit=3D32
> + =A0 =A0echo -n "$1"
> + =A0 =A0shift
> + =A0 =A0for x; do
> + =A0 =A0 =A0 if [ ${#x} -le $limit ]; then
> + =A0 =A0 =A0 =A0 =A0 echo -n " $x"
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 short=3D$(echo "$x" | head -c$limit)
> + =A0 =A0 =A0 =A0 =A0 echo -n " \"$short\"...<${#x} bytes>"
> + =A0 =A0 =A0 fi
> + =A0 =A0done
> +}
> +
> =A0run_test () {
> =A0 =A0 echo -n "$@: =A0 =A0 =A0 "
> =A0 =A0 if [ -n "$VALGRIND" -a -f $1.supp ]; then
> @@ -70,6 +84,28 @@ run_wrap_test () {
> =A0 =A0 base_run_test wrap_test "$@"
> =A0}
>
> +wrap_error () {
> + =A0 =A0(
> + =A0 =A0 =A0 if verbose_run "$@"; then
> + =A0 =A0 =A0 =A0 =A0 FAIL "Expected non-zero return code"
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 ret=3D"$?"
> + =A0 =A0 =A0 =A0 =A0 if [ "$ret" -gt 127 ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 signame=3D$(kill -l $((ret - 128)))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 FAIL "Killed by SIG$signame"
> + =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 PASS
> + =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 fi
> + =A0 =A0)
> +}
> +
> +run_wrap_error_test () {
> + =A0 =A0shorten_echo "$@"
> + =A0 =A0echo -n " {!=3D 0}: =A0"
> + =A0 =A0base_run_test wrap_error "$@"
> +}
> +
> =A0run_dtc_test () {
> =A0 =A0 echo -n "dtc $@: =A0 "
> =A0 =A0 base_run_test wrap_test $VALGRIND $DTC "$@"
> @@ -84,25 +120,18 @@ asm_to_so_test () {
> =A0}
>
> =A0run_fdtget_test () {
> - =A0 =A0# run_fdtget_test name expected_output dtb_file args...
> - =A0 =A0echo -n "$1: =A0 =A0 =A0 "
> + =A0 =A0expect=3D"$1"
> =A0 =A0 shift
> - =A0 =A0base_run_test sh fdtget-runtest.sh "$@"
> + =A0 =A0echo -n "fdtget-runtest.sh "$expect" $@: =A0 "
> + =A0 =A0base_run_test sh fdtget-runtest.sh "$expect" "$@"
> =A0}
>
> =A0run_fdtput_test () {
> - =A0 =A0# run_fdtput_test name expected_output dtb_file node property fl=
ags value...
> - =A0 =A0echo -n "$1: =A0 =A0 =A0 "
> + =A0 =A0expect=3D"$1"
> =A0 =A0 shift
> - =A0 =A0output=3D"$1"
> - =A0 =A0dtb=3D"$2"
> - =A0 =A0node=3D"$3"
> - =A0 =A0property=3D"$4"
> - =A0 =A0flags=3D"$5"
> - =A0 =A0shift 5
> - =A0 =A0base_run_test sh fdtput-runtest.sh "$output" "$dtb" "$node" "$pr=
operty" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 "$flags" $@
> -# =A0 =A0 base_run_test sh fdtput-runtest.sh "$@"
> + =A0 =A0shorten_echo fdtput-runtest.sh "$expect" "$@"
> + =A0 =A0echo -n ": "
> + =A0 =A0base_run_test sh fdtput-runtest.sh "$expect" "$@"
> =A0}
>
> =A0tree1_tests () {
> @@ -425,39 +454,32 @@ dtbs_equal_tests () {
> =A0}
>
> =A0fdtget_tests () {
> - =A0 =A0file=3Dlabel01.dtb
> - =A0 =A0$DTC -O dtb -o $file ${file%.dtb}.dts 2>/dev/null
> + =A0 =A0dts=3Dlabel01.dts
> + =A0 =A0dtb=3D$dts.fdtget.test.dtb
> + =A0 =A0run_dtc_test -O dtb -o $dtb $dts
>
> - =A0 =A0# run_fdtget_test <test-name> <expected-result> <args>...
> - =A0 =A0run_fdtget_test "Simple string" "MyBoardName" $file / model
> - =A0 =A0run_fdtget_test "Multiple string i" "77 121 66 111 \
> + =A0 =A0# run_fdtget_test <expected-result> [<flags>] <file> <node> <pro=
perty>
> + =A0 =A0run_fdtget_test "MyBoardName" $dtb / model
> + =A0 =A0run_fdtget_test "77 121 66 111 \
> =A097 114 100 78 97 109 101 0 77 121 66 111 97 114 100 70 97 109 105 \
> -108 121 78 97 109 101 0" $file / compatible
> - =A0 =A0run_fdtget_test "Multiple string s" "MyBoardName MyBoardFamilyNa=
me" \
> - =A0 =A0 =A0 -t s $file / compatible
> - =A0 =A0run_fdtget_test "Integer" "32768" $file /cpus/PowerPC,970@1 d-ca=
che-size
> - =A0 =A0run_fdtget_test "Integer hex" "8000" -tx $file \
> - =A0 =A0 =A0 /cpus/PowerPC,970@1 d-cache-size
> - =A0 =A0run_fdtget_test "Integer list" "61 62 63 0" -tbx $file \
> - =A0 =A0 =A0 /randomnode tricky1
> - =A0 =A0run_fdtget_test "Byte list short" "a b c d de ea ad be ef" -tbx \
> - =A0 =A0 =A0 $file /randomnode blob
> +108 121 78 97 109 101 0" $dtb / compatible
> + =A0 =A0run_fdtget_test "MyBoardName MyBoardFamilyName" -t s $dtb / comp=
atible
> + =A0 =A0run_fdtget_test 32768 $dtb /cpus/PowerPC,970@1 d-cache-size
> + =A0 =A0run_fdtget_test 8000 -tx $dtb /cpus/PowerPC,970@1 d-cache-size
> + =A0 =A0run_fdtget_test "61 62 63 0" -tbx $dtb /randomnode tricky1
> + =A0 =A0run_fdtget_test "a b c d de ea ad be ef" -tbx $dtb /randomnode b=
lob
>
> =A0 =A0 # Here the property size is not a multiple of 4 bytes, so it shou=
ld fail
> - =A0 =A0run_fdtget_test "Integer list invalid" ERR -tlx \
> - =A0 =A0 =A0 $file /randomnode mixed
> - =A0 =A0run_fdtget_test "Integer list halfword" "6162 6300 1234 0 a 0 b =
0 c" -thx \
> - =A0 =A0 =A0 $file /randomnode mixed
> - =A0 =A0run_fdtget_test "Integer list byte" \
> - =A0 =A0 =A0 "61 62 63 0 12 34 0 0 0 a 0 0 0 b 0 0 0 c" -thhx \
> - =A0 =A0 =A0 $file /randomnode mixed
> - =A0 =A0run_fdtget_test "Missing property" ERR -ts \
> - =A0 =A0 =A0 $file /randomnode doctor-who
> + =A0 =A0run_wrap_error_test $DTGET -tlx $dtb /randomnode mixed
> + =A0 =A0run_fdtget_test "6162 6300 1234 0 a 0 b 0 c" -thx $dtb /randomno=
de mixed
> + =A0 =A0run_fdtget_test "61 62 63 0 12 34 0 0 0 a 0 0 0 b 0 0 0 c" \
> + =A0 =A0 =A0 -thhx $dtb /randomnode mixed
> + =A0 =A0run_wrap_error_test $DTGET -ts $dtb /randomnode doctor-who
> =A0}
>
> =A0fdtput_tests () {
> - =A0 =A0file=3Dlabel01.dtb
> - =A0 =A0src=3Dlabel01.dts
> + =A0 =A0dts=3Dlabel01.dts
> + =A0 =A0dtb=3D$dts.fdtput.test.dtb
>
> =A0 =A0 # Create some test files containing useful strings
> =A0 =A0 base=3Dtmp.test0
> @@ -467,7 +489,7 @@ fdtput_tests () {
> =A0 =A0 bigfile2=3Dtmp.test4
>
> =A0 =A0 # Filter out anything the shell might not like
> - =A0 =A0cat $src | tr -d "'\"\n\;/\.\*{}\-" | tr -s "[:blank:]" " " >$ba=
se
> + =A0 =A0cat $dts | tr -d "'\"\n\;/\.\*{}\-" | tr -s "[:blank:]" " " >$ba=
se
>
> =A0 =A0 # Make two small files
> =A0 =A0 head -5 $base >$file1
> @@ -479,31 +501,25 @@ fdtput_tests () {
>
> =A0 =A0 # Allow just enough space for both file1 and file2
> =A0 =A0 space=3D$(( $(stat -c %s $file1) + $(stat -c %s $file2) ))
> - =A0 =A0$DTC -O dtb -p $space -o $file ${file%.dtb}.dts 2>/dev/null
> -
> - =A0 =A0# run_fdtput_test <test-name> <expected-result> <file> <key> <fl=
ags>
> - =A0 =A0# =A0 =A0 =A0 =A0 =A0<args>...
> - =A0 =A0run_fdtput_test "Simple string" "a_model" $file / model -ts "a_m=
odel"
> - =A0 =A0run_fdtput_test "Multiple string s" "board1 board2" \
> - =A0 =A0 =A0 $file / compatible -ts board1 board2
> - =A0 =A0run_fdtput_test "Single string with spaces" "board1 board2" \
> - =A0 =A0 =A0 $file / compatible -ts "board1 board2"
> - =A0 =A0run_fdtput_test "Integer" "32768" \
> - =A0 =A0 =A0 $file /cpus/PowerPC,970@1 d-cache-size "" "32768"
> - =A0 =A0run_fdtput_test "Integer hex" "8001" \
> - =A0 =A0 =A0 $file /cpus/PowerPC,970@1 d-cache-size -tx 0x8001
> - =A0 =A0run_fdtput_test "Integer list" "2 3 12" \
> - =A0 =A0 =A0 $file /randomnode tricky1 -tbi "02 003 12"
> - =A0 =A0run_fdtput_test "Byte list short" "a b c ea ad be ef" \
> - =A0 =A0 =A0 $file /randomnode blob -tbx "a b c ea ad be ef"
> - =A0 =A0run_fdtput_test "Integer list short" "a0b0c0d deeaae ef000000" \
> - =A0 =A0 =A0 $file /randomnode blob -tx "a0b0c0d deeaae ef000000"
> - =A0 =A0run_fdtput_test "Large string list" "`cat $file1 $file2`" \
> - =A0 =A0 =A0 $file /randomnode blob -ts "`cat $file1`" "`cat $file2`"
> + =A0 =A0run_dtc_test -O dtb -p $space -o $dtb $dts
> +
> + =A0 =A0# run_fdtput_test <expected-result> <file> <node> <property> <fl=
ags> <value>
> + =A0 =A0run_fdtput_test "a_model" $dtb / model -ts "a_model"
> + =A0 =A0run_fdtput_test "board1 board2" $dtb / compatible -ts board1 boa=
rd2
> + =A0 =A0run_fdtput_test "board1 board2" $dtb / compatible -ts "board1 bo=
ard2"
> + =A0 =A0run_fdtput_test "32768" $dtb /cpus/PowerPC,970@1 d-cache-size ""=
 "32768"
> + =A0 =A0run_fdtput_test "8001" $dtb /cpus/PowerPC,970@1 d-cache-size -tx=
 0x8001
> + =A0 =A0run_fdtput_test "2 3 12" $dtb /randomnode tricky1 -tbi "02 003 1=
2"
> + =A0 =A0run_fdtput_test "a b c ea ad be ef" $dtb /randomnode blob \
> + =A0 =A0 =A0 -tbx "a b c ea ad be ef"
> + =A0 =A0run_fdtput_test "a0b0c0d deeaae ef000000" $dtb /randomnode blob \
> + =A0 =A0 =A0 -tx "a0b0c0d deeaae ef000000"
> + =A0 =A0run_fdtput_test "`cat $file1 $file2`" $dtb /randomnode blob \
> + =A0 =A0 =A0 -ts "`cat $file1`" "`cat $file2`"
>
> =A0 =A0 # This should be larger than available space in the fdt ($space)
> - =A0 =A0run_fdtput_test "Enormous string list" ERR \
> - =A0 =A0 =A0 $file /randomnode blob -ts "`cat $bigfile1`" "`cat $bigfile=
2`"
> + =A0 =A0run_wrap_error_test $DTPUT $dtb /randomnode blob \
> + =A0 =A0 =A0 -ts "`cat $bigfile1`" "`cat $bigfile2`"
>
> =A0 =A0 # TODO: Add tests for verbose mode?
> =A0}
> diff --git a/tests/tests.sh b/tests/tests.sh
> index 3b7c6c8..31530d5 100644
> --- a/tests/tests.sh
> +++ b/tests/tests.sh
> @@ -30,6 +30,15 @@ verbose_run () {
> =A0 =A0 fi
> =A0}
>
> +verbose_run_check () {
> + =A0 =A0verbose_run "$@"
> + =A0 =A0ret=3D"$?"
> + =A0 =A0FAIL_IF_SIGNAL $ret
> + =A0 =A0if [ $ret !=3D 0 ]; then
> + =A0 =A0 =A0 FAIL "Returned error code $ret"
> + =A0 =A0fi
> +}
> +
> =A0verbose_run_log () {
> =A0 =A0 LOG=3D"$1"
> =A0 =A0 shift
> @@ -40,3 +49,13 @@ verbose_run_log () {
> =A0 =A0 fi
> =A0 =A0 return $ret
> =A0}
> +
> +verbose_run_log_check () {
> + =A0 =A0verbose_run_log "$@"
> + =A0 =A0ret=3D"$?"
> + =A0 =A0FAIL_IF_SIGNAL $ret
> + =A0 =A0if [ $ret !=3D 0 ]; then
> + =A0 =A0 =A0 FAIL "Returned error code $ret"
> + =A0 =A0fi
> +}
> +
> --
> 1.7.8.3
>
