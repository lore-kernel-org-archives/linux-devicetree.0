From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v14 3/5] clk: imx: Add SCCG PLL type
Date: Thu, 29 Nov 2018 09:28:35 +0000
Message-ID: <1543483640-4585-4-git-send-email-abel.vesa@nxp.com>
References: <1543483640-4585-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543483640-4585-1-git-send-email-abel.vesa@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Aisheng DONG <aisheng.dong@nxp.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Abel Vesa <abelvesa@linux.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Lucas Stach <l.stach@pengutronix.de>

The SCCG is a new PLL type introduced on i.MX8.

The description of this SCCG clock can be found here:

https://www.nxp.com/docs/en/reference-manual/IMX8MDQLQRM.pdf#page=3D834

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/clk/imx/Makefile       |   3 +-
 drivers/clk/imx/clk-sccg-pll.c | 256 +++++++++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/clk.h          |   9 ++
 3 files changed, 267 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/clk-sccg-pll.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 4893c1f..b87513c 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -12,7 +12,8 @@ obj-y +=3D \
 	clk-pllv1.o \
 	clk-pllv2.o \
 	clk-pllv3.o \
-	clk-pfd.o
+	clk-pfd.o \
+	clk-sccg-pll.o
=20
 obj-$(CONFIG_SOC_IMX1)   +=3D clk-imx1.o
 obj-$(CONFIG_SOC_IMX21)  +=3D clk-imx21.o
