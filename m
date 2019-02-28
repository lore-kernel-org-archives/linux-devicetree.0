From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 1/2] clk: imx7ulp: remove snvs clock
Date: Thu, 28 Feb 2019 08:56:00 +0000
Message-ID: <1551343889-6674-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "gustavo@embeddedor.com" <gustavo@embeddedor.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Since i.MX7ULP B0 chip, the SNVS module is moved into M4
domain and its clock is also moved into PCC0 which is
contorlled by M4, Linux kernel should NOT add it into
clock tree.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/clk/imx/clk-imx7ulp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx7ulp.c b/drivers/clk/imx/clk-imx7ulp.c
index ce30663..6668210 100644
--- a/drivers/clk/imx/clk-imx7ulp.c
+++ b/drivers/clk/imx/clk-imx7ulp.c
@@ -151,7 +151,6 @@ static void __init imx7ulp_clk_pcc2_init(struct device_=
node *np)
 	clks[IMX7ULP_CLK_DMA1]		=3D imx_clk_hw_gate("dma1", "nic1_clk", base + 0x=
20, 30);
 	clks[IMX7ULP_CLK_RGPIO2P1]	=3D imx_clk_hw_gate("rgpio2p1", "nic1_bus_clk"=
, base + 0x3c, 30);
 	clks[IMX7ULP_CLK_DMA_MUX1]	=3D imx_clk_hw_gate("dma_mux1", "nic1_bus_clk"=
, base + 0x84, 30);
-	clks[IMX7ULP_CLK_SNVS]		=3D imx_clk_hw_gate("snvs", "nic1_bus_clk", base =
+ 0x8c, 30);
 	clks[IMX7ULP_CLK_CAAM]		=3D imx_clk_hw_gate("caam", "nic1_clk", base + 0x=
90, 30);
 	clks[IMX7ULP_CLK_LPTPM4]	=3D imx7ulp_clk_composite("lptpm4",  periph_bus_=
sels, ARRAY_SIZE(periph_bus_sels), true, false, true, base + 0x94);
 	clks[IMX7ULP_CLK_LPTPM5]	=3D imx7ulp_clk_composite("lptpm5",  periph_bus_=
sels, ARRAY_SIZE(periph_bus_sels), true, false, true, base + 0x98);
--=20
2.7.4
