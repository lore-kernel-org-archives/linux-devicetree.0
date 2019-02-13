From: Abel Vesa <abel.vesa@nxp.com>
Subject: [RFC 1/5] clk: imx: imx8mq: Fix the rate propagation for arm pll
Date: Wed, 13 Feb 2019 19:05:12 +0000
Message-ID: <1550084693-9797-2-git-send-email-abel.vesa@nxp.com>
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

The arm pll bypass needs to propagate the rate upwards
in order for the cpufreq to work.

Fixes: b80522040cd3f ("clk: imx: Add clock driver for i.MX8MQ CCM")
Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 drivers/clk/imx/clk-imx8mq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index 398ab0b..57499ed 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -340,7 +340,7 @@ static int imx8mq_clocks_probe(struct platform_device *=
pdev)
 	clks[IMX8MQ_DRAM_PLL2_DIV] =3D imx_clk_divider("dram_pll2_div", "dram_pll=
2", base + 0x68, 1, 6);
=20
 	/* PLL bypass out */
-	clks[IMX8MQ_ARM_PLL_BYPASS] =3D imx_clk_mux("arm_pll_bypass", base + 0x28=
, 14, 1, arm_pll_bypass_sels, ARRAY_SIZE(arm_pll_bypass_sels));
+	clks[IMX8MQ_ARM_PLL_BYPASS] =3D imx_clk_mux_flags("arm_pll_bypass", base =
+ 0x28, 14, 1, arm_pll_bypass_sels, ARRAY_SIZE(arm_pll_bypass_sels), CLK_SE=
T_RATE_PARENT);
 	clks[IMX8MQ_GPU_PLL_BYPASS] =3D imx_clk_mux("gpu_pll_bypass", base + 0x18=
, 14, 1, gpu_pll_bypass_sels, ARRAY_SIZE(gpu_pll_bypass_sels));
 	clks[IMX8MQ_VPU_PLL_BYPASS] =3D imx_clk_mux("vpu_pll_bypass", base + 0x20=
, 14, 1, vpu_pll_bypass_sels, ARRAY_SIZE(vpu_pll_bypass_sels));
 	clks[IMX8MQ_AUDIO_PLL1_BYPASS] =3D imx_clk_mux("audio_pll1_bypass", base =
+ 0x0, 14, 1, audio_pll1_bypass_sels, ARRAY_SIZE(audio_pll1_bypass_sels));
--=20
2.7.4
