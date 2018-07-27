Return-Path: <SRS0=Pf9O=KL=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 1/2] soc: renesas: identify RZ/A2
Date: Fri, 27 Jul 2018 11:53:32 -0500
Message-Id: <20180727165333.60598-2-chris.brandt@renesas.com>
In-Reply-To: <20180727165333.60598-1-chris.brandt@renesas.com>
References: <20180727165333.60598-1-chris.brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add support for identifying the RZ/A2M (R7S9210) SoC.
Also add support for reading the BSID register which is a different format
than the PRR.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
* Remove 'hard coded' section because there will not be andy non-DT
  legacy support needed
* Make displaying the chip revision more flexible for the future case
  when the revision number from the BSID will be displayed
---
 drivers/soc/renesas/renesas-soc.c | 55 +++++++++++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index d44d0e687ab8..cf06cd84092a 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -46,8 +46,12 @@ static const struct renesas_family fam_rmobile __initconst __maybe_unused = {
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
 };
 
 static const struct renesas_family fam_rzg __initconst __maybe_unused = {
@@ -67,7 +71,12 @@ struct renesas_soc {
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
@@ -184,6 +193,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #ifdef CONFIG_ARCH_R7S72100
 	{ .compatible = "renesas,r7s72100",	.data = &soc_rz_a1h },
 #endif
+#ifdef CONFIG_ARCH_R7S9210
+	{ .compatible = "renesas,r7s9210",	.data = &soc_rz_a2m },
+#endif
 #ifdef CONFIG_ARCH_R8A73A4
 	{ .compatible = "renesas,r8a73a4",	.data = &soc_rmobile_ape6 },
 #endif
@@ -262,7 +274,7 @@ static int __init renesas_soc_init(void)
 	void __iomem *chipid = NULL;
 	struct soc_device *soc_dev;
 	struct device_node *np;
-	unsigned int product;
+	unsigned int product, eshi = 0, eslo;
 
 	match = of_match_node(renesas_socs, of_root);
 	if (!match)
@@ -271,6 +283,31 @@ static int __init renesas_soc_init(void)
 	soc = match->data;
 	family = soc->family;
 
+	np = of_find_compatible_node(NULL, NULL, "renesas,bsid");
+	if (np) {
+		chipid = of_iomap(np, 0);
+		of_node_put(np);
+
+		if (chipid) {
+			product = readl(chipid);
+			iounmap(chipid);
+
+			if (soc->id && ((product >> 16) & 0xff) != soc->id) {
+				pr_warn("SoC mismatch (product = 0x%x)\n",
+					product);
+				return -ENODEV;
+			}
+		}
+
+		/*
+		 * TODO: Upper 4 bits of BSID are for chip version, but the
+		 * format is not known at this time so we don't know how to
+		 * specify eshi and eslo
+		 */
+
+		goto done;
+	}
+
 	/* Try PRR first, then hardcoded fallback */
 	np = of_find_compatible_node(NULL, NULL, "renesas,prr");
 	if (np) {
@@ -289,8 +326,11 @@ static int __init renesas_soc_init(void)
 			pr_warn("SoC mismatch (product = 0x%x)\n", product);
 			return -ENODEV;
 		}
+		eshi = ((product >> 4) & 0x0f) + 1;
+		eslo = product & 0xf;
 	}
 
+done:
 	soc_dev_attr = kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
 	if (!soc_dev_attr)
 		return -ENOMEM;
@@ -302,10 +342,9 @@ static int __init renesas_soc_init(void)
 	soc_dev_attr->family = kstrdup_const(family->name, GFP_KERNEL);
 	soc_dev_attr->soc_id = kstrdup_const(strchr(match->compatible, ',') + 1,
 					     GFP_KERNEL);
-	if (chipid)
-		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "ES%u.%u",
-						   ((product >> 4) & 0x0f) + 1,
-						   product & 0xf);
+	if (eshi)
+		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "ES%u.%u", eshi,
+						   eslo);
 
 	pr_info("Detected Renesas %s %s %s\n", soc_dev_attr->family,
 		soc_dev_attr->soc_id, soc_dev_attr->revision ?: "");
-- 
2.16.1
