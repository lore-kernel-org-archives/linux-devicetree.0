From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH] clk: bcm: Add driver for Northstar ILP clock
Date: Fri, 29 Jul 2016 14:58:32 +0200
Message-ID: <1469797120-29298-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>, Eric Anholt <eric@anholt.net>, Stephen Warren <swarren@wwwdotorg.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

=46rom: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

This clock is present on cheaper Northstar devices like BCM53573 or
BCM47189 using Corex-A7. This driver uses PMU (Power Management Unit)
to calculate clock rate and allows using it in a generic (clk_*) way.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
---
 .../devicetree/bindings/clock/brcm,ns-ilp.txt      |  28 ++++
 drivers/clk/bcm/Makefile                           |   1 +
 drivers/clk/bcm/clk-ns-ilp.c                       | 146 +++++++++++++=
++++++++
 3 files changed, 175 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,ns-ilp=
=2Etxt
 create mode 100644 drivers/clk/bcm/clk-ns-ilp.c

diff --git a/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt b/=
Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
new file mode 100644
index 0000000..c4df38e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
@@ -0,0 +1,28 @@
+Broadcom Northstar ILP clock
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+
+This binding uses the common clock binding:
+    Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+This binding is used for ILP clock on Broadcom Northstar devices using
+Corex-A7 CPU. ILP clock depends on ALP one and has to be calculated on
+runtime.
+
+Required properties:
+- compatible: "brcm,ns-ilp"
+- reg: iomem address range of PMU (Power Management Unit)
+- reg-names: "pmu", the only needed & supported reg right now
+- clocks: should reference an ALP clock
+- clock-names: "alp", the only needed & supported clock right now
+- #clock-cells: should be <0>
+
+Example:
+
+ilp: ilp {
+	compatible =3D "brcm,ns-ilp";
+	reg =3D <0x18012000 0x1000>;
+	reg-names =3D "pmu";
+	clocks =3D <&alp>;
+	clock-names =3D "alp-clk";
+	#clock-cells =3D <0>;
+};
diff --git a/drivers/clk/bcm/Makefile b/drivers/clk/bcm/Makefile
index 1d79bd2..1389379 100644
--- a/drivers/clk/bcm/Makefile
+++ b/drivers/clk/bcm/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_COMMON_CLK_IPROC)	+=3D clk-ns2.o
 obj-$(CONFIG_ARCH_BCM_CYGNUS)	+=3D clk-cygnus.o
 obj-$(CONFIG_ARCH_BCM_NSP)	+=3D clk-nsp.o
 obj-$(CONFIG_ARCH_BCM_5301X)	+=3D clk-nsp.o
