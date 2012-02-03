From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 07/10] Factor signal checks out of test scripts
Date: Fri,  3 Feb 2012 16:12:06 +1100
Message-ID: <1328245929-15443-8-git-send-email-david@gibson.dropbear.id.au>
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

Several test scripts now have some code to check for a program returning
a signal, and reporting a suitable failure.  This patch moves this
duplicated code into a helper function in tests.sh.  At the same time we
remove a bashism found in the current copies (using the non portablr $[ ]
construct for arithmetic).

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 tests/dtc-checkfails.sh |    5 +----
 tests/fdtget-runtest.sh |    5 +----
 tests/fdtput-runtest.sh |   11 +++--------
 tests/tests.sh          |    8 ++++++++
 4 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/tests/dtc-checkfails.sh b/tests/dtc-checkfails.sh
index 87992a0..3f77b13 100755
--- a/tests/dtc-checkfails.sh
+++ b/tests/dtc-checkfails.sh
@@ -17,10 +17,7 @@ trap "rm -f $LOG" 0
 verbose_run_log "$LOG" $VALGRIND "$DTC" -o /dev/null "$@"
 ret="$?"
 
-if [ "$ret" -gt 127 ]; then
-    signame=$(kill -l $[ret - 128])
-    FAIL "Killed by SIG$signame"
-fi
+FAIL_IF_SIGNAL $ret
 
 for c in $CHECKS; do
     if ! grep -E "^(ERROR)|(Warning) \($c\):" $LOG > /dev/null; then
diff --git a/tests/fdtget-runtest.sh b/tests/fdtget-runtest.sh
index 44c3529..42dc00c 100755
--- a/tests/fdtget-runtest.sh
+++ b/tests/fdtget-runtest.sh
@@ -18,10 +18,7 @@ if [ "$ret" -ne 0 -a "$expect" = "ERR" ]; then
 	PASS
 fi
 
-if [ "$ret" -gt 127 ]; then
-    signame=$(kill -l $[ret - 128])
-    FAIL "Killed by SIG$signame"
-fi
+FAIL_IF_SIGNAL $ret
 
 diff $EXPECT $LOG
 ret="$?"
diff --git a/tests/fdtput-runtest.sh b/tests/fdtput-runtest.sh
index c4b2135..9178d2f 100644
--- a/tests/fdtput-runtest.sh
+++ b/tests/fdtput-runtest.sh
@@ -29,19 +29,14 @@ ret="$?"
 if [ "$ret" -ne 0 -a "$expect" = "ERR" ]; then
 	PASS
 fi
-if [ "$ret" -gt 127 ]; then
-    signame=$(kill -l $[ret - 128])
-    FAIL "Killed by SIG$signame"
-fi
+
+FAIL_IF_SIGNAL $ret
 
 # Now fdtget to read the value
 verbose_run_log "$LOG" $VALGRIND "$DTGET" "$dtb" "$node" "$property" $flags
 ret="$?"
 
-if [ "$ret" -gt 127 ]; then
-    signame=$(kill -l $[ret - 128])
-    FAIL "Killed by SIG$signame"
-fi
+FAIL_IF_SIGNAL $ret
 
 diff $EXPECT $LOG
 ret="$?"
diff --git a/tests/tests.sh b/tests/tests.sh
index 6e5e76a..3b7c6c8 100644
--- a/tests/tests.sh
+++ b/tests/tests.sh
@@ -10,6 +10,14 @@ FAIL () {
     exit 2
 }
 
+FAIL_IF_SIGNAL () {
+    ret="$1"
+    if [ "$ret" -gt 127 ]; then
+	signame=$(kill -l $((ret - 128)))
+	FAIL "Killed by SIG$signame"
+    fi
+}
+
 DTC=../dtc
 DTGET=../fdtget
 DTPUT=../fdtput
-- 
1.7.8.3
