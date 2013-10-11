From: Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH RESEND 1/3] ARM: imx: Add DMAMUX clock for Vybrid vf610 SoC
Date: Fri, 11 Oct 2013 09:53:40 +0800
Message-ID: <1381456421-7620-1-git-send-email-b35083@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/mach-imx/clk-vf610.c           | 5 +++++
 include/dt-bindings/clock/vf610-clock.h | 6 +++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/clk-vf610.c b/arch/arm/mach-imx/clk-vf610.c
index b169a39..29f88a2 100644
--- a/arch/arm/mach-imx/clk-vf610.c
+++ b/arch/arm/mach-imx/clk-vf610.c
@@ -298,6 +298,11 @@ static void __init vf610_clocks_init(struct device_node *ccm_node)
 	clk[VF610_CLK_FLEXCAN0] = imx_clk_gate2("flexcan0", "ipg_bus", CCM_CCGR0, CCM_CCGRx_CGn(0));
 	clk[VF610_CLK_FLEXCAN1] = imx_clk_gate2("flexcan1", "ipg_bus", CCM_CCGR9, CCM_CCGRx_CGn(4));
 
+	clk[VF610_CLK_DMAMUX0] = imx_clk_gate2("dmamux0", "platform_bus", CCM_CCGR0, CCM_CCGRx_CGn(4));
+	clk[VF610_CLK_DMAMUX1] = imx_clk_gate2("dmamux1", "platform_bus", CCM_CCGR0, CCM_CCGRx_CGn(5));
+	clk[VF610_CLK_DMAMUX2] = imx_clk_gate2("dmamux2", "platform_bus", CCM_CCGR0, CCM_CCGRx_CGn(1));
+	clk[VF610_CLK_DMAMUX3] = imx_clk_gate2("dmamux3", "platform_bus", CCM_CCGR0, CCM_CCGRx_CGn(2));
+
 	clk_set_parent(clk[VF610_CLK_QSPI0_SEL], clk[VF610_CLK_PLL1_PFD4]);
 	clk_set_rate(clk[VF610_CLK_QSPI0_X4_DIV], clk_get_rate(clk[VF610_CLK_QSPI0_SEL]) / 2);
 	clk_set_rate(clk[VF610_CLK_QSPI0_X2_DIV], clk_get_rate(clk[VF610_CLK_QSPI0_X4_DIV]) / 2);
diff --git a/include/dt-bindings/clock/vf610-clock.h b/include/dt-bindings/clock/vf610-clock.h
index 4aa2b48..a916029 100644
--- a/include/dt-bindings/clock/vf610-clock.h
+++ b/include/dt-bindings/clock/vf610-clock.h
@@ -160,6 +160,10 @@
 #define VF610_CLK_GPU2D			147
 #define VF610_CLK_ENET0			148
 #define VF610_CLK_ENET1			149
-#define VF610_CLK_END			150
+#define VF610_CLK_DMAMUX0		150
+#define VF610_CLK_DMAMUX1		151
+#define VF610_CLK_DMAMUX2		152
+#define VF610_CLK_DMAMUX3		153
+#define VF610_CLK_END			154
 
 #endif /* __DT_BINDINGS_CLOCK_VF610_H */
-- 
1.8.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
