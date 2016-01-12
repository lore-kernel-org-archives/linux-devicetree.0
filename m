From: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH 3/4] mtd: atmel_nand: Support 32-bit ECC strength
Date: Tue, 12 Jan 2016 15:33:42 +0100
Message-ID: <1452609223-14790-4-git-send-email-romain.izard.pro@gmail.com>
References: <1452609223-14790-1-git-send-email-romain.izard.pro@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452609223-14790-1-git-send-email-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Starting with the SAMA5D2, there is a new revision of the Atmel PMECC
controller that can correct 32 bits in each sector. This controller is
not 100% compatible with the previous revision that corrected a maximum
of 24 bits by sector, as some register addresses overlap.

Using information from the device tree, we can configure the driver to
work with both versions.

Signed-off-by: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/mtd/atmel-nand.txt         | 10 +++--
 drivers/mtd/nand/atmel_nand.c                      | 43 +++++++++++++++++++---
 drivers/mtd/nand/atmel_nand_ecc.h                  |  9 ++++-
 3 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index 89b0db9801b0..ef0db8e2a0fd 100644
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
@@ -22,9 +25,10 @@ Optional properties:
   Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
   "soft_bch".
 - atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardware.
-  Only supported by at91sam9x5 or later sam9 product.
+  Supported by AT91SAM9x5 or later SAM9 chips, and SAMA5 chips.
 - atmel,pmecc-cap : error correct capability for Programmable Multibit ECC
-  Controller. Supported values are: 2, 4, 8, 12, 24.
+  Controller. Supported values are: 2, 4, 8, 12, 24. SAMA5D2 also supports
+  32.
 - atmel,pmecc-sector-size : sector size for ECC computation. Supported values
   are: 512, 1024.
 - atmel,pmecc-lookup-table-offset : includes two offsets of lookup table in ROM
diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index e5d7e7e63f49..cd55d54a9a7d 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -65,6 +65,7 @@ module_param(on_flash_bbt, int, 0);
 
 struct atmel_nand_caps {
 	bool pmecc_correct_erase_page;
+	uint8_t pmecc_max_correction;
 };
 
 struct atmel_nand_nfc_priv {
@@ -146,6 +147,7 @@ struct atmel_nand_host {
 	int			pmecc_cw_len;	/* Length of codeword */
 
 	void __iomem		*pmerrloc_base;
+	void __iomem		*pmerrloc_el_base;
 	void __iomem		*pmecc_rom_base;
 
 	/* lookup table for alpha_to and index_of */
@@ -472,6 +474,7 @@ static void atmel_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
  *                8-bits                13-bytes                 14-bytes
  *               12-bits                20-bytes                 21-bytes
  *               24-bits                39-bytes                 42-bytes
+ *               32-bits                52-bytes                 56-bytes
  */
 static int pmecc_get_ecc_bytes(int cap, int sector_size)
 {
@@ -817,7 +820,7 @@ static void pmecc_correct_data(struct mtd_info *mtd, uint8_t *buf, uint8_t *ecc,
 	sector_size = host->pmecc_sector_size;
 
 	while (err_nbr) {
-		tmp = pmerrloc_readl_el_relaxed(host->pmerrloc_base, i) - 1;
+		tmp = pmerrloc_readl_el_relaxed(host->pmerrloc_el_base, i) - 1;
 		byte_pos = tmp / 8;
 		bit_pos  = tmp % 8;
 
@@ -1081,6 +1084,9 @@ static int pmecc_choose_ecc(struct atmel_nand_host *host,
 
 	/* If device tree doesn't specify, use NAND's minimum ECC parameters */
 	if (host->pmecc_corr_cap == 0) {
+		if (*cap > host->caps->pmecc_max_correction)
+			return -EINVAL;
+
 		/* use the most fitable ecc bits (the near bigger one ) */
 		if (*cap <= 2)
 			host->pmecc_corr_cap = 2;
@@ -1092,6 +1098,8 @@ static int pmecc_choose_ecc(struct atmel_nand_host *host,
 			host->pmecc_corr_cap = 12;
 		else if (*cap <= 24)
 			host->pmecc_corr_cap = 24;
+		else if (*cap <= 32)
+			host->pmecc_corr_cap = 32;
 		else
 			return -EINVAL;
 	}
@@ -1208,6 +1216,8 @@ static int atmel_pmecc_nand_init_params(struct platform_device *pdev,
 		err_no = PTR_ERR(host->pmerrloc_base);
 		goto err;
 	}
+	host->pmerrloc_el_base = host->pmerrloc_base + ATMEL_PMERRLOC_SIGMAx +
+		(host->caps->pmecc_max_correction + 1) * 4;
 
 	if (!host->has_no_lookup_table) {
 		regs_rom = platform_get_resource(pdev, IORESOURCE_MEM, 3);
@@ -1550,10 +1560,16 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
 	 * them from NAND ONFI parameters.
 	 */
 	if (of_property_read_u32(np, "atmel,pmecc-cap", &val) == 0) {
-		if ((val != 2) && (val != 4) && (val != 8) && (val != 12) &&
-				(val != 24)) {
+		if (val > host->caps->pmecc_max_correction) {
+			dev_err(host->dev,
+				"Required ECC strength too high: %u max %u\n",
+				val, host->caps->pmecc_max_correction);
+			return -EINVAL;
+		}
+		if ((val != 2)  && (val != 4)  && (val != 8) &&
+		    (val != 12) && (val != 24) && (val != 32)) {
 			dev_err(host->dev,
-				"Unsupported PMECC correction capability: %d; should be 2, 4, 8, 12 or 24\n",
+				"Required ECC strength not supported: %u\n",
 				val);
 			return -EINVAL;
 		}
@@ -1563,7 +1579,7 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
 	if (of_property_read_u32(np, "atmel,pmecc-sector-size", &val) == 0) {
 		if ((val != 512) && (val != 1024)) {
 			dev_err(host->dev,
-				"Unsupported PMECC sector size: %d; should be 512 or 1024 bytes\n",
+				"Required ECC sector size not supported: %u\n",
 				val);
 			return -EINVAL;
 		}
@@ -2307,17 +2323,34 @@ static int atmel_nand_remove(struct platform_device *pdev)
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
index 668e7358f19b..b1d436d8bb7a 100644
--- a/drivers/mtd/nand/atmel_nand_ecc.h
+++ b/drivers/mtd/nand/atmel_nand_ecc.h
@@ -43,6 +43,7 @@
 #define		PMECC_CFG_BCH_ERR8		(2 << 0)
 #define		PMECC_CFG_BCH_ERR12		(3 << 0)
 #define		PMECC_CFG_BCH_ERR24		(4 << 0)
+#define		PMECC_CFG_BCH_ERR25		(5 << 0)
 
 #define		PMECC_CFG_SECTOR512		(0 << 4)
 #define		PMECC_CFG_SECTOR1024		(1 << 4)
@@ -108,7 +109,11 @@
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
@@ -136,7 +141,7 @@
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
