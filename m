From: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 6/8] drm/exynos: dsi: add support for Exynos5433
Date: Thu, 26 Mar 2015 20:15:38 +0900
Message-ID: <1427368540-28010-7-git-send-email-human.hwang@samsung.com>
References: <1427368540-28010-1-git-send-email-human.hwang@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1427368540-28010-1-git-send-email-human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org
Cc: sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for Exynos5433 mipi dsi.

Signed-off-by: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Changes for v2:
 - change the author of "drm/exynos: dsi: add support for Exynos5433 SoC" to
 Hyungwon Hwang by the previous author's will
Changes for v3:
 - Separated from the patch "drm/exynos: dsi: add support for Exynos5433 SoC"
 in version 2.
 - use defines for more readable code
 - fix typos
 .../devicetree/bindings/video/exynos_dsim.txt      |  1 +
 drivers/gpu/drm/exynos/Kconfig                     |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 69 +++++++++++++++++++++-
 3 files changed, 68 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/exynos_dsim.txt b/Documentation/devicetree/bindings/video/exynos_dsim.txt
index 39940ca..8b12bfe 100644
--- a/Documentation/devicetree/bindings/video/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/video/exynos_dsim.txt
@@ -6,6 +6,7 @@ Required properties:
 		"samsung,exynos4210-mipi-dsi" /* for Exynos4 SoCs */
 		"samsung,exynos4415-mipi-dsi" /* for Exynos4415 SoC */
 		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
+		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index f78f3ef..e873502 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -47,7 +47,7 @@ config DRM_EXYNOS_DPI
 
 config DRM_EXYNOS_DSI
 	bool "EXYNOS DRM MIPI-DSI driver support"
-	depends on (DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON)
+	depends on (DRM_EXYNOS_FIMD || DRM_EXYNOS5433_DECON || DRM_EXYNOS7_DECON)
 	select DRM_MIPI_DSI
 	select DRM_PANEL
 	default n
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 2d9a249..d1ecd0f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -131,6 +131,7 @@
 #define DSIM_INT_PLL_STABLE		(1 << 31)
 #define DSIM_INT_SW_RST_RELEASE		(1 << 30)
 #define DSIM_INT_SFR_FIFO_EMPTY		(1 << 29)
+#define DSIM_INT_SFR_HDR_FIFO_EMPTY	(1 << 28)
 #define DSIM_INT_BTA			(1 << 25)
 #define DSIM_INT_FRAME_DONE		(1 << 24)
 #define DSIM_INT_RX_TIMEOUT		(1 << 21)
@@ -179,6 +180,8 @@
 
 /* DSIM_PHYCTRL */
 #define DSIM_PHYCTRL_ULPS_EXIT(x)	(((x) & 0x1ff) << 0)
+#define DSIM_PHYCTRL_B_DPHYCTL_VREG_LP	(1 << 30)
+#define DSIM_PHYCTRL_B_DPHYCTL_SLEW_UP	(1 << 14)
 
 /* DSIM_PHYTIMING */
 #define DSIM_PHYTIMING_LPX(x)		((x) << 8)
@@ -206,7 +209,9 @@
 #define DSI_WRITE(dsi, reg, val)	writel((val), REG((dsi), (reg)))
 #define DSI_READ(dsi, reg)		readl(REG((dsi), (reg)))
 
