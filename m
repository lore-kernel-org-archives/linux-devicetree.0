From: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 09/15] drm/exynos: dsi: add macros for register access
Date: Fri, 12 Jun 2015 21:59:04 +0900
Message-ID: <1434113958-15877-10-git-send-email-human.hwang@samsung.com>
References: <1434113958-15877-1-git-send-email-human.hwang@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1434113958-15877-1-git-send-email-human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds macros for register writing/reading. This is needed for
adding support Exynos5433 MIPI DSI driver, not by using if statement, but
by using driver data.

Signed-off-by: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Changes before:
- Refer https://patchwork.kernel.org/patch/6191761
Changes for v6:
- None

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 98 +++++++++++++++++----------------
 1 file changed, 51 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index a3bfac2..70367d0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -237,6 +237,9 @@

 #define OLD_SCLK_MIPI_CLK_NAME "pll_clk"

+#define DSI_WRITE(dsi, reg, val)	writel((val), (dsi)->reg_base + (reg))
+#define DSI_READ(dsi, reg)		readl((dsi)->reg_base + (reg))
+
 enum exynos_dsi_transfer_type {
 	EXYNOS_DSI_TX,
 	EXYNOS_DSI_RX,
@@ -365,8 +368,10 @@ static void exynos_dsi_wait_for_reset(struct exynos_dsi *dsi)

 static void exynos_dsi_reset(struct exynos_dsi *dsi)
 {
+	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+
 	reinit_completion(&dsi->completed);
-	writel(DSIM_SWRST, dsi->reg_base + DSIM_SWRST_REG);
+	DSI_WRITE(dsi, DSIM_SWRST_REG, DSIM_SWRST);
 }

 #ifndef MHZ
@@ -376,6 +381,7 @@ static void exynos_dsi_reset(struct exynos_dsi *dsi)
 static unsigned long exynos_dsi_pll_find_pms(struct exynos_dsi *dsi,
 		unsigned long fin, unsigned long fout, u8 *p, u16 *m, u8 *s)
 {
+	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	unsigned long best_freq = 0;
 	u32 min_delta = 0xffffffff;
 	u8 p_min, p_max;
@@ -466,7 +472,7 @@ static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
 		reg |= DSIM_FREQ_BAND(band);
 	}

-	writel(reg, dsi->reg_base + DSIM_PLLCTRL_REG);
+	DSI_WRITE(dsi, DSIM_PLLCTRL_REG, reg);

 	timeout = 1000;
 	do {
@@ -474,7 +480,7 @@ static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
 			dev_err(dsi->dev, "PLL failed to stabilize\n");
 			return 0;
 		}
-		reg = readl(dsi->reg_base + DSIM_STATUS_REG);
+		reg = DSI_READ(dsi, DSIM_STATUS_REG);
 	} while ((reg & DSIM_PLL_STABLE) == 0);

 	return fout;
@@ -504,7 +510,7 @@ static int exynos_dsi_enable_clock(struct exynos_dsi *dsi)
 	dev_dbg(dsi->dev, "hs_clk = %lu, byte_clk = %lu, esc_clk = %lu\n",
 		hs_clk, byte_clk, esc_clk);

-	reg = readl(dsi->reg_base + DSIM_CLKCTRL_REG);
+	reg = DSI_READ(dsi, DSIM_CLKCTRL_REG);
 	reg &= ~(DSIM_ESC_PRESCALER_MASK | DSIM_LANE_ESC_CLK_EN_CLK
 			| DSIM_LANE_ESC_CLK_EN_DATA_MASK | DSIM_PLL_BYPASS
 			| DSIM_BYTE_CLK_SRC_MASK);
@@ -514,7 +520,7 @@ static int exynos_dsi_enable_clock(struct exynos_dsi *dsi)
 			| DSIM_LANE_ESC_CLK_EN_DATA(BIT(dsi->lanes) - 1)
 			| DSIM_BYTE_CLK_SRC(0)
 			| DSIM_TX_REQUEST_HSCLK;
-	writel(reg, dsi->reg_base + DSIM_CLKCTRL_REG);
+	DSI_WRITE(dsi, DSIM_CLKCTRL_REG, reg);

 	return 0;
 }
@@ -529,7 +535,7 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)

 	/* B D-PHY: D-PHY Master & Slave Analog Block control */
 	reg = DSIM_PHYCTRL_ULPS_EXIT(0x0af);
-	writel(reg, dsi->reg_base + DSIM_PHYCTRL_REG);
+	DSI_WRITE(dsi, DSIM_PHYCTRL_REG, reg);

 	/*
 	 * T LPX: Transmitted length of any Low-Power state period
@@ -537,7 +543,7 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 	 *	burst
 	 */
 	reg = DSIM_PHYTIMING_LPX(0x06) | DSIM_PHYTIMING_HS_EXIT(0x0b);
