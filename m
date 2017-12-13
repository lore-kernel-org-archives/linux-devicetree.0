From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 06/11] clk: qcom: ipq8074: add PCIE, USB and SDCC clocks
Date: Wed, 13 Dec 2017 19:55:37 +0530
Message-ID: <1513175142-3702-7-git-send-email-absahu@codeaurora.org>
References: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513175142-3702-1-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

- It has 2 instances of PCIE which uses AXI, AHB, AUX, SYS NOC
  AXI and PIPE clocks.
- It has 2 instances of USB 3.0 which uses AUX, SLEEP, PIPE,
  SYS NOC, mock UTMI and master clocks.
- It has 2 instances of SDCC which uses APSS and AHB clock.
  SDCC1 requires ICE core clock also.
- All the PIPE clocks are external clocks which will be
  registered in clock framework by PHY drivers. The enabling
  and disabling of PIPE RCG clocks are dependent upon PHY
  initialization sequence so BRANCH_HALT_DELAY flag is required for
  these clocks.

Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/clk/qcom/gcc-ipq8074.c | 994 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 994 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index ad9c920..7010560 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -28,6 +28,7 @@
 #include "clk-rcg.h"
 #include "clk-branch.h"
 #include "clk-alpha-pll.h"
+#include "clk-regmap-mux.h"
 #include "reset.h"
 
 #define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
@@ -36,6 +37,13 @@ enum {
 	P_XO,
 	P_GPLL0,
 	P_GPLL0_DIV2,
+	P_GPLL2,
+	P_GPLL6,
+	P_SLEEP_CLK,
+	P_PCIE20_PHY0_PIPE,
+	P_PCIE20_PHY1_PIPE,
+	P_USB3PHY_0_PIPE,
+	P_USB3PHY_1_PIPE,
 };
 
 static const char * const gcc_xo_gpll0_gpll0_out_main_div2[] = {
@@ -50,6 +58,122 @@ enum {
 	{ P_GPLL0_DIV2, 4 },
 };
 
+static const char * const gcc_xo_gpll0[] = {
+	"xo",
+	"gpll0",
+};
+
+static const struct parent_map gcc_xo_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+};
+
+static const char * const gcc_xo_gpll0_gpll2_gpll0_out_main_div2[] = {
+	"xo",
+	"gpll0",
+	"gpll2",
+	"gpll0_out_main_div2",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll2_gpll0_out_main_div2_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL2, 2 },
+	{ P_GPLL0_DIV2, 4 },
+};
+
+static const char * const gcc_xo_gpll0_sleep_clk[] = {
+	"xo",
+	"gpll0",
+	"sleep_clk",
+};
+
+static const struct parent_map gcc_xo_gpll0_sleep_clk_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 2 },
+	{ P_SLEEP_CLK, 6 },
+};
+
+static const char * const gcc_xo_gpll6_gpll0_gpll0_out_main_div2[] = {
+	"xo",
+	"gpll6",
+	"gpll0",
+	"gpll0_out_main_div2",
+};
+
+static const struct parent_map gcc_xo_gpll6_gpll0_gpll0_out_main_div2_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL6, 1 },
+	{ P_GPLL0, 3 },
+	{ P_GPLL0_DIV2, 4 },
+};
+
+static const char * const gcc_xo_gpll0_out_main_div2_gpll0[] = {
+	"xo",
+	"gpll0_out_main_div2",
+	"gpll0",
+};
+
+static const struct parent_map gcc_xo_gpll0_out_main_div2_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_DIV2, 2 },
+	{ P_GPLL0, 1 },
+};
+
+static const char * const gcc_usb3phy_0_cc_pipe_clk_xo[] = {
+	"usb3phy_0_cc_pipe_clk",
+	"xo",
+};
+
+static const struct parent_map gcc_usb3phy_0_cc_pipe_clk_xo_map[] = {
+	{ P_USB3PHY_0_PIPE, 0 },
+	{ P_XO, 2 },
+};
+
+static const char * const gcc_usb3phy_1_cc_pipe_clk_xo[] = {
+	"usb3phy_1_cc_pipe_clk",
+	"xo",
+};
+
+static const struct parent_map gcc_usb3phy_1_cc_pipe_clk_xo_map[] = {
+	{ P_USB3PHY_1_PIPE, 0 },
+	{ P_XO, 2 },
+};
+
+static const char * const gcc_pcie20_phy0_pipe_clk_xo[] = {
+	"pcie20_phy0_pipe_clk",
+	"xo",
+};
+
+static const struct parent_map gcc_pcie20_phy0_pipe_clk_xo_map[] = {
+	{ P_PCIE20_PHY0_PIPE, 0 },
+	{ P_XO, 2 },
+};
+
+static const char * const gcc_pcie20_phy1_pipe_clk_xo[] = {
+	"pcie20_phy1_pipe_clk",
+	"xo",
+};
+
+static const struct parent_map gcc_pcie20_phy1_pipe_clk_xo_map[] = {
+	{ P_PCIE20_PHY1_PIPE, 0 },
+	{ P_XO, 2 },
+};
+
+static const char * const gcc_xo_gpll0_gpll6_gpll0_div2[] = {
+	"xo",
+	"gpll0",
+	"gpll6",
+	"gpll0_out_main_div2",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll6_gpll0_div2_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL6, 2 },
+	{ P_GPLL0_DIV2, 4 },
+};
+
 static struct clk_alpha_pll gpll0_main = {
 	.offset = 0x21000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
@@ -610,6 +734,297 @@ enum {
 	},
 };
 
