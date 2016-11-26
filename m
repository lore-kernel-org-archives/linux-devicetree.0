From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH 33/39] mtd: nand: denali: support 1024 byte ECC step size
Date: Sun, 27 Nov 2016 03:06:19 +0900
Message-ID: <1480183585-592-34-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480183585-592-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This driver was originally written for the Intel MRST platform with
several platform specific parameters hard-coded.  Another thing we
need to fix is the hard-coded ECC step size.  Currently, it is
defined as follows:

  #define ECC_SECTOR_SIZE 512

(somehow, it is defined in both denali.c and denali.h)

This must be avoided because the Denali IP supports 1024 byte ECC
size as well.  Add a new flag DENALI_CAPS_ECC_SIZE_1024. If it is
specified, ecc.size is set to 1024, otherwise set to 512.

We can use "nand-ecc-step-size" DT property to override the ecc.size
if we want, but this capability flag can provide the reasonable
default because it is associated with the DT compatible strings.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

 .../devicetree/bindings/mtd/denali-nand.txt        |  4 ++++
 drivers/mtd/nand/denali.c                          | 26 +++++++++++-----------
 drivers/mtd/nand/denali.h                          |  3 +--
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index 603110b..e9d5818 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -6,6 +6,10 @@ Required properties:
   - reg-names: Should contain the reg names "nand_data" and "denali_reg"
   - interrupts : The interrupt number.
 
+Optional properties:
+  - nand-ecc-step-size: must be 512 or 1024.  If not specified, default to 512.
+    see nand.txt for details.
+
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
 
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 63f7500..5d80f16 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -894,8 +894,6 @@ static bool denali_hw_ecc_fixup(struct denali_nand_info *denali,
 	return false;
 }
 
-#define ECC_SECTOR_SIZE 512
-
 #define ECC_SECTOR(x)	(((x) & ECC_ERROR_ADDRESS__SECTOR_NR) >> 12)
 #define ECC_BYTE(x)	(((x) & ECC_ERROR_ADDRESS__OFFSET))
 #define ECC_CORRECTION_VALUE(x) ((x) & ERR_CORRECTION_INFO__BYTEMASK)
@@ -908,6 +906,7 @@ static bool denali_sw_ecc_fixup(struct denali_nand_info *denali, u8 *buf,
 {
 	bool check_erased_page = false;
 	unsigned int bitflips = 0;
+	unsigned int ecc_size = denali->nand.ecc.size;
 	u32 err_address, err_correction_info, err_byte, err_sector, err_device,
 	    err_correction_value;
 
@@ -930,18 +929,18 @@ static bool denali_sw_ecc_fixup(struct denali_nand_info *denali, u8 *buf,
 
 		if (ECC_ERROR_CORRECTABLE(err_correction_info)) {
 			/*
-			 * If err_byte is larger than ECC_SECTOR_SIZE, means error
+			 * If err_byte is larger than ecc_size, means error
 			 * happened in OOB, so we ignore it. It's no need for
 			 * us to correct it err_device is represented the NAND
 			 * error bits are happened in if there are more than
 			 * one NAND connected.
 			 */
-			if (err_byte < ECC_SECTOR_SIZE) {
+			if (err_byte < ecc_size) {
 				struct mtd_info *mtd =
 					nand_to_mtd(&denali->nand);
 				int offset;
 
-				offset = (err_sector * ECC_SECTOR_SIZE + err_byte) *
+				offset = (err_sector * ecc_size + err_byte) *
 					denali->devnum + err_device;
 				/* correct the ECC error */
 				buf[offset] ^= err_correction_value;
@@ -1590,22 +1589,25 @@ int denali_init(struct denali_nand_info *denali)
 	/* no subpage writes on denali */
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
 
+	/* If "nand-ecc-step-size" DT property is specified, respect it */
+	if (!chip->ecc.size)
+		chip->ecc.size = denali->caps & DENALI_CAPS_ECC_SIZE_1024 ?
+								1024 : 512;
+
 	/*
 	 * Denali Controller only support 15bit and 8bit ECC in MRST,
 	 * so just let controller do 15bit ECC for MLC and 8bit ECC for
 	 * SLC if possible.
 	 * */
 	if (!nand_is_slc(chip) &&
-			(mtd->oobsize > (denali->bbtskipbytes +
-			ECC_15BITS * (mtd->writesize /
-			ECC_SECTOR_SIZE)))) {
+			mtd->oobsize > denali->bbtskipbytes +
+			ECC_15BITS * (mtd->writesize / chip->ecc.size)) {
 		/* if MLC OOB size is large enough, use 15bit ECC*/
 		chip->ecc.strength = 15;
 		chip->ecc.bytes = ECC_15BITS;
 		iowrite32(15, denali->flash_reg + ECC_CORRECTION);
-	} else if (mtd->oobsize < (denali->bbtskipbytes +
-			ECC_8BITS * (mtd->writesize /
-			ECC_SECTOR_SIZE))) {
+	} else if (mtd->oobsize <
+		   denali->bbtskipbytes + ECC_8BITS * (mtd->writesize / chip->ecc.size)) {
 		pr_err("Your NAND chip OOB is not large enough to contain 8bit ECC correction codes");
 		goto failed_req_irq;
 	} else {
@@ -1616,8 +1618,6 @@ int denali_init(struct denali_nand_info *denali)
 
 	mtd_set_ooblayout(mtd, &denali_ooblayout_ops);
 
-	/* override the default read operations */
-	chip->ecc.size = ECC_SECTOR_SIZE;
 	chip->ecc.read_page = denali_read_page;
 	chip->ecc.read_page_raw = denali_read_page_raw;
 	chip->ecc.write_page = denali_write_page;
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index d621b74..5209625 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -396,8 +396,6 @@
 #define MODE_10    0x08000000
 #define MODE_11    0x0C000000
 
-#define ECC_SECTOR_SIZE     512
-
 struct nand_buf {
 	int head;
 	int tail;
@@ -434,6 +432,7 @@ struct denali_nand_info {
 #define DENALI_CAPS_HW_ECC_FIXUP		BIT(0)
 #define DENALI_CAPS_DMA_64BIT			BIT(1)
 #define DENALI_CAPS_NEW_N_BANKS_FORMAT		BIT(2)
+#define DENALI_CAPS_ECC_SIZE_1024		BIT(3)
 };
 
 extern int denali_init(struct denali_nand_info *denali);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
