From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 2/3] clk: imx8mq: add hdmi_phy_27m clock as pll's reference
 clock
Date: Thu, 7 Mar 2019 03:41:03 +0000
Message-ID: <1551929772-22633-2-git-send-email-Anson.Huang@nxp.com>
References: <1551929772-22633-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551929772-22633-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Abel Vesa <abel.vesa@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

There is another 27MHz OSC inside i.MX8MQ's display block and
it can be one of reference clocks of all PLLs, add it into clock
tree and also add it as PLL's reference clock.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/clk/imx/clk-imx8mq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index a9b3888..bb1bf9b 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -26,7 +26,7 @@ static u32 share_count_nand;
=20
 static struct clk *clks[IMX8MQ_CLK_END];
=20
-static const char * const pll_ref_sels[] =3D { "osc_25m", "osc_27m", "dumm=
y", "dummy", };
+static const char * const pll_ref_sels[] =3D { "osc_25m", "osc_27m", "osc_=
hdmi_phy_27m", "dummy", };
 static const char * const arm_pll_bypass_sels[] =3D {"arm_pll", "arm_pll_r=
ef_sel", };
 static const char * const gpu_pll_bypass_sels[] =3D {"gpu_pll", "gpu_pll_r=
ef_sel", };
 static const char * const vpu_pll_bypass_sels[] =3D {"vpu_pll", "vpu_pll_r=
ef_sel", };
@@ -281,6 +281,7 @@ static int imx8mq_clocks_probe(struct platform_device *=
pdev)
 	clks[IMX8MQ_CLK_32K] =3D of_clk_get_by_name(np, "ckil");
 	clks[IMX8MQ_CLK_25M] =3D of_clk_get_by_name(np, "osc_25m");
 	clks[IMX8MQ_CLK_27M] =3D of_clk_get_by_name(np, "osc_27m");
+	clks[IMX8MQ_CLK_HDMI_PHY_27M] =3D of_clk_get_by_name(np, "osc_hdmi_phy_27=
m");
 	clks[IMX8MQ_CLK_EXT1] =3D of_clk_get_by_name(np, "clk_ext1");
 	clks[IMX8MQ_CLK_EXT2] =3D of_clk_get_by_name(np, "clk_ext2");
 	clks[IMX8MQ_CLK_EXT3] =3D of_clk_get_by_name(np, "clk_ext3");
--=20
2.7.4
