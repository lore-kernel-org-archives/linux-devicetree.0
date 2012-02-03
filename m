From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 09/10] Don't use diff to check fdt{get,put} results
Date: Fri,  3 Feb 2012 16:12:08 +1100
Message-ID: <1328245929-15443-10-git-send-email-david@gibson.dropbear.id.au>
References: <1328245929-15443-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1328245929-15443-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: jdl-CYoMK+44s/E@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently the fdt{get,put}-runtest.sh scripts invoke diff to check if
fdt{get,put} did the right thing.  This isn't great though: it's not
obvious from the diff output which is the expected and which is the
actual result; diff's line by line behaviour is useless here, since all
the results are a single line and finally, when there is a difference
it always prints information even when the tests are supposed to be
running in quiet mode.

This patch uses cmp instead, and explicitly prints the expected results,
when running in verbose mode (the invocation of fdtget itself will have
already displayed the actual results in this mode.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 tests/fdtget-runtest.sh |   13 +++++++------
 tests/fdtput-runtest.sh |   13 +++++++------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/tests/fdtget-runtest.sh b/tests/fdtget-runtest.sh
index 75e7503..dac7f9a 100755
--- a/tests/fdtget-runtest.sh
+++ b/tests/fdtget-runtest.sh
@@ -13,11 +13,12 @@ shift
 
 verbose_run_log_check "$LOG" $VALGRIND $DTGET "$@"
 
-diff $EXPECT $LOG
-ret="$?"
-
-if [ "$ret" -eq 0 ]; then
-	PASS
+if cmp $EXPECT $LOG>/dev/null; then
+    PASS
 else
-	FAIL
+    if [ -z "$QUIET_TEST" ]; then
+	echo "EXPECTED :-:"
+	cat $EXPECT
+    fi
+    FAIL "Results differ from expected"
 fi
diff --git a/tests/fdtput-runtest.sh b/tests/fdtput-runtest.sh
index dbd9c0d..527a968 100644
--- a/tests/fdtput-runtest.sh
+++ b/tests/fdtput-runtest.sh
@@ -28,11 +28,12 @@ verbose_run_check $VALGRIND "$DTPUT" "$dtb" "$node" "$property" $value $flags
 # Now fdtget to read the value
 verbose_run_log_check "$LOG" $VALGRIND "$DTGET" "$dtb" "$node" "$property" $flags
 
-diff $EXPECT $LOG
-ret="$?"
-
-if [ "$ret" -eq 0 ]; then
-	PASS
+if cmp $EXPECT $LOG >/dev/null; then
+    PASS
 else
-	FAIL
+    if [ -z "$QUIET_TEST" ]; then
+	echo "EXPECTED :-:"
+	cat $EXPECT
+    fi
+    FAIL "Results differ from expected"
 fi
-- 
1.7.8.3