-	writel(reg, dsi->reg_base + DSIM_PHYTIMING_REG);
+	DSI_WRITE(dsi, DSIM_PHYTIMING_REG, reg);

 	/*
 	 * T CLK-PREPARE: Time that the transmitter drives the Clock Lane LP-00
@@ -556,7 +562,7 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 			DSIM_PHYTIMING1_CLK_ZERO(0x27) |
 			DSIM_PHYTIMING1_CLK_POST(0x0d) |
 			DSIM_PHYTIMING1_CLK_TRAIL(0x08);
-	writel(reg, dsi->reg_base + DSIM_PHYTIMING1_REG);
+	DSI_WRITE(dsi, DSIM_PHYTIMING1_REG, reg);

 	/*
 	 * T HS-PREPARE: Time that the transmitter drives the Data Lane LP-00
@@ -569,21 +575,21 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 	 */
 	reg = DSIM_PHYTIMING2_HS_PREPARE(0x09) | DSIM_PHYTIMING2_HS_ZERO(0x0d) |
 			DSIM_PHYTIMING2_HS_TRAIL(0x0b);
-	writel(reg, dsi->reg_base + DSIM_PHYTIMING2_REG);
+	DSI_WRITE(dsi, DSIM_PHYTIMING2_REG, reg);
 }

 static void exynos_dsi_disable_clock(struct exynos_dsi *dsi)
 {
 	u32 reg;

-	reg = readl(dsi->reg_base + DSIM_CLKCTRL_REG);
+	reg = DSI_READ(dsi, DSIM_CLKCTRL_REG);
 	reg &= ~(DSIM_LANE_ESC_CLK_EN_CLK | DSIM_LANE_ESC_CLK_EN_DATA_MASK
 			| DSIM_ESC_CLKEN | DSIM_BYTE_CLKEN);
-	writel(reg, dsi->reg_base + DSIM_CLKCTRL_REG);
+	DSI_WRITE(dsi, DSIM_CLKCTRL_REG, reg);

-	reg = readl(dsi->reg_base + DSIM_PLLCTRL_REG);
+	reg = DSI_READ(dsi, DSIM_PLLCTRL_REG);
 	reg &= ~DSIM_PLL_EN;
-	writel(reg, dsi->reg_base + DSIM_PLLCTRL_REG);
+	DSI_WRITE(dsi, DSIM_PLLCTRL_REG, reg);
 }

 static int exynos_dsi_init_link(struct exynos_dsi *dsi)
@@ -594,15 +600,14 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 	u32 lanes_mask;

 	/* Initialize FIFO pointers */
-	reg = readl(dsi->reg_base + DSIM_FIFOCTRL_REG);
+	reg = DSI_READ(dsi, DSIM_FIFOCTRL_REG);
 	reg &= ~0x1f;
-	writel(reg, dsi->reg_base + DSIM_FIFOCTRL_REG);
+	DSI_WRITE(dsi, DSIM_FIFOCTRL_REG, reg);

 	usleep_range(9000, 11000);

 	reg |= 0x1f;
-	writel(reg, dsi->reg_base + DSIM_FIFOCTRL_REG);
-
+	DSI_WRITE(dsi, DSIM_FIFOCTRL_REG, reg);
 	usleep_range(9000, 11000);

 	/* DSI configuration */
@@ -661,14 +666,14 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)

 	reg |= DSIM_NUM_OF_DATA_LANE(dsi->lanes - 1);

-	writel(reg, dsi->reg_base + DSIM_CONFIG_REG);
+	DSI_WRITE(dsi, DSIM_CONFIG_REG, reg);

 	reg |= DSIM_LANE_EN_CLK;
-	writel(reg, dsi->reg_base + DSIM_CONFIG_REG);
+	DSI_WRITE(dsi, DSIM_CONFIG_REG, reg);

 	lanes_mask = BIT(dsi->lanes) - 1;
 	reg |= DSIM_LANE_EN(lanes_mask);
-	writel(reg, dsi->reg_base + DSIM_CONFIG_REG);
+	DSI_WRITE(dsi, DSIM_CONFIG_REG, reg);

 	/*
 	 * Use non-continuous clock mode if the periparal wants and
@@ -681,7 +686,7 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 	if (driver_data->has_clklane_stop &&
 			dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
 		reg |= DSIM_CLKLANE_STOP;
-		writel(reg, dsi->reg_base + DSIM_CONFIG_REG);
+		DSI_WRITE(dsi, DSIM_CONFIG_REG, reg);
 	}

 	/* Check clock and data lane state are stop state */
@@ -692,19 +697,19 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 			return -EFAULT;
 		}

