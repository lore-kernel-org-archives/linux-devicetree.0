From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] fdtget-runtest.sh: Fix failures when /bin/sh isn't bash
Date: Tue, 20 Mar 2012 20:23:46 -0600
Message-ID: <1332296626-19707-1-git-send-email-swarren@wwwdotorg.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Ubuntu, /bin/sh is dash (at least by default), and dash's echo doesn't
accept the -e option. This means that fdtget-runtest.sh's EXPECT file will
contain "-e foo" rather than just "foo", which causes a test failure.

To work around this, run /bin/echo instead of (builtin) echo, which has
more chance of supporting the -e option.

Another possible fix is to change all the #! lines to /bin/bash rather
than /bin/sh, and change run_tests.sh to invoke sub-scripts using $SHELL
instead of just "sh". However, that would require bash specifically, which
may not be desirable.

Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
---
 tests/fdtget-runtest.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tests/fdtget-runtest.sh b/tests/fdtget-runtest.sh
index 982fbe1..c3a3559 100755
--- a/tests/fdtget-runtest.sh
+++ b/tests/fdtget-runtest.sh
@@ -8,7 +8,7 @@ rm -f $LOG $EXPECT
 trap "rm -f $LOG $EXPECT" 0
 
 expect="$1"
-echo -e $expect >$EXPECT
+/bin/echo -e $expect >$EXPECT
 shift
 
 verbose_run_log_check "$LOG" $VALGRIND $DTGET "$@"
-- 
1.7.5.4
