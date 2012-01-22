From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6 2/2] Add fdtput utility to write property values to a
 device tree
Date: Sun, 22 Jan 2012 22:23:18 +1100
Message-ID: <20120122112318.GQ4512@truffala.fritz.box>
References: <1327169688-7569-2-git-send-email-sjg@chromium.org>
 <1327169688-7569-3-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1327169688-7569-3-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 21, 2012 at 10:14:48AM -0800, Simon Glass wrote:
> This simple utility allows writing of values into a device tree from the
> command line. It aimes to be the opposite of fdtget.

[snip]
> diff --git a/tests/fdtput-runtest.sh b/tests/fdtput-runtest.sh
> new file mode 100644
> index 0000000..ea51569
> --- /dev/null
> +++ b/tests/fdtput-runtest.sh
> @@ -0,0 +1,55 @@
> +#! /bin/sh
> +
> +# Run script for fdtput tests
> +# We run fdtput to update the device tree, thn fdtget to check it
> +
> +# Usage
> +#    fdtput-runtest.sh name expected_output dtb_file node property flags value
> +
> +. ./tests.sh
> +
> +LOG="tmp.log.$$"
> +EXPECT="tmp.expect.$$"
> +
> +rm -f $TMPFILE $LOG

TMPFILE does not appear to be set here.

> +expect="$1"
> +echo "$expect" >$EXPECT
> +dtb="$2"
> +node="$3"
> +property="$4"
> +flags="$5"
> +shift 5
> +value="$@"
> +
> +# First run fdtput
> +verbose_run $VALGRIND "$DTPUT" "$dtb" "$node" "$property" $value $flags
> +ret="$?"
> +
> +if [ "$ret" -ne 0 -a "$expect" = "ERR" ]; then
> +	PASS
> +fi
> +if [ "$ret" -gt 127 ]; then
> +    signame=$(kill -l $[ret - 128])

$[] bashism again.

> +    FAIL "Killed by SIG$signame"
> +fi
> +
> +# Now fdtget to read the value
> +verbose_run_log "$LOG" $VALGRIND "$DTGET" "$dtb" "$node" "$property" $flags
> +ret="$?"
> +
> +if [ "$ret" -gt 127 ]; then
> +    signame=$(kill -l $[ret - 128])
> +    FAIL "Killed by SIG$signame"
> +fi

So, doing an fdtget to extract the value for checking is one way.  I
would have thought the more obvious way to check results would be to
do a dtbs_ordered_equal or dtbs_unordered_equal on the output.  That
then checks the fdtput behaviour independent of the fdtget behaviour.

[snip]
> +fdtput_tests () {
> +    file=label01.dtb
> +    src=label01.dts
> +
> +    # Create some test files containing useful strings
> +    base=tmp.test0
> +    file1=tmp.test1
> +    file2=tmp.test2
> +    bigfile1=tmp.test3
> +    bigfile2=tmp.test4
> +
> +    # Filter out anything the shell might not like
> +    cat $src | tr -d "'\"\n\;/\.\*{}\-" | tr -s "[:blank:]" " " >$base
> +
> +    # Make two small files
> +    head -5 $base >$file1
> +    cat $file1 | tr a-z A-Z | cut -c10-30 | sort -r >$file2
> +
> +    # and two larger ones
> +    cat $base > $bigfile1
> +    tac $base | tr a-z A-Z | sort -r >$bigfile2

This seems a really convoluted way of just generating some testdata.
And misleading since AFAICT the fact that this testdata is derived
from a dts is not actually relevant in any way.

> +    # Allow just enough space for both file1 and file2
> +    (( space = $(stat -c %s $file1) + $(stat -c %s $file2) ))

Ugh, several bashisms here, and I'm not entirely sure what they are.
I got it not to produce errors with /bin/dash, but it still didn't
seem to work quite right.  In particular spaces around an assignment
won't work in most shells.

> +    $DTC -O dtb -p $space -o $file ${file%.dtb}.dts 2>/dev/null
> +
> +    # run_fdtput_test <test-name> <expected-result> <file> <key> <flags>
> +    #		<args>...
> +    run_fdtput_test "Simple string" "a_model" $file / model -ts "a_model"
> +    run_fdtput_test "Multiple string s" "board1 board2" \
> +	$file / compatible -ts board1 board2
> +    run_fdtput_test "Single string with spaces" "board1 board2" \
> +	$file / compatible -ts "board1 board2"
> +    run_fdtput_test "Integer" "32768" \
> +	$file /cpus/PowerPC,970@1 d-cache-size "" "32768"
> +    run_fdtput_test "Integer hex" "8001" \
> +	$file /cpus/PowerPC,970@1 d-cache-size -tx 0x8001
> +    run_fdtput_test "Integer list" "2 3 12" \
> +	$file /randomnode tricky1 -tbi "02 003 12"
> +    run_fdtput_test "Byte list short" "a b c ea ad be ef" \
> +	$file /randomnode blob -tbx "a b c ea ad be ef"
> +    run_fdtput_test "Integer list short" "a0b0c0d deeaae ef000000" \
> +	$file /randomnode blob -tx "a0b0c0d deeaae ef000000"
> +    run_fdtput_test "Large string list" "`cat $file1 $file2`" \
> +	$file /randomnode blob -ts "`cat $file1`" "`cat $file2`"

So, this test fails for me.  I suspect it is because one of the
bashisms means it isn't executing quite right, but I haven't pinned it
down yet.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
