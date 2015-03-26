From: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 5/8] drm/exynos: dsi: generalize register setting and clock
 control
Date: Thu, 26 Mar 2015 20:15:37 +0900
Message-ID: <1427368540-28010-6-git-send-email-human.hwang@samsung.com>
References: <1427368540-28010-1-git-send-email-human.hwang@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1427368540-28010-1-git-send-email-human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org
Cc: sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch makes the driver use arrays for clocks, register address,
and values. By doing this, it becomes easier to add support for another
SoC.

Signed-off-by: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Changes for v3:
 - Separated from the patch "drm/exynos: dsi: add support for Exynos5433 SoC"
 in version 2.
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 347 ++++++++++++++++++++------------
 1 file changed, 218 insertions(+), 129 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 4af18b2f..2d9a249 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -33,38 +33,6 @@
 /* returns true iff both arguments logically differs */
 #define NEQV(a, b) (!(a) ^ !(b))
 
-#define DSIM_STATUS_REG		0x0	/* Status register */
-#define DSIM_SWRST_REG		0x4	/* Software reset register */
-#define DSIM_CLKCTRL_REG	0x8	/* Clock control register */
-#define DSIM_TIMEOUT_REG	0xc	/* Time out register */
-#define DSIM_CONFIG_REG		0x10	/* Configuration register */
-#define DSIM_ESCMODE_REG	0x14	/* Escape mode register */
-
-/* Main display image resolution register */
-#define DSIM_MDRESOL_REG	0x18
-#define DSIM_MVPORCH_REG	0x1c	/* Main display Vporch register */
-#define DSIM_MHPORCH_REG	0x20	/* Main display Hporch register */
-#define DSIM_MSYNC_REG		0x24	/* Main display sync area register */
-
-/* Sub display image resolution register */
-#define DSIM_SDRESOL_REG	0x28
-#define DSIM_INTSRC_REG		0x2c	/* Interrupt source register */
-#define DSIM_INTMSK_REG		0x30	/* Interrupt mask register */
-#define DSIM_PKTHDR_REG		0x34	/* Packet Header FIFO register */
-#define DSIM_PAYLOAD_REG	0x38	/* Payload FIFO register */
-#define DSIM_RXFIFO_REG		0x3c	/* Read FIFO register */
-#define DSIM_FIFOTHLD_REG	0x40	/* FIFO threshold level register */
-#define DSIM_FIFOCTRL_REG	0x44	/* FIFO status and control register */
-
-/* FIFO memory AC characteristic register */
-#define DSIM_PLLCTRL_REG	0x4c	/* PLL control register */
-#define DSIM_PHYACCHR_REG	0x54	/* D-PHY AC characteristic register */
-#define DSIM_PHYACCHR1_REG	0x58	/* D-PHY AC characteristic register1 */
-#define DSIM_PHYCTRL_REG	0x5c
-#define DSIM_PHYTIMING_REG	0x64
-#define DSIM_PHYTIMING1_REG	0x68
-#define DSIM_PHYTIMING2_REG	0x6c
-
 /* DSIM_STATUS */
 #define DSIM_STOP_STATE_DAT(x)		(((x) & 0xf) << 0)
 #define DSIM_STOP_STATE_CLK		(1 << 8)
@@ -128,8 +96,8 @@
 
 /* DSIM_MDRESOL */
 #define DSIM_MAIN_STAND_BY		(1 << 31)
-#define DSIM_MAIN_VRESOL(x)		(((x) & 0x7ff) << 16)
-#define DSIM_MAIN_HRESOL(x)		(((x) & 0X7ff) << 0)
+#define DSIM_MAIN_VRESOL(x, num_bits)	(((x) & ((1 << (num_bits)) - 1)) << 16)
+#define DSIM_MAIN_HRESOL(x, num_bits)	(((x) & ((1 << (num_bits)) - 1)) << 0)
 
 /* DSIM_MVPORCH */
 #define DSIM_CMD_ALLOW(x)		((x) << 28)
@@ -234,6 +202,12 @@
 #define DSI_XFER_TIMEOUT_MS		100
 #define DSI_RX_FIFO_EMPTY		0x30800002
 
