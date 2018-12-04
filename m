From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 4/5] clk: meson: gxbb-ao: replace cec-32k with the dual divider
Date: Tue,  4 Dec 2018 17:53:09 +0100
Message-ID: <20181204165310.20806-5-jbrunet@baylibre.com>
References: <20181204165310.20806-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204165310.20806-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Replace the cec-32k clock of gxbb-ao with the simpler dual divider
driver. The dual divider implements only the dividing part. All the
other bits are now exposed using simple elements, such as gates and
muxes

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Makefile         |   2 +-
 drivers/clk/meson/gxbb-aoclk-32k.c | 193 -----------------------
 drivers/clk/meson/gxbb-aoclk.c     | 238 +++++++++++++++++++++++------
 drivers/clk/meson/gxbb-aoclk.h     |  20 +--
 4 files changed, 191 insertions(+), 262 deletions(-)
 delete mode 100644 drivers/clk/meson/gxbb-aoclk-32k.c

diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index ae3fa2a127d5..6da1d7082f1a 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -7,7 +7,7 @@ obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-dualdiv.o
 obj-$(CONFIG_COMMON_CLK_AMLOGIC_AUDIO)	+= clk-triphase.o sclk-div.o
 obj-$(CONFIG_COMMON_CLK_MESON_AO) += meson-aoclk.o
 obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o
-obj-$(CONFIG_COMMON_CLK_GXBB)	 += gxbb.o gxbb-aoclk.o gxbb-aoclk-32k.o
+obj-$(CONFIG_COMMON_CLK_GXBB)	 += gxbb.o gxbb-aoclk.o
 obj-$(CONFIG_COMMON_CLK_AXG)	 += axg.o axg-aoclk.o
 obj-$(CONFIG_COMMON_CLK_AXG_AUDIO)	+= axg-audio.o
 obj-$(CONFIG_COMMON_CLK_REGMAP_MESON)	+= clk-regmap.o