+obj-$(CONFIG_ARCH_BCM_5301X)	+=3D clk-ns-ilp.o
diff --git a/drivers/clk/bcm/clk-ns-ilp.c b/drivers/clk/bcm/clk-ns-ilp.=
c
new file mode 100644
index 0000000..230458e8
--- /dev/null
+++ b/drivers/clk/bcm/clk-ns-ilp.c
@@ -0,0 +1,146 @@
+/*
+ * Copyright (C) 2016 Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/slab.h>
+
+#define PMU_XTAL_FREQ_RATIO			0x66c
+#define  XTAL_ALP_PER_4ILP			0x00001fff
+#define  XTAL_CTL_EN				0x80000000
+#define PMU_SLOW_CLK_PERIOD			0x6dc
+
+struct ns_ilp {
+	struct clk *clk;
+	struct clk_hw hw;
+	struct clk *alp_clk;
+	void __iomem *pmu;
+};
+
+static int ns_ilp_enable(struct clk_hw *hw)
+{
+	struct ns_ilp *ilp =3D container_of(hw, struct ns_ilp, hw);
+
+	writel(0x10199, ilp->pmu + PMU_SLOW_CLK_PERIOD);
+	writel(0x10000, ilp->pmu + 0x674);
+
+	return 0;
+}
+
+static unsigned long ns_ilp_recalc_rate(struct clk_hw *hw,
+					unsigned long parent_rate)
+{
+	struct ns_ilp *ilp =3D container_of(hw, struct ns_ilp, hw);
+	void __iomem *pmu =3D ilp->pmu;
+	u32 last_val, cur_val;
+	u32 sum =3D 0, num =3D 0, loop_num =3D 0;
+	u32 avg;
+	int err;
+
+	err =3D clk_prepare_enable(ilp->alp_clk);
+	if (err)
+		return 0;
+
+	/* Enable */
+	writel(XTAL_CTL_EN, pmu + PMU_XTAL_FREQ_RATIO);
+
+	/* Read initial value */
+	last_val =3D readl(pmu + PMU_XTAL_FREQ_RATIO) & XTAL_ALP_PER_4ILP;
+
+	/* Try getting 20 different values for calculating average */
+	while (num < 20) {
+		cur_val =3D readl(pmu + PMU_XTAL_FREQ_RATIO) & XTAL_ALP_PER_4ILP;
+
+		if (cur_val !=3D last_val) {
+			/* Got different value, use it */
+			sum +=3D cur_val;
+			num++;
+			loop_num =3D 0;
+			last_val =3D cur_val;
+		} else if (++loop_num > 5000) {
+			/* Same value over and over, give up */
+			sum +=3D cur_val;
+			num++;
+			break;
+		}
+	}
+
+	/* Disable */
+	writel(0x0, pmu + PMU_XTAL_FREQ_RATIO);
+
+	avg =3D sum / num;
+
+	return clk_get_rate(ilp->alp_clk) * 4 / avg;
+}
+
+const struct clk_ops ns_ilp_clk_ops =3D {
+	.enable =3D ns_ilp_enable,
+	.recalc_rate =3D ns_ilp_recalc_rate,
+};
+
+static void ns_ilp_init(struct device_node *np)
+{
+	struct ns_ilp *ilp;
+	struct resource res;
+	struct clk_init_data init =3D { 0 };
+	int index;
+	int err;
+
+	ilp =3D kzalloc(sizeof(*ilp), GFP_KERNEL);
+	if (!ilp)
+		return;
+
+	index =3D of_property_match_string(np, "reg-names", "pmu");
+	if (index < 0) {
+		err =3D index;
+		goto err_free_ilp;
+	}
+	err =3D of_address_to_resource(np, index, &res);
+	if (err) {
+		err =3D index;
+		goto err_free_ilp;
+	}
+	ilp->pmu =3D ioremap_nocache(res.start, resource_size(&res));
+	if (IS_ERR(ilp->pmu)) {
+		err =3D PTR_ERR(ilp->pmu);
+		goto err_free_ilp;
+	}
+
+	ilp->alp_clk =3D of_clk_get_by_name(np, "alp-clk");
+	if (IS_ERR(ilp->alp_clk)) {
+		err =3D PTR_ERR(ilp->alp_clk);
+		goto err_unmap_pmu;
+	}
+
+	init.name =3D np->name;
+	init.ops =3D &ns_ilp_clk_ops;
+	init.flags =3D CLK_IS_ROOT;
+
+	ilp->hw.init =3D &init;
+	ilp->clk =3D clk_register(NULL, &ilp->hw);
+	if (WARN_ON(IS_ERR(ilp->clk)))
+		goto err_put_alp_clk;
+
+	of_clk_add_provider(np, of_clk_src_simple_get, ilp->clk);
+
+	return;
+
+err_put_alp_clk:
+	clk_put(ilp->alp_clk);
+err_unmap_pmu:
+	iounmap(ilp->pmu);
+err_free_ilp:
+	kfree(ilp);
+	pr_err("Failed to init ILP clock: %d\n", err);
+}
+CLK_OF_DECLARE(ns_ilp_clk, "brcm,ns-ilp", ns_ilp_init);
--=20
1.8.4.5

