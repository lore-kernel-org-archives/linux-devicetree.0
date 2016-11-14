From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 02/11] soc: renesas: Identify SoC and register with the SoC bus
Date: Mon, 14 Nov 2016 19:37:08 +0100
Message-ID: <1479148637-5399-3-git-send-email-geert+renesas@glider.be>
References: <1479148637-5399-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1479148637-5399-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Dirk Behme <dirk.behme@de.bosch.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Identify the SoC type and revision, and register this information with
the SoC bus, so it is available under /sys/devices/soc0/, and can be
checked where needed using soc_device_match().

Identification is done using the Product Register or Common Chip Code
Register, as declared in DT (PRR only for now), or using a hardcoded
fallback if missing.

Example:

    Detected Renesas R-Car Gen2 r8a7791 ES1.0
    ...
    # cat /sys/devices/soc0/{machine,family,soc_id,revision}
    Koelsch
    R-Car Gen2
    r8a7791
    ES1.0

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Re-add SoC families and family names,
  - Re-add RZ/A1H and R-Car M1A, not providing a revision,
  - On arm, move "select SOC_BUS" to ARCH_RENESAS again,
  - Drop "renesas,cccr" DT support, as the CCCR is not a lone register,
    but part of the HPB/APB block, pending full DT bindings for HPB/APB,
  - Re-add verification of product IDs,
  - Re-add registering the SoC bus if the chip ID register is missing,
  - Revert APE6 fallback to CCCR (it has both), as it's a member of the
    R-Mobile family,
  - Use of_match_node(..., of_root) instead of
    of_find_matching_node_and_match(),
  - Mark structures __maybe_unused to avoid compiler warnings,

v2:
  - Drop SoC families and family names; use fixed "Renesas" instead,
  - Drop EMEV2, which doesn't have a chip ID register, and doesn't share
    devices with other SoCs,
  - Drop RZ/A1H and R-CAR M1A, which don't have chip ID registers (for
    M1A: not accessible from the ARM core?),
  - On arm, move "select SOC_BUS" from ARCH_RENESAS to Kconfig symbols
    for SoCs that provide a chip ID register,
  - Build renesas-soc only if SOC_BUS is enabled,
  - Use "renesas,prr" and "renesas,cccr" device nodes in DT if
    available, else fall back to hardcoded addresses for compatibility
    with existing DTBs,
  - Remove verification of product IDs; just print the ID instead,
  - Don't register the SoC bus if the chip ID register is missing,
  - Change R-Mobile APE6 fallback to use PRR instead of CCCR (it has
    both).
---
 arch/arm/mach-shmobile/Kconfig    |   1 +
 arch/arm64/Kconfig.platforms      |   1 +
 drivers/soc/renesas/Makefile      |   2 +
 drivers/soc/renesas/renesas-soc.c | 257 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 261 insertions(+)
 create mode 100644 drivers/soc/renesas/renesas-soc.c

diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index 6fbd9b7d2d67a18f..5e7b0503921e221f 100644
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -41,6 +41,7 @@ menuconfig ARCH_RENESAS
 	select HAVE_ARM_TWD if SMP
 	select NO_IOPORT_MAP
 	select PINCTRL
+	select SOC_BUS
 	select ZONE_DMA if ARM_LPAE
 
 if ARCH_RENESAS
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 101794f5ce1008b7..b751c6891c6a51ed 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -143,6 +143,7 @@ config ARCH_RENESAS
 	select PM
 	select PM_GENERIC_DOMAINS
 	select RENESAS_IRQC