-static char *clk_names[2] = { "bus_clk", "sclk_mipi" };
+static char *clk_names[5] = { "bus_clk", "sclk_mipi",
+	"phyclk_mipidphy0_bitclkdiv8", "phyclk_mipidphy0_rxclkesc0",
+	"sclk_rgb_vclk_to_dsim0" };
 
 enum exynos_dsi_transfer_type {
 	EXYNOS_DSI_TX,
@@ -335,6 +340,30 @@ static unsigned int regs[] = {
 	[DSIM_PHYTIMING2_REG] =  0x6c,
 };
 
+static unsigned int exynos5433_regs[] = {
+	[DSIM_STATUS_REG] = 0x04,
+	[DSIM_SWRST_REG] = 0x0C,
+	[DSIM_CLKCTRL_REG] = 0x10,
+	[DSIM_TIMEOUT_REG] = 0x14,
+	[DSIM_CONFIG_REG] = 0x18,
+	[DSIM_ESCMODE_REG] = 0x1C,
+	[DSIM_MDRESOL_REG] = 0x20,
+	[DSIM_MVPORCH_REG] = 0x24,
+	[DSIM_MHPORCH_REG] = 0x28,
+	[DSIM_MSYNC_REG] = 0x2C,
+	[DSIM_INTSRC_REG] = 0x34,
+	[DSIM_INTMSK_REG] = 0x38,
+	[DSIM_PKTHDR_REG] = 0x3C,
+	[DSIM_PAYLOAD_REG] = 0x40,
+	[DSIM_RXFIFO_REG] = 0x44,
+	[DSIM_FIFOCTRL_REG] = 0x4C,
+	[DSIM_PLLCTRL_REG] = 0x94,
+	[DSIM_PHYCTRL_REG] = 0xA4,
+	[DSIM_PHYTIMING_REG] = 0xB4,
+	[DSIM_PHYTIMING1_REG] = 0xB8,
+	[DSIM_PHYTIMING2_REG] = 0xBC,
+};
+
 enum values {
 	RESET_TYPE,
 	PLL_TIMER,
@@ -371,6 +400,24 @@ static unsigned int values[] = {
 	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0b),
 };
 
+static unsigned int exynos5433_values[] = {
+	[RESET_TYPE] = DSIM_FUNCRST,
+	[PLL_TIMER] = 22200,
+	[STOP_STATE_CNT] = 0xa,
+	[PHYCTRL_ULPS_EXIT] = DSIM_PHYCTRL_ULPS_EXIT(0x190),
+	[PHYCTRL_VREG_LP] = DSIM_PHYCTRL_B_DPHYCTL_VREG_LP,
+	[PHYCTRL_SLEW_UP] = DSIM_PHYCTRL_B_DPHYCTL_SLEW_UP,
+	[PHYTIMING_LPX] = DSIM_PHYTIMING_LPX(0x07),
+	[PHYTIMING_HS_EXIT] = DSIM_PHYTIMING_HS_EXIT(0x0c),
+	[PHYTIMING_CLK_PREPARE] = DSIM_PHYTIMING1_CLK_PREPARE(0x09),
+	[PHYTIMING_CLK_ZERO] = DSIM_PHYTIMING1_CLK_ZERO(0x2d),
+	[PHYTIMING_CLK_POST] = DSIM_PHYTIMING1_CLK_POST(0x0e),
+	[PHYTIMING_CLK_TRAIL] = DSIM_PHYTIMING1_CLK_TRAIL(0x09),
+	[PHYTIMING_HS_PREPARE] = DSIM_PHYTIMING2_HS_PREPARE(0x0b),
+	[PHYTIMING_HS_ZERO] = DSIM_PHYTIMING2_HS_ZERO(0x10),
+	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0c),
+};
+
 static struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
 	.regs = regs,
 	.plltmr_reg = 0x50,
@@ -416,6 +463,17 @@ static struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
 	.values = values,
 };
 
+static struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
+	.regs = exynos5433_regs,
+	.plltmr_reg = 0xa0,
+	.has_clklane_stop = 1,
+	.num_clks = 5,
+	.max_freq = 1500,
+	.wait_for_reset = 0,
+	.num_bits_resol = 12,
+	.values = exynos5433_values,
+};
+
 static struct of_device_id exynos_dsi_of_match[] = {
 	{ .compatible = "samsung,exynos3250-mipi-dsi",
 	  .data = &exynos3_dsi_driver_data },
@@ -425,6 +483,8 @@ static struct of_device_id exynos_dsi_of_match[] = {
 	  .data = &exynos4415_dsi_driver_data },
 	{ .compatible = "samsung,exynos5410-mipi-dsi",
 	  .data = &exynos5_dsi_driver_data },
+	{ .compatible = "samsung,exynos5433-mipi-dsi",
+	  .data = &exynos5433_dsi_driver_data },
 	{ }
 };
 
@@ -1182,13 +1242,16 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
 	DSI_WRITE(dsi, DSIM_INTSRC_REG, status);
 
 	if (status & DSIM_INT_SW_RST_RELEASE) {
-		u32 mask = ~(DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY);
+		u32 mask = ~(DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY |
+			DSIM_INT_SFR_HDR_FIFO_EMPTY | DSIM_INT_FRAME_DONE |
+			DSIM_INT_RX_ECC_ERR | DSIM_INT_SW_RST_RELEASE);
 		DSI_WRITE(dsi, DSIM_INTMSK_REG, mask);
 		complete(&dsi->completed);
 		return IRQ_HANDLED;
 	}
 
-	if (!(status & (DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY)))
+	if (!(status & (DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY |
+			DSIM_INT_FRAME_DONE | DSIM_INT_PLL_STABLE)))
 		return IRQ_HANDLED;
 
 	if (exynos_dsi_transfer_finish(dsi))
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