+#define REG(dsi, reg)	((dsi)->reg_base + dsi->driver_data->regs[(reg)])
+#define DSI_WRITE(dsi, reg, val)	writel((val), REG((dsi), (reg)))
+#define DSI_READ(dsi, reg)		readl(REG((dsi), (reg)))
+
+static char *clk_names[2] = { "bus_clk", "sclk_mipi" };
+
 enum exynos_dsi_transfer_type {
 	EXYNOS_DSI_TX,
 	EXYNOS_DSI_RX,
@@ -261,10 +235,15 @@ struct exynos_dsi_transfer {
 #define DSIM_STATE_CMD_LPM		BIT(2)
 
 struct exynos_dsi_driver_data {
+	unsigned int *regs;
 	unsigned int plltmr_reg;
-
 	unsigned int has_freqband:1;
 	unsigned int has_clklane_stop:1;
+	unsigned int num_clks;
+	unsigned int max_freq;
+	unsigned int wait_for_reset;
+	unsigned int num_bits_resol;
+	unsigned int *values;
 };
 
 struct exynos_dsi {
@@ -277,8 +256,7 @@ struct exynos_dsi {
 
 	void __iomem *reg_base;
 	struct phy *phy;
-	struct clk *sclk_clk;
-	struct clk *bus_clk;
+	struct clk **clks;
 	struct regulator_bulk_data supplies[2];
 	int irq;
 	int te_gpio;
@@ -309,25 +287,133 @@ static inline struct exynos_dsi *display_to_dsi(struct exynos_drm_display *d)
 	return container_of(d, struct exynos_dsi, display);
 }
 
+enum regs {
+	DSIM_STATUS_REG,	/* Status register */
+	DSIM_SWRST_REG,		/* Software reset register */
+	DSIM_CLKCTRL_REG,	/* Clock control register */
+	DSIM_TIMEOUT_REG,	/* Time out register */
+	DSIM_CONFIG_REG,	/* Configuration register */
+	DSIM_ESCMODE_REG,	/* Escape mode register */
+	DSIM_MDRESOL_REG,
+	DSIM_MVPORCH_REG,	/* Main display Vporch register */
+	DSIM_MHPORCH_REG,	/* Main display Hporch register */
+	DSIM_MSYNC_REG,		/* Main display sync area register */
+	DSIM_INTSRC_REG,	/* Interrupt source register */
+	DSIM_INTMSK_REG,	/* Interrupt mask register */
+	DSIM_PKTHDR_REG,	/* Packet Header FIFO register */
+	DSIM_PAYLOAD_REG,	/* Payload FIFO register */
+	DSIM_RXFIFO_REG,	/* Read FIFO register */
+	DSIM_FIFOCTRL_REG,	/* FIFO status and control register */
+	DSIM_PLLCTRL_REG,	/* PLL control register */
+	DSIM_PHYCTRL_REG,
+	DSIM_PHYTIMING_REG,
+	DSIM_PHYTIMING1_REG,
+	DSIM_PHYTIMING2_REG,
+	NUM_REGS
+};
+static unsigned int regs[] = {
+	[DSIM_STATUS_REG] =  0x00,
+	[DSIM_SWRST_REG] =  0x04,
+	[DSIM_CLKCTRL_REG] =  0x08,
+	[DSIM_TIMEOUT_REG] =  0x0c,
+	[DSIM_CONFIG_REG] =  0x10,
+	[DSIM_ESCMODE_REG] =  0x14,
+	[DSIM_MDRESOL_REG] =  0x18,
+	[DSIM_MVPORCH_REG] =  0x1c,
+	[DSIM_MHPORCH_REG] =  0x20,
+	[DSIM_MSYNC_REG] =  0x24,
+	[DSIM_INTSRC_REG] =  0x2c,
+	[DSIM_INTMSK_REG] =  0x30,
+	[DSIM_PKTHDR_REG] =  0x34,
+	[DSIM_PAYLOAD_REG] =  0x38,
+	[DSIM_RXFIFO_REG] =  0x3c,
+	[DSIM_FIFOCTRL_REG] =  0x44,
+	[DSIM_PLLCTRL_REG] =  0x4c,
+	[DSIM_PHYCTRL_REG] =  0x5c,
+	[DSIM_PHYTIMING_REG] =  0x64,
+	[DSIM_PHYTIMING1_REG] =  0x68,
+	[DSIM_PHYTIMING2_REG] =  0x6c,
+};
+
+enum values {
+	RESET_TYPE,
+	PLL_TIMER,
+	STOP_STATE_CNT,
+	PHYCTRL_ULPS_EXIT,
+	PHYCTRL_VREG_LP,
+	PHYCTRL_SLEW_UP,
+	PHYTIMING_LPX,
+	PHYTIMING_HS_EXIT,
+	PHYTIMING_CLK_PREPARE,
+	PHYTIMING_CLK_ZERO,
+	PHYTIMING_CLK_POST,
+	PHYTIMING_CLK_TRAIL,
+	PHYTIMING_HS_PREPARE,
+	PHYTIMING_HS_ZERO,
+	PHYTIMING_HS_TRAIL
+};
+
+static unsigned int values[] = {
+	[RESET_TYPE] = DSIM_SWRST,
+	[PLL_TIMER] = 500,
+	[STOP_STATE_CNT] = 0xf,
+	[PHYCTRL_ULPS_EXIT] = DSIM_PHYCTRL_ULPS_EXIT(0x0af),
+	[PHYCTRL_VREG_LP] = 0,
+	[PHYCTRL_SLEW_UP] = 0,
+	[PHYTIMING_LPX] = DSIM_PHYTIMING_LPX(0x06),
+	[PHYTIMING_HS_EXIT] = DSIM_PHYTIMING_HS_EXIT(0x0b),
+	[PHYTIMING_CLK_PREPARE] = DSIM_PHYTIMING1_CLK_PREPARE(0x07),
+	[PHYTIMING_CLK_ZERO] = DSIM_PHYTIMING1_CLK_ZERO(0x27),
+	[PHYTIMING_CLK_POST] = DSIM_PHYTIMING1_CLK_POST(0x0d),
+	[PHYTIMING_CLK_TRAIL] = DSIM_PHYTIMING1_CLK_TRAIL(0x08),
+	[PHYTIMING_HS_PREPARE] = DSIM_PHYTIMING2_HS_PREPARE(0x09),
+	[PHYTIMING_HS_ZERO] = DSIM_PHYTIMING2_HS_ZERO(0x0d),
+	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0b),
+};
+
 static struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
+	.regs = regs,
 	.plltmr_reg = 0x50,
 	.has_freqband = 1,
 	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 1000,
+	.wait_for_reset = 1,
+	.num_bits_resol = 11,
+	.values = values,
 };
 
 static struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
+	.regs = regs,
 	.plltmr_reg = 0x50,
 	.has_freqband = 1,
 	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 1000,
+	.wait_for_reset = 1,
+	.num_bits_resol = 11,
+	.values = values,
 };
 
 static struct exynos_dsi_driver_data exynos4415_dsi_driver_data = {
+	.regs = regs,
 	.plltmr_reg = 0x58,
 	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 1000,
+	.wait_for_reset = 1,
+	.num_bits_resol = 11,
+	.values = values,
 };
 
 static struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