diff --git a/drivers/clk/imx/clk-sccg-pll.c b/drivers/clk/imx/clk-sccg-pll.=
c
new file mode 100644
index 0000000..ee7752b
--- /dev/null
+++ b/drivers/clk/imx/clk-sccg-pll.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2018 NXP.
+ *
+ * This driver supports the SCCG plls found in the imx8m SOCs
+ *
+ * Documentation for this SCCG pll can be found at:
+ *   https://www.nxp.com/docs/en/reference-manual/IMX8MDQLQRM.pdf#page=3D8=
34
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/iopoll.h>
+#include <linux/slab.h>
+#include <linux/bitfield.h>
+
+#include "clk.h"
+
+/* PLL CFGs */
+#define PLL_CFG0		0x0
+#define PLL_CFG1		0x4
+#define PLL_CFG2		0x8
+
+#define PLL_DIVF1_MASK		GENMASK(18, 13)
+#define PLL_DIVF2_MASK		GENMASK(12, 7)
+#define PLL_DIVR1_MASK		GENMASK(27, 25)
+#define PLL_DIVR2_MASK		GENMASK(24, 19)
+#define PLL_REF_MASK		GENMASK(2, 0)
+
+#define PLL_LOCK_MASK		BIT(31)
+#define PLL_PD_MASK		BIT(7)
+
+#define OSC_25M			25000000
+#define OSC_27M			27000000
+
+#define PLL_SCCG_LOCK_TIMEOUT	70
+
+struct clk_sccg_pll {
+	struct clk_hw	hw;
+	void __iomem	*base;
+};
+
+#define to_clk_sccg_pll(_hw) container_of(_hw, struct clk_sccg_pll, hw)
+
+static int clk_pll_wait_lock(struct clk_sccg_pll *pll)
+{
+	u32 val;
+
+	return readl_poll_timeout(pll->base, val, val & PLL_LOCK_MASK, 0,
+					PLL_SCCG_LOCK_TIMEOUT);
+}
+
+static int clk_pll1_is_prepared(struct clk_hw *hw)
+{
+	struct clk_sccg_pll *pll =3D to_clk_sccg_pll(hw);
+	u32 val;
+
+	val =3D readl_relaxed(pll->base + PLL_CFG0);
+	return (val & PLL_PD_MASK) ? 0 : 1;
+}
+
+static unsigned long clk_pll1_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct clk_sccg_pll *pll =3D to_clk_sccg_pll(hw);
+	u32 val, divf;
+
+	val =3D readl_relaxed(pll->base + PLL_CFG2);
+	divf =3D FIELD_GET(PLL_DIVF1_MASK, val);
+
+	return parent_rate * 2 * (divf + 1);
+}
+
+static long clk_pll1_round_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long *prate)
+{
+	unsigned long parent_rate =3D *prate;
+	u32 div;
+
+	if (!parent_rate)
+		return 0;
+
+	div =3D rate / (parent_rate * 2);
+
+	return parent_rate * div * 2;
+}
+
+static int clk_pll1_set_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct clk_sccg_pll *pll =3D to_clk_sccg_pll(hw);
+	u32 val;
+	u32 divf;
+
+	if (!parent_rate)
+		return -EINVAL;
+
+	divf =3D rate / (parent_rate * 2);
+
+	val =3D readl_relaxed(pll->base + PLL_CFG2);
+	val &=3D ~PLL_DIVF1_MASK;
+	val |=3D FIELD_PREP(PLL_DIVF1_MASK, divf - 1);
+	writel_relaxed(val, pll->base + PLL_CFG2);
+
+	return clk_pll_wait_lock(pll);
+}
+
+static int clk_pll1_prepare(struct clk_hw *hw)
+{
+	struct clk_sccg_pll *pll =3D to_clk_sccg_pll(hw);
+	u32 val;
+
+	val =3D readl_relaxed(pll->base + PLL_CFG0);
+	val &=3D ~PLL_PD_MASK;
+	writel_relaxed(val, pll->base + PLL_CFG0);
+
+	return clk_pll_wait_lock(pll);
+}
+
+static void clk_pll1_unprepare(struct clk_hw *hw)
+{
+	struct clk_sccg_pll *pll =3D to_clk_sccg_pll(hw);
+	u32 val;
+
+	val =3D readl_relaxed(pll->base + PLL_CFG0);
+	val |=3D PLL_PD_MASK;
+	writel_relaxed(val, pll->base + PLL_CFG0);
+
+}
+
+static unsigned long clk_pll2_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct clk_sccg_pll *pll =3D to_clk_sccg_pll(hw);
+	u32 val, ref, divr1, divf1, divr2, divf2;
+	u64 temp64;
+
+	val =3D readl_relaxed(pll->base + PLL_CFG0);
+	switch (FIELD_GET(PLL_REF_MASK, val)) {
+	case 0:
+		ref =3D OSC_25M;
+		break;
+	case 1:
+		ref =3D OSC_27M;
+		break;
+	default:
+		ref =3D OSC_25M;
+		break;
+	}
+
+	val =3D readl_relaxed(pll->base + PLL_CFG2);
+	divr1 =3D FIELD_GET(PLL_DIVR1_MASK, val);
+	divr2 =3D FIELD_GET(PLL_DIVR2_MASK, val);
+	divf1 =3D FIELD_GET(PLL_DIVF1_MASK, val);
+	divf2 =3D FIELD_GET(PLL_DIVF2_MASK, val);
+
+	temp64 =3D ref * 2;
+	temp64 *=3D (divf1 + 1) * (divf2 + 1);
+
+	do_div(temp64, (divr1 + 1) * (divr2 + 1));
+
+	return temp64;
+}
+
+static long clk_pll2_round_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long *prate)
+{
+	u32 div;
+	unsigned long parent_rate =3D *prate;
+
+	if (!parent_rate)
+		return 0;
+
+	div =3D rate / parent_rate;
+
+	return parent_rate * div;
+}
+
+static int clk_pll2_set_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	u32 val;
+	u32 divf;
+	struct clk_sccg_pll *pll =3D to_clk_sccg_pll(hw);
+
+	if (!parent_rate)
+		return -EINVAL;
+
+	divf =3D rate / parent_rate;
+
+	val =3D readl_relaxed(pll->base + PLL_CFG2);
+	val &=3D ~PLL_DIVF2_MASK;
+	val |=3D FIELD_PREP(PLL_DIVF2_MASK, divf - 1);
+	writel_relaxed(val, pll->base + PLL_CFG2);
+
+	return clk_pll_wait_lock(pll);
+}
+
+static const struct clk_ops clk_sccg_pll1_ops =3D {
+	.is_prepared	=3D clk_pll1_is_prepared,
+	.recalc_rate	=3D clk_pll1_recalc_rate,
+	.round_rate	=3D clk_pll1_round_rate,
+	.set_rate	=3D clk_pll1_set_rate,
+};
+
+static const struct clk_ops clk_sccg_pll2_ops =3D {
+	.prepare	=3D clk_pll1_prepare,
+	.unprepare	=3D clk_pll1_unprepare,
+	.recalc_rate	=3D clk_pll2_recalc_rate,
+	.round_rate	=3D clk_pll2_round_rate,
+	.set_rate	=3D clk_pll2_set_rate,
+};
+
+struct clk *imx_clk_sccg_pll(const char *name,
+				const char *parent_name,
+				void __iomem *base,
+				enum imx_sccg_pll_type pll_type)
+{
+	struct clk_sccg_pll *pll;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	switch (pll_type) {
+	case SCCG_PLL1:
+		init.ops =3D &clk_sccg_pll1_ops;
+		break;
+	case SCCG_PLL2:
+		init.ops =3D &clk_sccg_pll2_ops;
+		break;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+
+	pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
+
+	init.name =3D name;
+	init.flags =3D 0;
+	init.parent_names =3D &parent_name;
+	init.num_parents =3D 1;
+
+	pll->base =3D base;
+	pll->hw.init =3D &init;
+
+	hw =3D &pll->hw;
+
+	ret =3D clk_hw_register(NULL, hw);
+	if (ret) {
+		kfree(pll);
+		return ERR_PTR(ret);
+	}
+
+	return hw->clk;
+}
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 44a1f14..864cd8a 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -21,6 +21,11 @@ enum imx_pllv1_type {
 	IMX_PLLV1_IMX35,
 };
=20
+enum imx_sccg_pll_type {
+	SCCG_PLL1,
+	SCCG_PLL2,
+};
+
 struct clk *imx_clk_pllv1(enum imx_pllv1_type type, const char *name,
 		const char *parent, void __iomem *base);
=20
@@ -30,6 +35,10 @@ struct clk *imx_clk_pllv2(const char *name, const char *=
parent,
 struct clk *imx_clk_frac_pll(const char *name, const char *parent_name,
 			     void __iomem *base);
=20
+struct clk *imx_clk_sccg_pll(const char *name, const char *parent_name,
+			     void __iomem *base,
+			     enum imx_sccg_pll_type pll_type);
+
 enum imx_pllv3_type {
 	IMX_PLLV3_GENERIC,
 	IMX_PLLV3_SYS,
--=20
2.7.4
