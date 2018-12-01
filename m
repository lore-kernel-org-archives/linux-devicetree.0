From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v15 4/5] clk: imx: Add imx composite clock
Date: Sat, 1 Dec 2018 10:52:14 +0000
Message-ID: <1543661502-18573-5-git-send-email-abel.vesa@nxp.com>
References: <1543661502-18573-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543661502-18573-1-git-send-email-abel.vesa@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Aisheng DONG <aisheng.dong@nxp.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Abel Vesa <abelvesa@linux.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

Since a lot of clocks on imx8m are formed by a mux, gate, predivider and
divider, the idea here is to combine all of those into one composite clock,
but we need to deal with both predivider and divider at the same time and
therefore we add the imx8m_clk_composite_divider_ops and register
the composite clock with those.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
Suggested-by: Sascha Hauer <s.hauer@pengutronix.de>
Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/clk/imx/Makefile           |   1 +
 drivers/clk/imx/clk-composite-8m.c | 178 +++++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/clk.h              |  16 ++++
 3 files changed, 195 insertions(+)
 create mode 100644 drivers/clk/imx/clk-composite-8m.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index b87513c..237444b 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -3,6 +3,7 @@
 obj-y +=3D \
 	clk.o \
 	clk-busy.o \
+	clk-composite-8m.o \
 	clk-cpu.o \
 	clk-fixup-div.o \
 	clk-fixup-mux.o \
