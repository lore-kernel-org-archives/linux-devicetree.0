From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCHv2 14/16] clk: imx: add kpp clock for i.MX6UL
Date: Wed, 20 Jan 2016 11:09:07 +0100
Message-ID: <1453284549-16363-15-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <b20788@freescale.com>, Bai Ping <b51503@freescale.com>, Frank Li <Frank.Li@freescale.com>, Fugang Duan <B38611@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the necessary clock to use the KPP interface on i.MX6UL.

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 drivers/clk/imx/clk-imx6ul.c             | 1 +
 include/dt-bindings/clock/imx6ul-clock.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.=
c
index 3e31ec0..1ee28d3 100644
--- a/drivers/clk/imx/clk-imx6ul.c
+++ b/drivers/clk/imx/clk-imx6ul.c
@@ -365,6 +365,7 @@ static void __init imx6ul_clocks_init(struct device=
_node *ccm_node)
 	/* CCGR5 */
 	clks[IMX6UL_CLK_ROM]		=3D imx_clk_gate2("rom",		"ahb",		base + 0x7c,	=
0);
 	clks[IMX6UL_CLK_SDMA]		=3D imx_clk_gate2("sdma",		"ahb",		base + 0x7c=
,	6);
+	clks[IMX6UL_CLK_KPP]		=3D imx_clk_gate2("kpp",		"ipg",		base + 0x7c,	=
8);
 	clks[IMX6UL_CLK_WDOG2]		=3D imx_clk_gate2("wdog2",	"ipg",		base + 0x7=
c,	10);
 	clks[IMX6UL_CLK_SPBA]		=3D imx_clk_gate2("spba",		"ipg",		base + 0x7c=
,	12);
 	clks[IMX6UL_CLK_SPDIF]		=3D imx_clk_gate2_shared("spdif",		"spdif_pod=
f",	base + 0x7c,	14, &share_count_audio);
diff --git a/include/dt-bindings/clock/imx6ul-clock.h b/include/dt-bind=
ings/clock/imx6ul-clock.h
index 08ce4a7..fd8aee8 100644
--- a/include/dt-bindings/clock/imx6ul-clock.h
+++ b/include/dt-bindings/clock/imx6ul-clock.h
@@ -234,7 +234,8 @@
 #define IMX6UL_CLK_CSI_SEL		221
 #define IMX6UL_CLK_CSI_PODF		222
 #define IMX6UL_CLK_PLL3_120M		223
+#define IMX6UL_CLK_KPP			224
=20
-#define IMX6UL_CLK_END			224
+#define IMX6UL_CLK_END			225
=20
 #endif /* __DT_BINDINGS_CLOCK_IMX6UL_H */
--=20
2.1.4