diff --git a/drivers/clk/meson/gxbb-aoclk-32k.c b/drivers/clk/meson/gxbb-aoclk-32k.c
deleted file mode 100644
index 680467141a1d..000000000000
--- a/drivers/clk/meson/gxbb-aoclk-32k.c
+++ /dev/null
@@ -1,193 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Copyright (c) 2017 BayLibre, SAS.
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#include <linux/clk-provider.h>
-#include <linux/bitfield.h>
-#include <linux/regmap.h>
-#include "gxbb-aoclk.h"
-
-/*
- * The AO Domain embeds a dual/divider to generate a more precise
- * 32,768KHz clock for low-power suspend mode and CEC.
- *                      ______   ______
- *                     |      | |      |
- *         ______      | Div1 |-| Cnt1 |       ______
- *        |      |    /|______| |______|\     |      |
- * Xtal-->| Gate |---|  ______   ______  X-X--| Gate |-->
- *        |______| |  \|      | |      |/  |  |______|
- *                 |   | Div2 |-| Cnt2 |   |
- *                 |   |______| |______|   |
- *                 |_______________________|
- *
- * The dividing can be switched to single or dual, with a counter
- * for each divider to set when the switching is done.
- * The entire dividing mechanism can be also bypassed.
- */
-
-#define CLK_CNTL0_N1_MASK	GENMASK(11, 0)
-#define CLK_CNTL0_N2_MASK	GENMASK(23, 12)
-#define CLK_CNTL0_DUALDIV_EN	BIT(28)
-#define CLK_CNTL0_OUT_GATE_EN	BIT(30)
-#define CLK_CNTL0_IN_GATE_EN	BIT(31)
-
-#define CLK_CNTL1_M1_MASK	GENMASK(11, 0)
-#define CLK_CNTL1_M2_MASK	GENMASK(23, 12)
-#define CLK_CNTL1_BYPASS_EN	BIT(24)
-#define CLK_CNTL1_SELECT_OSC	BIT(27)
-
-#define PWR_CNTL_ALT_32K_SEL	GENMASK(13, 10)
-
-struct cec_32k_freq_table {
-	unsigned long parent_rate;
-	unsigned long target_rate;
-	bool dualdiv;
-	unsigned int n1;
-	unsigned int n2;
-	unsigned int m1;
-	unsigned int m2;
-};
-
-static const struct cec_32k_freq_table aoclk_cec_32k_table[] = {
-	[0] = {
-		.parent_rate = 24000000,
-		.target_rate = 32768,
-		.dualdiv = true,
-		.n1 = 733,
-		.n2 = 732,
-		.m1 = 8,
-		.m2 = 11,
-	},
-};
-
-/*
- * If CLK_CNTL0_DUALDIV_EN == 0
- *  - will use N1 divider only
- * If CLK_CNTL0_DUALDIV_EN == 1
- *  - hold M1 cycles of N1 divider then changes to N2
- *  - hold M2 cycles of N2 divider then changes to N1
- * Then we can get more accurate division.
- */
-static unsigned long aoclk_cec_32k_recalc_rate(struct clk_hw *hw,
-					       unsigned long parent_rate)
-{
-	struct aoclk_cec_32k *cec_32k = to_aoclk_cec_32k(hw);
-	unsigned long n1;
-	u32 reg0, reg1;
-
-	regmap_read(cec_32k->regmap, AO_RTC_ALT_CLK_CNTL0, &reg0);
-	regmap_read(cec_32k->regmap, AO_RTC_ALT_CLK_CNTL1, &reg1);
-
-	if (reg1 & CLK_CNTL1_BYPASS_EN)
-		return parent_rate;
-
-	if (reg0 & CLK_CNTL0_DUALDIV_EN) {
-		unsigned long n2, m1, m2, f1, f2, p1, p2;
-
-		n1 = FIELD_GET(CLK_CNTL0_N1_MASK, reg0) + 1;
-		n2 = FIELD_GET(CLK_CNTL0_N2_MASK, reg0) + 1;
-
-		m1 = FIELD_GET(CLK_CNTL1_M1_MASK, reg1) + 1;
-		m2 = FIELD_GET(CLK_CNTL1_M2_MASK, reg1) + 1;
-
-		f1 = DIV_ROUND_CLOSEST(parent_rate, n1);
-		f2 = DIV_ROUND_CLOSEST(parent_rate, n2);
-
-		p1 = DIV_ROUND_CLOSEST(100000000 * m1, f1 * (m1 + m2));
-		p2 = DIV_ROUND_CLOSEST(100000000 * m2, f2 * (m1 + m2));
-
-		return DIV_ROUND_UP(100000000, p1 + p2);
-	}
-
-	n1 = FIELD_GET(CLK_CNTL0_N1_MASK, reg0) + 1;
-
-	return DIV_ROUND_CLOSEST(parent_rate, n1);
-}
-
-static const struct cec_32k_freq_table *find_cec_32k_freq(unsigned long rate,
-							  unsigned long prate)
-{
-	int i;
-
-	for (i = 0 ; i < ARRAY_SIZE(aoclk_cec_32k_table) ; ++i)
-		if (aoclk_cec_32k_table[i].parent_rate == prate &&
-		    aoclk_cec_32k_table[i].target_rate == rate)
-			return &aoclk_cec_32k_table[i];
-
-	return NULL;
-}
-
-static long aoclk_cec_32k_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
-{
-	const struct cec_32k_freq_table *freq = find_cec_32k_freq(rate,
-								  *prate);
-
-	/* If invalid return first one */
-	if (!freq)
-		return aoclk_cec_32k_table[0].target_rate;
-
-	return freq->target_rate;
-}
-
-/*
- * From the Amlogic init procedure, the IN and OUT gates needs to be handled
- * in the init procedure to avoid any glitches.
- */
-
-static int aoclk_cec_32k_set_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long parent_rate)
-{
-	const struct cec_32k_freq_table *freq = find_cec_32k_freq(rate,
-								  parent_rate);
-	struct aoclk_cec_32k *cec_32k = to_aoclk_cec_32k(hw);
-	u32 reg = 0;
-
-	if (!freq)
-		return -EINVAL;
-
-	/* Disable clock */
-	regmap_update_bits(cec_32k->regmap, AO_RTC_ALT_CLK_CNTL0,
-			   CLK_CNTL0_IN_GATE_EN | CLK_CNTL0_OUT_GATE_EN, 0);
-
-	reg = FIELD_PREP(CLK_CNTL0_N1_MASK, freq->n1 - 1);
-	if (freq->dualdiv)
-		reg |= CLK_CNTL0_DUALDIV_EN |
-		       FIELD_PREP(CLK_CNTL0_N2_MASK, freq->n2 - 1);
-
-	regmap_write(cec_32k->regmap, AO_RTC_ALT_CLK_CNTL0, reg);
-
-	reg = FIELD_PREP(CLK_CNTL1_M1_MASK, freq->m1 - 1);
-	if (freq->dualdiv)
-		reg |= FIELD_PREP(CLK_CNTL1_M2_MASK, freq->m2 - 1);
-
-	regmap_write(cec_32k->regmap, AO_RTC_ALT_CLK_CNTL1, reg);
-
-	/* Enable clock */
-	regmap_update_bits(cec_32k->regmap, AO_RTC_ALT_CLK_CNTL0,
-			   CLK_CNTL0_IN_GATE_EN, CLK_CNTL0_IN_GATE_EN);
-
-	udelay(200);
-
-	regmap_update_bits(cec_32k->regmap, AO_RTC_ALT_CLK_CNTL0,
-			   CLK_CNTL0_OUT_GATE_EN, CLK_CNTL0_OUT_GATE_EN);
-
-	regmap_update_bits(cec_32k->regmap, AO_CRT_CLK_CNTL1,
-			   CLK_CNTL1_SELECT_OSC, CLK_CNTL1_SELECT_OSC);
-
-	/* Select 32k from XTAL */
-	regmap_update_bits(cec_32k->regmap,
-			  AO_RTI_PWR_CNTL_REG0,
-			  PWR_CNTL_ALT_32K_SEL,
-			  FIELD_PREP(PWR_CNTL_ALT_32K_SEL, 4));
-
-	return 0;
-}
-
-const struct clk_ops meson_aoclk_cec_32k_ops = {
-	.recalc_rate = aoclk_cec_32k_recalc_rate,
-	.round_rate = aoclk_cec_32k_round_rate,
-	.set_rate = aoclk_cec_32k_set_rate,
-};
diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
index 42ed61d3c3fb..4188294d9a96 100644
--- a/drivers/clk/meson/gxbb-aoclk.c
+++ b/drivers/clk/meson/gxbb-aoclk.c
@@ -5,10 +5,19 @@
  */
 #include <linux/platform_device.h>
 #include <linux/mfd/syscon.h>
