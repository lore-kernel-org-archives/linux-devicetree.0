From: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 6/8] mtd: atmel_nand: Support PMECC on SAMA5D2
Date: Fri, 15 Jan 2016 11:35:00 +0100
Message-ID: <1452854102-6125-7-git-send-email-romain.izard.pro@gmail.com>
References: <1452854102-6125-1-git-send-email-romain.izard.pro@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452854102-6125-1-git-send-email-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Starting with the SAMA5D2, there is a new revision of the Atmel PMECC
controller that can correct 32 bits in each sector. This controller is
not 100% compatible with the previous revision that corrected a maximum
of 24 bits by sector, as some register addresses overlap.

Using information from the device tree, we can configure the driver to
work with both versions.

Signed-off-by: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v2: Split rewording of the binding into its own patch

 .../devicetree/bindings/mtd/atmel-nand.txt         |  5 ++++-
 drivers/mtd/nand/atmel_nand.c                      | 23 +++++++++++++++++++++-
 drivers/mtd/nand/atmel_nand_ecc.h                  |  8 ++++++--
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index e68ab404d912..e1887b7d7e53 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
@@ -1,7 +1,10 @@
 Atmel NAND flash
 
 Required properties:
-- compatible : should be "atmel,at91rm9200-nand" or "atmel,sama5d4-nand".
+- compatible: The possible values are:
+	"atmel,at91rm9200-nand"
+	"atmel,sama5d2-nand"
+	"atmel,sama5d4-nand"
 - reg : should specify localbus address and size used for the chip,
 	and hardware ECC controller if available.
 	If the hardware ECC is PMECC, it should contain address and size for
diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 0599f3c5ad3b..f73037a3b51d 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -65,6 +65,7 @@ module_param(on_flash_bbt, int, 0);
 
 struct atmel_nand_caps {
 	bool pmecc_correct_erase_page;
+	uint8_t pmecc_max_correction;
 };
 
 struct atmel_nand_nfc_caps {
@@ -146,6 +147,7 @@ struct atmel_nand_host {
 	int			pmecc_cw_len;	/* Length of codeword */
 
 	void __iomem		*pmerrloc_base;
+	void __iomem		*pmerrloc_el_base;
 	void __iomem		*pmecc_rom_base;
 
 	/* lookup table for alpha_to and index_of */
@@ -817,7 +819,7 @@ static void pmecc_correct_data(struct mtd_info *mtd, uint8_t *buf, uint8_t *ecc,
 	sector_size = host->pmecc_sector_size;
 
 	while (err_nbr) {
-		tmp = pmerrloc_readl_el_relaxed(host->pmerrloc_base, i) - 1;
+		tmp = pmerrloc_readl_el_relaxed(host->pmerrloc_el_base, i) - 1;
 		byte_pos = tmp / 8;
 		bit_pos  = tmp % 8;
 
@@ -1209,6 +1211,8 @@ static int atmel_pmecc_nand_init_params(struct platform_device *pdev,
 		err_no = PTR_ERR(host->pmerrloc_base);
 		goto err;
 	}
+	host->pmerrloc_el_base = host->pmerrloc_base + ATMEL_PMERRLOC_SIGMAx +
+		(host->caps->pmecc_max_correction + 1) * 4;
 
 	if (!host->has_no_lookup_table) {
 		regs_rom = platform_get_resource(pdev, IORESOURCE_MEM, 3);
@@ -2307,17 +2311,34 @@ static int atmel_nand_remove(struct platform_device *pdev)
 	return 0;
 }
 
+/*
+ * AT91RM9200 does not have PMECC or PMECC Errloc peripherals for
+ * BCH ECC. Combined with the "atmel,has-pmecc", it is used to describe
+ * devices from the SAM9 family that have those.
+ */
 static struct atmel_nand_caps at91rm9200_caps = {
 	.pmecc_correct_erase_page = false,
+	.pmecc_max_correction = 24,
 };
 
 static struct atmel_nand_caps sama5d4_caps = {
 	.pmecc_correct_erase_page = true,
+	.pmecc_max_correction = 24,
+};
+
+/*
+ * The PMECC Errloc controller starting in SAMA5D2 is not compatible,
+ * as the increased correction strength requires more registers.
+ */
+static struct atmel_nand_caps sama5d2_caps = {
+	.pmecc_correct_erase_page = true,
+	.pmecc_max_correction = 32,
 };
 
 static const struct of_device_id atmel_nand_dt_ids[] = {
 	{ .compatible = "atmel,at91rm9200-nand", .data = &at91rm9200_caps },
 	{ .compatible = "atmel,sama5d4-nand", .data = &sama5d4_caps },
+	{ .compatible = "atmel,sama5d2-nand", .data = &sama5d2_caps },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/mtd/nand/atmel_nand_ecc.h b/drivers/mtd/nand/atmel_nand_ecc.h
index 668e7358f19b..ec964c43c932 100644
--- a/drivers/mtd/nand/atmel_nand_ecc.h
+++ b/drivers/mtd/nand/atmel_nand_ecc.h
@@ -108,7 +108,11 @@
 #define		PMERRLOC_ERR_NUM_MASK		(0x1f << 8)
 #define		PMERRLOC_CALC_DONE		(1 << 0)
 #define ATMEL_PMERRLOC_SIGMAx		0x028	/* Error location SIGMA x */
-#define ATMEL_PMERRLOC_ELx		0x08c	/* Error location x */
+
+/*
+ * The ATMEL_PMERRLOC_ELx register location depends from the number of
+ * bits corrected by the PMECC controller. Do not use it.
+ */
 
 /* Register access macros for PMECC */
 #define pmecc_readl_relaxed(addr, reg) \
@@ -136,7 +140,7 @@
 	readl_relaxed((addr) + ATMEL_PMERRLOC_SIGMAx + ((n) * 4))
 
 #define pmerrloc_readl_el_relaxed(addr, n) \
-	readl_relaxed((addr) + ATMEL_PMERRLOC_ELx + ((n) * 4))
+	readl_relaxed((addr) + ((n) * 4))
 
 /* Galois field dimension */
 #define PMECC_GF_DIMENSION_13			13
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
