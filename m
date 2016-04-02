From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH v3 3/9] clk: imx: add ckil clock for i.MX7
Date: Sat,  2 Apr 2016 18:25:45 +0200
Message-ID: <1459614351-16731-4-git-send-email-gary.bisson@boundarydevices.com>
References: <1458050668-26748-1-git-send-email-gary.bisson@boundarydevices.com>
 <1459614351-16731-1-git-send-email-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459614351-16731-1-git-send-email-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, troy.kisky-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the necessary clock to use the ckil on i.MX7.

Inspired from the following patch:
https://github.com/boundarydevices/linux-imx6/commit/b80e8271

Signed-off-by: Troy Kisky <troy.kisky-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
---

Changes v1 -> v2:
- none
Changes v2 -> v3:
- none

---
 drivers/clk/imx/clk-imx7d.c             | 3 ++-
 include/dt-bindings/clock/imx7d-clock.h | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
index fbb6a8c..7912be8 100644
--- a/drivers/clk/imx/clk-imx7d.c
+++ b/drivers/clk/imx/clk-imx7d.c
@@ -342,7 +342,7 @@ static const char *clko1_sel[] = { "osc", "pll_sys_main_clk",
 
 static const char *clko2_sel[] = { "osc", "pll_sys_main_240m_clk",
 	"pll_sys_pfd0_392m_clk", "pll_sys_pfd1_166m_clk", "pll_sys_pfd4_clk",
-	"pll_audio_main_clk", "pll_video_main_clk", "osc_32k_clk", };
+	"pll_audio_main_clk", "pll_video_main_clk", "ckil", };
 
 static const char *lvds1_sel[] = { "pll_arm_main_clk",
 	"pll_sys_main_clk", "pll_sys_pfd0_392m_clk", "pll_sys_pfd1_332m_clk",
@@ -382,6 +382,7 @@ static void __init imx7d_clocks_init(struct device_node *ccm_node)
 
 	clks[IMX7D_CLK_DUMMY] = imx_clk_fixed("dummy", 0);
 	clks[IMX7D_OSC_24M_CLK] = of_clk_get_by_name(ccm_node, "osc");
+	clks[IMX7D_CKIL] = of_clk_get_by_name(ccm_node, "ckil");
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx7d-anatop");
 	base = of_iomap(np, 0);
diff --git a/include/dt-bindings/clock/imx7d-clock.h b/include/dt-bindings/clock/imx7d-clock.h
index edca8985c..1183347 100644
--- a/include/dt-bindings/clock/imx7d-clock.h
+++ b/include/dt-bindings/clock/imx7d-clock.h
@@ -448,5 +448,6 @@
 #define IMX7D_PLL_DRAM_TEST_DIV		435
 #define IMX7D_ADC_ROOT_CLK		436
 #define IMX7D_CLK_ARM			437
-#define IMX7D_CLK_END			438
+#define IMX7D_CKIL			438
+#define IMX7D_CLK_END			439
 #endif /* __DT_BINDINGS_CLOCK_IMX7D_H */
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