+	select SOC_BUS
 	help
 	  This enables support for the ARMv8 based Renesas SoCs.
 
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 9e0bb329594c4fca..1652df037955e0e6 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -1,3 +1,5 @@
+obj-$(CONFIG_SOC_BUS)		+= renesas-soc.o
+
 obj-$(CONFIG_ARCH_R8A7743)	+= rcar-sysc.o r8a7743-sysc.o
 obj-$(CONFIG_ARCH_R8A7779)	+= rcar-sysc.o r8a7779-sysc.o
 obj-$(CONFIG_ARCH_R8A7790)	+= rcar-sysc.o r8a7790-sysc.o
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
new file mode 100644
index 0000000000000000..330960312296f603
--- /dev/null
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -0,0 +1,257 @@
+/*
+ * Renesas SoC Identification
+ *
+ * Copyright (C) 2014-2016 Glider bvba
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sys_soc.h>
+
+
+struct renesas_family {
+	const char name[16];
+	u32 reg;			/* CCCR or PRR, if not in DT */
+};
+
+static const struct renesas_family fam_rcar_gen1 __initconst __maybe_unused = {
+	.name	= "R-Car Gen1",
+	.reg	= 0xff000044,		/* PRR (Product Register) */
+};
+
+static const struct renesas_family fam_rcar_gen2 __initconst __maybe_unused = {
+	.name	= "R-Car Gen2",
+	.reg	= 0xff000044,		/* PRR (Product Register) */
+};
+
+static const struct renesas_family fam_rcar_gen3 __initconst __maybe_unused = {
+	.name	= "R-Car Gen3",
+	.reg	= 0xfff00044,		/* PRR (Product Register) */
+};
+
+static const struct renesas_family fam_rmobile __initconst __maybe_unused = {
+	.name	= "R-Mobile",
+	.reg	= 0xe600101c,		/* CCCR (Common Chip Code Register) */
+};
+
+static const struct renesas_family fam_rza __initconst __maybe_unused = {
+	.name	= "RZ/A",
+};
+
+static const struct renesas_family fam_rzg __initconst __maybe_unused = {
+	.name	= "RZ/G",
+	.reg	= 0xff000044,		/* PRR (Product Register) */
+};
+
+static const struct renesas_family fam_shmobile __initconst __maybe_unused = {
+	.name	= "SH-Mobile",
+	.reg	= 0xe600101c,		/* CCCR (Common Chip Code Register) */
+};
+
+
+struct renesas_soc {
+	const struct renesas_family *family;
+	u8 id;
+};
+
+static const struct renesas_soc soc_rz_a1h __initconst __maybe_unused = {
+	.family	= &fam_rza,
+};
+
+static const struct renesas_soc soc_rmobile_ape6 __initconst __maybe_unused = {
+	.family	= &fam_rmobile,
+	.id	= 0x3f,
+};
+
+static const struct renesas_soc soc_rmobile_a1 __initconst __maybe_unused = {
+	.family	= &fam_rmobile,
+	.id	= 0x40,
+};
+
+static const struct renesas_soc soc_rz_g1m __initconst __maybe_unused = {
+	.family	= &fam_rzg,
+	.id	= 0x47,
+};
+
+static const struct renesas_soc soc_rz_g1e __initconst __maybe_unused = {
+	.family	= &fam_rzg,
+	.id	= 0x4c,
+};
+
+static const struct renesas_soc soc_rcar_m1a __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen1,
+};
+
+static const struct renesas_soc soc_rcar_h1 __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen1,
+	.id	= 0x3b,
+};
+
+static const struct renesas_soc soc_rcar_h2 __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen2,
+	.id	= 0x45,
+};
+
+static const struct renesas_soc soc_rcar_m2_w __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen2,
+	.id	= 0x47,
+};
+
+static const struct renesas_soc soc_rcar_v2h __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen2,
+	.id	= 0x4a,
+};
+
+static const struct renesas_soc soc_rcar_m2_n __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen2,
+	.id	= 0x4b,
+};
+
+static const struct renesas_soc soc_rcar_e2 __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen2,
+	.id	= 0x4c,
+};
+
+static const struct renesas_soc soc_rcar_h3 __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen3,
+	.id	= 0x4f,
+};
+
+static const struct renesas_soc soc_rcar_m3_w __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen3,
+	.id	= 0x52,
+};
+
+static const struct renesas_soc soc_shmobile_ag5 __initconst __maybe_unused = {
+	.family	= &fam_shmobile,
+	.id	= 0x37,
+};
+
+
+static const struct of_device_id renesas_socs[] __initconst = {
+#ifdef CONFIG_ARCH_R7S72100
+	{ .compatible = "renesas,r7s72100",	.data = &soc_rz_a1h },
+#endif
+#ifdef CONFIG_ARCH_R8A73A4
+	{ .compatible = "renesas,r8a73a4",	.data = &soc_rmobile_ape6 },
+#endif
+#ifdef CONFIG_ARCH_R8A7740
+	{ .compatible = "renesas,r8a7740",	.data = &soc_rmobile_a1 },
+#endif
+#ifdef CONFIG_ARCH_R8A7743
+	{ .compatible = "renesas,r8a7743",	.data = &soc_rz_g1m },
+#endif
+#ifdef CONFIG_ARCH_R8A7745
+	{ .compatible = "renesas,r8a7745",	.data = &soc_rz_g1e },
+#endif
+#ifdef CONFIG_ARCH_R8A7778
+	{ .compatible = "renesas,r8a7778",	.data = &soc_rcar_m1a },
+#endif
+#ifdef CONFIG_ARCH_R8A7779
+	{ .compatible = "renesas,r8a7779",	.data = &soc_rcar_h1 },
+#endif
+#ifdef CONFIG_ARCH_R8A7790
+	{ .compatible = "renesas,r8a7790",	.data = &soc_rcar_h2 },
+#endif
+#ifdef CONFIG_ARCH_R8A7791
+	{ .compatible = "renesas,r8a7791",	.data = &soc_rcar_m2_w },
+#endif
+#ifdef CONFIG_ARCH_R8A7792
+	{ .compatible = "renesas,r8a7792",	.data = &soc_rcar_v2h },
+#endif
+#ifdef CONFIG_ARCH_R8A7793
+	{ .compatible = "renesas,r8a7793",	.data = &soc_rcar_m2_n },
+#endif
+#ifdef CONFIG_ARCH_R8A7794
+	{ .compatible = "renesas,r8a7794",	.data = &soc_rcar_e2 },
+#endif
+#ifdef CONFIG_ARCH_R8A7795
+	{ .compatible = "renesas,r8a7795",	.data = &soc_rcar_h3 },
+#endif
+#ifdef CONFIG_ARCH_R8A7796
+	{ .compatible = "renesas,r8a7796",	.data = &soc_rcar_m3_w },
+#endif
+#ifdef CONFIG_ARCH_SH73A0
+	{ .compatible = "renesas,sh73a0",	.data = &soc_shmobile_ag5 },
+#endif
+	{ /* sentinel */ }
+};
+
+static int __init renesas_soc_init(void)
+{
+	struct soc_device_attribute *soc_dev_attr;
+	const struct renesas_family *family;
+	const struct of_device_id *match;
+	const struct renesas_soc *soc;
+	void __iomem *chipid = NULL;
+	struct soc_device *soc_dev;
+	struct device_node *np;
+	unsigned int product;
+
+	match = of_match_node(renesas_socs, of_root);
+	if (!match)
+		return -ENODEV;
+
+	soc = match->data;
+	family = soc->family;
+
+	/* Try PRR first, then hardcoded fallback */
+	np = of_find_compatible_node(NULL, NULL, "renesas,prr");
+	if (np) {
+		chipid = of_iomap(np, 0);
+		of_node_put(np);
+	} else if (soc->id) {
+		chipid = ioremap(family->reg, 4);
+	}
+	if (chipid) {
+		product = readl(chipid);
+		iounmap(chipid);
+		if (soc->id && ((product >> 8) & 0xff) != soc->id) {
+			pr_warn("SoC mismatch (product = 0x%x)\n", product);
+			return -ENODEV;
+		}
+	}
+
+	soc_dev_attr = kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
+	if (!soc_dev_attr)
+		return -ENOMEM;
+
+	np = of_find_node_by_path("/");
+	of_property_read_string(np, "model", &soc_dev_attr->machine);
+	of_node_put(np);
+
+	soc_dev_attr->family = kstrdup_const(family->name, GFP_KERNEL);
+	soc_dev_attr->soc_id = kstrdup_const(strchr(match->compatible, ',') + 1,
+					     GFP_KERNEL);
+	if (chipid)
+		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "ES%u.%u",
+						   ((product >> 4) & 0x0f) + 1,
+						   product & 0xf);
+
+	pr_info("Detected Renesas %s %s %s\n", soc_dev_attr->family,
+		soc_dev_attr->soc_id, soc_dev_attr->revision ?: "");
+
+	soc_dev = soc_device_register(soc_dev_attr);
+	if (IS_ERR(soc_dev)) {
+		kfree(soc_dev_attr->revision);
+		kfree_const(soc_dev_attr->soc_id);
+		kfree_const(soc_dev_attr->family);
+		kfree(soc_dev_attr);
+		return PTR_ERR(soc_dev);
+	}
+
+	return 0;
+}
+core_initcall(renesas_soc_init);
-- 
1.9.1
