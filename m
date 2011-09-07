From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 6/6] fdtput: Add basic tests
Date: Wed,  7 Sep 2011 12:54:20 -0700
Message-ID: <1315425260-2711-7-git-send-email-sjg@chromium.org>
References: <1315425260-2711-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1315425260-2711-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These tests verify the major features.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Adjust tests for new fdtput arguments
- Add test for multiple strings
- Add test for exhausting fdt space

 tests/fdtput-runtest.sh |   55 +++++++++++++++++++++++++++++++++++
 tests/run_tests.sh      |   73 +++++++++++++++++++++++++++++++++++++++++++++-
 tests/tests.sh          |    1 +
 3 files changed, 127 insertions(+), 2 deletions(-)
 create mode 100644 tests/fdtput-runtest.sh

diff --git a/tests/fdtput-runtest.sh b/tests/fdtput-runtest.sh
new file mode 100644
index 0000000..ea51569
--- /dev/null
+++ b/tests/fdtput-runtest.sh
@@ -0,0 +1,55 @@
+#! /bin/sh
+
+# Run script for fdtput tests
+# We run fdtput to update the device tree, thn fdtget to check it
+
+# Usage
+#    fdtput-runtest.sh name expected_output dtb_file node property flags value
+
+. ./tests.sh
+
+LOG="tmp.log.$$"
+EXPECT="tmp.expect.$$"
+
+rm -f $TMPFILE $LOG
+
+expect="$1"
+echo "$expect" >$EXPECT
+dtb="$2"
+node="$3"
+property="$4"
+flags="$5"
+shift 5
+value="$@"
+
+# First run fdtput
+verbose_run $VALGRIND "$DTPUT" "$dtb" "$node" "$property" $value $flags
+ret="$?"
+
+if [ "$ret" -ne 0 -a "$expect" = "ERR" ]; then
+	PASS
+fi
+if [ "$ret" -gt 127 ]; then
+    signame=$(kill -l $[ret - 128])
+    FAIL "Killed by SIG$signame"
+fi
+
+# Now fdtget to read the value
+verbose_run_log "$LOG" $VALGRIND "$DTGET" "$dtb" "$node" "$property" $flags
+ret="$?"
+
+if [ "$ret" -gt 127 ]; then
+    signame=$(kill -l $[ret - 128])
+    FAIL "Killed by SIG$signame"
+fi
+
+diff $EXPECT $LOG
+ret="$?"
+
+rm -f $LOG $EXPECT
+
+if [ "$ret" -eq 0 ]; then
+	PASS
+else
+	FAIL
+fi
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 9acdeb5..cd03d61 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -90,6 +90,21 @@ run_fdtget_test () {
     base_run_test sh fdtget-runtest.sh "$@"
 }
 
+run_fdtput_test () {
+    # run_fdtput_test name expected_output dtb_file node property flags value...
+    echo -n "$1:	"
+    shift
+    output="$1"
+    dtb="$2"
+    node="$3"
+    property="$4"
+    flags="$5"
+    shift 5
+    base_run_test sh fdtput-runtest.sh "$output" "$dtb" "$node" "$property" \
+		"$flags" $@
+#     base_run_test sh fdtput-runtest.sh "$@"
+}
+
 tree1_tests () {
     TREE=$1
 
@@ -415,10 +430,61 @@ fdtget_tests () {
 	$file /randomnode blob
     run_fdtget_test "Integer list short" "a0b0c0d deeaadbe ef000000" -tx \
 	-t i $file /randomnode blob
-    run_fdtget_test "Missing property" ERR -tx \
+    run_fdtget_test "Missing property" ERR -ts \
 	$file /randomnode doctor-who
 }
 
+fdtput_tests () {
+    file=label01.dtb
+    src=label01.dts
+
+    # Create some test files containing useful strings
+    base=tmp.test0
+    file1=tmp.test1
+    file2=tmp.test2
+    bigfile1=tmp.test3
+    bigfile2=tmp.test4
+
+    # Filter out anything the shell might not like
+    cat $src | tr -d "'\"\n\;/\.\*{}\-" | tr -s "[:blank:]" " " >$base
+
+    # Make two small files
+    head -5 $base >$file1
+    cat $file1 | tr a-z A-Z | cut -c10-30 | sort -r >$file2
+
+    # and two larger ones
+    cat $base > $bigfile1
+    tac $base | tr a-z A-Z | sort -r >$bigfile2
+
+    # Allow just enough space for both file1 and file2
+    (( space = $(stat -c %s $file1) + $(stat -c %s $file2) ))
+    $DTC -O dtb -p $space -o $file ${file%.dtb}.dts 2>/dev/null
+
+    # run_fdtput_test <test-name> <expected-result> <file> <key> <flags>
+    #		<args>...
+    run_fdtput_test "Simple string" "a_model" $file / model -ts "a_model"
+    run_fdtput_test "Multiple string s" "board1 board2" \
+	$file / compatible -ts board1 board2
+    run_fdtput_test "Single string with spaces" "board1 board2" \
+	$file / compatible -ts "board1 board2"
+    run_fdtput_test "Integer" "32768" \
+	$file /cpus/PowerPC,970@1 d-cache-size "" "32768"
+    run_fdtput_test "Integer hex" "8001" \
+	$file /cpus/PowerPC,970@1 d-cache-size -tx 0x8001
+    run_fdtput_test "Integer list" "2 3 4" \
+	$file /randomnode tricky1 -tb "02 03 04"
+    run_fdtput_test "Byte list short" "a b c ea ad be ef" \
+	$file /randomnode blob -tbx "a b c ea ad be ef"
+    run_fdtput_test "Integer list short" "a0b0c0d deeaae ef000000" \
+	$file /randomnode blob -tx "a0b0c0d deeaae ef000000"
+    run_fdtput_test "Large string list" "`cat $file1 $file2`" \
+	$file /randomnode blob -ts "`cat $file1`" "`cat $file2`"
+
+    # This should be larger than available space in the fdt ($space)
+    run_fdtput_test "Enormous string list" ERR \
+	$file /randomnode blob -ts "`cat $bigfile1`" "`cat $bigfile2`"
+}
+
 while getopts "vt:m" ARG ; do
     case $ARG in
 	"v")
@@ -434,7 +500,7 @@ while getopts "vt:m" ARG ; do
 done
 
 if [ -z "$TESTSETS" ]; then
-    TESTSETS="libfdt dtc dtbs_equal fdtget"
+    TESTSETS="libfdt dtc dtbs_equal fdtget fdtput"
 fi
 
 # Make sure we don't have stale blobs lying around
@@ -454,6 +520,9 @@ for set in $TESTSETS; do
 	"fdtget")
 	    fdtget_tests
 	    ;;
+	"fdtput")
+	    fdtput_tests
+	    ;;
     esac
 done
 
diff --git a/tests/tests.sh b/tests/tests.sh
index d9a0524..6e5e76a 100644
--- a/tests/tests.sh
+++ b/tests/tests.sh
@@ -12,6 +12,7 @@ FAIL () {
 
 DTC=../dtc
 DTGET=../fdtget
+DTPUT=../fdtput
 
 verbose_run () {
     if [ -z "$QUIET_TEST" ]; then
-- 
1.7.3.1
