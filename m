From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/2] tests: fdtoverlay unit test
Date: Wed, 14 Jun 2017 17:51:12 +0300
Message-ID: <1497451872-15289-3-git-send-email-pantelis.antoniou@konsulko.com>
References: <1497451872-15289-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497451872-15289-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add an fdtoverlay unit test. Applies applies overlay(s) and then
retrieves an inserted property to verify.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 tests/fdtoverlay-runtest.sh | 40 ++++++++++++++++++++++++++++++++++++++++
 tests/run_tests.sh          | 27 ++++++++++++++++++++++++++-
 tests/tests.sh              |  1 +
 3 files changed, 67 insertions(+), 1 deletion(-)
 create mode 100644 tests/fdtoverlay-runtest.sh

diff --git a/tests/fdtoverlay-runtest.sh b/tests/fdtoverlay-runtest.sh
new file mode 100644
index 0000000..06c1169
--- /dev/null
+++ b/tests/fdtoverlay-runtest.sh
@@ -0,0 +1,40 @@
+#! /bin/sh
+
+# Run script for fdtoverlay tests
+# We run fdtoverlay to generate a target device tree, thn fdtget to check it
+
+# Usage
+#    fdtoverlay-runtest.sh name expected_output dtb_file node property flags value
+
+. ./tests.sh
+
+LOG=tmp.log.$$
+EXPECT=tmp.expect.$$
+rm -f $LOG $EXPECT
+trap "rm -f $LOG $EXPECT" 0
+
+expect="$1"
+echo $expect >$EXPECT
+node="$2"
+property="$3"
+flags="$4"
+basedtb="$5"
+targetdtb="$6"
+shift 6
+overlays="$@"
+
+# First run fdtoverlay
+verbose_run_check $VALGRIND "$FDTOVERLAY" -i "$basedtb" -o "$targetdtb" $overlays
+
+# Now fdtget to read the value
+verbose_run_log_check "$LOG" $VALGRIND "$DTGET" "$targetdtb" "$node" "$property" $flags
+
+if cmp $EXPECT $LOG >/dev/null; then
+    PASS
+else
+    if [ -z "$QUIET_TEST" ]; then
+	echo "EXPECTED :-:"
+	cat $EXPECT
+    fi
+    FAIL "Results differ from expected"
+fi
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 5df1480..d20729c 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -160,6 +160,14 @@ run_fdtdump_test() {
     base_run_test sh fdtdump-runtest.sh "$file" 2>/dev/null
 }
 
+run_fdtoverlay_test() {
+    expect="$1"
+    shift
+    shorten_echo fdtoverlay-runtest.sh "$expect" "$@"
+    printf ":	"
+    base_run_test sh fdtoverlay-runtest.sh "$expect" "$@"
+}
+
 BAD_FIXUP_TREES="bad_index \
 		empty \
 		empty_index \
@@ -771,6 +779,20 @@ fdtdump_tests () {
     run_fdtdump_test fdtdump.dts
 }
 
+fdtoverlay_tests() {
+    base=overlay_base.dts
+    basedtb=overlay_base.fdoverlay.test.dtb
+    overlay=overlay_overlay_manual_fixups.dts
+    overlaydtb=overlay_overlay_manual_fixups.fdoverlay.test.dtb
+    targetdtb=target.fdoverlay.test.dtb
+
+    run_dtc_test -@ -I dts -O dtb -o $basedtb $base
+    run_dtc_test -@ -I dts -O dtb -o $overlaydtb $overlay
+
+    # test that the new property is installed
+    run_fdtoverlay_test foobar "/test-node" "test-str-property" "-ts" ${basedtb} ${targetdtb} ${overlaydtb}
+}
+
 pylibfdt_tests () {
     TMP=/tmp/tests.stderr.$$
     python pylibfdt_tests.py -v 2> $TMP
@@ -809,7 +831,7 @@ while getopts "vt:me" ARG ; do
 done
 
 if [ -z "$TESTSETS" ]; then
-    TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump"
+    TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump fdtoverlay"
 
     # Test pylibfdt if the libfdt Python module is available.
     if [ -f ../pylibfdt/_libfdt.so ]; then
@@ -846,6 +868,9 @@ for set in $TESTSETS; do
 	"pylibfdt")
 	    pylibfdt_tests
 	    ;;
+        "fdtoverlay")
+	    fdtoverlay_tests
+	    ;;
     esac
 done
 
diff --git a/tests/tests.sh b/tests/tests.sh
index 818fd09..8dda6e1 100644
--- a/tests/tests.sh
+++ b/tests/tests.sh
@@ -22,6 +22,7 @@ DTC=../dtc
 DTGET=../fdtget
 DTPUT=../fdtput
 FDTDUMP=../fdtdump
+FDTOVERLAY=../fdtoverlay
 
 verbose_run () {
     if [ -z "$QUIET_TEST" ]; then
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
