From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 05/10] Use 'trap' builtin to clean up temporaries in test
 scripts
Date: Fri,  3 Feb 2012 16:12:04 +1100
Message-ID: <1328245929-15443-6-git-send-email-david@gibson.dropbear.id.au>
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

Some of the test scripts create temporary files, which we remove at the
end.  Except that we usually forgot to remove them on some exit paths. To
avoid this problem in future, this modifies the scripts to use the shell's
trap 0 functionality to automatically remove the temporaries on any exit.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 tests/dtc-checkfails.sh |    6 ++----
 tests/fdtget-runtest.sh |   10 ++++------
 tests/fdtput-runtest.sh |   10 ++++------
 3 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/tests/dtc-checkfails.sh b/tests/dtc-checkfails.sh
index e7aa25e..87992a0 100755
--- a/tests/dtc-checkfails.sh
+++ b/tests/dtc-checkfails.sh
@@ -10,9 +10,9 @@ for x; do
     CHECKS="$CHECKS $x"
 done
 
-LOG="tmp.log.$$"
-
+LOG=tmp.log.$$
 rm -f $LOG
+trap "rm -f $LOG" 0
 
 verbose_run_log "$LOG" $VALGRIND "$DTC" -o /dev/null "$@"
 ret="$?"
@@ -28,6 +28,4 @@ for c in $CHECKS; do
     fi
 done
 
-rm -f $LOG
-
 PASS
diff --git a/tests/fdtget-runtest.sh b/tests/fdtget-runtest.sh
index c17c8f9..44c3529 100755
--- a/tests/fdtget-runtest.sh
+++ b/tests/fdtget-runtest.sh
@@ -2,10 +2,10 @@
 
 . ./tests.sh
 
-LOG="tmp.log.$$"
-EXPECT="tmp.expect.$$"
-
-rm -f $LOG
+LOG=tmp.log.$$
+EXPECT=tmp.expect.$$
+rm -f $LOG $EXPECT
+trap "rm -f $LOG $EXPECT" 0
 
 expect="$1"
 echo "$expect" >$EXPECT
@@ -26,8 +26,6 @@ fi
 diff $EXPECT $LOG
 ret="$?"
 
-rm -f $LOG $EXPECT
-
 if [ "$ret" -eq 0 ]; then
 	PASS
 else
diff --git a/tests/fdtput-runtest.sh b/tests/fdtput-runtest.sh
index 8e4cd95..c4b2135 100644
--- a/tests/fdtput-runtest.sh
+++ b/tests/fdtput-runtest.sh
@@ -8,10 +8,10 @@
 
 . ./tests.sh
 
-LOG="tmp.log.$$"
-EXPECT="tmp.expect.$$"
-
-rm -f $LOG
+LOG=tmp.log.$$
+EXPECT=tmp.expect.$$
+rm -f $LOG $EXPECT
+trap "rm -f $LOG $EXPECT" 0
 
 expect="$1"
 echo "$expect" >$EXPECT
@@ -46,8 +46,6 @@ fi
 diff $EXPECT $LOG
 ret="$?"
 
-rm -f $LOG $EXPECT
-
 if [ "$ret" -eq 0 ]; then
 	PASS
 else
-- 
1.7.8.3
