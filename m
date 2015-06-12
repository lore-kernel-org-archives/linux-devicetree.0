From: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 10/15] drm/exynos: dsi: make use of driver data for static
 values
Date: Fri, 12 Jun 2015 21:59:05 +0900
Message-ID: <1434113958-15877-11-git-send-email-human.hwang@samsung.com>
References: <1434113958-15877-1-git-send-email-human.hwang@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1434113958-15877-1-git-send-email-human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Exynos MIPI DSI driver uses some static values such as address offsets,
register setting values, and etc. This patch makes the driver get those
values from the driver data.

Signed-off-by: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Changes before:
- Refer https://patchwork.kernel.org/patch/6191731
Changes for v6:
- None

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 196 +++++++++++++++++++++++---------
 1 file changed, 145 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 70367d0..0b468d7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -34,38 +34,6 @@
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
@@ -129,8 +97,8 @@

 /* DSIM_MDRESOL */
 #define DSIM_MAIN_STAND_BY		(1 << 31)
-#define DSIM_MAIN_VRESOL(x)		(((x) & 0x7ff) << 16)
-#define DSIM_MAIN_HRESOL(x)		(((x) & 0X7ff) << 0)
+#define DSIM_MAIN_VRESOL(x, num_bits)	(((x) & ((1 << (num_bits)) - 1)) << 16)
+#define DSIM_MAIN_HRESOL(x, num_bits)	(((x) & ((1 << (num_bits)) - 1)) << 0)

 /* DSIM_MVPORCH */
 #define DSIM_CMD_ALLOW(x)		((x) << 28)
@@ -237,8 +205,11 @@

 #define OLD_SCLK_MIPI_CLK_NAME "pll_clk"