+static const struct freq_tbl ftbl_pcie_axi_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 pcie0_axi_clk_src = {
+	.cmd_rcgr = 0x75054,
+	.freq_tbl = ftbl_pcie_axi_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pcie0_axi_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_pcie_aux_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+};
+
+static struct clk_rcg2 pcie0_aux_clk_src = {
+	.cmd_rcgr = 0x75024,
+	.freq_tbl = ftbl_pcie_aux_clk_src,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_sleep_clk_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pcie0_aux_clk_src",
+		.parent_names = gcc_xo_gpll0_sleep_clk,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_mux pcie0_pipe_clk_src = {
+	.reg = 0x7501c,
+	.shift = 8,
+	.width = 2,
+	.parent_map = gcc_pcie20_phy0_pipe_clk_xo_map,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "pcie0_pipe_clk_src",
+			.parent_names = gcc_pcie20_phy0_pipe_clk_xo,
+			.num_parents = 2,
+			.ops = &clk_regmap_mux_closest_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg2 pcie1_axi_clk_src = {
+	.cmd_rcgr = 0x76054,
+	.freq_tbl = ftbl_pcie_axi_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pcie1_axi_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 pcie1_aux_clk_src = {
+	.cmd_rcgr = 0x76024,
+	.freq_tbl = ftbl_pcie_aux_clk_src,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_sleep_clk_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pcie1_aux_clk_src",
+		.parent_names = gcc_xo_gpll0_sleep_clk,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_mux pcie1_pipe_clk_src = {
+	.reg = 0x7601c,
+	.shift = 8,
+	.width = 2,
+	.parent_map = gcc_pcie20_phy1_pipe_clk_xo_map,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "pcie1_pipe_clk_src",
+			.parent_names = gcc_pcie20_phy1_pipe_clk_xo,
+			.num_parents = 2,
+			.ops = &clk_regmap_mux_closest_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_sdcc_apps_clk_src[] = {
+	F(144000, P_XO, 16, 3, 25),
+	F(400000, P_XO, 12, 1, 4),
+	F(24000000, P_GPLL2, 12, 1, 4),
+	F(48000000, P_GPLL2, 12, 1, 2),
+	F(96000000, P_GPLL2, 12, 0, 0),
+	F(177777778, P_GPLL0, 4.5, 0, 0),
+	F(192000000, P_GPLL2, 6, 0, 0),
+	F(384000000, P_GPLL2, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 sdcc1_apps_clk_src = {
+	.cmd_rcgr = 0x42004,
+	.freq_tbl = ftbl_sdcc_apps_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll2_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "sdcc1_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll2_gpll0_out_main_div2,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_sdcc_ice_core_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(160000000, P_GPLL0, 5, 0, 0),
+	F(308570000, P_GPLL6, 3.5, 0, 0),
+};
+
+static struct clk_rcg2 sdcc1_ice_core_clk_src = {
+	.cmd_rcgr = 0x5d000,
+	.freq_tbl = ftbl_sdcc_ice_core_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll6_gpll0_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "sdcc1_ice_core_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll6_gpll0_div2,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 sdcc2_apps_clk_src = {
+	.cmd_rcgr = 0x43004,
+	.freq_tbl = ftbl_sdcc_apps_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll2_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "sdcc2_apps_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll2_gpll0_out_main_div2,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_usb_master_clk_src[] = {
+	F(80000000, P_GPLL0_DIV2, 5, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(133330000, P_GPLL0, 6, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 usb0_master_clk_src = {
+	.cmd_rcgr = 0x3e00c,
+	.freq_tbl = ftbl_usb_master_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_out_main_div2_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "usb0_master_clk_src",
+		.parent_names = gcc_xo_gpll0_out_main_div2_gpll0,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_usb_aux_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 usb0_aux_clk_src = {
+	.cmd_rcgr = 0x3e05c,
+	.freq_tbl = ftbl_usb_aux_clk_src,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_sleep_clk_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "usb0_aux_clk_src",
+		.parent_names = gcc_xo_gpll0_sleep_clk,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_usb_mock_utmi_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(20000000, P_GPLL6, 6, 1, 9),
+	F(60000000, P_GPLL6, 6, 1, 3),
+	{ }
+};
+
+static struct clk_rcg2 usb0_mock_utmi_clk_src = {
+	.cmd_rcgr = 0x3e020,
+	.freq_tbl = ftbl_usb_mock_utmi_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll6_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "usb0_mock_utmi_clk_src",
+		.parent_names = gcc_xo_gpll6_gpll0_gpll0_out_main_div2,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_mux usb0_pipe_clk_src = {
+	.reg = 0x3e048,
+	.shift = 8,
+	.width = 2,
+	.parent_map = gcc_usb3phy_0_cc_pipe_clk_xo_map,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "usb0_pipe_clk_src",
+			.parent_names = gcc_usb3phy_0_cc_pipe_clk_xo,
+			.num_parents = 2,
+			.ops = &clk_regmap_mux_closest_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg2 usb1_master_clk_src = {
+	.cmd_rcgr = 0x3f00c,
+	.freq_tbl = ftbl_usb_master_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_out_main_div2_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "usb1_master_clk_src",
+		.parent_names = gcc_xo_gpll0_out_main_div2_gpll0,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 usb1_aux_clk_src = {
+	.cmd_rcgr = 0x3f05c,
+	.freq_tbl = ftbl_usb_aux_clk_src,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_sleep_clk_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "usb1_aux_clk_src",
+		.parent_names = gcc_xo_gpll0_sleep_clk,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 usb1_mock_utmi_clk_src = {
+	.cmd_rcgr = 0x3f020,
+	.freq_tbl = ftbl_usb_mock_utmi_clk_src,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll6_gpll0_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "usb1_mock_utmi_clk_src",
+		.parent_names = gcc_xo_gpll6_gpll0_gpll0_out_main_div2,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_mux usb1_pipe_clk_src = {
+	.reg = 0x3f048,
+	.shift = 8,
+	.width = 2,
+	.parent_map = gcc_usb3phy_1_cc_pipe_clk_xo_map,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "usb1_pipe_clk_src",
+			.parent_names = gcc_usb3phy_1_cc_pipe_clk_xo,
+			.num_parents = 2,
+			.ops = &clk_regmap_mux_closest_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
 static struct clk_branch gcc_blsp1_ahb_clk = {
 	.halt_reg = 0x01008,
 	.clkr = {
@@ -985,6 +1400,537 @@ enum {
 	},
 };
 
+static struct clk_branch gcc_pcie0_ahb_clk = {
+	.halt_reg = 0x75010,
+	.clkr = {
+		.enable_reg = 0x75010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie0_ahb_clk",
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
+static struct clk_branch gcc_pcie0_aux_clk = {
+	.halt_reg = 0x75014,
+	.clkr = {
+		.enable_reg = 0x75014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie0_aux_clk",
+			.parent_names = (const char *[]){
+				"pcie0_aux_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_axi_m_clk = {
+	.halt_reg = 0x75008,
+	.clkr = {
+		.enable_reg = 0x75008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie0_axi_m_clk",
+			.parent_names = (const char *[]){
+				"pcie0_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_axi_s_clk = {
+	.halt_reg = 0x7500c,
+	.clkr = {
+		.enable_reg = 0x7500c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie0_axi_s_clk",
+			.parent_names = (const char *[]){
+				"pcie0_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_pipe_clk = {
+	.halt_reg = 0x75018,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x75018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie0_pipe_clk",
+			.parent_names = (const char *[]){
+				"pcie0_pipe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sys_noc_pcie0_axi_clk = {
+	.halt_reg = 0x26048,
+	.clkr = {
+		.enable_reg = 0x26048,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sys_noc_pcie0_axi_clk",
+			.parent_names = (const char *[]){
+				"pcie0_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_ahb_clk = {
+	.halt_reg = 0x76010,
+	.clkr = {
+		.enable_reg = 0x76010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie1_ahb_clk",
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
+static struct clk_branch gcc_pcie1_aux_clk = {
+	.halt_reg = 0x76014,
+	.clkr = {
+		.enable_reg = 0x76014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie1_aux_clk",
+			.parent_names = (const char *[]){
+				"pcie1_aux_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_axi_m_clk = {
+	.halt_reg = 0x76008,
+	.clkr = {
+		.enable_reg = 0x76008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie1_axi_m_clk",
+			.parent_names = (const char *[]){
+				"pcie1_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_axi_s_clk = {
+	.halt_reg = 0x7600c,
+	.clkr = {
+		.enable_reg = 0x7600c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie1_axi_s_clk",
+			.parent_names = (const char *[]){
+				"pcie1_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_pipe_clk = {
+	.halt_reg = 0x76018,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x76018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_pcie1_pipe_clk",
+			.parent_names = (const char *[]){
+				"pcie1_pipe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sys_noc_pcie1_axi_clk = {
+	.halt_reg = 0x2604c,
+	.clkr = {
+		.enable_reg = 0x2604c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sys_noc_pcie1_axi_clk",
+			.parent_names = (const char *[]){
+				"pcie1_axi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_aux_clk = {
+	.halt_reg = 0x3e044,
+	.clkr = {
+		.enable_reg = 0x3e044,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb0_aux_clk",
+			.parent_names = (const char *[]){
+				"usb0_aux_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sys_noc_usb0_axi_clk = {
+	.halt_reg = 0x26040,
+	.clkr = {
+		.enable_reg = 0x26040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sys_noc_usb0_axi_clk",
+			.parent_names = (const char *[]){
+				"usb0_master_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_master_clk = {
+	.halt_reg = 0x3e000,
+	.clkr = {
+		.enable_reg = 0x3e000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb0_master_clk",
+			.parent_names = (const char *[]){
+				"usb0_master_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_mock_utmi_clk = {
+	.halt_reg = 0x3e008,
+	.clkr = {
+		.enable_reg = 0x3e008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb0_mock_utmi_clk",
+			.parent_names = (const char *[]){
+				"usb0_mock_utmi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_phy_cfg_ahb_clk = {
+	.halt_reg = 0x3e080,
+	.clkr = {
+		.enable_reg = 0x3e080,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb0_phy_cfg_ahb_clk",
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
+static struct clk_branch gcc_usb0_pipe_clk = {
+	.halt_reg = 0x3e040,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x3e040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb0_pipe_clk",
+			.parent_names = (const char *[]){
+				"usb0_pipe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_sleep_clk = {
+	.halt_reg = 0x3e004,
+	.clkr = {
+		.enable_reg = 0x3e004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb0_sleep_clk",
+			.parent_names = (const char *[]){
+				"gcc_sleep_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb1_aux_clk = {
+	.halt_reg = 0x3f044,
+	.clkr = {
+		.enable_reg = 0x3f044,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb1_aux_clk",
+			.parent_names = (const char *[]){
+				"usb1_aux_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sys_noc_usb1_axi_clk = {
+	.halt_reg = 0x26044,
+	.clkr = {
+		.enable_reg = 0x26044,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sys_noc_usb1_axi_clk",
+			.parent_names = (const char *[]){
+				"usb1_master_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb1_master_clk = {
+	.halt_reg = 0x3f000,
+	.clkr = {
+		.enable_reg = 0x3f000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb1_master_clk",
+			.parent_names = (const char *[]){
+				"usb1_master_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb1_mock_utmi_clk = {
+	.halt_reg = 0x3f008,
+	.clkr = {
+		.enable_reg = 0x3f008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb1_mock_utmi_clk",
+			.parent_names = (const char *[]){
+				"usb1_mock_utmi_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb1_phy_cfg_ahb_clk = {
+	.halt_reg = 0x3f080,
+	.clkr = {
+		.enable_reg = 0x3f080,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb1_phy_cfg_ahb_clk",
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
+static struct clk_branch gcc_usb1_pipe_clk = {
+	.halt_reg = 0x3f040,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x3f040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb1_pipe_clk",
+			.parent_names = (const char *[]){
+				"usb1_pipe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb1_sleep_clk = {
+	.halt_reg = 0x3f004,
+	.clkr = {
+		.enable_reg = 0x3f004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_usb1_sleep_clk",
+			.parent_names = (const char *[]){
+				"gcc_sleep_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_ahb_clk = {
+	.halt_reg = 0x4201c,
+	.clkr = {
+		.enable_reg = 0x4201c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc1_ahb_clk",
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
+static struct clk_branch gcc_sdcc1_apps_clk = {
+	.halt_reg = 0x42018,
+	.clkr = {
+		.enable_reg = 0x42018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc1_apps_clk",
+			.parent_names = (const char *[]){
+				"sdcc1_apps_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_ice_core_clk = {
+	.halt_reg = 0x5d014,
+	.clkr = {
+		.enable_reg = 0x5d014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc1_ice_core_clk",
+			.parent_names = (const char *[]){
+				"sdcc1_ice_core_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc2_ahb_clk = {
+	.halt_reg = 0x4301c,
+	.clkr = {
+		.enable_reg = 0x4301c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc2_ahb_clk",
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
+static struct clk_branch gcc_sdcc2_apps_clk = {
+	.halt_reg = 0x43018,
+	.clkr = {
+		.enable_reg = 0x43018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_sdcc2_apps_clk",
+			.parent_names = (const char *[]){
+				"sdcc2_apps_clk_src"
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
@@ -1024,6 +1970,23 @@ enum {
 	[BLSP1_UART4_APPS_CLK_SRC] = &blsp1_uart4_apps_clk_src.clkr,
 	[BLSP1_UART5_APPS_CLK_SRC] = &blsp1_uart5_apps_clk_src.clkr,
 	[BLSP1_UART6_APPS_CLK_SRC] = &blsp1_uart6_apps_clk_src.clkr,
+	[PCIE0_AXI_CLK_SRC] = &pcie0_axi_clk_src.clkr,
+	[PCIE0_AUX_CLK_SRC] = &pcie0_aux_clk_src.clkr,
+	[PCIE0_PIPE_CLK_SRC] = &pcie0_pipe_clk_src.clkr,
+	[PCIE1_AXI_CLK_SRC] = &pcie1_axi_clk_src.clkr,
+	[PCIE1_AUX_CLK_SRC] = &pcie1_aux_clk_src.clkr,
+	[PCIE1_PIPE_CLK_SRC] = &pcie1_pipe_clk_src.clkr,
+	[SDCC1_APPS_CLK_SRC] = &sdcc1_apps_clk_src.clkr,
+	[SDCC1_ICE_CORE_CLK_SRC] = &sdcc1_ice_core_clk_src.clkr,
+	[SDCC2_APPS_CLK_SRC] = &sdcc2_apps_clk_src.clkr,
+	[USB0_MASTER_CLK_SRC] = &usb0_master_clk_src.clkr,
+	[USB0_AUX_CLK_SRC] = &usb0_aux_clk_src.clkr,
+	[USB0_MOCK_UTMI_CLK_SRC] = &usb0_mock_utmi_clk_src.clkr,
+	[USB0_PIPE_CLK_SRC] = &usb0_pipe_clk_src.clkr,
+	[USB1_MASTER_CLK_SRC] = &usb1_master_clk_src.clkr,
+	[USB1_AUX_CLK_SRC] = &usb1_aux_clk_src.clkr,
+	[USB1_MOCK_UTMI_CLK_SRC] = &usb1_mock_utmi_clk_src.clkr,
+	[USB1_PIPE_CLK_SRC] = &usb1_pipe_clk_src.clkr,
 	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
 	[GCC_BLSP1_QUP1_I2C_APPS_CLK] = &gcc_blsp1_qup1_i2c_apps_clk.clkr,
 	[GCC_BLSP1_QUP1_SPI_APPS_CLK] = &gcc_blsp1_qup1_spi_apps_clk.clkr,
@@ -1046,6 +2009,37 @@ enum {
 	[GCC_PRNG_AHB_CLK] = &gcc_prng_ahb_clk.clkr,
 	[GCC_QPIC_AHB_CLK] = &gcc_qpic_ahb_clk.clkr,
 	[GCC_QPIC_CLK] = &gcc_qpic_clk.clkr,
+	[GCC_PCIE0_AHB_CLK] = &gcc_pcie0_ahb_clk.clkr,
+	[GCC_PCIE0_AUX_CLK] = &gcc_pcie0_aux_clk.clkr,
+	[GCC_PCIE0_AXI_M_CLK] = &gcc_pcie0_axi_m_clk.clkr,
+	[GCC_PCIE0_AXI_S_CLK] = &gcc_pcie0_axi_s_clk.clkr,
+	[GCC_PCIE0_PIPE_CLK] = &gcc_pcie0_pipe_clk.clkr,
+	[GCC_SYS_NOC_PCIE0_AXI_CLK] = &gcc_sys_noc_pcie0_axi_clk.clkr,
+	[GCC_PCIE1_AHB_CLK] = &gcc_pcie1_ahb_clk.clkr,
+	[GCC_PCIE1_AUX_CLK] = &gcc_pcie1_aux_clk.clkr,
+	[GCC_PCIE1_AXI_M_CLK] = &gcc_pcie1_axi_m_clk.clkr,
+	[GCC_PCIE1_AXI_S_CLK] = &gcc_pcie1_axi_s_clk.clkr,
+	[GCC_PCIE1_PIPE_CLK] = &gcc_pcie1_pipe_clk.clkr,
+	[GCC_SYS_NOC_PCIE1_AXI_CLK] = &gcc_sys_noc_pcie1_axi_clk.clkr,
+	[GCC_USB0_AUX_CLK] = &gcc_usb0_aux_clk.clkr,
+	[GCC_SYS_NOC_USB0_AXI_CLK] = &gcc_sys_noc_usb0_axi_clk.clkr,
+	[GCC_USB0_MASTER_CLK] = &gcc_usb0_master_clk.clkr,
+	[GCC_USB0_MOCK_UTMI_CLK] = &gcc_usb0_mock_utmi_clk.clkr,
+	[GCC_USB0_PHY_CFG_AHB_CLK] = &gcc_usb0_phy_cfg_ahb_clk.clkr,
+	[GCC_USB0_PIPE_CLK] = &gcc_usb0_pipe_clk.clkr,
+	[GCC_USB0_SLEEP_CLK] = &gcc_usb0_sleep_clk.clkr,
+	[GCC_USB1_AUX_CLK] = &gcc_usb1_aux_clk.clkr,
+	[GCC_SYS_NOC_USB1_AXI_CLK] = &gcc_sys_noc_usb1_axi_clk.clkr,
+	[GCC_USB1_MASTER_CLK] = &gcc_usb1_master_clk.clkr,
+	[GCC_USB1_MOCK_UTMI_CLK] = &gcc_usb1_mock_utmi_clk.clkr,
+	[GCC_USB1_PHY_CFG_AHB_CLK] = &gcc_usb1_phy_cfg_ahb_clk.clkr,
+	[GCC_USB1_PIPE_CLK] = &gcc_usb1_pipe_clk.clkr,
+	[GCC_USB1_SLEEP_CLK] = &gcc_usb1_sleep_clk.clkr,
+	[GCC_SDCC1_AHB_CLK] = &gcc_sdcc1_ahb_clk.clkr,
+	[GCC_SDCC1_APPS_CLK] = &gcc_sdcc1_apps_clk.clkr,
+	[GCC_SDCC1_ICE_CORE_CLK] = &gcc_sdcc1_ice_core_clk.clkr,
+	[GCC_SDCC2_AHB_CLK] = &gcc_sdcc2_ahb_clk.clkr,
+	[GCC_SDCC2_APPS_CLK] = &gcc_sdcc2_apps_clk.clkr,
 };
 
 static const struct qcom_reset_map gcc_ipq8074_resets[] = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
