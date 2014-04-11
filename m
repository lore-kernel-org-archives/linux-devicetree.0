From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 3/4] ARM: dts: imx6: use of_clk_get_by_name() to retrieve fixed-clock
Date: Fri, 11 Apr 2014 16:04:06 +0800
Message-ID: <1397203447-22965-4-git-send-email-shawn.guo@freescale.com>
References: <1397203447-22965-1-git-send-email-shawn.guo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397203447-22965-1-git-send-email-shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

With the dependencies of those fixed input clocks reflected in device
tree, we now can just call of_clk_get_by_name() to retrieve the clocks.

Signed-off-by: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/mach-imx/clk-imx6q.c  | 6 +++---
 arch/arm/mach-imx/clk-imx6sl.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-imx/clk-imx6q.c b/arch/arm/mach-imx/clk-imx6q.c
index b0e7f9d..862c80e 100644
--- a/arch/arm/mach-imx/clk-imx6q.c
+++ b/arch/arm/mach-imx/clk-imx6q.c
@@ -148,9 +148,9 @@ static void __init imx6q_clocks_init(struct device_node *ccm_node)
 	int ret;
 
 	clk[dummy] = imx_clk_fixed("dummy", 0);
-	clk[ckil] = imx_obtain_fixed_clock("ckil", 0);
-	clk[ckih] = imx_obtain_fixed_clock("ckih1", 0);
-	clk[osc] = imx_obtain_fixed_clock("osc", 0);
+	clk[ckil] = of_clk_get_by_name(ccm_node, "ckil");
+	clk[ckih] = of_clk_get_by_name(ccm_node, "ckih1");
+	clk[osc] = of_clk_get_by_name(ccm_node, "osc");
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx6q-anatop");
 	base = of_iomap(np, 0);
diff --git a/arch/arm/mach-imx/clk-imx6sl.c b/arch/arm/mach-imx/clk-imx6sl.c
index f7073c07..397f01a 100644
--- a/arch/arm/mach-imx/clk-imx6sl.c
+++ b/arch/arm/mach-imx/clk-imx6sl.c
@@ -174,8 +174,8 @@ static void __init imx6sl_clocks_init(struct device_node *ccm_node)
 	int ret;
 
 	clks[IMX6SL_CLK_DUMMY] = imx_clk_fixed("dummy", 0);
-	clks[IMX6SL_CLK_CKIL] = imx_obtain_fixed_clock("ckil", 0);
-	clks[IMX6SL_CLK_OSC] = imx_obtain_fixed_clock("osc", 0);
+	clks[IMX6SL_CLK_CKIL] = of_clk_get_by_name(ccm_node, "ckil");
+	clks[IMX6SL_CLK_OSC] = of_clk_get_by_name(ccm_node, "osc");
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx6sl-anatop");
 	base = of_iomap(np, 0);
-- 
1.8.3.2


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
