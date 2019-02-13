From: Abel Vesa <abel.vesa@nxp.com>
Subject: [RFC 3/5] clk: imx8mq: Add the missing ARM clock
Date: Wed, 13 Feb 2019 19:05:15 +0000
Message-ID: <1550084693-9797-4-git-send-email-abel.vesa@nxp.com>
References: <1550084693-9797-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550084693-9797-1-git-send-email-abel.vesa@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Angus Ainslie <angus.ainslie@puri.sm>, Anson Huang <anson.huang@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

Add the ARM clock as imx_clk_cpu type.
Will be used by cpufreq.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 drivers/clk/imx/clk-imx8mq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index 57499ed..8a283cb 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -558,6 +558,12 @@ static int imx8mq_clocks_probe(struct platform_device =
*pdev)
 	clks[IMX8MQ_GPT_3M_CLK] =3D imx_clk_fixed_factor("gpt_3m", "osc_25m", 1, =
8);
 	clks[IMX8MQ_CLK_DRAM_ALT_ROOT] =3D imx_clk_fixed_factor("dram_alt_root", =
"dram_alt", 1, 4);
=20
+	clks[IMX8MQ_CLK_ARM] =3D imx_clk_cpu("arm", "arm_a53_div",
+					   clks[IMX8MQ_CLK_A53_DIV],
+					   clks[IMX8MQ_CLK_A53_SRC],
+					   clks[IMX8MQ_ARM_PLL_OUT],
+					   clks[IMX8MQ_SYS1_PLL_800M]);
+
 	for (i =3D 0; i < IMX8MQ_CLK_END; i++)
 		if (IS_ERR(clks[i]))
 			pr_err("i.MX8mq clk %u register failed with %ld\n",
--=20
2.7.4
