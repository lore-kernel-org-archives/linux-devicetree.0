From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 4/6] fdtget: Add basic tests
Date: Wed,  7 Sep 2011 12:54:18 -0700
Message-ID: <1315425260-2711-5-git-send-email-sjg@chromium.org>
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

This adds a few tests for common use cases.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Adjust tests for new fdtget arguments

 tests/fdtget-runtest.sh |   35 +++++++++++++++++++++++++++++++++++
 tests/run_tests.sh      |   36 +++++++++++++++++++++++++++++++++++-
 tests/tests.sh          |    1 +
 3 files changed, 71 insertions(+), 1 deletions(-)
 create mode 100755 tests/fdtget-runtest.sh

diff --git a/tests/fdtget-runtest.sh b/tests/fdtget-runtest.sh
new file mode 100755
index 0000000..f38184f
--- /dev/null
+++ b/tests/fdtget-runtest.sh
@@ -0,0 +1,35 @@
+#! /bin/sh
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
+shift
+
+verbose_run_log "$LOG" $VALGRIND "$DTGET" "$@"
+ret="$?"
+
+if [ "$ret" -ne 0 -a "$expect" = "ERR" ]; then
+	PASS
+fi
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
index 72dda32..9acdeb5 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -83,6 +83,13 @@ asm_to_so_test () {
     run_wrap_test asm_to_so "$@"
 }
 
+run_fdtget_test () {
+    # run_fdtget_test name expected_output dtb_file args...
+    echo -n "$1:	"
+    shift
+    base_run_test sh fdtget-runtest.sh "$@"
+}
+
 tree1_tests () {
     TREE=$1
 
@@ -388,6 +395,30 @@ dtbs_equal_tests () {
     cmp_tests test_tree1.dtb $WRONG_TREE1
 }
 
+fdtget_tests () {
+    file=label01.dtb
+    $DTC -O dtb -o $file ${file%.dtb}.dts 2>/dev/null
+
+    # run_fdtget_test <test-name> <expected-result> <args>...
+    run_fdtget_test "Simple string" "MyBoardName" $file / model
+    run_fdtget_test "Multiple string i" "77 121 66 111 \
+97 114 100 78 97 109 101 0 77 121 66 111 97 114 100 70 97 109 105 \
+108 121 78 97 109 101 0" $file / compatible
+    run_fdtget_test "Multiple string s" "MyBoardName MyBoardFamilyName" \
+	-t s $file / compatible
+    run_fdtget_test "Integer" "32768" $file /cpus/PowerPC,970@1 d-cache-size
+    run_fdtget_test "Integer hex" "8000" -tx $file \
+	/cpus/PowerPC,970@1 d-cache-size
+    run_fdtget_test "Integer list" "61 62 63 0" -tbx $file \
+	/randomnode tricky1
+    run_fdtget_test "Byte list short" "a b c d de ea ad be ef" -tbx \
+	$file /randomnode blob
+    run_fdtget_test "Integer list short" "a0b0c0d deeaadbe ef000000" -tx \
+	-t i $file /randomnode blob
+    run_fdtget_test "Missing property" ERR -tx \
+	$file /randomnode doctor-who
+}
+
 while getopts "vt:m" ARG ; do
     case $ARG in
 	"v")
@@ -403,7 +434,7 @@ while getopts "vt:m" ARG ; do
 done
 
 if [ -z "$TESTSETS" ]; then
-    TESTSETS="libfdt dtc dtbs_equal"
+    TESTSETS="libfdt dtc dtbs_equal fdtget"
 fi
 
 # Make sure we don't have stale blobs lying around
@@ -420,6 +451,9 @@ for set in $TESTSETS; do
 	"dtbs_equal")
 	    dtbs_equal_tests
 	    ;;
+	"fdtget")
+	    fdtget_tests
+	    ;;
     esac
 done
 
diff --git a/tests/tests.sh b/tests/tests.sh
index 30ffead..d9a0524 100644
--- a/tests/tests.sh
+++ b/tests/tests.sh
@@ -11,6 +11,7 @@ FAIL () {
 }
 
 DTC=../dtc
+DTGET=../fdtget
 
 verbose_run () {
     if [ -z "$QUIET_TEST" ]; then
-- 
1.7.3.1