+	.regs = regs,
 	.plltmr_reg = 0x58,
+	.num_clks = 2,
+	.max_freq = 1000,
+	.wait_for_reset = 1,
+	.num_bits_resol = 11,
+	.values = values,
 };
 
 static struct of_device_id exynos_dsi_of_match[] = {
@@ -361,8 +447,10 @@ static void exynos_dsi_wait_for_reset(struct exynos_dsi *dsi)
 
 static void exynos_dsi_reset(struct exynos_dsi *dsi)
 {
+	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+
 	reinit_completion(&dsi->completed);
-	writel(DSIM_SWRST, dsi->reg_base + DSIM_SWRST_REG);
+	DSI_WRITE(dsi, DSIM_SWRST_REG, driver_data->values[RESET_TYPE]);
 }
 
 #ifndef MHZ
@@ -372,6 +460,7 @@ static void exynos_dsi_reset(struct exynos_dsi *dsi)
 static unsigned long exynos_dsi_pll_find_pms(struct exynos_dsi *dsi,
 		unsigned long fin, unsigned long fout, u8 *p, u16 *m, u8 *s)
 {
+	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	unsigned long best_freq = 0;
 	u32 min_delta = 0xffffffff;
 	u8 p_min, p_max;
@@ -395,7 +484,8 @@ static unsigned long exynos_dsi_pll_find_pms(struct exynos_dsi *dsi,
 
 			tmp = (u64)_m * fin;
 			do_div(tmp, _p);
-			if (tmp < 500 * MHZ || tmp > 1000 * MHZ)
+			if (tmp < 500 * MHZ ||
+					tmp > driver_data->max_freq * MHZ)
 				continue;
 
 			tmp = (u64)_m * fin;
@@ -440,7 +530,7 @@ static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
 	}
 	dev_dbg(dsi->dev, "PLL freq %lu, (p %d, m %d, s %d)\n", fout, p, m, s);
 
-	writel(500, dsi->reg_base + driver_data->plltmr_reg);
+	DSI_WRITE(dsi, driver_data->plltmr_reg, driver_data->values[PLL_TIMER]);
 
 	reg = DSIM_PLL_EN | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
 
@@ -462,7 +552,7 @@ static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
 		reg |= DSIM_FREQ_BAND(band);
 	}
 
-	writel(reg, dsi->reg_base + DSIM_PLLCTRL_REG);
+	DSI_WRITE(dsi, DSIM_PLLCTRL_REG, reg);
 
 	timeout = 1000;
 	do {
@@ -470,7 +560,7 @@ static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
 			dev_err(dsi->dev, "PLL failed to stabilize\n");
 			return 0;
 		}
-		reg = readl(dsi->reg_base + DSIM_STATUS_REG);
+		reg = DSI_READ(dsi, DSIM_STATUS_REG);
 	} while ((reg & DSIM_PLL_STABLE) == 0);
 
 	return fout;
