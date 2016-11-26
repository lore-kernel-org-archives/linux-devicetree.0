From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH 39/39] mtd: nand: denali_dt: add compatible strings for UniPhier SoC variants
Date: Sun, 27 Nov 2016 03:06:25 +0900
Message-ID: <1480183585-592-40-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480183585-592-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add two compatible strings for UniPhier SoCs.  The revision register
on both shows revision 5.0, but they are different hardware.

Features:
 - DMA engine with 64 bit physical address support
 - 1024 byte ECC step size
 - 8 / 16 / 24 bit ECC strength
 - The n_banks format depends on SoC

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

 .../devicetree/bindings/mtd/denali-nand.txt        | 10 +++++--
 drivers/mtd/nand/denali_dt.c                       | 33 ++++++++++++++++++++--
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index 51fe195..cea46e2 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -1,13 +1,19 @@
 * Denali NAND controller
 
 Required properties:
-  - compatible : should be "denali,denali-nand-dt"
+  - compatible : should be one of the following:
+      "denali,denali-nand-dt"
+      "denali,denali-nand-uniphier-v5a"
+      "denali,denali-nand-uniphier-v5b"
   - reg : should contain registers location and length for data and reg.
   - reg-names: Should contain the reg names "nand_data" and "denali_reg"
   - interrupts : The interrupt number.
 
 Optional properties:
-  - nand-ecc-step-size: must be 512 or 1024.  If not specified, default to 512.
+  - nand-ecc-step-size: must be 512 or 1024.  If not specified, default to:
+      512  for "denali,denali-nand-dt"
+      1024 for "denali,denali-nand-uniphier-v5a"
+      1024 for "denali,denali-nand-uniphier-v5b"
     see nand.txt for details.
   - nand-ecc-strength: see nand.txt for details
   - nand-ecc-maximize: see nand.txt for details
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index aa1e032..b411889 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -34,10 +34,37 @@ struct denali_dt_data {
 	unsigned int caps;
 };
 
+static const int denali_uniphier_ecc_strength[] = {
+	24, 16, 8, 0,
+};
+
+static const struct denali_dt_data denali_uniphier_v5a_data = {
+	.ecc_strength_avail = denali_uniphier_ecc_strength,
+	.caps = DENALI_CAPS_DMA_64BIT |
+		DENALI_CAPS_ECC_SIZE_1024,
+};
+
+static const struct denali_dt_data denali_uniphier_v5b_data = {
+	.ecc_strength_avail = denali_uniphier_ecc_strength,
+	.caps = DENALI_CAPS_DMA_64BIT |
+		DENALI_CAPS_NEW_N_BANKS_FORMAT |
+		DENALI_CAPS_ECC_SIZE_1024,
+};
+
 static const struct of_device_id denali_nand_dt_ids[] = {
-		{ .compatible = "denali,denali-nand-dt" },
-		{ /* sentinel */ }
-	};
+	{
+		.compatible = "denali,denali-nand-dt",
+	},
+	{
+		.compatible = "denali,denali-nand-uniphier-v5a",
+		.data = &denali_uniphier_v5a_data,
+	},
+	{
+		.compatible = "denali,denali-nand-uniphier-v5b",
+		.data = &denali_uniphier_v5b_data,
+	},
+	{ /* sentinel */ }
+};
 
 MODULE_DEVICE_TABLE(of, denali_nand_dt_ids);
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