diff --git a/drivers/clk/imx/clk-composite-8m.c b/drivers/clk/imx/clk-compo=
site-8m.c
new file mode 100644
index 0000000..6d9d371
--- /dev/null
+++ b/drivers/clk/imx/clk-composite-8m.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2018 NXP
+ */
+
+#include <linux/errno.h>
+#include <linux/slab.h>
+#include <linux/clk-provider.h>
+
+#include "clk.h"
+
+#define PCG_PREDIV_SHIFT	16
+#define PCG_PREDIV_WIDTH	3
+#define PCG_PREDIV_MAX		8
+
+#define PCG_DIV_SHIFT		0
+#define PCG_DIV_WIDTH		6
+#define PCG_DIV_MAX		64
+
+#define PCG_PCS_SHIFT		24
+#define PCG_PCS_MASK		0x7
+
+#define PCG_CGC_SHIFT		28
+
+static unsigned long imx8m_clk_composite_divider_recalc_rate(struct clk_hw=
 *hw,
+						unsigned long parent_rate)
+{
+	struct clk_divider *divider =3D to_clk_divider(hw);
+	unsigned long prediv_rate;
+	unsigned int prediv_value;
+	unsigned int div_value;
+
+	prediv_value =3D readl(divider->reg) >> divider->shift;
+	prediv_value &=3D clk_div_mask(divider->width);
+
+	prediv_rate =3D divider_recalc_rate(hw, parent_rate, prediv_value,
+						NULL, divider->flags,
+						divider->width);
+
+	div_value =3D readl(divider->reg) >> PCG_DIV_SHIFT;
+	div_value &=3D clk_div_mask(PCG_DIV_WIDTH);
+
+	return divider_recalc_rate(hw, prediv_rate, div_value, NULL,
+				   divider->flags, PCG_DIV_WIDTH);
+}
+
+static int imx8m_clk_composite_compute_dividers(unsigned long rate,
+						unsigned long parent_rate,
+						int *prediv, int *postdiv)
+{
+	int div1, div2;
+	int error =3D INT_MAX;
+	int ret =3D -EINVAL;
+
+	*prediv =3D 1;
+	*postdiv =3D 1;
+
+	for (div1 =3D 1; div1 <=3D PCG_PREDIV_MAX; div1++) {
+		for (div2 =3D 1; div2 <=3D PCG_DIV_MAX; div2++) {
+			int new_error =3D ((parent_rate / div1) / div2) - rate;
+
+			if (abs(new_error) < abs(error)) {
+				*prediv =3D div1;
+				*postdiv =3D div2;
+				error =3D new_error;
+				ret =3D 0;
+			}
+		}
+	}
+	return ret;
+}
+
+static long imx8m_clk_composite_divider_round_rate(struct clk_hw *hw,
+						unsigned long rate,
+						unsigned long *prate)
+{
+	int prediv_value;
+	int div_value;
+
+	imx8m_clk_composite_compute_dividers(rate, *prate,
+						&prediv_value, &div_value);
+	rate =3D DIV_ROUND_UP(*prate, prediv_value);
+
+	return DIV_ROUND_UP(rate, div_value);
+
+}
+
+static int imx8m_clk_composite_divider_set_rate(struct clk_hw *hw,
+					unsigned long rate,
+					unsigned long parent_rate)
+{
+	struct clk_divider *divider =3D to_clk_divider(hw);
+	unsigned long flags =3D 0;
+	int prediv_value;
+	int div_value;
+	int ret =3D 0;
+	u32 val;
+
+	ret =3D imx8m_clk_composite_compute_dividers(rate, parent_rate,
+						&prediv_value, &div_value);
+	if (ret)
+		return -EINVAL;
+
+	spin_lock_irqsave(divider->lock, flags);
+
+	val =3D readl(divider->reg);
+	val &=3D ~((clk_div_mask(divider->width) << divider->shift) |
+			(clk_div_mask(PCG_DIV_WIDTH) << PCG_DIV_SHIFT));
+
+	val |=3D (u32)(prediv_value  - 1) << divider->shift;
+	val |=3D (u32)(div_value - 1) << PCG_DIV_SHIFT;
+	writel(val, divider->reg);
+
+	spin_unlock_irqrestore(divider->lock, flags);
+
+	return ret;
+}
+
+static const struct clk_ops imx8m_clk_composite_divider_ops =3D {
+	.recalc_rate =3D imx8m_clk_composite_divider_recalc_rate,
+	.round_rate =3D imx8m_clk_composite_divider_round_rate,
+	.set_rate =3D imx8m_clk_composite_divider_set_rate,
+};
+
+struct clk *imx8m_clk_composite_flags(const char *name,
+					const char **parent_names,
+					int num_parents, void __iomem *reg,
+					unsigned long flags)
+{
+	struct clk_hw *hw =3D ERR_PTR(-ENOMEM), *mux_hw;
+	struct clk_hw *div_hw, *gate_hw;
+	struct clk_divider *div =3D NULL;
+	struct clk_gate *gate =3D NULL;
+	struct clk_mux *mux =3D NULL;
+
+	mux =3D kzalloc(sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		goto fail;
+
+	mux_hw =3D &mux->hw;
+	mux->reg =3D reg;
+	mux->shift =3D PCG_PCS_SHIFT;
+	mux->mask =3D PCG_PCS_MASK;
+
+	div =3D kzalloc(sizeof(*div), GFP_KERNEL);
+	if (!div)
+		goto fail;
+
+	div_hw =3D &div->hw;
+	div->reg =3D reg;
+	div->shift =3D PCG_PREDIV_SHIFT;
+	div->width =3D PCG_PREDIV_WIDTH;
+	div->lock =3D &imx_ccm_lock;
+	div->flags =3D CLK_DIVIDER_ROUND_CLOSEST;
+
+	gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		goto fail;
+
+	gate_hw =3D &gate->hw;
+	gate->reg =3D reg;
+	gate->bit_idx =3D PCG_CGC_SHIFT;
+
+	hw =3D clk_hw_register_composite(NULL, name, parent_names, num_parents,
+			mux_hw, &clk_mux_ops, div_hw,
+			&imx8m_clk_composite_divider_ops,
+			gate_hw, &clk_gate_ops, flags);
+	if (IS_ERR(hw))
+		goto fail;
+
+	return hw->clk;
+
+fail:
+	kfree(gate);
+	kfree(div);
+	kfree(mux);
+	return ERR_CAST(hw);
+}
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 864cd8a..cb3e92c 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -239,4 +239,20 @@ struct clk *imx_clk_cpu(const char *name, const char *=
parent_name,
 		struct clk *div, struct clk *mux, struct clk *pll,
 		struct clk *step);
=20
+struct clk *imx8m_clk_composite_flags(const char *name,
+					const char **parent_names,
+					int num_parents, void __iomem *reg,
+					unsigned long flags);
+
+#define __imx8m_clk_composite(name, parent_names, reg, flags) \
+	imx8m_clk_composite_flags(name, parent_names, \
+		ARRAY_SIZE(parent_names), reg, \
+		flags | CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE)
+
+#define imx8m_clk_composite(name, parent_names, reg) \
+	__imx8m_clk_composite(name, parent_names, reg, 0)
+
+#define imx8m_clk_composite_critical(name, parent_names, reg) \
+	__imx8m_clk_composite(name, parent_names, reg, CLK_IS_CRITICAL)
+
 #endif
--=20
2.7.4