@@ -482,6 +572,8 @@ static int exynos_dsi_enable_clock(struct exynos_dsi *dsi)
 	unsigned long esc_div;
 	u32 reg;
 
+	reg = DSI_READ(dsi, DSIM_STATUS_REG);
+
 	hs_clk = exynos_dsi_set_pll(dsi, dsi->burst_clk_rate);
 	if (!hs_clk) {
 		dev_err(dsi->dev, "failed to configure DSI PLL\n");
@@ -500,7 +592,7 @@ static int exynos_dsi_enable_clock(struct exynos_dsi *dsi)
 	dev_dbg(dsi->dev, "hs_clk = %lu, byte_clk = %lu, esc_clk = %lu\n",
 		hs_clk, byte_clk, esc_clk);
 
-	reg = readl(dsi->reg_base + DSIM_CLKCTRL_REG);
+	reg = DSI_READ(dsi, DSIM_CLKCTRL_REG);
 	reg &= ~(DSIM_ESC_PRESCALER_MASK | DSIM_LANE_ESC_CLK_EN_CLK
 			| DSIM_LANE_ESC_CLK_EN_DATA_MASK | DSIM_PLL_BYPASS
 			| DSIM_BYTE_CLK_SRC_MASK);
@@ -510,7 +602,7 @@ static int exynos_dsi_enable_clock(struct exynos_dsi *dsi)
 			| DSIM_LANE_ESC_CLK_EN_DATA(BIT(dsi->lanes) - 1)
 			| DSIM_BYTE_CLK_SRC(0)
 			| DSIM_TX_REQUEST_HSCLK;
-	writel(reg, dsi->reg_base + DSIM_CLKCTRL_REG);
+	DSI_WRITE(dsi, DSIM_CLKCTRL_REG, reg);
 
 	return 0;
 }
