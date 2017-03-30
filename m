From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH v3 14/37] mtd: nand: denali: support "nand-ecc-strength" DT property
Date: Thu, 30 Mar 2017 15:46:00 +0900
Message-ID: <1490856383-31560-15-git-send-email-yamada.masahiro@socionext.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490856383-31560-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Enrico Jorns <ejo-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chuanxiao Dong <chuanxiao.dong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Historically, this driver tried to choose as big ECC strength as
possible, but it would be reasonable to allow DT to set a particular
ECC strength with "nand-ecc-strength" property.  This is useful
when a particular ECC setting is hard-coded by firmware (or hard-
wired by boot ROM).

If no ECC strength is specified in DT, "nand-ecc-maximize" is implied
since this was the original behavior.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---

Changes in v3: None
Changes in v2:
  - Add available values in the binding document

 Documentation/devicetree/bindings/mtd/denali-nand.txt |  6 ++++++
 drivers/mtd/nand/denali.c                             | 18 ++++++++++++++++--
 drivers/mtd/nand/denali_pci.c                         |  1 +
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index 25313c7..647618e 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -11,6 +11,12 @@ Optional properties:
   - nand-ecc-step-size: must be 512 or 1024.  If not specified, default to:
       512   for "altr,socfpga-denali-nand"
     see nand.txt for details.
+  - nand-ecc-strength: see nand.txt for details.  Available values are:
+      8, 15      for "altr,socfpga-denali-nand"
+  - nand-ecc-maximize: see nand.txt for details
+
+Note:
+Either nand-ecc-strength or nand-ecc-maximize should be specified.
 
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index ce87b95..2f796e3 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1641,9 +1641,23 @@ int denali_init(struct denali_nand_info *denali)
 		goto failed_req_irq;
 	}
 
-	ret = denali_set_max_ecc_strength(denali);
-	if (ret)
+	if (!chip->ecc.strength && !(chip->ecc.options & NAND_ECC_MAXIMIZE)) {
+		dev_info(denali->dev,
+			 "No ECC strength strategy is specified. Maximizing ECC strength\n");
+		chip->ecc.options |= NAND_ECC_MAXIMIZE;
+	}
+
+	if (chip->ecc.options & NAND_ECC_MAXIMIZE) {
+		ret = denali_set_max_ecc_strength(denali);
+		if (ret)
+			goto failed_req_irq;
+	} else if (!(denali->ecc_strength_avail & BIT(chip->ecc.strength))) {
+		dev_err(denali->dev,
+			"ECC strength %d is not supported on this controller.\n",
+			chip->ecc.strength);
+		ret = -EINVAL;
 		goto failed_req_irq;
+	}
 
 	chip->ecc.bytes = denali_calc_ecc_bytes(chip->ecc.size,
 						chip->ecc.strength);
diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index a1ee9f8..a39682a5 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -87,6 +87,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	denali->ecc_strength_avail = BIT(15) | BIT(8);
 	denali->caps |= DENALI_CAP_ECC_SIZE_512;
+	denali->nand.ecc.options |= NAND_ECC_MAXIMIZE;
 
 	ret = denali_init(denali);
 	if (ret)
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