-		reg = readl(dsi->reg_base + DSIM_STATUS_REG);
+		reg = DSI_READ(dsi, DSIM_STATUS_REG);
 		if ((reg & DSIM_STOP_STATE_DAT(lanes_mask))
 		    != DSIM_STOP_STATE_DAT(lanes_mask))
 			continue;
 	} while (!(reg & (DSIM_STOP_STATE_CLK | DSIM_TX_READY_HS_CLK)));

-	reg = readl(dsi->reg_base + DSIM_ESCMODE_REG);
+	reg = DSI_READ(dsi, DSIM_ESCMODE_REG);
 	reg &= ~DSIM_STOP_STATE_CNT_MASK;
 	reg |= DSIM_STOP_STATE_CNT(0xf);
-	writel(reg, dsi->reg_base + DSIM_ESCMODE_REG);
+	DSI_WRITE(dsi, DSIM_ESCMODE_REG, reg);

 	reg = DSIM_BTA_TIMEOUT(0xff) | DSIM_LPDR_TIMEOUT(0xffff);
-	writel(reg, dsi->reg_base + DSIM_TIMEOUT_REG);
+	DSI_WRITE(dsi, DSIM_TIMEOUT_REG, reg);

 	return 0;
 }
@@ -718,19 +723,19 @@ static void exynos_dsi_set_display_mode(struct exynos_dsi *dsi)
 		reg = DSIM_CMD_ALLOW(0xf)
 			| DSIM_STABLE_VFP(vm->vfront_porch)
 			| DSIM_MAIN_VBP(vm->vback_porch);
-		writel(reg, dsi->reg_base + DSIM_MVPORCH_REG);
+		DSI_WRITE(dsi, DSIM_MVPORCH_REG, reg);

 		reg = DSIM_MAIN_HFP(vm->hfront_porch)
 			| DSIM_MAIN_HBP(vm->hback_porch);
-		writel(reg, dsi->reg_base + DSIM_MHPORCH_REG);
+		DSI_WRITE(dsi, DSIM_MHPORCH_REG, reg);

 		reg = DSIM_MAIN_VSA(vm->vsync_len)
 			| DSIM_MAIN_HSA(vm->hsync_len);
-		writel(reg, dsi->reg_base + DSIM_MSYNC_REG);
+		DSI_WRITE(dsi, DSIM_MSYNC_REG, reg);
 	}

 	reg = DSIM_MAIN_HRESOL(vm->hactive) | DSIM_MAIN_VRESOL(vm->vactive);
-	writel(reg, dsi->reg_base + DSIM_MDRESOL_REG);
+	DSI_WRITE(dsi, DSIM_MDRESOL_REG, reg);

 	dev_dbg(dsi->dev, "LCD size = %dx%d\n", vm->hactive, vm->vactive);
 }
@@ -739,12 +744,12 @@ static void exynos_dsi_set_display_enable(struct exynos_dsi *dsi, bool enable)
 {
 	u32 reg;

-	reg = readl(dsi->reg_base + DSIM_MDRESOL_REG);
+	reg = DSI_READ(dsi, DSIM_MDRESOL_REG);
 	if (enable)
 		reg |= DSIM_MAIN_STAND_BY;
 	else
 		reg &= ~DSIM_MAIN_STAND_BY;
-	writel(reg, dsi->reg_base + DSIM_MDRESOL_REG);
+	DSI_WRITE(dsi, DSIM_MDRESOL_REG, reg);
 }

 static int exynos_dsi_wait_for_hdr_fifo(struct exynos_dsi *dsi)
