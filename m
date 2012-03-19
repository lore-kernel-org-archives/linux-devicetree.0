From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH] Don't use non-standard echo options for fdtget-runtest.sh
Date: Mon, 19 Mar 2012 12:56:33 +1100
Message-ID: <1332122193-8323-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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

fdtget-runtest.sh currently uses the "-e" option to echo, for interpreting
string escapes.  But this option is only understood by some versions of
echo - the one in bash does, but the one in dash does not.  In fact since
I reworked the fdtget tests a while back, we no longer need the escape
expanding feature of echo here, so this patch simple removes the -e to
fix the problem (the testsuite now passes when /bin/sh is dash).

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 tests/fdtget-runtest.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tests/fdtget-runtest.sh b/tests/fdtget-runtest.sh
index 982fbe1..dac7f9a 100755
--- a/tests/fdtget-runtest.sh
+++ b/tests/fdtget-runtest.sh
@@ -8,7 +8,7 @@ rm -f $LOG $EXPECT
 trap "rm -f $LOG $EXPECT" 0
 
 expect="$1"
-echo -e $expect >$EXPECT
+echo $expect >$EXPECT
 shift
 
 verbose_run_log_check "$LOG" $VALGRIND $DTGET "$@"
-- 
1.7.9.1
