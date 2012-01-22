From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6 1/2] Add fdtget utility to read property values from a
 device tree
Date: Sun, 22 Jan 2012 21:30:49 +1100
Message-ID: <20120122103049.GP4512@truffala.fritz.box>
References: <1327169688-7569-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1327169688-7569-2-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

On Sat, Jan 21, 2012 at 10:14:47AM -0800, Simon Glass wrote:
> This simply utility makes it easy for scripts to read values from the device
> tree. It is written in C and uses the same libfdt as the rest of the dtc
> package.
> 
> What is it for:
> - Reading fdt values from scripts
> - Extracting fdt information within build systems
> - Looking at particular values without having to dump the entire tree
> 
> To use it, specify the fdt binary file on command line followed by a list of
> node, property pairs. The utility then looks up each node, finds the property
> and displays the value.
> 
> Each value is printed on a new line.
> 
> fdtget tries to guess the type of each property based on its contents. This
> is not always reliable, so you can use the -t option to force fdtget to decode
> the value as a string, or byte, etc.
> 
> To read from stdin, use - as the file.
> 
> Usage:
> 	fdtget <options> <dt file> [<node> <property>]...
> Options:
> 	-t <type>	Type of data
> 	-h		Print this help
> 
> <type>	s=string, i=int, u=unsigned, x=hex
> 	Optional modifier prefix:
> 		hh or b=byte, h=2 byte, l=4 byte (default)
> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Um.. there are a bunch of small problems here.

[snip]
> +	if (size == -1)
> +		size = (len % 4) == 0 ? 4 : 1;

If you have braces on one path of an if/else, please put them on both.

> +	else if (len % size) {
> +		fprintf(stderr, "Property length must be a multiple of "
> +				"selected data size\n");
> +		return -1;
> +	}

[snip]
> diff --git a/tests/fdtget-runtest.sh b/tests/fdtget-runtest.sh
> new file mode 100755
> index 0000000..f38184f
> --- /dev/null
> +++ b/tests/fdtget-runtest.sh
> @@ -0,0 +1,35 @@
> +#! /bin/sh
> +
> +. ./tests.sh
> +
> +LOG="tmp.log.$$"
> +EXPECT="tmp.expect.$$"
> +
> +rm -f $TMPFILE $LOG

TMPFILE doesn't appear to be defined here.

> +
> +expect="$1"
> +echo "$expect" >$EXPECT
> +shift
> +
> +verbose_run_log "$LOG" $VALGRIND "$DTGET" "$@"
> +ret="$?"
> +
> +if [ "$ret" -ne 0 -a "$expect" = "ERR" ]; then
> +	PASS

Ugh, ugly.  I'd prefer a different option to the script, or a
different script entirely for checking expected errors.

> +fi
> +
> +if [ "$ret" -gt 127 ]; then
> +    signame=$(kill -l $[ret - 128])

$[] for math expressions is a bashism.  We want the test scripts to be
plain Bourne shell.

> +    FAIL "Killed by SIG$signame"
> +fi
> +
> +diff $EXPECT $LOG

Please use diff -u, it's much easier to read.  Also the output should
go to null unless running in verbose mode.

