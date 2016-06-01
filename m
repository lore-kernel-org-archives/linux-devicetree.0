From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/1] soc: renesas: Add DT fixup code for missing r8a7791 RST
Date: Wed,  1 Jun 2016 21:50:50 +0200
Message-ID: <1464810650-23002-2-git-send-email-geert+renesas@glider.be>
References: <1464810650-23002-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1464810650-23002-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Dirk Behme <dirk.behme@de.bosch.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Arnd Bergmann <arnd@arndb.de>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add DT fixup code to add a reset-controller node for the r8a7791 RST
module if it's not yet present.

This allows the R-Car Gen2 clock driver to use the RST driver to obtain
the value of the mode pins, instead of reading from a hardcoded address
in rcar_gen2_read_mode_pins(), while providing backward compatibility
with old DTBs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
---
 drivers/soc/renesas/Makefile           |   4 +
 drivers/soc/renesas/renesas-dt-fixup.c | 159 +++++++++++++++++++++++++++++++++
 2 files changed, 163 insertions(+)
 create mode 100644 drivers/soc/renesas/renesas-dt-fixup.c

diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 0d732ff893dd8fba..e5f4454821ca6f63 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -1,3 +1,7 @@
+# FIXME Depend on new Kconfig symbol CONFIG_ARCH_RENESAS_LEGACY
+# FIXME Needs OF_DYNAMIC
+obj-$(CONFIG_ARCH_RENESAS)	+= renesas-dt-fixup.o
+
 obj-$(CONFIG_ARCH_RCAR_GEN1)	+= rcar-rst.o
 obj-$(CONFIG_ARCH_RCAR_GEN2)	+= rcar-rst.o
 obj-$(CONFIG_ARCH_R8A7795)	+= rcar-rst.o
diff --git a/drivers/soc/renesas/renesas-dt-fixup.c b/drivers/soc/renesas/renesas-dt-fixup.c
new file mode 100644
index 0000000000000000..83c9ca6b44f8136c
--- /dev/null
+++ b/drivers/soc/renesas/renesas-dt-fixup.c
@@ -0,0 +1,159 @@
+/*
+ * Renesas DT Fixup Code
+ *
+ * Provide backwards compatibility with old DTBs by updating the DT
+ *
+ * Copyright (C) 2016 Glider bvba
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+
+#define RST_BASE	0xe6160000
+#define RST_SIZE	0x0100		/* R-Car Gen2 */
+
+static struct property rst_compatible = {
+	.name = "compatible",
+};
+
+static __be32 rst_reg_values[4] = {
+	cpu_to_be32(0),
+	cpu_to_be32(RST_BASE),
+	cpu_to_be32(0),
+	cpu_to_be32(RST_SIZE),
+};
+
+static struct property rst_name = {
+	.name = "name",
+	.length = sizeof("reset-controller"),
+	.value = "reset-controller",
+};
+
+static struct property rst_reg = {
+	.name = "reg",
+	.length = sizeof(rst_reg_values),
+	.value = rst_reg_values,
+};
+
+static int __init add_rst(struct device_node *parent, const char *path,
+			  char *compatible)
+{
+	struct property *prop[] = { &rst_compatible, &rst_name, &rst_reg };
+	struct device_node *np;
+	char *full_name;
+	unsigned int i;
+	int error;
+
+	pr_debug("Adding RST node %s\n", compatible);
+	np = kzalloc(sizeof(*np), GFP_KERNEL);
+	if (!np)
+		return -ENOMEM;
+
+	np->name = kasprintf(GFP_KERNEL, "%s@%x", (char *)rst_name.value,
+			     RST_BASE);
+	full_name = kasprintf(GFP_KERNEL, "%s/%s", path, np->name);
+	np->full_name = full_name;
+	np->parent = parent;
+
+	of_node_set_flag(np, OF_DYNAMIC);
+	of_node_init(np);
+
+	error = of_attach_node(np);
+	if (error) {
+		pr_err("%s: of_attach_node() %s failed %d\n", __func__,
+		       np->name, error);
+		kfree(np);
+		return error;
+	}
+
+	rst_compatible.value = compatible;
+	rst_compatible.length = strlen(rst_compatible.value) + 1;
+
+	for (i = 0; i < ARRAY_SIZE(prop); i++) {
+		error = of_add_property(np, prop[i]);
+		if (error)
+			pr_err("%s: of_add_property() %s/%s failed %d\n",
+			       __func__, np->name, prop[i]->name, error);
+	}
+
+	return 0;
+}
+
+static int __init add_sysc(struct device_node *parent, const char *path,
+			   char *compatible)
+{
+	pr_debug("NOT YET adding SYSC node %s\n", compatible);
+	return 0;
+}
+
+static const struct of_device_id renesas_matches[] __initconst = {
+	{ .compatible = "renesas,r8a7791", },
+	{ /* sentinel */ }
+};
+
+static int __init renesas_dt_fixup(void)
+{
+	const struct of_device_id *match;
+	struct device_node *np, *parent;
+	const char *parent_path;
+	char *compatible;
+
+	np = of_find_node_by_path("/");
+	if (!np)
+		return -ENODEV;
+
+	for (match = renesas_matches; match->compatible[0]; match++)
+		if (of_device_is_compatible(np, match->compatible))
+			break;
+	of_node_put(np);
+
+	if (!match->compatible[0])
+		return -ENODEV;
+
+	/* Find the main SoC bus node */
+	np = of_find_compatible_node(NULL, NULL, "arm,gic-400");
+	if (!np) {
+		pr_warn("%s: Cannot find %s\n", __func__, "arm,gic-400");
+		return -ENODEV;
+	}
+
+	parent = of_get_parent(np);
+	of_node_put(np);
+	if (!parent) {
+		pr_warn("%s: Cannot find GIC parent\n", __func__);
+		return -ENODEV;
+	}
+
+	parent_path = parent->full_name;
+	/* Prevent double leading slash */
+	if (!parent_path[1])
+		parent_path++;
+
+	compatible = kasprintf(GFP_KERNEL, "%s-rst", match->compatible);
+	if (of_find_compatible_node(NULL, NULL, compatible)) {
+		pr_debug("%s: RST node %s present\n", __func__, compatible);
+		kfree(compatible);
+	} else {
+		add_rst(parent, parent_path, compatible);
+	}
+
+	compatible = kasprintf(GFP_KERNEL, "%s-sysc", match->compatible);
+	if (of_find_compatible_node(NULL, NULL, compatible)) {
+		pr_debug("%s: SYSC node %s present\n", __func__, compatible);
+		kfree(compatible);
+	} else {
+		add_sysc(parent, parent_path, compatible);
+	}
+
+	of_node_put(parent);
+	return 0;
+}
+early_initcall(renesas_dt_fixup);
-- 
1.9.1
