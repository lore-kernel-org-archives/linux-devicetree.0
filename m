Return-Path: <SRS0=GvcF=KJ=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 2/3] soc: renesas: identify RZ/A2
Date: Wed, 25 Jul 2018 16:22:19 -0500
Message-Id: <20180725212220.44525-3-chris.brandt@renesas.com>
In-Reply-To: <20180725212220.44525-1-chris.brandt@renesas.com>
References: <20180725212220.44525-1-chris.brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add support for identifying the RZ/A2M (R7S9210) SoC.
Also add support for reading the BSID register which is a different format
than the PRR.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/soc/renesas/renesas-soc.c | 60 +++++++++++++++++++++++++++++++--------
 1 file changed, 48 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index d44d0e687ab8..e528744b07c3 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -20,10 +20,15 @@
 #include <linux/string.h>
 #include <linux/sys_soc.h>
 
+enum {
+	TYPE_PRR,
+	TYPE_BSID,
+};
 
 struct renesas_family {
 	const char name[16];
-	u32 reg;			/* CCCR or PRR, if not in DT */
+	u32 reg;			/* CCCR, PRR or BSID, if not in DT */
+	u8 type;
 };
 
 static const struct renesas_family fam_rcar_gen1 __initconst __maybe_unused = {
@@ -46,8 +51,14 @@ static const struct renesas_family fam_rmobile __initconst __maybe_unused = {
 	.reg	= 0xe600101c,		/* CCCR (Common Chip Code Register) */
 };
 
-static const struct renesas_family fam_rza __initconst __maybe_unused = {
-	.name	= "RZ/A",
+static const struct renesas_family fam_rza1 __initconst __maybe_unused = {
+	.name	= "RZ/A1",
+};
+
+static const struct renesas_family fam_rza2 __initconst __maybe_unused = {
+	.name	= "RZ/A2",
+	.reg	= 0xfcfe8004,		/* BSID (Boundary Scan ID Register) */
+	.type	= TYPE_BSID,
 };
 
 static const struct renesas_family fam_rzg __initconst __maybe_unused = {
@@ -67,7 +78,12 @@ struct renesas_soc {
 };
 
 static const struct renesas_soc soc_rz_a1h __initconst __maybe_unused = {
-	.family	= &fam_rza,
+	.family	= &fam_rza1,
+};
+
+static const struct renesas_soc soc_rz_a2m __initconst __maybe_unused = {
+	.family	= &fam_rza2,
+	.id	= 0x3b,
 };
 
 static const struct renesas_soc soc_rmobile_ape6 __initconst __maybe_unused = {
@@ -184,6 +200,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #ifdef CONFIG_ARCH_R7S72100
 	{ .compatible = "renesas,r7s72100",	.data = &soc_rz_a1h },
 #endif
+#ifdef CONFIG_ARCH_R7S9210
+	{ .compatible = "renesas,r7s9210",	.data = &soc_rz_a2m },
+#endif
 #ifdef CONFIG_ARCH_R8A73A4
 	{ .compatible = "renesas,r8a73a4",	.data = &soc_rmobile_ape6 },
 #endif
@@ -263,6 +282,7 @@ static int __init renesas_soc_init(void)
 	struct soc_device *soc_dev;
 	struct device_node *np;
 	unsigned int product;
+	u8 reg_type = TYPE_PRR;
 
 	match = of_match_node(renesas_socs, of_root);
 	if (!match)
@@ -271,23 +291,39 @@ static int __init renesas_soc_init(void)
 	soc = match->data;
 	family = soc->family;
 
-	/* Try PRR first, then hardcoded fallback */
+	/* Try PRR and BSID first, then hardcoded fallback */
 	np = of_find_compatible_node(NULL, NULL, "renesas,prr");
+	if (!np) {
+		np = of_find_compatible_node(NULL, NULL, "renesas,bsid");
+		if (np)
+			reg_type = TYPE_BSID;
+	}
 	if (np) {
 		chipid = of_iomap(np, 0);
 		of_node_put(np);
 	} else if (soc->id) {
 		chipid = ioremap(family->reg, 4);
+		reg_type = family->type;
 	}
 	if (chipid) {
 		product = readl(chipid);
 		iounmap(chipid);
-		/* R-Car M3-W ES1.1 incorrectly identifies as ES2.0 */
-		if ((product & 0x7fff) == 0x5210)
-			product ^= 0x11;
-		if (soc->id && ((product >> 8) & 0xff) != soc->id) {
-			pr_warn("SoC mismatch (product = 0x%x)\n", product);
-			return -ENODEV;
+
+		if (reg_type == TYPE_PRR) {
+			/* R-Car M3-W ES1.1 incorrectly identifies as ES2.0 */
+			if ((product & 0x7fff) == 0x5210)
+				product ^= 0x11;
+			if (soc->id && ((product >> 8) & 0xff) != soc->id) {
+				pr_warn("SoC mismatch (product = 0x%x)\n",
+					product);
+				return -ENODEV;
+			}
+		} else if (reg_type == TYPE_BSID) {
+			if (soc->id && ((product >> 16) & 0xff) != soc->id) {
+				pr_warn("SoC mismatch (product = 0x%x)\n",
+					product);
+				return -ENODEV;
+			}
 		}
 	}
 
@@ -302,7 +338,7 @@ static int __init renesas_soc_init(void)
 	soc_dev_attr->family = kstrdup_const(family->name, GFP_KERNEL);
 	soc_dev_attr->soc_id = kstrdup_const(strchr(match->compatible, ',') + 1,
 					     GFP_KERNEL);
-	if (chipid)
+	if (chipid && (reg_type == TYPE_PRR))
 		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "ES%u.%u",
 						   ((product >> 4) & 0x0f) + 1,
 						   product & 0xf);
-- 
2.16.1
