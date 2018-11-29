From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v13 0/5] Add i.MX8MQ clock driver
Date: Wed, 28 Nov 2018 16:41:48 -0800
Message-ID: <154345210894.88331.8277410833858111600@swboyd.mtv.corp.google.com>
References: <1542125975-8448-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542125975-8448-1-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "A.s. Dong" <aisheng.dong@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Abel Vesa <abelvesa@linux.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

Quoting Abel Vesa (2018-11-13 08:19:56)
> Here is a link to the 12th version:
> https://lkml.org/lkml/2018/11/7/642
> =

> Changes since v12:
>  * replaced the division in clk_pll_recalc_rate in clk-frac
>    with do_div as suggested by Stephen
> =

> Abel Vesa (2):
>   clk: imx: Add imx composite clock
>   clk: imx: Add clock driver for i.MX8MQ CCM
> =

> Lucas Stach (3):
>   dt-bindings: add binding for i.MX8MQ CCM
>   clk: imx: add fractional PLL output clock
>   clk: imx: Add SCCG PLL type
> =


I had to apply this set of fixes to silence sparse and smatch warnings
about things that are not right. Please take a look over things and see
if it's sane.

diff --git a/drivers/clk/imx/clk-composite-8m.c b/drivers/clk/imx/clk-compo=
site-8m.c
index bcd31d889584..6d9d3714b4df 100644
--- a/drivers/clk/imx/clk-composite-8m.c
+++ b/drivers/clk/imx/clk-composite-8m.c
@@ -127,8 +127,8 @@ struct clk *imx8m_clk_composite_flags(const char *name,
 					int num_parents, void __iomem *reg,
 					unsigned long flags)
 {
-	struct clk_hw *hw =3D NULL, *mux_hw =3D NULL;
-	struct clk_hw *div_hw =3D NULL, *gate_hw =3D NULL;
+	struct clk_hw *hw =3D ERR_PTR(-ENOMEM), *mux_hw;
+	struct clk_hw *div_hw, *gate_hw;
 	struct clk_divider *div =3D NULL;
 	struct clk_gate *gate =3D NULL;
 	struct clk_mux *mux =3D NULL;
diff --git a/drivers/clk/imx/clk-frac-pll.c b/drivers/clk/imx/clk-frac-pll.c
index a3732be5ad7f..98726206f3c4 100644
--- a/drivers/clk/imx/clk-frac-pll.c
+++ b/drivers/clk/imx/clk-frac-pll.c
@@ -14,6 +14,8 @@
 #include <linux/slab.h>
 #include <linux/bitfield.h>
 =

+#include "clk.h"
+
 #define PLL_CFG0		0x0
 #define PLL_CFG1		0x4
 =

@@ -214,7 +216,7 @@ struct clk *imx_clk_frac_pll(const char *name, const ch=
ar *parent_name,
 	ret =3D clk_hw_register(NULL, hw);
 	if (ret) {
 		kfree(pll);
-		return ERR_CAST(hw);
+		return ERR_PTR(ret);
 	}
 =

 	return hw->clk;
diff --git a/drivers/clk/imx/clk-sccg-pll.c b/drivers/clk/imx/clk-sccg-pll.c
index 4666b96bdb3f..ee7752bace89 100644
--- a/drivers/clk/imx/clk-sccg-pll.c
+++ b/drivers/clk/imx/clk-sccg-pll.c
@@ -249,7 +249,7 @@ struct clk *imx_clk_sccg_pll(const char *name,
 	ret =3D clk_hw_register(NULL, hw);
 	if (ret) {
 		kfree(pll);
-		return ERR_CAST(hw);
+		return ERR_PTR(ret);
 	}
 =

 	return hw->clk;
