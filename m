From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 05/11] =?UTF-8?q?clk:=20qcom:=20ipq8074:=20add=20remain?= =?UTF-8?q?ing=20PLL=E2=80=99s?=
Date: Wed, 13 Dec 2017 19:55:36 +0530
Message-ID: <1513175142-3702-6-git-send-email-absahu@codeaurora.org>
References: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513175142-3702-1-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

- GPLL2, GPLL4 and GPLL6 are general PLL clocks and parent
  for all core peripherals.
- UBI PLL is mainly used by NSS (Network Switching System).
  IPQ8074 has 2 instances of NSS UBI cores and UBI PLL will
  be used to control the core frequency.
- NSS Crypto PLL is mainly used by NSS Crypto Engine which
  supports the multiple cryptographic algorithm used in
  Ethernet.
- IPQ8074 frequency plan does not require change in PLL post
  dividers so marked the same as read-only.

Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/clk/qcom/gcc-ipq8074.c | 192 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 191 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index 99906f6..ad9c920 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -91,7 +91,186 @@ enum {
 			"gpll0_main"
 		},
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_ops,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+	},
+};
+
+static struct clk_alpha_pll gpll2_main = {
+	.offset = 0x4a000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x0b000,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll2_main",
+			.parent_names = (const char *[]){
+				"xo"
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+			.flags = CLK_IS_CRITICAL,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv gpll2 = {
+	.offset = 0x4a000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll2",
+		.parent_names = (const char *[]){
+			"gpll2_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_alpha_pll gpll4_main = {
+	.offset = 0x24000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x0b000,
+		.enable_mask = BIT(5),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll4_main",
+			.parent_names = (const char *[]){
+				"xo"
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+			.flags = CLK_IS_CRITICAL,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv gpll4 = {
+	.offset = 0x24000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll4",
+		.parent_names = (const char *[]){
+			"gpll4_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_alpha_pll gpll6_main = {
+	.offset = 0x37000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_BRAMMO],
+	.flags = SUPPORTS_DYNAMIC_UPDATE,
+	.clkr = {
+		.enable_reg = 0x0b000,
+		.enable_mask = BIT(7),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll6_main",
+			.parent_names = (const char *[]){
+				"xo"
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+			.flags = CLK_IS_CRITICAL,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv gpll6 = {
+	.offset = 0x37000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_BRAMMO],
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll6",
+		.parent_names = (const char *[]){
+			"gpll6_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor gpll6_out_main_div2 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll6_out_main_div2",
+		.parent_names = (const char *[]){
+			"gpll6_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_alpha_pll ubi32_pll_main = {
+	.offset = 0x25000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_HUAYRA],
+	.flags = SUPPORTS_DYNAMIC_UPDATE,
+	.clkr = {
+		.enable_reg = 0x0b000,
+		.enable_mask = BIT(6),
+		.hw.init = &(struct clk_init_data){
+			.name = "ubi32_pll_main",
+			.parent_names = (const char *[]){
+				"xo"
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_huayra_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv ubi32_pll = {
+	.offset = 0x25000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_HUAYRA],
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "ubi32_pll",
+		.parent_names = (const char *[]){
+			"ubi32_pll_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_alpha_pll nss_crypto_pll_main = {
+	.offset = 0x22000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x0b000,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_crypto_pll_main",
+			.parent_names = (const char *[]){
+				"xo"
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv nss_crypto_pll = {
+	.offset = 0x22000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_crypto_pll",
+		.parent_names = (const char *[]){
+			"nss_crypto_pll_main"
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -808,12 +987,23 @@ enum {
 
 static struct clk_hw *gcc_ipq8074_hws[] = {
 	&gpll0_out_main_div2.hw,
+	&gpll6_out_main_div2.hw,
 	&pcnoc_clk_src.hw,
 };
 
 static struct clk_regmap *gcc_ipq8074_clks[] = {
 	[GPLL0_MAIN] = &gpll0_main.clkr,
 	[GPLL0] = &gpll0.clkr,
+	[GPLL2_MAIN] = &gpll2_main.clkr,
+	[GPLL2] = &gpll2.clkr,
+	[GPLL4_MAIN] = &gpll4_main.clkr,
+	[GPLL4] = &gpll4.clkr,
+	[GPLL6_MAIN] = &gpll6_main.clkr,
+	[GPLL6] = &gpll6.clkr,
+	[UBI32_PLL_MAIN] = &ubi32_pll_main.clkr,
+	[UBI32_PLL] = &ubi32_pll.clkr,
+	[NSS_CRYPTO_PLL_MAIN] = &nss_crypto_pll_main.clkr,
+	[NSS_CRYPTO_PLL] = &nss_crypto_pll.clkr,
 	[PCNOC_BFDCD_CLK_SRC] = &pcnoc_bfdcd_clk_src.clkr,
 	[GCC_SLEEP_CLK_SRC] = &gcc_sleep_clk_src.clkr,
 	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
