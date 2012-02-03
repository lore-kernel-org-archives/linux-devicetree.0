From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 04/10] Remove unused variable from test scripts
Date: Fri,  3 Feb 2012 16:12:03 +1100
Message-ID: <1328245929-15443-5-git-send-email-david@gibson.dropbear.id.au>
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

Several of the test scripts remove $TMPFILE, without ever having set
the TMPFILE variable. This patch fixes it.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 tests/dtc-checkfails.sh |    2 +-
 tests/fdtget-runtest.sh |    2 +-
 tests/fdtput-runtest.sh |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/dtc-checkfails.sh b/tests/dtc-checkfails.sh
index c58694f..e7aa25e 100755
--- a/tests/dtc-checkfails.sh
+++ b/tests/dtc-checkfails.sh
@@ -12,7 +12,7 @@ done
 
 LOG="tmp.log.$$"
 
-rm -f $TMPFILE $LOG
+rm -f $LOG
 
 verbose_run_log "$LOG" $VALGRIND "$DTC" -o /dev/null "$@"
 ret="$?"
diff --git a/tests/fdtget-runtest.sh b/tests/fdtget-runtest.sh
index f38184f..c17c8f9 100755
--- a/tests/fdtget-runtest.sh
+++ b/tests/fdtget-runtest.sh
@@ -5,7 +5,7 @@
 LOG="tmp.log.$$"
 EXPECT="tmp.expect.$$"
 
-rm -f $TMPFILE $LOG
+rm -f $LOG
 
 expect="$1"
 echo "$expect" >$EXPECT
diff --git a/tests/fdtput-runtest.sh b/tests/fdtput-runtest.sh
index ea51569..8e4cd95 100644
--- a/tests/fdtput-runtest.sh
+++ b/tests/fdtput-runtest.sh
@@ -11,7 +11,7 @@
 LOG="tmp.log.$$"
 EXPECT="tmp.expect.$$"
 
-rm -f $TMPFILE $LOG
+rm -f $LOG
 
 expect="$1"
 echo "$expect" >$EXPECT
-- 
1.7.8.3