> +ret="$?"
> +
> +rm -f $LOG $EXPECT
> +
> +if [ "$ret" -eq 0 ]; then
> +	PASS
> +else
> +	FAIL
> +fi
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index e42154b..e6184df 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -83,6 +83,13 @@ asm_to_so_test () {
>      run_wrap_test asm_to_so "$@"
>  }
>  
> +run_fdtget_test () {
> +    # run_fdtget_test name expected_output dtb_file args...
> +    echo -n "$1:	"
> +    shift
> +    base_run_test sh fdtget-runtest.sh "$@"

Ugh.  I hate the way you've overriden the displayed test name with a
message.  The headings in the test output are intentionally the
commands you need to run the tests individually, to make tracking
things down easier in the case of failures.

As it is the labels don't even distinguish between fdtget and later
corresponding fdtput tests.

> +}
> +
>  tree1_tests () {
>      TREE=$1
>  
> @@ -402,6 +409,37 @@ dtbs_equal_tests () {
>      cmp_tests test_tree1.dtb $WRONG_TREE1
>  }
>  
> +fdtget_tests () {
> +    file=label01.dtb
> +    $DTC -O dtb -o $file ${file%.dtb}.dts 2>/dev/null

Should be a run_dtc_test here to catch an error in this command.
Also, I think ${%} is a bashism.

> +
> +    # run_fdtget_test <test-name> <expected-result> <args>...
> +    run_fdtget_test "Simple string" "MyBoardName" $file / model
> +    run_fdtget_test "Multiple string i" "77 121 66 111 \
> +97 114 100 78 97 109 101 0 77 121 66 111 97 114 100 70 97 109 105 \
> +108 121 78 97 109 101 0" $file / compatible
> +    run_fdtget_test "Multiple string s" "MyBoardName MyBoardFamilyName" \
> +	-t s $file / compatible
> +    run_fdtget_test "Integer" "32768" $file /cpus/PowerPC,970@1 d-cache-size
> +    run_fdtget_test "Integer hex" "8000" -tx $file \
> +	/cpus/PowerPC,970@1 d-cache-size
> +    run_fdtget_test "Integer list" "61 62 63 0" -tbx $file \
> +	/randomnode tricky1
> +    run_fdtget_test "Byte list short" "a b c d de ea ad be ef" -tbx \
> +	$file /randomnode blob
> +
> +    # Here the property size is not a multiple of 4 bytes, so it should fail
> +    run_fdtget_test "Integer list invalid" ERR -tlx \
> +	$file /randomnode mixed
> +    run_fdtget_test "Integer list halfword" "6162 6300 1234 0 a 0 b 0 c" -thx \
> +	$file /randomnode mixed
> +    run_fdtget_test "Integer list byte" \
> +	"61 62 63 0 12 34 0 0 0 a 0 0 0 b 0 0 0 c" -thhx \
> +	$file /randomnode mixed
> +    run_fdtget_test "Missing property" ERR -ts \
> +	$file /randomnode doctor-who
> +}
> +
>  utilfdt_tests () {
>      run_test utilfdt_test
>  }
> @@ -421,7 +459,7 @@ while getopts "vt:m" ARG ; do
>  done
>  
>  if [ -z "$TESTSETS" ]; then
> -    TESTSETS="libfdt utilfdt dtc dtbs_equal"
> +    TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget"
>  fi
>  
>  # Make sure we don't have stale blobs lying around
> @@ -441,6 +479,9 @@ for set in $TESTSETS; do
>  	"dtbs_equal")
>  	    dtbs_equal_tests
>  	    ;;
> +	"fdtget")
> +	    fdtget_tests
> +	    ;;
>      esac
>  done
>  
> diff --git a/tests/tests.sh b/tests/tests.sh
> index 30ffead..d9a0524 100644
> --- a/tests/tests.sh
> +++ b/tests/tests.sh
> @@ -11,6 +11,7 @@ FAIL () {
>  }
>  
>  DTC=../dtc
> +DTGET=../fdtget
>  
>  verbose_run () {
>      if [ -z "$QUIET_TEST" ]; then
> diff --git a/util.h b/util.h
> index 730918e..c8eb45d 100644
> --- a/util.h
> +++ b/util.h
> @@ -140,4 +140,14 @@ int utilfdt_write_err(const char *filename, const void *blob);
>   */
>  int utilfdt_decode_type(const char *fmt, int *type, int *size);
>  
> +/*
> + * This is a usage message fragment for the -t option. It is the format
> + * supported by utilfdt_decode_type.
> + */
> +
> +#define USAGE_TYPE_MSG \
> +	"<type>\ts=string, i=int, u=unsigned, x=hex\n" \
> +	"\tOptional modifier prefix:\n" \
> +	"\t\thh or b=byte, h=2 byte, l=4 byte (default)\n";
> +
>  #endif /* _UTIL_H */

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
