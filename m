From: Anson.Huang@nxp.com
Subject: [PATCH V5 2/5] clk: imx8mm: Make 1416X/1443X PLL macro definitions common for usage
Date: Fri, 14 Jun 2019 16:37:44 +0800
Message-ID: <20190614083747.28762-2-Anson.Huang@nxp.com>
References: <20190614083747.28762-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614083747.28762-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, will.deacon@arm.com, maxime.ripard@bootlin.com, horms+renesas@verge.net.au, olof@lixom.net, jagan@amarulasolutions.com, bjorn.andersson@linaro.org, leonard.crestez@nxp.com, dinguyen@kernel.org, enric.balletbo@collabora.com, aisheng.dong@nxp.com, ping.bai@nxp.com, abel.vesa@nxp.com, l.stach@pengutronix.de, peng.fan@nxp.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

1416X/1443X PLL are used on i.MX8MM and i.MX8MN and maybe
other i.MX8M series SoC later, the macro definitions of
these PLLs' initialization should be common for usage.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No changes.
---
 drivers/clk/imx/clk-imx8mm.c | 17 -----------------
 drivers/clk/imx/clk.h        | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 6b8e75d..43fa9c3 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -26,23 +26,6 @@ static u32 share_count_dcss;
 static u32 share_count_pdm;
 static u32 share_count_nand;
 
-#define PLL_1416X_RATE(_rate, _m, _p, _s)		\
-	{						\
-		.rate	=	(_rate),		\
-		.mdiv	=	(_m),			\
-		.pdiv	=	(_p),			\
-		.sdiv	=	(_s),			\
-	}
-
-#define PLL_1443X_RATE(_rate, _m, _p, _s, _k)		\
-	{						\
-		.rate	=	(_rate),		\
-		.mdiv	=	(_m),			\
-		.pdiv	=	(_p),			\
-		.sdiv	=	(_s),			\
-		.kdiv	=	(_k),			\
-	}
-
 static const struct imx_pll14xx_rate_table imx8mm_pll1416x_tbl[] = {
 	PLL_1416X_RATE(1800000000U, 225, 3, 0),
 	PLL_1416X_RATE(1600000000U, 200, 3, 0),
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index d94d9cb..19d7b8b 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -153,6 +153,23 @@ enum imx_pllv3_type {
 struct clk_hw *imx_clk_hw_pllv3(enum imx_pllv3_type type, const char *name,
 		const char *parent_name, void __iomem *base, u32 div_mask);
 
+#define PLL_1416X_RATE(_rate, _m, _p, _s)		\
+	{						\
+		.rate	=	(_rate),		\
+		.mdiv	=	(_m),			\
+		.pdiv	=	(_p),			\
+		.sdiv	=	(_s),			\
+	}
+
+#define PLL_1443X_RATE(_rate, _m, _p, _s, _k)		\
+	{						\
+		.rate	=	(_rate),		\
+		.mdiv	=	(_m),			\
+		.pdiv	=	(_p),			\
+		.sdiv	=	(_s),			\
+		.kdiv	=	(_k),			\
+	}
+
 struct clk_hw *imx_clk_pllv4(const char *name, const char *parent_name,
 			     void __iomem *base);
 
-- 
2.7.4
