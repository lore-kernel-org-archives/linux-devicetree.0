Return-Path: <SRS0=mSv1=PQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr60047.outbound.protection.outlook.com ([40.107.6.47]:37293
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726333AbfAHJAw (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 8 Jan 2019 04:00:52 -0500
From: Jacky Bai <ping.bai@nxp.com>
Subject: [PATCH 1/3] clk: imx: Add PLLs driver for imx8mm soc
Date: Tue, 8 Jan 2019 09:00:45 +0000
Message-ID: <1546938317-23203-1-git-send-email-ping.bai@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

New PLLs are introduced on i.MX8M Mini SOC.
PLL1416X is Integer PLL, PLL1443X is a Frac PLL.

Signed-off-by: Bai Ping <ping.bai@nxp.com>
---
 drivers/clk/imx/Makefile      |   3 +-
 drivers/clk/imx/clk-pll14xx.c | 409 ++++++++++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/clk.h         |  23 +++
 3 files changed, 434 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/clk-pll14xx.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 73119fb..ff74287 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -18,7 +18,8 @@ obj-$(CONFIG_MXC_CLK) +=3D \
 	clk-pllv2.o \
 	clk-pllv3.o \
 	clk-pllv4.o \
-	clk-sccg-pll.o
+	clk-sccg-pll.o \
+	clk-pll14xx.o
=20
 obj-$(CONFIG_MXC_CLK_SCU) +=3D \
 	clk-scu.o \
diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
new file mode 100644
index 0000000..c9f83fd
--- /dev/null
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -0,0 +1,409 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2017-2018 NXP.
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/jiffies.h>
+
+#include "clk.h"
+
+#define GNRL_CTL	0x0
+#define DIV_CTL		0x4
+#define LOCK_STATUS	BIT(31)
+#define LOCK_SEL_MASK	BIT(29)
+#define CLKE_MASK	BIT(11)
+#define RST_MASK	BIT(9)
+#define BYPASS_MASK	BIT(4)
+#define MDIV_SHIFT	12
+#define MDIV_MASK	GENMASK(21, 12)
+#define PDIV_SHIFT	4
+#define PDIV_MASK	GENMASK(9, 4)
+#define SDIV_SHIFT	0
+#define SDIV_MASK	GENMASK(2, 0)
+#define KDIV_SHIFT	0
+#define KDIV_MASK	GENMASK(15, 0)
+
+struct clk_pll14xx {
+	struct clk_hw			hw;
+	void __iomem			*base;
+	enum imx_pll14xx_type		type;
+	struct imx_pll14xx_rate_table	*rate_table;
+	int rate_count;
+};
+
+#define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw)
+
+static const struct imx_pll14xx_rate_table *imx_get_pll_settings(
+		struct clk_pll14xx *pll, unsigned long rate)
+{
+	const struct imx_pll14xx_rate_table *rate_table =3D pll->rate_table;
+	int i;
+
+	for (i =3D 0; i < pll->rate_count; i++) {
+		if (rate =3D=3D rate_table[i].rate)
+			return &rate_table[i];
+	}
+
+	return NULL;
+}
+
+static long clk_pll14xx_round_rate(struct clk_hw *hw, unsigned long rate,
+			unsigned long *prate)
+{
+	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
+	const struct imx_pll14xx_rate_table *rate_table =3D pll->rate_table;
+	int i;
+
+	/* Assumming rate_table is in descending order */
+	for (i =3D 0; i < pll->rate_count; i++) {
+		if (rate >=3D rate_table[i].rate)
+			return rate_table[i].rate;
+	}
+	/* return minimum supported value */
+	return rate_table[i - 1].rate;
+}
+
+static unsigned long clk_pll1416x_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
+	u32 mdiv, pdiv, sdiv, pll_gnrl, pll_div;
+	u64 fvco =3D parent_rate;
+
+	pll_gnrl =3D readl_relaxed(pll->base);
+	pll_div =3D readl_relaxed(pll->base + 4);
+	mdiv =3D (pll_div & MDIV_MASK) >> MDIV_SHIFT;
+	pdiv =3D (pll_div & PDIV_MASK) >> PDIV_SHIFT;
+	sdiv =3D (pll_div & SDIV_MASK) >> SDIV_SHIFT;
+
+	fvco *=3D mdiv;
+	do_div(fvco, pdiv << sdiv);
+
+	return (unsigned long)fvco;
+}
+
+static unsigned long clk_pll1443x_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
+	u32 mdiv, pdiv, sdiv, pll_gnrl, pll_div_ctl0, pll_div_ctl1;
+	short int kdiv;
+	u64 fvco =3D parent_rate;
+
+	pll_gnrl =3D readl_relaxed(pll->base);
+	pll_div_ctl0 =3D readl_relaxed(pll->base + 4);
+	pll_div_ctl1 =3D readl_relaxed(pll->base + 8);
+	mdiv =3D (pll_div_ctl0 & MDIV_MASK) >> MDIV_SHIFT;
+	pdiv =3D (pll_div_ctl0 & PDIV_MASK) >> PDIV_SHIFT;
+	sdiv =3D (pll_div_ctl0 & SDIV_MASK) >> SDIV_SHIFT;
+	kdiv =3D pll_div_ctl1 & KDIV_MASK;
+
+	/* fvco =3D (m * 65536 + k) * Fin / (p * 65536) */
+	fvco *=3D (mdiv * 65536 + kdiv);
+	pdiv *=3D 65536;
+
+	do_div(fvco, pdiv << sdiv);
+
+	return (unsigned long)fvco;
+}
+
+static inline bool clk_pll1416x_mp_change(const struct imx_pll14xx_rate_ta=
ble *rate,
+					  u32 pll_div)
+{
+	u32 old_mdiv, old_pdiv;
+
+	old_mdiv =3D (pll_div >> MDIV_SHIFT) & MDIV_MASK;
+	old_pdiv =3D (pll_div >> PDIV_SHIFT) & PDIV_MASK;
+
+	return (rate->mdiv !=3D old_mdiv || rate->pdiv !=3D old_pdiv);
+}
+
+static inline bool clk_pll1443x_mpk_change(const struct imx_pll14xx_rate_t=
able *rate,
+					  u32 pll_div_ctl0, u32 pll_div_ctl1)
+{
+	u32 old_mdiv, old_pdiv, old_kdiv;
+
+	old_mdiv =3D (pll_div_ctl0 >> MDIV_SHIFT) & MDIV_MASK;
+	old_pdiv =3D (pll_div_ctl0 >> PDIV_SHIFT) & PDIV_MASK;
+	old_kdiv =3D (pll_div_ctl1 >> KDIV_SHIFT) & KDIV_MASK;
+
+	return (rate->mdiv !=3D old_mdiv || rate->pdiv !=3D old_pdiv ||
+		rate->kdiv !=3D old_kdiv);
+}
+
+static inline bool clk_pll1443x_mp_change(const struct imx_pll14xx_rate_ta=
ble *rate,
+					  u32 pll_div_ctl0, u32 pll_div_ctl1)
+{
+	u32 old_mdiv, old_pdiv, old_kdiv;
+
+	old_mdiv =3D (pll_div_ctl0 >> MDIV_SHIFT) & MDIV_MASK;
+	old_pdiv =3D (pll_div_ctl0 >> PDIV_SHIFT) & PDIV_MASK;
+	old_kdiv =3D (pll_div_ctl1 >> KDIV_SHIFT) & KDIV_MASK;
+
+	return (rate->mdiv !=3D old_mdiv || rate->pdiv !=3D old_pdiv ||
+		rate->kdiv !=3D old_kdiv);
+}
+
+static int clk_pll14xx_wait_lock(struct clk_pll14xx *pll)
+{
+	unsigned long timeout =3D jiffies + msecs_to_jiffies(10);
+
+	/* Wait for PLL to lock */
+	do {
+		if (readl_relaxed(pll->base) & LOCK_STATUS)
+			break;
+		if (time_after(jiffies, timeout))
+			break;
+	} while (1);
+
+	return readl_relaxed(pll->base) & LOCK_STATUS ? 0 : -ETIMEDOUT;
+}
+
+static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
+				 unsigned long prate)
+{
+	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
+	const struct imx_pll14xx_rate_table *rate;
+	u32 tmp, div_val;
+	int ret;
+
+	rate =3D imx_get_pll_settings(pll, drate);
+	if (!rate) {
+		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
+		       drate, clk_hw_get_name(hw));
+		return -EINVAL;
+	}
+
+	tmp =3D readl_relaxed(pll->base + 4);
+
+	if (!clk_pll1416x_mp_change(rate, tmp)) {
+		tmp &=3D ~(SDIV_MASK) << SDIV_SHIFT;
+		tmp |=3D rate->sdiv << SDIV_SHIFT;
+		writel_relaxed(tmp, pll->base + 4);
+
+		return 0;
+	}
+
+	/* Bypass clock and set lock to pll output lock */
+	tmp =3D readl_relaxed(pll->base);
+	tmp |=3D LOCK_SEL_MASK;
+	writel_relaxed(tmp, pll->base);
+
+	/* Enable RST */
+	tmp &=3D ~RST_MASK;
+	writel_relaxed(tmp, pll->base);
+
+	div_val =3D (rate->mdiv << MDIV_SHIFT) | (rate->pdiv << PDIV_SHIFT) |
+		(rate->sdiv << SDIV_SHIFT);
+	writel_relaxed(div_val, pll->base + 0x4);
+
+	/*
+	 * According to SPEC, t3 - t2 need to be greater than
+	 * 1us and 1/FREF, respectively.
+	 * FREF is FIN / Prediv, the prediv is [1, 63], so choose
+	 * 3us.
+	 */
+	udelay(3);
+
+	/* Disable RST */
+	tmp |=3D RST_MASK;
+	writel_relaxed(tmp, pll->base);
+
+	/* Wait Lock */
+	ret =3D clk_pll14xx_wait_lock(pll);
+	if (ret)
+		return ret;
+
+	/* Bypass */
+	tmp &=3D ~BYPASS_MASK;
+	writel_relaxed(tmp, pll->base);
+
+	return 0;
+}
+
+static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
+				 unsigned long prate)
+{
+	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
+	const struct imx_pll14xx_rate_table *rate;
+	u32 tmp, div_val;
+	int ret;
+
+	rate =3D imx_get_pll_settings(pll, drate);
+	if (!rate) {
+		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
+			drate, clk_hw_get_name(hw));
+		return -EINVAL;
+	}
+
+	tmp =3D readl_relaxed(pll->base + 4);
+	div_val =3D readl_relaxed(pll->base + 8);
+
+	if (!clk_pll1443x_mpk_change(rate, tmp, div_val)) {
+		tmp &=3D ~(SDIV_MASK) << SDIV_SHIFT;
+		tmp |=3D rate->sdiv << SDIV_SHIFT;
+		writel_relaxed(tmp, pll->base + 4);
+
+		return 0;
+	}
+
+	/* Enable RST */
+	tmp =3D readl_relaxed(pll->base);
+	tmp &=3D ~RST_MASK;
+	writel_relaxed(tmp, pll->base);
+
+	div_val =3D (rate->mdiv << MDIV_SHIFT) | (rate->pdiv << PDIV_SHIFT) |
+		(rate->sdiv << SDIV_SHIFT);
+	writel_relaxed(div_val, pll->base + 0x4);
+	writel_relaxed(rate->kdiv << KDIV_SHIFT, pll->base + 0x8);
+
+	/*
+	 * According to SPEC, t3 - t2 need to be greater than
+	 * 1us and 1/FREF, respectively.
+	 * FREF is FIN / Prediv, the prediv is [1, 63], so choose
+	 * 3us.
+	 */
+	udelay(3);
+
+	/* Disable RST */
+	tmp |=3D RST_MASK;
+	writel_relaxed(tmp, pll->base);
+
+	/* Wait Lock*/
+	ret =3D clk_pll14xx_wait_lock(pll);
+	if (ret)
+		return ret;
+
+	/* Bypass */
+	tmp &=3D ~BYPASS_MASK;
+	writel_relaxed(tmp, pll->base);
+
+	return 0;
+}
+
+static int clk_pll14xx_prepare(struct clk_hw *hw)
+{
+	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
+	u32 val;
+
+	/*
+	 * RESETB =3D 1 from 0, PLL starts its normal
+	 * operation after lock time
+	 */
+	val =3D readl_relaxed(pll->base + GNRL_CTL);
+	val |=3D RST_MASK;
+	writel_relaxed(val, pll->base + GNRL_CTL);
+
+	return clk_pll14xx_wait_lock(pll);
+}
+
+static int clk_pll14xx_is_prepared(struct clk_hw *hw)
+{
+	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
+	u32 val;
+
+	val =3D readl_relaxed(pll->base + GNRL_CTL);
+
+	return (val & RST_MASK) ? 1 : 0;
+}
+
+static void clk_pll14xx_unprepare(struct clk_hw *hw)
+{
+	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
+	u32 val;
+
+	/*
+	 * Set RST to 0, power down mode is enabled and
+	 * every digital block is reset
+	 */
+	val =3D readl_relaxed(pll->base + GNRL_CTL);
+	val &=3D ~RST_MASK;
+	writel_relaxed(val, pll->base + GNRL_CTL);
+}
+
+static const struct clk_ops clk_pll1416x_ops =3D {
+	.prepare	=3D clk_pll14xx_prepare,
+	.unprepare	=3D clk_pll14xx_unprepare,
+	.is_prepared	=3D clk_pll14xx_is_prepared,
+	.recalc_rate	=3D clk_pll1416x_recalc_rate,
+	.round_rate	=3D clk_pll14xx_round_rate,
+	.set_rate	=3D clk_pll1416x_set_rate,
+};
+
+static const struct clk_ops clk_pll1416x_min_ops =3D {
+	.recalc_rate	=3D clk_pll1416x_recalc_rate,
+};
+
+static const struct clk_ops clk_pll1443x_ops =3D {
+	.prepare	=3D clk_pll14xx_prepare,
+	.unprepare	=3D clk_pll14xx_unprepare,
+	.is_prepared	=3D clk_pll14xx_is_prepared,
+	.recalc_rate	=3D clk_pll1443x_recalc_rate,
+	.round_rate	=3D clk_pll14xx_round_rate,
+	.set_rate	=3D clk_pll1443x_set_rate,
+};
+
+struct clk *imx_clk_pll14xx(const char *name, const char *parent_name,
+			    void __iomem *base,
+			    const struct imx_pll14xx_clk *pll_clk)
+{
+	struct clk_pll14xx *pll;
+	struct clk *clk;
+	struct clk_init_data init;
+	int len;
+
+	pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
+
+	init.name =3D name;
+	init.flags =3D pll_clk->flags;
+	init.parent_names =3D &parent_name;
+	init.num_parents =3D 1;
+
+	if (pll_clk->rate_table) {
+		for (len =3D 0; pll_clk->rate_table[len].rate !=3D 0; )
+			len++;
+
+		pll->rate_count =3D len;
+		pll->rate_table =3D kmemdup(pll_clk->rate_table,
+					  pll->rate_count *
+					  sizeof(struct imx_pll14xx_rate_table),
+					  GFP_KERNEL);
+		WARN(!pll->rate_table, "%s : could not alloc rate table\n", __func__);
+	}
+
+	switch (pll_clk->type) {
+	case PLL_1416X:
+		if (!pll->rate_table)
+			init.ops =3D &clk_pll1416x_min_ops;
+		else
+			init.ops =3D &clk_pll1416x_ops;
+		break;
+	case PLL_1443X:
+		init.ops =3D &clk_pll1443x_ops;
+		break;
+	default:
+		pr_err("%s: Unknown pll type for pll clk %s\n",
+		       __func__, name);
+	};
+
+	pll->base =3D base;
+	pll->hw.init =3D &init;
+	pll->type =3D pll_clk->type;
+
+	clk =3D clk_register(NULL, &pll->hw);
+	if (IS_ERR(clk)) {
+		pr_err("%s: failed to register pll %s %lu\n",
+			__func__, name, PTR_ERR(clk));
+		kfree(pll);
+	}
+
+	return clk;
+}
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 028312d..27372f7 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -27,6 +27,29 @@ enum imx_sccg_pll_type {
 	SCCG_PLL2,
 };
=20
+enum imx_pll14xx_type {
+	PLL_1416X,
+	PLL_1443X,
+};
+
+/* NOTE: Rate table should be kept sorted in descending order. */
+struct imx_pll14xx_rate_table {
+	unsigned int rate;
+	unsigned int pdiv;
+	unsigned int mdiv;
+	unsigned int sdiv;
+	unsigned int kdiv;
+};
+
+struct imx_pll14xx_clk {
+	enum imx_pll14xx_type type;
+	const struct imx_pll14xx_rate_table *rate_table;
+	int flags;
+};
+
+struct clk *imx_clk_pll14xx(const char *name, const char *parent_name,
+		 void __iomem *base, const struct imx_pll14xx_clk *pll_clk);
+
 struct clk *imx_clk_pllv1(enum imx_pllv1_type type, const char *name,
 		const char *parent, void __iomem *base);
=20
--=20
1.9.1