-#define DSI_WRITE(dsi, reg, val)	writel((val), (dsi)->reg_base + (reg))
-#define DSI_READ(dsi, reg)		readl((dsi)->reg_base + (reg))
+#define REG_ADDR(dsi, reg_idx)		((dsi)->reg_base + \
+					dsi->driver_data->reg_ofs[(reg_idx)])
+#define DSI_WRITE(dsi, reg_idx, val)	writel((val), \
+					REG_ADDR((dsi), (reg_idx)))
+#define DSI_READ(dsi, reg_idx)		readl(REG_ADDR((dsi), (reg_idx)))

 enum exynos_dsi_transfer_type {
 	EXYNOS_DSI_TX,
@@ -268,10 +239,15 @@ struct exynos_dsi_transfer {
 #define DSIM_STATE_VIDOUT_AVAILABLE	BIT(3)

 struct exynos_dsi_driver_data {
+	unsigned int *reg_ofs;
 	unsigned int plltmr_reg;
-
 	unsigned int has_freqband:1;
 	unsigned int has_clklane_stop:1;
+	unsigned int num_clks;
+	unsigned int max_freq;
+	unsigned int wait_for_reset;
+	unsigned int num_bits_resol;
+	unsigned int *reg_values;
 };

 struct exynos_dsi {
@@ -316,25 +292,133 @@ static inline struct exynos_dsi *display_to_dsi(struct exynos_drm_display *d)
 	return container_of(d, struct exynos_dsi, display);
 }

+enum reg_idx {
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
+static unsigned int exynos_reg_ofs[] = {
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
+enum reg_value_idx {
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
+static unsigned int reg_values[] = {
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
+	.reg_ofs = exynos_reg_ofs,
 	.plltmr_reg = 0x50,
 	.has_freqband = 1,
 	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 1000,
+	.wait_for_reset = 1,
+	.num_bits_resol = 11,
+	.reg_values = reg_values,
 };

 static struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
+	.reg_ofs = exynos_reg_ofs,
 	.plltmr_reg = 0x50,
 	.has_freqband = 1,
 	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 1000,
+	.wait_for_reset = 1,
+	.num_bits_resol = 11,
+	.reg_values = reg_values,
 };

 static struct exynos_dsi_driver_data exynos4415_dsi_driver_data = {
+	.reg_ofs = exynos_reg_ofs,
 	.plltmr_reg = 0x58,
 	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 1000,
+	.wait_for_reset = 1,
+	.num_bits_resol = 11,
+	.reg_values = reg_values,
 };

 static struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
+	.reg_ofs = exynos_reg_ofs,
 	.plltmr_reg = 0x58,
+	.num_clks = 2,
+	.max_freq = 1000,
+	.wait_for_reset = 1,
+	.num_bits_resol = 11,
+	.reg_values = reg_values,
 };

 static struct of_device_id exynos_dsi_of_match[] = {
@@ -371,7 +455,7 @@ static void exynos_dsi_reset(struct exynos_dsi *dsi)
 	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;

 	reinit_completion(&dsi->completed);
-	DSI_WRITE(dsi, DSIM_SWRST_REG, DSIM_SWRST);
+	DSI_WRITE(dsi, DSIM_SWRST_REG, driver_data->reg_values[RESET_TYPE]);
 }

 #ifndef MHZ
@@ -405,7 +489,8 @@ static unsigned long exynos_dsi_pll_find_pms(struct exynos_dsi *dsi,

 			tmp = (u64)_m * fin;
 			do_div(tmp, _p);
-			if (tmp < 500 * MHZ || tmp > 1000 * MHZ)
+			if (tmp < 500 * MHZ ||
+					tmp > driver_data->max_freq * MHZ)
 				continue;

 			tmp = (u64)_m * fin;
@@ -450,7 +535,8 @@ static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
 	}
 	dev_dbg(dsi->dev, "PLL freq %lu, (p %d, m %d, s %d)\n", fout, p, m, s);

-	writel(500, dsi->reg_base + driver_data->plltmr_reg);
+	writel(driver_data->reg_values[PLL_TIMER],
+			dsi->reg_base + driver_data->plltmr_reg);

 	reg = DSIM_PLL_EN | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);

@@ -528,13 +614,15 @@ static int exynos_dsi_enable_clock(struct exynos_dsi *dsi)
 static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 {
 	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	unsigned int *reg_values = driver_data->reg_values;
 	u32 reg;

 	if (driver_data->has_freqband)
 		return;

 	/* B D-PHY: D-PHY Master & Slave Analog Block control */
-	reg = DSIM_PHYCTRL_ULPS_EXIT(0x0af);
+	reg = reg_values[PHYCTRL_ULPS_EXIT] | reg_values[PHYCTRL_VREG_LP] |
+		reg_values[PHYCTRL_SLEW_UP];
 	DSI_WRITE(dsi, DSIM_PHYCTRL_REG, reg);

 	/*
@@ -542,7 +630,7 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 	 * T HS-EXIT: Time that the transmitter drives LP-11 following a HS
 	 *	burst
 	 */
-	reg = DSIM_PHYTIMING_LPX(0x06) | DSIM_PHYTIMING_HS_EXIT(0x0b);
+	reg = reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_HS_EXIT];
 	DSI_WRITE(dsi, DSIM_PHYTIMING_REG, reg);

 	/*
@@ -558,10 +646,11 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 	 * T CLK-TRAIL: Time that the transmitter drives the HS-0 state after
 	 *	the last payload clock bit of a HS transmission burst
 	 */
-	reg = DSIM_PHYTIMING1_CLK_PREPARE(0x07) |
-			DSIM_PHYTIMING1_CLK_ZERO(0x27) |
-			DSIM_PHYTIMING1_CLK_POST(0x0d) |
-			DSIM_PHYTIMING1_CLK_TRAIL(0x08);
+	reg = reg_values[PHYTIMING_CLK_PREPARE] |
+		reg_values[PHYTIMING_CLK_ZERO] |
+		reg_values[PHYTIMING_CLK_POST] |
+		reg_values[PHYTIMING_CLK_TRAIL];
+
 	DSI_WRITE(dsi, DSIM_PHYTIMING1_REG, reg);

 	/*
@@ -573,8 +662,8 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 	 * T HS-TRAIL: Time that the transmitter drives the flipped differential
 	 *	state after last payload data bit of a HS transmission burst
 	 */
-	reg = DSIM_PHYTIMING2_HS_PREPARE(0x09) | DSIM_PHYTIMING2_HS_ZERO(0x0d) |
-			DSIM_PHYTIMING2_HS_TRAIL(0x0b);
+	reg = reg_values[PHYTIMING_HS_PREPARE] | reg_values[PHYTIMING_HS_ZERO] |
+		reg_values[PHYTIMING_HS_TRAIL];
 	DSI_WRITE(dsi, DSIM_PHYTIMING2_REG, reg);
 }

@@ -705,7 +794,7 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)

 	reg = DSI_READ(dsi, DSIM_ESCMODE_REG);
 	reg &= ~DSIM_STOP_STATE_CNT_MASK;
-	reg |= DSIM_STOP_STATE_CNT(0xf);
+	reg |= DSIM_STOP_STATE_CNT(driver_data->reg_values[STOP_STATE_CNT]);
 	DSI_WRITE(dsi, DSIM_ESCMODE_REG, reg);

 	reg = DSIM_BTA_TIMEOUT(0xff) | DSIM_LPDR_TIMEOUT(0xffff);
@@ -717,6 +806,7 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 static void exynos_dsi_set_display_mode(struct exynos_dsi *dsi)
 {
 	struct videomode *vm = &dsi->vm;
+	unsigned int num_bits_resol = dsi->driver_data->num_bits_resol;
 	u32 reg;

 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
@@ -733,8 +823,9 @@ static void exynos_dsi_set_display_mode(struct exynos_dsi *dsi)
 			| DSIM_MAIN_HSA(vm->hsync_len);
 		DSI_WRITE(dsi, DSIM_MSYNC_REG, reg);
 	}
+	reg =  DSIM_MAIN_HRESOL(vm->hactive, num_bits_resol) |
+		DSIM_MAIN_VRESOL(vm->vactive, num_bits_resol);

-	reg = DSIM_MAIN_HRESOL(vm->hactive) | DSIM_MAIN_VRESOL(vm->vactive);
 	DSI_WRITE(dsi, DSIM_MDRESOL_REG, reg);

 	dev_dbg(dsi->dev, "LCD size = %dx%d\n", vm->hactive, vm->vactive);
@@ -1141,10 +1232,13 @@ static void exynos_dsi_disable_irq(struct exynos_dsi *dsi)

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

--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
