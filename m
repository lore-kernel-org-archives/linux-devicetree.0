From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 08/11] clk: qcom: ipq8074: add NSS ethernet port clocks
Date: Wed, 13 Dec 2017 19:55:39 +0530
Message-ID: <1513175142-3702-9-git-send-email-absahu@codeaurora.org>
References: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

IPQ8074 has 6 ethernet ports which supports all ethernet speeds
from 10Mpbs to 10 Gpbs and each speed requires different clock
rates. Each port has separate TX and RX clocks. These clocks
use separate external UNIPHY PLL’s which will be registered with
separate NSS driver. The clock frequency is 125 Mhz for UNIPHY0
and 312.5 Mhz for UNIPHY1 and UNIPHY2.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq8074.c | 1288 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 1288 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index cec921c..be919bb 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -50,6 +50,12 @@ enum {
 	P_NSS_CRYPTO_PLL,
 	P_BIAS_PLL,
 	P_BIAS_PLL_NSS_NOC,
+	P_UNIPHY0_RX,
+	P_UNIPHY0_TX,
+	P_UNIPHY1_RX,
+	P_UNIPHY1_TX,
+	P_UNIPHY2_RX,
+	P_UNIPHY2_TX,
 };
 
 static const char * const gcc_xo_gpll0_gpll0_out_main_div2[] = {
@@ -278,6 +284,112 @@ enum {
 	{ P_GPLL4, 2 },
 };
 
+static const char * const gcc_xo_uniphy0_rx_tx_ubi32_bias[] = {
+	"xo",
+	"uniphy0_gcc_rx_clk",
+	"uniphy0_gcc_tx_clk",
+	"ubi32_pll",
+	"bias_pll_cc_clk",
+};
+
+static const struct parent_map gcc_xo_uniphy0_rx_tx_ubi32_bias_map[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY0_RX, 1 },
+	{ P_UNIPHY0_TX, 2 },
+	{ P_UBI32_PLL, 5 },
+	{ P_BIAS_PLL, 6 },
+};
+
+static const char * const gcc_xo_uniphy0_tx_rx_ubi32_bias[] = {
+	"xo",
+	"uniphy0_gcc_tx_clk",
+	"uniphy0_gcc_rx_clk",
+	"ubi32_pll",
+	"bias_pll_cc_clk",
+};
+
+static const struct parent_map gcc_xo_uniphy0_tx_rx_ubi32_bias_map[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY0_TX, 1 },
+	{ P_UNIPHY0_RX, 2 },
+	{ P_UBI32_PLL, 5 },
+	{ P_BIAS_PLL, 6 },
+};
+
+static const char * const gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bias[] = {
+	"xo",
+	"uniphy0_gcc_rx_clk",
+	"uniphy0_gcc_tx_clk",
+	"uniphy1_gcc_rx_clk",
+	"uniphy1_gcc_tx_clk",
+	"ubi32_pll",
+	"bias_pll_cc_clk",
+};
+
+static const struct parent_map
+gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bias_map[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY0_RX, 1 },
+	{ P_UNIPHY0_TX, 2 },
+	{ P_UNIPHY1_RX, 3 },
+	{ P_UNIPHY1_TX, 4 },
+	{ P_UBI32_PLL, 5 },
+	{ P_BIAS_PLL, 6 },
+};
+
+static const char * const gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bias[] = {
+	"xo",
+	"uniphy0_gcc_tx_clk",
+	"uniphy0_gcc_rx_clk",
+	"uniphy1_gcc_tx_clk",
+	"uniphy1_gcc_rx_clk",
+	"ubi32_pll",
+	"bias_pll_cc_clk",
+};
+
+static const struct parent_map
+gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bias_map[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY0_TX, 1 },
+	{ P_UNIPHY0_RX, 2 },
+	{ P_UNIPHY1_TX, 3 },
+	{ P_UNIPHY1_RX, 4 },
+	{ P_UBI32_PLL, 5 },
+	{ P_BIAS_PLL, 6 },
+};
+
+static const char * const gcc_xo_uniphy2_rx_tx_ubi32_bias[] = {
+	"xo",
+	"uniphy2_gcc_rx_clk",
+	"uniphy2_gcc_tx_clk",
+	"ubi32_pll",
+	"bias_pll_cc_clk",
+};
+
+static const struct parent_map gcc_xo_uniphy2_rx_tx_ubi32_bias_map[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY2_RX, 1 },
+	{ P_UNIPHY2_TX, 2 },
+	{ P_UBI32_PLL, 5 },
+	{ P_BIAS_PLL, 6 },
+};
+
+static const char * const gcc_xo_uniphy2_tx_rx_ubi32_bias[] = {
+	"xo",
+	"uniphy2_gcc_tx_clk",
+	"uniphy2_gcc_rx_clk",
+	"ubi32_pll",
+	"bias_pll_cc_clk",
+};
+
+static const struct parent_map gcc_xo_uniphy2_tx_rx_ubi32_bias_map[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY2_TX, 1 },
+	{ P_UNIPHY2_RX, 2 },
+	{ P_UBI32_PLL, 5 },
+	{ P_BIAS_PLL, 6 },
+};
+
 static struct clk_alpha_pll gpll0_main = {
 	.offset = 0x21000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
@@ -1413,6 +1525,420 @@ enum {
 	},
 };
 
