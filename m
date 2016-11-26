From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH 37/39] mtd: nand: denali: support "nand-ecc-strength" DT property
Date: Sun, 27 Nov 2016 03:06:23 +0900
Message-ID: <1480183585-592-38-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480183585-592-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Historically, this driver tried to choose as big ECC strength as
possible, but it would be reasonable to allow DT to set a particular
ECC strength with "nand-ecc-strength" property.

Going forward, DT platforms should specify "nand-ecc-strength" or
"nand-ecc-maximize" to show the ECC strength strategy explicitly.

If nothing is specified in DT, "nand-ecc-maximize" is implied since
this was the original behavior.  It applies to PCI platforms too.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

 .../devicetree/bindings/mtd/denali-nand.txt        |  5 ++++
 drivers/mtd/nand/denali.c                          | 27 +++++++++++++++++++++-
 drivers/mtd/nand/denali_pci.c                      |  2 ++
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index e9d5818..51fe195 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -9,6 +9,11 @@ Required properties:
 Optional properties:
   - nand-ecc-step-size: must be 512 or 1024.  If not specified, default to 512.
     see nand.txt for details.
+  - nand-ecc-strength: see nand.txt for details
+  - nand-ecc-maximize: see nand.txt for details
+
+Note:
+Either nand-ecc-strength or nand-ecc-maximize should be specified.
 
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 54c9e0c..df174ca 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1393,6 +1393,21 @@ static int denali_set_max_ecc_strength(struct denali_nand_info *denali)
 	return -EINVAL;
 }
 
+static int denali_check_ecc_strength(struct denali_nand_info *denali)
+{
+	const int *ecc_strength = denali->ecc_strength_avail;
+
+	for (; *ecc_strength; ecc_strength++) {
+		if (*ecc_strength == denali->nand.ecc.strength)
+			return 0;
+	}
+
+	dev_err(denali->dev,
+		"Specified ECC strength is not supported for this controller.\n");
+
+	return -EINVAL;
+}
+
 static int denali_ooblayout_ecc(struct mtd_info *mtd, int section,
 				struct mtd_oob_region *oobregion)
 {
@@ -1628,7 +1643,17 @@ int denali_init(struct denali_nand_info *denali)
 	if (!denali->ecc_strength_avail)
 		denali->ecc_strength_avail = denali_default_ecc_strength;
 
-	ret = denali_set_max_ecc_strength(denali);
+	if (!chip->ecc.strength && !(chip->ecc.options & NAND_ECC_MAXIMIZE)) {
+		dev_info(denali->dev,
+			"No ECC strength is specified.  Trying max ECC strength strategy\n");
+		chip->ecc.options |= NAND_ECC_MAXIMIZE;
+	}
+
+	if (chip->ecc.options & NAND_ECC_MAXIMIZE)
+		ret = denali_set_max_ecc_strength(denali);
+	else
+		ret = denali_check_ecc_strength(denali);
+
 	if (ret)
 		goto failed_req_irq;
 
diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index ac84323..0064f3e 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -85,6 +85,8 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		goto failed_remap_reg;
 	}
 
+	denali->nand.ecc.options |= NAND_ECC_MAXIMIZE;
+
 	ret = denali_init(denali);
 	if (ret)
 		goto failed_remap_mem;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