-#include "clk-regmap.h"
+#include "clkc.h"
 #include "meson-aoclk.h"
 #include "gxbb-aoclk.h"
 
+/* AO Configuration Clock registers offsets */
+#define AO_RTI_PWR_CNTL_REG1	0x0c
+#define AO_RTI_PWR_CNTL_REG0	0x10
+#define AO_RTI_GEN_CNTL_REG0	0x40
+#define AO_OSCIN_CNTL		0x58
+#define AO_CRT_CLK_CNTL1	0x68
+#define AO_RTC_ALT_CLK_CNTL0	0x94
+#define AO_RTC_ALT_CLK_CNTL1	0x98
+
 #define GXBB_AO_GATE(_name, _bit)					\
 static struct clk_regmap _name##_ao = {					\
 	.data = &(struct clk_regmap_gate_data) {			\
@@ -31,13 +40,161 @@ GXBB_AO_GATE(uart1, 3);
 GXBB_AO_GATE(uart2, 5);
 GXBB_AO_GATE(ir_blaster, 6);
 
-static struct aoclk_cec_32k cec_32k_ao = {
-	.hw.init = &(struct clk_init_data) {
-		.name = "cec_32k_ao",
-		.ops = &meson_aoclk_cec_32k_ops,
+static struct clk_regmap ao_cts_oscin = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = AO_RTI_PWR_CNTL_REG0,
+		.bit_idx = 6,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ao_cts_oscin",
+		.ops = &clk_regmap_gate_ro_ops,
 		.parent_names = (const char *[]){ "xtal" },
 		.num_parents = 1,
-		.flags = CLK_IGNORE_UNUSED,
+	},
+};
+
+static struct clk_regmap ao_32k_pre = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = AO_RTC_ALT_CLK_CNTL0,
+		.bit_idx = 31,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ao_32k_pre",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "ao_cts_oscin" },
+		.num_parents = 1,
+	},
+};
+
+static const struct meson_clk_dualdiv_param gxbb_32k_div_table[] = {
+	{
+		.dual	= 1,
+		.n1	= 733,
+		.m1	= 8,
+		.n2	= 732,
+		.m2	= 11,
+	}, {}
+};
+
+static struct clk_regmap ao_32k_div = {
+	.data = &(struct meson_clk_dualdiv_data){
+		.n1 = {
+			.reg_off = AO_RTC_ALT_CLK_CNTL0,
+			.shift   = 0,
+			.width   = 12,
+		},
+		.n2 = {
+			.reg_off = AO_RTC_ALT_CLK_CNTL0,
+			.shift   = 12,
+			.width   = 12,
+		},
+		.m1 = {
+			.reg_off = AO_RTC_ALT_CLK_CNTL1,
+			.shift   = 0,
+			.width   = 12,
+		},
+		.m2 = {
+			.reg_off = AO_RTC_ALT_CLK_CNTL1,
+			.shift   = 12,
+			.width   = 12,
+		},
+		.dual = {
+			.reg_off = AO_RTC_ALT_CLK_CNTL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.table = gxbb_32k_div_table,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ao_32k_div",
+		.ops = &meson_clk_dualdiv_ops,
+		.parent_names = (const char *[]){ "ao_32k_pre" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap ao_32k_sel = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = AO_RTC_ALT_CLK_CNTL1,
+		.mask = 0x1,
+		.shift = 24,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ao_32k_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_names = (const char *[]){ "ao_32k_div",
+						  "ao_32k_pre" },
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap ao_32k = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = AO_RTC_ALT_CLK_CNTL0,
+		.bit_idx = 30,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ao_32k",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "ao_32k_sel" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap ao_cts_rtc_oscin = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = AO_RTI_PWR_CNTL_REG0,
+		.mask = 0x7,
+		.shift = 10,
+		.table = (u32[]){ 1, 2, 3, 4 },
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ao_cts_rtc_oscin",
+		.ops = &clk_regmap_mux_ops,
+		.parent_names = (const char *[]){ "ext_32k_0",
+						  "ext_32k_1",
+						  "ext_32k_2",
+						  "ao_32k" },
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap ao_clk81 = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = AO_RTI_PWR_CNTL_REG0,
+		.mask = 0x1,
+		.shift = 0,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ao_clk81",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_names = (const char *[]){ "clk81",
+						  "ao_cts_rtc_oscin" },
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap ao_cts_cec = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = AO_CRT_CLK_CNTL1,
+		.mask = 0x1,
+		.shift = 27,
+		.table = (u32[]){ 1 },
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ao_cts_cec",
+		.ops = &clk_regmap_mux_ops,
+		.parent_names = (const char *[]){ "ao_cts_rtc_oscin" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -50,13 +207,21 @@ static const unsigned int gxbb_aoclk_reset[] = {
 	[RESET_AO_IR_BLASTER] = 23,
 };
 
-static struct clk_regmap *gxbb_aoclk_gate[] = {
-	[CLKID_AO_REMOTE] = &remote_ao,
-	[CLKID_AO_I2C_MASTER] = &i2c_master_ao,
-	[CLKID_AO_I2C_SLAVE] = &i2c_slave_ao,
-	[CLKID_AO_UART1] = &uart1_ao,
-	[CLKID_AO_UART2] = &uart2_ao,
-	[CLKID_AO_IR_BLASTER] = &ir_blaster_ao,
+static struct clk_regmap *gxbb_aoclk[] = {
+	&remote_ao,
+	&i2c_master_ao,
+	&i2c_slave_ao,
+	&uart1_ao,
+	&uart2_ao,
+	&ir_blaster_ao,
+	&ao_cts_oscin,
+	&ao_32k_pre,
+	&ao_32k_div,
+	&ao_32k_sel,
+	&ao_32k,
+	&ao_cts_rtc_oscin,
+	&ao_clk81,
+	&ao_cts_cec,
 };
 
 static const struct clk_hw_onecell_data gxbb_aoclk_onecell_data = {
@@ -67,52 +232,27 @@ static const struct clk_hw_onecell_data gxbb_aoclk_onecell_data = {
 		[CLKID_AO_UART1] = &uart1_ao.hw,
 		[CLKID_AO_UART2] = &uart2_ao.hw,
 		[CLKID_AO_IR_BLASTER] = &ir_blaster_ao.hw,
-		[CLKID_AO_CEC_32K] = &cec_32k_ao.hw,
+		[CLKID_AO_CEC_32K] = &ao_cts_cec.hw,
+		[CLKID_AO_CTS_OSCIN] = &ao_cts_oscin.hw,
+		[CLKID_AO_32K_PRE] = &ao_32k_pre.hw,
+		[CLKID_AO_32K_DIV] = &ao_32k_div.hw,
+		[CLKID_AO_32K_SEL] = &ao_32k_sel.hw,
+		[CLKID_AO_32K] = &ao_32k.hw,
+		[CLKID_AO_CTS_RTC_OSCIN] = &ao_cts_rtc_oscin.hw,
+		[CLKID_AO_CLK81] = &ao_clk81.hw,
 	},
 	.num = NR_CLKS,
 };
 
-static int gxbb_register_cec_ao_32k(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct regmap *regmap;
-	int ret;
-
-	regmap = syscon_node_to_regmap(of_get_parent(dev->of_node));
-	if (IS_ERR(regmap)) {
-		dev_err(dev, "failed to get regmap\n");
-		return PTR_ERR(regmap);
-	}
-
-	/* Specific clocks */
-	cec_32k_ao.regmap = regmap;
-	ret = devm_clk_hw_register(dev, &cec_32k_ao.hw);
-	if (ret) {
-		dev_err(&pdev->dev, "clk cec_32k_ao register failed.\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static const struct meson_aoclk_data gxbb_aoclkc_data = {
 	.reset_reg	= AO_RTI_GEN_CNTL_REG0,
 	.num_reset	= ARRAY_SIZE(gxbb_aoclk_reset),
 	.reset		= gxbb_aoclk_reset,
-	.num_clks	= ARRAY_SIZE(gxbb_aoclk_gate),
-	.clks		= gxbb_aoclk_gate,
+	.num_clks	= ARRAY_SIZE(gxbb_aoclk),
+	.clks		= gxbb_aoclk,
 	.hw_data	= &gxbb_aoclk_onecell_data,
 };
 
-static int gxbb_aoclkc_probe(struct platform_device *pdev)
-{
-	int ret = gxbb_register_cec_ao_32k(pdev);
-	if (ret)
-		return ret;
-
-	return meson_aoclkc_probe(pdev);
-}
-
 static const struct of_device_id gxbb_aoclkc_match_table[] = {
 	{
 		.compatible	= "amlogic,meson-gx-aoclkc",
@@ -122,7 +262,7 @@ static const struct of_device_id gxbb_aoclkc_match_table[] = {
 };
 
 static struct platform_driver gxbb_aoclkc_driver = {
-	.probe		= gxbb_aoclkc_probe,
+	.probe		= meson_aoclkc_probe,
 	.driver		= {
 		.name	= "gxbb-aoclkc",
 		.of_match_table = gxbb_aoclkc_match_table,
diff --git a/drivers/clk/meson/gxbb-aoclk.h b/drivers/clk/meson/gxbb-aoclk.h
index c514493d989a..1db16f9b37d4 100644
--- a/drivers/clk/meson/gxbb-aoclk.h
+++ b/drivers/clk/meson/gxbb-aoclk.h
@@ -7,25 +7,7 @@
 #ifndef __GXBB_AOCLKC_H
 #define __GXBB_AOCLKC_H
 
-#define NR_CLKS	7
-
-/* AO Configuration Clock registers offsets */
-#define AO_RTI_PWR_CNTL_REG1	0x0c
-#define AO_RTI_PWR_CNTL_REG0	0x10
-#define AO_RTI_GEN_CNTL_REG0	0x40
-#define AO_OSCIN_CNTL		0x58
-#define AO_CRT_CLK_CNTL1	0x68
-#define AO_RTC_ALT_CLK_CNTL0	0x94
-#define AO_RTC_ALT_CLK_CNTL1	0x98
-
-struct aoclk_cec_32k {
-	struct clk_hw hw;
-	struct regmap *regmap;
-};
-
-#define to_aoclk_cec_32k(_hw) container_of(_hw, struct aoclk_cec_32k, hw)
-
-extern const struct clk_ops meson_aoclk_cec_32k_ops;
+#define NR_CLKS	14
 
 #include <dt-bindings/clock/gxbb-aoclkc.h>
 #include <dt-bindings/reset/gxbb-aoclkc.h>
-- 
2.19.1