+static const struct freq_tbl ftbl_nss_port1_rx_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(25000000, P_UNIPHY0_RX, 5, 0, 0),
+	F(125000000, P_UNIPHY0_RX, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_port1_rx_clk_src = {
+	.cmd_rcgr = 0x68020,
+	.freq_tbl = ftbl_nss_port1_rx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_rx_tx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port1_rx_clk_src",
+		.parent_names = gcc_xo_uniphy0_rx_tx_ubi32_bias,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div nss_port1_rx_div_clk_src = {
+	.reg = 0x68400,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port1_rx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port1_rx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_nss_port1_tx_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(25000000, P_UNIPHY0_TX, 5, 0, 0),
+	F(125000000, P_UNIPHY0_TX, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_port1_tx_clk_src = {
+	.cmd_rcgr = 0x68028,
+	.freq_tbl = ftbl_nss_port1_tx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_tx_rx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port1_tx_clk_src",
+		.parent_names = gcc_xo_uniphy0_tx_rx_ubi32_bias,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div nss_port1_tx_div_clk_src = {
+	.reg = 0x68404,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port1_tx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port1_tx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg2 nss_port2_rx_clk_src = {
+	.cmd_rcgr = 0x68030,
+	.freq_tbl = ftbl_nss_port1_rx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_rx_tx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port2_rx_clk_src",
+		.parent_names = gcc_xo_uniphy0_rx_tx_ubi32_bias,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div nss_port2_rx_div_clk_src = {
+	.reg = 0x68410,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port2_rx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port2_rx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg2 nss_port2_tx_clk_src = {
+	.cmd_rcgr = 0x68038,
+	.freq_tbl = ftbl_nss_port1_tx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_tx_rx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port2_tx_clk_src",
+		.parent_names = gcc_xo_uniphy0_tx_rx_ubi32_bias,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div nss_port2_tx_div_clk_src = {
+	.reg = 0x68414,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port2_tx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port2_tx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg2 nss_port3_rx_clk_src = {
+	.cmd_rcgr = 0x68040,
+	.freq_tbl = ftbl_nss_port1_rx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_rx_tx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port3_rx_clk_src",
+		.parent_names = gcc_xo_uniphy0_rx_tx_ubi32_bias,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div nss_port3_rx_div_clk_src = {
+	.reg = 0x68420,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port3_rx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port3_rx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg2 nss_port3_tx_clk_src = {
+	.cmd_rcgr = 0x68048,
+	.freq_tbl = ftbl_nss_port1_tx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_tx_rx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port3_tx_clk_src",
+		.parent_names = gcc_xo_uniphy0_tx_rx_ubi32_bias,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div nss_port3_tx_div_clk_src = {
+	.reg = 0x68424,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port3_tx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port3_tx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg2 nss_port4_rx_clk_src = {
+	.cmd_rcgr = 0x68050,
+	.freq_tbl = ftbl_nss_port1_rx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_rx_tx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port4_rx_clk_src",
+		.parent_names = gcc_xo_uniphy0_rx_tx_ubi32_bias,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div nss_port4_rx_div_clk_src = {
+	.reg = 0x68430,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port4_rx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port4_rx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg2 nss_port4_tx_clk_src = {
+	.cmd_rcgr = 0x68058,
+	.freq_tbl = ftbl_nss_port1_tx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_tx_rx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port4_tx_clk_src",
+		.parent_names = gcc_xo_uniphy0_tx_rx_ubi32_bias,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div nss_port4_tx_div_clk_src = {
+	.reg = 0x68434,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port4_tx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port4_tx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_nss_port5_rx_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(25000000, P_UNIPHY1_RX, 12.5, 0, 0),
+	F(78125000, P_UNIPHY1_RX, 4, 0, 0),
+	F(125000000, P_UNIPHY1_RX, 2.5, 0, 0),
+	F(156250000, P_UNIPHY1_RX, 2, 0, 0),
+	F(312500000, P_UNIPHY1_RX, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_port5_rx_clk_src = {
+	.cmd_rcgr = 0x68060,
+	.freq_tbl = ftbl_nss_port5_rx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port5_rx_clk_src",
+		.parent_names = gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bias,
+		.num_parents = 7,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div nss_port5_rx_div_clk_src = {
+	.reg = 0x68440,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port5_rx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port5_rx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_nss_port5_tx_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(25000000, P_UNIPHY1_TX, 12.5, 0, 0),
+	F(78125000, P_UNIPHY1_TX, 4, 0, 0),
+	F(125000000, P_UNIPHY1_TX, 2.5, 0, 0),
+	F(156250000, P_UNIPHY1_TX, 2, 0, 0),
+	F(312500000, P_UNIPHY1_TX, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_port5_tx_clk_src = {
+	.cmd_rcgr = 0x68068,
+	.freq_tbl = ftbl_nss_port5_tx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port5_tx_clk_src",
+		.parent_names = gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bias,
+		.num_parents = 7,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div nss_port5_tx_div_clk_src = {
+	.reg = 0x68444,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port5_tx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port5_tx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_nss_port6_rx_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(25000000, P_UNIPHY2_RX, 12.5, 0, 0),
+	F(78125000, P_UNIPHY2_RX, 4, 0, 0),
+	F(125000000, P_UNIPHY2_RX, 2.5, 0, 0),
+	F(156250000, P_UNIPHY2_RX, 2, 0, 0),
+	F(312500000, P_UNIPHY2_RX, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_port6_rx_clk_src = {
+	.cmd_rcgr = 0x68070,
+	.freq_tbl = ftbl_nss_port6_rx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy2_rx_tx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port6_rx_clk_src",
+		.parent_names = gcc_xo_uniphy2_rx_tx_ubi32_bias,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div nss_port6_rx_div_clk_src = {
+	.reg = 0x68450,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port6_rx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port6_rx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_nss_port6_tx_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(25000000, P_UNIPHY2_TX, 12.5, 0, 0),
+	F(78125000, P_UNIPHY2_TX, 4, 0, 0),
+	F(125000000, P_UNIPHY2_TX, 2.5, 0, 0),
+	F(156250000, P_UNIPHY2_TX, 2, 0, 0),
+	F(312500000, P_UNIPHY2_TX, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_port6_tx_clk_src = {
+	.cmd_rcgr = 0x68078,
+	.freq_tbl = ftbl_nss_port6_tx_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_uniphy2_tx_rx_ubi32_bias_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_port6_tx_clk_src",
+		.parent_names = gcc_xo_uniphy2_tx_rx_ubi32_bias,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div nss_port6_tx_div_clk_src = {
+	.reg = 0x68454,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_port6_tx_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_port6_tx_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
 static struct clk_branch gcc_blsp1_ahb_clk = {
 	.halt_reg = 0x01008,
 	.clkr = {
@@ -2914,6 +3440,703 @@ enum {
 	},
 };
 
+static struct clk_branch gcc_cmn_12gpll_ahb_clk = {
+	.halt_reg = 0x56308,
+	.clkr = {
+		.enable_reg = 0x56308,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_cmn_12gpll_ahb_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cmn_12gpll_sys_clk = {
+	.halt_reg = 0x5630c,
+	.clkr = {
+		.enable_reg = 0x5630c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_cmn_12gpll_sys_clk",
+			.parent_names = (const char *[]){
+				"gcc_xo_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdio_ahb_clk = {
+	.halt_reg = 0x58004,
+	.clkr = {
+		.enable_reg = 0x58004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mdio_ahb_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_ahb_clk = {
+	.halt_reg = 0x56008,
+	.clkr = {
+		.enable_reg = 0x56008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_ahb_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_sys_clk = {
+	.halt_reg = 0x5600c,
+	.clkr = {
+		.enable_reg = 0x5600c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_sys_clk",
+			.parent_names = (const char *[]){
+				"gcc_xo_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy1_ahb_clk = {
+	.halt_reg = 0x56108,
+	.clkr = {
+		.enable_reg = 0x56108,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy1_ahb_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy1_sys_clk = {
+	.halt_reg = 0x5610c,
+	.clkr = {
+		.enable_reg = 0x5610c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy1_sys_clk",
+			.parent_names = (const char *[]){
+				"gcc_xo_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy2_ahb_clk = {
+	.halt_reg = 0x56208,
+	.clkr = {
+		.enable_reg = 0x56208,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy2_ahb_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy2_sys_clk = {
+	.halt_reg = 0x5620c,
+	.clkr = {
+		.enable_reg = 0x5620c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy2_sys_clk",
+			.parent_names = (const char *[]){
+				"gcc_xo_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port1_rx_clk = {
+	.halt_reg = 0x68240,
+	.clkr = {
+		.enable_reg = 0x68240,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port1_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port1_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port1_tx_clk = {
+	.halt_reg = 0x68244,
+	.clkr = {
+		.enable_reg = 0x68244,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port1_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port1_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port2_rx_clk = {
+	.halt_reg = 0x68248,
+	.clkr = {
+		.enable_reg = 0x68248,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port2_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port2_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port2_tx_clk = {
+	.halt_reg = 0x6824c,
+	.clkr = {
+		.enable_reg = 0x6824c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port2_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port2_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port3_rx_clk = {
+	.halt_reg = 0x68250,
+	.clkr = {
+		.enable_reg = 0x68250,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port3_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port3_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port3_tx_clk = {
+	.halt_reg = 0x68254,
+	.clkr = {
+		.enable_reg = 0x68254,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port3_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port3_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port4_rx_clk = {
+	.halt_reg = 0x68258,
+	.clkr = {
+		.enable_reg = 0x68258,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port4_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port4_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port4_tx_clk = {
+	.halt_reg = 0x6825c,
+	.clkr = {
+		.enable_reg = 0x6825c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port4_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port4_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port5_rx_clk = {
+	.halt_reg = 0x68260,
+	.clkr = {
+		.enable_reg = 0x68260,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port5_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port5_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port5_tx_clk = {
+	.halt_reg = 0x68264,
+	.clkr = {
+		.enable_reg = 0x68264,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port5_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port5_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port6_rx_clk = {
+	.halt_reg = 0x68268,
+	.clkr = {
+		.enable_reg = 0x68268,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port6_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port6_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_port6_tx_clk = {
+	.halt_reg = 0x6826c,
+	.clkr = {
+		.enable_reg = 0x6826c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_port6_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port6_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_port1_mac_clk = {
+	.halt_reg = 0x68320,
+	.clkr = {
+		.enable_reg = 0x68320,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_port1_mac_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_port2_mac_clk = {
+	.halt_reg = 0x68324,
+	.clkr = {
+		.enable_reg = 0x68324,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_port2_mac_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_port3_mac_clk = {
+	.halt_reg = 0x68328,
+	.clkr = {
+		.enable_reg = 0x68328,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_port3_mac_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_port4_mac_clk = {
+	.halt_reg = 0x6832c,
+	.clkr = {
+		.enable_reg = 0x6832c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_port4_mac_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_port5_mac_clk = {
+	.halt_reg = 0x68330,
+	.clkr = {
+		.enable_reg = 0x68330,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_port5_mac_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_port6_mac_clk = {
+	.halt_reg = 0x68334,
+	.clkr = {
+		.enable_reg = 0x68334,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_port6_mac_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port1_rx_clk = {
+	.halt_reg = 0x56010,
+	.clkr = {
+		.enable_reg = 0x56010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port1_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port1_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port1_tx_clk = {
+	.halt_reg = 0x56014,
+	.clkr = {
+		.enable_reg = 0x56014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port1_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port1_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port2_rx_clk = {
+	.halt_reg = 0x56018,
+	.clkr = {
+		.enable_reg = 0x56018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port2_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port2_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port2_tx_clk = {
+	.halt_reg = 0x5601c,
+	.clkr = {
+		.enable_reg = 0x5601c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port2_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port2_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port3_rx_clk = {
+	.halt_reg = 0x56020,
+	.clkr = {
+		.enable_reg = 0x56020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port3_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port3_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port3_tx_clk = {
+	.halt_reg = 0x56024,
+	.clkr = {
+		.enable_reg = 0x56024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port3_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port3_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port4_rx_clk = {
+	.halt_reg = 0x56028,
+	.clkr = {
+		.enable_reg = 0x56028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port4_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port4_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port4_tx_clk = {
+	.halt_reg = 0x5602c,
+	.clkr = {
+		.enable_reg = 0x5602c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port4_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port4_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port5_rx_clk = {
+	.halt_reg = 0x56030,
+	.clkr = {
+		.enable_reg = 0x56030,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port5_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port5_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_port5_tx_clk = {
+	.halt_reg = 0x56034,
+	.clkr = {
+		.enable_reg = 0x56034,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy0_port5_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port5_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy1_port5_rx_clk = {
+	.halt_reg = 0x56110,
+	.clkr = {
+		.enable_reg = 0x56110,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy1_port5_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port5_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy1_port5_tx_clk = {
+	.halt_reg = 0x56114,
+	.clkr = {
+		.enable_reg = 0x56114,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy1_port5_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port5_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy2_port6_rx_clk = {
+	.halt_reg = 0x56210,
+	.clkr = {
+		.enable_reg = 0x56210,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy2_port6_rx_clk",
+			.parent_names = (const char *[]){
+				"nss_port6_rx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy2_port6_tx_clk = {
+	.halt_reg = 0x56214,
+	.clkr = {
+		.enable_reg = 0x56214,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_uniphy2_port6_tx_clk",
+			.parent_names = (const char *[]){
+				"nss_port6_tx_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_hw *gcc_ipq8074_hws[] = {
 	&gpll0_out_main_div2.hw,
 	&gpll6_out_main_div2.hw,
@@ -2986,6 +4209,30 @@ enum {
 	[UBI_MPT_CLK_SRC] = &ubi_mpt_clk_src.clkr,
 	[NSS_IMEM_CLK_SRC] = &nss_imem_clk_src.clkr,
 	[NSS_PPE_CLK_SRC] = &nss_ppe_clk_src.clkr,
+	[NSS_PORT1_RX_CLK_SRC] = &nss_port1_rx_clk_src.clkr,
+	[NSS_PORT1_RX_DIV_CLK_SRC] = &nss_port1_rx_div_clk_src.clkr,
+	[NSS_PORT1_TX_CLK_SRC] = &nss_port1_tx_clk_src.clkr,
+	[NSS_PORT1_TX_DIV_CLK_SRC] = &nss_port1_tx_div_clk_src.clkr,
+	[NSS_PORT2_RX_CLK_SRC] = &nss_port2_rx_clk_src.clkr,
+	[NSS_PORT2_RX_DIV_CLK_SRC] = &nss_port2_rx_div_clk_src.clkr,
+	[NSS_PORT2_TX_CLK_SRC] = &nss_port2_tx_clk_src.clkr,
+	[NSS_PORT2_TX_DIV_CLK_SRC] = &nss_port2_tx_div_clk_src.clkr,
+	[NSS_PORT3_RX_CLK_SRC] = &nss_port3_rx_clk_src.clkr,
+	[NSS_PORT3_RX_DIV_CLK_SRC] = &nss_port3_rx_div_clk_src.clkr,
+	[NSS_PORT3_TX_CLK_SRC] = &nss_port3_tx_clk_src.clkr,
+	[NSS_PORT3_TX_DIV_CLK_SRC] = &nss_port3_tx_div_clk_src.clkr,
+	[NSS_PORT4_RX_CLK_SRC] = &nss_port4_rx_clk_src.clkr,
+	[NSS_PORT4_RX_DIV_CLK_SRC] = &nss_port4_rx_div_clk_src.clkr,
+	[NSS_PORT4_TX_CLK_SRC] = &nss_port4_tx_clk_src.clkr,
+	[NSS_PORT4_TX_DIV_CLK_SRC] = &nss_port4_tx_div_clk_src.clkr,
+	[NSS_PORT5_RX_CLK_SRC] = &nss_port5_rx_clk_src.clkr,
+	[NSS_PORT5_RX_DIV_CLK_SRC] = &nss_port5_rx_div_clk_src.clkr,
+	[NSS_PORT5_TX_CLK_SRC] = &nss_port5_tx_clk_src.clkr,
+	[NSS_PORT5_TX_DIV_CLK_SRC] = &nss_port5_tx_div_clk_src.clkr,
+	[NSS_PORT6_RX_CLK_SRC] = &nss_port6_rx_clk_src.clkr,
+	[NSS_PORT6_RX_DIV_CLK_SRC] = &nss_port6_rx_div_clk_src.clkr,
+	[NSS_PORT6_TX_CLK_SRC] = &nss_port6_tx_clk_src.clkr,
+	[NSS_PORT6_TX_DIV_CLK_SRC] = &nss_port6_tx_div_clk_src.clkr,
 	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
 	[GCC_BLSP1_QUP1_I2C_APPS_CLK] = &gcc_blsp1_qup1_i2c_apps_clk.clkr,
 	[GCC_BLSP1_QUP1_SPI_APPS_CLK] = &gcc_blsp1_qup1_spi_apps_clk.clkr,
@@ -3074,6 +4321,47 @@ enum {
 	[GCC_UBI1_NC_AXI_CLK] = &gcc_ubi1_nc_axi_clk.clkr,
 	[GCC_UBI1_CORE_CLK] = &gcc_ubi1_core_clk.clkr,
 	[GCC_UBI1_MPT_CLK] = &gcc_ubi1_mpt_clk.clkr,
+	[GCC_CMN_12GPLL_AHB_CLK] = &gcc_cmn_12gpll_ahb_clk.clkr,
+	[GCC_CMN_12GPLL_SYS_CLK] = &gcc_cmn_12gpll_sys_clk.clkr,
+	[GCC_MDIO_AHB_CLK] = &gcc_mdio_ahb_clk.clkr,
+	[GCC_UNIPHY0_AHB_CLK] = &gcc_uniphy0_ahb_clk.clkr,
+	[GCC_UNIPHY0_SYS_CLK] = &gcc_uniphy0_sys_clk.clkr,
+	[GCC_UNIPHY1_AHB_CLK] = &gcc_uniphy1_ahb_clk.clkr,
+	[GCC_UNIPHY1_SYS_CLK] = &gcc_uniphy1_sys_clk.clkr,
+	[GCC_UNIPHY2_AHB_CLK] = &gcc_uniphy2_ahb_clk.clkr,
+	[GCC_UNIPHY2_SYS_CLK] = &gcc_uniphy2_sys_clk.clkr,
+	[GCC_NSS_PORT1_RX_CLK] = &gcc_nss_port1_rx_clk.clkr,
+	[GCC_NSS_PORT1_TX_CLK] = &gcc_nss_port1_tx_clk.clkr,
+	[GCC_NSS_PORT2_RX_CLK] = &gcc_nss_port2_rx_clk.clkr,
+	[GCC_NSS_PORT2_TX_CLK] = &gcc_nss_port2_tx_clk.clkr,
+	[GCC_NSS_PORT3_RX_CLK] = &gcc_nss_port3_rx_clk.clkr,
+	[GCC_NSS_PORT3_TX_CLK] = &gcc_nss_port3_tx_clk.clkr,
+	[GCC_NSS_PORT4_RX_CLK] = &gcc_nss_port4_rx_clk.clkr,
+	[GCC_NSS_PORT4_TX_CLK] = &gcc_nss_port4_tx_clk.clkr,
+	[GCC_NSS_PORT5_RX_CLK] = &gcc_nss_port5_rx_clk.clkr,
+	[GCC_NSS_PORT5_TX_CLK] = &gcc_nss_port5_tx_clk.clkr,
+	[GCC_NSS_PORT6_RX_CLK] = &gcc_nss_port6_rx_clk.clkr,
+	[GCC_NSS_PORT6_TX_CLK] = &gcc_nss_port6_tx_clk.clkr,
+	[GCC_PORT1_MAC_CLK] = &gcc_port1_mac_clk.clkr,
+	[GCC_PORT2_MAC_CLK] = &gcc_port2_mac_clk.clkr,
+	[GCC_PORT3_MAC_CLK] = &gcc_port3_mac_clk.clkr,
+	[GCC_PORT4_MAC_CLK] = &gcc_port4_mac_clk.clkr,
+	[GCC_PORT5_MAC_CLK] = &gcc_port5_mac_clk.clkr,
+	[GCC_PORT6_MAC_CLK] = &gcc_port6_mac_clk.clkr,
+	[GCC_UNIPHY0_PORT1_RX_CLK] = &gcc_uniphy0_port1_rx_clk.clkr,
+	[GCC_UNIPHY0_PORT1_TX_CLK] = &gcc_uniphy0_port1_tx_clk.clkr,
+	[GCC_UNIPHY0_PORT2_RX_CLK] = &gcc_uniphy0_port2_rx_clk.clkr,
+	[GCC_UNIPHY0_PORT2_TX_CLK] = &gcc_uniphy0_port2_tx_clk.clkr,
+	[GCC_UNIPHY0_PORT3_RX_CLK] = &gcc_uniphy0_port3_rx_clk.clkr,
+	[GCC_UNIPHY0_PORT3_TX_CLK] = &gcc_uniphy0_port3_tx_clk.clkr,
+	[GCC_UNIPHY0_PORT4_RX_CLK] = &gcc_uniphy0_port4_rx_clk.clkr,
+	[GCC_UNIPHY0_PORT4_TX_CLK] = &gcc_uniphy0_port4_tx_clk.clkr,
+	[GCC_UNIPHY0_PORT5_RX_CLK] = &gcc_uniphy0_port5_rx_clk.clkr,
+	[GCC_UNIPHY0_PORT5_TX_CLK] = &gcc_uniphy0_port5_tx_clk.clkr,
+	[GCC_UNIPHY1_PORT5_RX_CLK] = &gcc_uniphy1_port5_rx_clk.clkr,
+	[GCC_UNIPHY1_PORT5_TX_CLK] = &gcc_uniphy1_port5_tx_clk.clkr,
+	[GCC_UNIPHY2_PORT6_RX_CLK] = &gcc_uniphy2_port6_rx_clk.clkr,
+	[GCC_UNIPHY2_PORT6_TX_CLK] = &gcc_uniphy2_port6_tx_clk.clkr,
 };
 
 static const struct qcom_reset_map gcc_ipq8074_resets[] = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