@@ -518,22 +610,24 @@ static int exynos_dsi_enable_clock(struct exynos_dsi *dsi)
 static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 {
 	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	unsigned int *values = driver_data->values;
 	u32 reg;
 
 	if (driver_data->has_freqband)
 		return;
 
 	/* B D-PHY: D-PHY Master & Slave Analog Block control */
-	reg = DSIM_PHYCTRL_ULPS_EXIT(0x0af);
-	writel(reg, dsi->reg_base + DSIM_PHYCTRL_REG);
+	reg = values[PHYCTRL_ULPS_EXIT] | values[PHYCTRL_VREG_LP] |
+		values[PHYCTRL_SLEW_UP];
+	DSI_WRITE(dsi, DSIM_PHYCTRL_REG, reg);
 
 	/*
 	 * T LPX: Transmitted length of any Low-Power state period
 	 * T HS-EXIT: Time that the transmitter drives LP-11 following a HS
 	 *	burst
 	 */
-	reg = DSIM_PHYTIMING_LPX(0x06) | DSIM_PHYTIMING_HS_EXIT(0x0b);
-	writel(reg, dsi->reg_base + DSIM_PHYTIMING_REG);
+	reg = values[PHYTIMING_LPX] | values[PHYTIMING_HS_EXIT];
+	DSI_WRITE(dsi, DSIM_PHYTIMING_REG, reg);
 
 	/*
 	 * T CLK-PREPARE: Time that the transmitter drives the Clock Lane LP-00
@@ -548,11 +642,10 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 	 * T CLK-TRAIL: Time that the transmitter drives the HS-0 state after
 	 *	the last payload clock bit of a HS transmission burst
 	 */
-	reg = DSIM_PHYTIMING1_CLK_PREPARE(0x07) |
-			DSIM_PHYTIMING1_CLK_ZERO(0x27) |
-			DSIM_PHYTIMING1_CLK_POST(0x0d) |
-			DSIM_PHYTIMING1_CLK_TRAIL(0x08);
-	writel(reg, dsi->reg_base + DSIM_PHYTIMING1_REG);
+	reg = values[PHYTIMING_CLK_PREPARE] | values[PHYTIMING_CLK_ZERO] |
+		values[PHYTIMING_CLK_POST] | values[PHYTIMING_CLK_TRAIL];
+
+	DSI_WRITE(dsi, DSIM_PHYTIMING1_REG, reg);
 
 	/*
 	 * T HS-PREPARE: Time that the transmitter drives the Data Lane LP-00
@@ -563,23 +656,23 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 	 * T HS-TRAIL: Time that the transmitter drives the flipped differential
 	 *	state after last payload data bit of a HS transmission burst
 	 */
-	reg = DSIM_PHYTIMING2_HS_PREPARE(0x09) | DSIM_PHYTIMING2_HS_ZERO(0x0d) |
-			DSIM_PHYTIMING2_HS_TRAIL(0x0b);
-	writel(reg, dsi->reg_base + DSIM_PHYTIMING2_REG);
+	reg = values[PHYTIMING_HS_PREPARE] | values[PHYTIMING_HS_ZERO] |
+		values[PHYTIMING_HS_TRAIL];
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
@@ -590,15 +683,14 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
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
@@ -657,14 +749,14 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 
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
@@ -677,7 +769,7 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 	if (driver_data->has_clklane_stop &&
 			dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
 		reg |= DSIM_CLKLANE_STOP;
-		writel(reg, dsi->reg_base + DSIM_CONFIG_REG);
+		DSI_WRITE(dsi, DSIM_CONFIG_REG, reg);
 	}
 
 	/* Check clock and data lane state are stop state */
@@ -688,19 +780,19 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
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
-	reg |= DSIM_STOP_STATE_CNT(0xf);
-	writel(reg, dsi->reg_base + DSIM_ESCMODE_REG);
+	reg |= DSIM_STOP_STATE_CNT(driver_data->values[STOP_STATE_CNT]);
+	DSI_WRITE(dsi, DSIM_ESCMODE_REG, reg);
 
 	reg = DSIM_BTA_TIMEOUT(0xff) | DSIM_LPDR_TIMEOUT(0xffff);
-	writel(reg, dsi->reg_base + DSIM_TIMEOUT_REG);
+	DSI_WRITE(dsi, DSIM_TIMEOUT_REG, reg);
 
 	return 0;
 }
@@ -708,25 +800,27 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 static void exynos_dsi_set_display_mode(struct exynos_dsi *dsi)
 {
 	struct videomode *vm = &dsi->vm;
+	unsigned int num_bits_resol = dsi->driver_data->num_bits_resol;
 	u32 reg;
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
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
+	reg =  DSIM_MAIN_HRESOL(vm->hactive, num_bits_resol) |
+		DSIM_MAIN_VRESOL(vm->vactive, num_bits_resol);
 
-	reg = DSIM_MAIN_HRESOL(vm->hactive) | DSIM_MAIN_VRESOL(vm->vactive);
-	writel(reg, dsi->reg_base + DSIM_MDRESOL_REG);
+	DSI_WRITE(dsi, DSIM_MDRESOL_REG, reg);
 
 	dev_dbg(dsi->dev, "LCD size = %dx%d\n", vm->hactive, vm->vactive);
 }
