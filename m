From: Anson.Huang@nxp.com
Subject: [PATCH 3/4] clk: imx8mm: Add system counter to clock tree
Date: Fri, 21 Jun 2019 15:07:19 +0800
Message-ID: <20190621070720.12395-3-Anson.Huang@nxp.com>
References: <20190621070720.12395-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190621070720.12395-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: catalin.marinas@arm.com, will@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, leonard.crestez@nxp.com, aisheng.dong@nxp.com, ping.bai@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com, abel.vesa@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

i.MX8MM timer-imx-sysctr driver needs system counter clock
for proper function, add it into clock tree.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/clk/imx/clk-imx8mm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 43fa9c3..56d53dd 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -645,6 +645,8 @@ static int __init imx8mm_clocks_init(struct device_node *ccm_node)
 	clks[IMX8MM_CLK_DRAM_ALT_ROOT] = imx_clk_fixed_factor("dram_alt_root", "dram_alt", 1, 4);
 	clks[IMX8MM_CLK_DRAM_CORE] = imx_clk_mux2_flags("dram_core_clk", base + 0x9800, 24, 1, imx8mm_dram_core_sels, ARRAY_SIZE(imx8mm_dram_core_sels), CLK_IS_CRITICAL);
 
+	clks[IMX8MM_CLK_SYS_CTR] = imx_clk_fixed_factor("sys_ctr", "osc_24m", 1, 3);
+
 	clks[IMX8MM_CLK_ARM] = imx_clk_cpu("arm", "arm_a53_div",
 					   clks[IMX8MM_CLK_A53_DIV],
 					   clks[IMX8MM_CLK_A53_SRC],
-- 
2.7.4
