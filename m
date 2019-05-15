From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 2/3] clk: imx8mm: add SNVS clock to clock tree
Date: Wed, 15 May 2019 01:29:57 +0000
Message-ID: <1557883490-22360-2-git-send-email-Anson.Huang@nxp.com>
References: <1557883490-22360-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557883490-22360-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-ID: <655E84F9BB8182418802F07E7FE89A7F@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

i.MX8MM has clock gate for SNVS module, add it into clock tree
for SNVS RTC driver to manage.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/clk/imx/clk-imx8mm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 733ca20..7ffbd6e3 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -622,6 +622,7 @@ static int __init imx8mm_clocks_init(struct device_node=
 *ccm_node)
 	clks[IMX8MM_CLK_SAI5_IPG] =3D imx_clk_gate2_shared2("sai5_ipg_clk", "ipg_=
audio_root", base + 0x4370, 0, &share_count_sai5);
 	clks[IMX8MM_CLK_SAI6_ROOT] =3D imx_clk_gate2_shared2("sai6_root_clk", "sa=
i6", base + 0x4380, 0, &share_count_sai6);
 	clks[IMX8MM_CLK_SAI6_IPG] =3D imx_clk_gate2_shared2("sai6_ipg_clk", "ipg_=
audio_root", base + 0x4380, 0, &share_count_sai6);
+	clks[IMX8MM_CLK_SNVS_ROOT] =3D imx_clk_gate4("snvs_root_clk", "ipg_root",=
 base + 0x4470, 0);
 	clks[IMX8MM_CLK_UART1_ROOT] =3D imx_clk_gate4("uart1_root_clk", "uart1", =
base + 0x4490, 0);
 	clks[IMX8MM_CLK_UART2_ROOT] =3D imx_clk_gate4("uart2_root_clk", "uart2", =
base + 0x44a0, 0);
 	clks[IMX8MM_CLK_UART3_ROOT] =3D imx_clk_gate4("uart3_root_clk", "uart3", =
base + 0x44b0, 0);
--=20
2.7.4