@@ -735,12 +829,12 @@ static void exynos_dsi_set_display_enable(struct exynos_dsi *dsi, bool enable)
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
@@ -748,7 +842,7 @@ static int exynos_dsi_wait_for_hdr_fifo(struct exynos_dsi *dsi)
 	int timeout = 2000;
 
 	do {
-		u32 reg = readl(dsi->reg_base + DSIM_FIFOCTRL_REG);
+		u32 reg = DSI_READ(dsi, DSIM_FIFOCTRL_REG);
 
 		if (!(reg & DSIM_SFR_HEADER_FULL))
 			return 0;
@@ -762,22 +856,21 @@ static int exynos_dsi_wait_for_hdr_fifo(struct exynos_dsi *dsi)
 
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
@@ -801,7 +894,7 @@ static void exynos_dsi_send_to_fifo(struct exynos_dsi *dsi,
 	while (length >= 4) {
 		reg = (payload[3] << 24) | (payload[2] << 16)
 					| (payload[1] << 8) | payload[0];
-		writel(reg, dsi->reg_base + DSIM_PAYLOAD_REG);
+		DSI_WRITE(dsi, DSIM_PAYLOAD_REG, reg);
 		payload += 4;
 		length -= 4;
 	}
@@ -816,7 +909,7 @@ static void exynos_dsi_send_to_fifo(struct exynos_dsi *dsi,
 		/* Fall through */
 	case 1:
 		reg |= payload[0];
-		writel(reg, dsi->reg_base + DSIM_PAYLOAD_REG);
+		DSI_WRITE(dsi, DSIM_PAYLOAD_REG, reg);
 		break;
 	case 0:
 		/* Do nothing */
@@ -839,7 +932,7 @@ static void exynos_dsi_send_to_fifo(struct exynos_dsi *dsi,
 		dsi->state ^= DSIM_STATE_CMD_LPM;
 	}
 
-	writel(reg, dsi->reg_base + DSIM_PKTHDR_REG);
+	DSI_WRITE(dsi, DSIM_PKTHDR_REG, reg);
 
 	if (xfer->flags & MIPI_DSI_MSG_REQ_ACK)
 		exynos_dsi_force_bta(dsi);
@@ -855,7 +948,7 @@ static void exynos_dsi_read_from_fifo(struct exynos_dsi *dsi,
 	u32 reg;
 
 	if (first) {
-		reg = readl(dsi->reg_base + DSIM_RXFIFO_REG);
+		reg = DSI_READ(dsi, DSIM_RXFIFO_REG);
 
 		switch (reg & 0x3f) {
 		case MIPI_DSI_RX_GENERIC_SHORT_READ_RESPONSE_2BYTE:
@@ -894,7 +987,7 @@ static void exynos_dsi_read_from_fifo(struct exynos_dsi *dsi,
 
 	/* Receive payload */
 	while (length >= 4) {
-		reg = readl(dsi->reg_base + DSIM_RXFIFO_REG);
+		reg = DSI_READ(dsi, DSIM_RXFIFO_REG);
 		payload[0] = (reg >>  0) & 0xff;
 		payload[1] = (reg >>  8) & 0xff;
 		payload[2] = (reg >> 16) & 0xff;
@@ -904,7 +997,7 @@ static void exynos_dsi_read_from_fifo(struct exynos_dsi *dsi,
 	}
 
 	if (length) {
-		reg = readl(dsi->reg_base + DSIM_RXFIFO_REG);
+		reg = DSI_READ(dsi, DSIM_RXFIFO_REG);
 		switch (length) {
 		case 3:
 			payload[2] = (reg >> 16) & 0xff;
@@ -1079,18 +1172,18 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
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
@@ -1133,10 +1226,13 @@ static void exynos_dsi_disable_irq(struct exynos_dsi *dsi)
 
 static int exynos_dsi_init(struct exynos_dsi *dsi)
 {
+	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+
 	exynos_dsi_reset(dsi);
 	exynos_dsi_enable_irq(dsi);
 	exynos_dsi_enable_clock(dsi);
-	exynos_dsi_wait_for_reset(dsi);
+	if (driver_data->wait_for_reset)
+		exynos_dsi_wait_for_reset(dsi);
 	exynos_dsi_set_phy_ctrl(dsi);
 	exynos_dsi_init_link(dsi);
 
@@ -1285,7 +1381,8 @@ static const struct mipi_dsi_host_ops exynos_dsi_ops = {
 
 static int exynos_dsi_poweron(struct exynos_dsi *dsi)
 {
-	int ret;
+	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	int ret, i;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
 	if (ret < 0) {
@@ -1293,31 +1390,23 @@ static int exynos_dsi_poweron(struct exynos_dsi *dsi)
 		return ret;
 	}
 
-	ret = clk_prepare_enable(dsi->bus_clk);
-	if (ret < 0) {
-		dev_err(dsi->dev, "cannot enable bus clock %d\n", ret);
-		goto err_bus_clk;
-	}
-
-	ret = clk_prepare_enable(dsi->sclk_clk);
-	if (ret < 0) {
-		dev_err(dsi->dev, "cannot enable pll clock %d\n", ret);
-		goto err_sclk_clk;
+	for (i = 0; i < driver_data->num_clks; i++) {
+		ret = clk_prepare_enable(dsi->clks[i]);
+		if (ret < 0)
+			goto err_clk;
 	}
 
 	ret = phy_power_on(dsi->phy);
 	if (ret < 0) {
 		dev_err(dsi->dev, "cannot enable phy %d\n", ret);
-		goto err_phy;
+		goto err_clk;
 	}
 
 	return 0;
 
-err_phy:
-	clk_disable_unprepare(dsi->sclk_clk);
-err_sclk_clk:
-	clk_disable_unprepare(dsi->bus_clk);
-err_bus_clk:
+err_clk:
+	while (--i > -1)
+		clk_disable_unprepare(dsi->clks[i]);
 	regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
 
 	return ret;
@@ -1325,7 +1414,8 @@ err_bus_clk:
 
 static void exynos_dsi_poweroff(struct exynos_dsi *dsi)
 {
-	int ret;
+	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	int ret, i;
 
 	usleep_range(10000, 20000);
 
@@ -1341,8 +1431,8 @@ static void exynos_dsi_poweroff(struct exynos_dsi *dsi)
 
 	phy_power_off(dsi->phy);
 
-	clk_disable_unprepare(dsi->sclk_clk);
-	clk_disable_unprepare(dsi->bus_clk);
+	for (i = driver_data->num_clks - 1; i > -1; i--)
+		clk_disable_unprepare(dsi->clks[i]);
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
 	if (ret < 0)
@@ -1671,7 +1761,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	struct exynos_dsi *dsi;
-	int ret;
+	int ret, i;
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
 	if (!dsi)
@@ -1711,18 +1801,17 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}
 
-	dsi->sclk_clk = devm_clk_get(dev, "sclk_mipi");
-	if (IS_ERR(dsi->sclk_clk)) {
-		dev_info(dev, "failed to get dsi sclk clock\n");
-		ret = PTR_ERR(dsi->sclk_clk);
-		goto err_del_component;
-	}
-
-	dsi->bus_clk = devm_clk_get(dev, "bus_clk");
-	if (IS_ERR(dsi->bus_clk)) {
-		dev_info(dev, "failed to get dsi bus clock\n");
-		ret = PTR_ERR(dsi->bus_clk);
-		goto err_del_component;
+	dsi->clks = devm_kzalloc(dev,
+			sizeof(*dsi->clks) * dsi->driver_data->num_clks,
+			GFP_KERNEL);
+	for (i = 0; i < dsi->driver_data->num_clks; i++) {
+		dsi->clks[i] = devm_clk_get(dev, clk_names[i]);
+		if (IS_ERR(dsi->clks[i])) {
+			dev_info(dev, "failed to get the clock: %s\n",
+								clk_names[i]);
+			ret = PTR_ERR(dsi->clks[i]);
+			goto err_del_component;
+		}
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
