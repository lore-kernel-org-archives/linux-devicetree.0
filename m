From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 5/6] arm/dt: mx5: change timer init function to dt clock way
Date: Sat, 19 Mar 2011 02:24:31 +0800
Message-ID: <1300472672-13392-6-git-send-email-shawn.guo@linaro.org>
References: <1300472672-13392-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1300472672-13392-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

The big deal here is that it removes the call to mx51_clocks_init,
where all the possible clocks are added to clkdev in static way.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/mach-mx5/board-dt.c |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-mx5/board-dt.c b/arch/arm/mach-mx5/board-dt.c
index 62ca693..f620ded 100644
--- a/arch/arm/mach-mx5/board-dt.c
+++ b/arch/arm/mach-mx5/board-dt.c
@@ -16,6 +16,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/of_platform.h>
 #include <linux/of_fdt.h>
+#include <linux/clk.h>
 
 #include <mach/common.h>
 #include <mach/hardware.h>
@@ -42,8 +43,14 @@ static void __init mx51_dt_board_init(void)
 
 static void __init mx51_dt_timer_init(void)
 {
-	mx51_clocks_init(32768, 24000000, 22579200, 0);
+	struct clk *clk;
+
 	mx5_clk_dt_init();
+
+	clk = clk_get_sys("gpt", NULL);
+	if (!IS_ERR(clk))
+		mxc_timer_init(clk, MX51_IO_ADDRESS(MX51_GPT1_BASE_ADDR),
+				MX51_MXC_INT_GPT);
 }
 
 static struct sys_timer mxc_timer = {
-- 
1.7.1
