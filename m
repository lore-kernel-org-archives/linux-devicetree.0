From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] fdtget-runtest.sh: use printf instead of /bin/echo -e
Date: Tue,  6 Nov 2012 11:00:31 -0700
Message-ID: <1352224831-1355-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, jdl-CYoMK+44s/E@public.gmane.org, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Not all /bin/echo implementations support the -e option. Instead, use
printf, which appears to be more widely available than /bin/echo -e.

See commit eaec1db "fdtget-runtest.sh: Fix failures when /bin/sh isn't
bash" for history.

I have tested this on Ubuntu 10.04 with /bin/sh pointing to both dash
and bash.

Reported-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> # and implemented-by
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Mike, should I re-write this with you as the git author? If so, could
you please supply an S-o-b line for this?
---
 tests/fdtget-runtest.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tests/fdtget-runtest.sh b/tests/fdtget-runtest.sh
index c3a3559..8d8b058 100755
--- a/tests/fdtget-runtest.sh
+++ b/tests/fdtget-runtest.sh
@@ -8,7 +8,7 @@ rm -f $LOG $EXPECT
 trap "rm -f $LOG $EXPECT" 0
 
 expect="$1"
-/bin/echo -e $expect >$EXPECT
+printf '%b\n' "$expect" > $EXPECT
 shift
 
 verbose_run_log_check "$LOG" $VALGRIND $DTGET "$@"
-- 
1.7.0.4