@@ -752,7 +757,7 @@ static int exynos_dsi_wait_for_hdr_fifo(struct exynos_dsi *dsi)
 	int timeout = 2000;

 	do {
-		u32 reg = readl(dsi->reg_base + DSIM_FIFOCTRL_REG);
+		u32 reg = DSI_READ(dsi, DSIM_FIFOCTRL_REG);

 		if (!(reg & DSIM_SFR_HEADER_FULL))
 			return 0;
@@ -766,22 +771,21 @@ static int exynos_dsi_wait_for_hdr_fifo(struct exynos_dsi *dsi)

 static void exynos_dsi_set_cmd_lpm(struct exynos_dsi *dsi, bool lpm)
 {
-	u32 v = readl(dsi->reg_base + DSIM_ESCMODE_REG);
+	u32 v = DSI_READ(dsi, DSIM_ESCMODE_REG);

 	if (lpm)
 		v |= DSIM_CMD_LPDT_LP;
 	else
 		v &= ~DSIM_CMD_LPDT_LP;

-	writel(v, dsi->reg_base + DSIM_ESCMODE_REG);
+	DSI_WRITE(dsi, DSIM_ESCMODE_REG, v);
 }

 static void exynos_dsi_force_bta(struct exynos_dsi *dsi)
 {
-	u32 v = readl(dsi->reg_base + DSIM_ESCMODE_REG);
-
+	u32 v = DSI_READ(dsi, DSIM_ESCMODE_REG);
 	v |= DSIM_FORCE_BTA;
-	writel(v, dsi->reg_base + DSIM_ESCMODE_REG);
+	DSI_WRITE(dsi, DSIM_ESCMODE_REG, v);
 }

 static void exynos_dsi_send_to_fifo(struct exynos_dsi *dsi,
@@ -805,7 +809,7 @@ static void exynos_dsi_send_to_fifo(struct exynos_dsi *dsi,
 	while (length >= 4) {
 		reg = (payload[3] << 24) | (payload[2] << 16)
 					| (payload[1] << 8) | payload[0];
-		writel(reg, dsi->reg_base + DSIM_PAYLOAD_REG);
+		DSI_WRITE(dsi, DSIM_PAYLOAD_REG, reg);
 		payload += 4;
 		length -= 4;
 	}
@@ -820,7 +824,7 @@ static void exynos_dsi_send_to_fifo(struct exynos_dsi *dsi,
 		/* Fall through */
 	case 1:
 		reg |= payload[0];
-		writel(reg, dsi->reg_base + DSIM_PAYLOAD_REG);
+		DSI_WRITE(dsi, DSIM_PAYLOAD_REG, reg);
 		break;
 	case 0:
 		/* Do nothing */
@@ -843,7 +847,7 @@ static void exynos_dsi_send_to_fifo(struct exynos_dsi *dsi,
 		dsi->state ^= DSIM_STATE_CMD_LPM;
 	}

-	writel(reg, dsi->reg_base + DSIM_PKTHDR_REG);
+	DSI_WRITE(dsi, DSIM_PKTHDR_REG, reg);

 	if (xfer->flags & MIPI_DSI_MSG_REQ_ACK)
 		exynos_dsi_force_bta(dsi);
@@ -859,7 +863,7 @@ static void exynos_dsi_read_from_fifo(struct exynos_dsi *dsi,
 	u32 reg;

 	if (first) {
-		reg = readl(dsi->reg_base + DSIM_RXFIFO_REG);
+		reg = DSI_READ(dsi, DSIM_RXFIFO_REG);

 		switch (reg & 0x3f) {
 		case MIPI_DSI_RX_GENERIC_SHORT_READ_RESPONSE_2BYTE:
@@ -898,7 +902,7 @@ static void exynos_dsi_read_from_fifo(struct exynos_dsi *dsi,

 	/* Receive payload */
 	while (length >= 4) {
-		reg = readl(dsi->reg_base + DSIM_RXFIFO_REG);
+		reg = DSI_READ(dsi, DSIM_RXFIFO_REG);
 		payload[0] = (reg >>  0) & 0xff;
 		payload[1] = (reg >>  8) & 0xff;
 		payload[2] = (reg >> 16) & 0xff;
@@ -908,7 +912,7 @@ static void exynos_dsi_read_from_fifo(struct exynos_dsi *dsi,
 	}

 	if (length) {
-		reg = readl(dsi->reg_base + DSIM_RXFIFO_REG);
+		reg = DSI_READ(dsi, DSIM_RXFIFO_REG);
 		switch (length) {
 		case 3:
 			payload[2] = (reg >> 16) & 0xff;
@@ -927,7 +931,7 @@ static void exynos_dsi_read_from_fifo(struct exynos_dsi *dsi,
 clear_fifo:
 	length = DSI_RX_FIFO_SIZE / 4;
 	do {
-		reg = readl(dsi->reg_base + DSIM_RXFIFO_REG);
+		reg = DSI_READ(dsi, DSIM_RXFIFO_REG);
 		if (reg == DSI_RX_FIFO_EMPTY)
 			break;
 	} while (--length);
@@ -1083,18 +1087,18 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
 	struct exynos_dsi *dsi = dev_id;
 	u32 status;

-	status = readl(dsi->reg_base + DSIM_INTSRC_REG);
+	status = DSI_READ(dsi, DSIM_INTSRC_REG);
 	if (!status) {
 		static unsigned long int j;
 		if (printk_timed_ratelimit(&j, 500))
 			dev_warn(dsi->dev, "spurious interrupt\n");
 		return IRQ_HANDLED;
 	}
-	writel(status, dsi->reg_base + DSIM_INTSRC_REG);
+	DSI_WRITE(dsi, DSIM_INTSRC_REG, status);

 	if (status & DSIM_INT_SW_RST_RELEASE) {
 		u32 mask = ~(DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY);
-		writel(mask, dsi->reg_base + DSIM_INTMSK_REG);
+		DSI_WRITE(dsi, DSIM_INTMSK_REG, mask);
 		complete(&dsi->completed);
 		return IRQ_HANDLED;
 	}
--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
