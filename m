From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [RESEND PATCH v2 26/53] mtd: nand: denali: support 1024 byte ECC step size
Date: Thu, 23 Mar 2017 05:07:25 +0900
Message-ID: <1490213273-8571-27-git-send-email-yamada.masahiro@socionext.com>
References: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490213273-8571-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: laurent.monat-1zQW0WpQGTYgLlGVC3PcNw@public.gmane.org, thorsten.christiansson-1zQW0WpQGTYgLlGVC3PcNw@public.gmane.org, Enrico Jorns <ejo-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chuanxiao Dong <chuanxiao.dong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This driver was originally written for the Intel MRST platform with
several platform specific parameters hard-coded.  Another thing we
need to fix is the hard-coded ECC step size.  Currently, it is
defined as follows:

  #define ECC_SECTOR_SIZE 512

(somehow, it is defined in both denali.c and denali.h)

This must be avoided because the Denali IP supports 1024B ECC size
as well.  The Denali User's Guide also says supporting both 512B and
1024B ECC sectors is possible, though it would require instantiation
of two different ECC circuits.  So, possible cases are:

 [1] only 512B ECC size is supported
 [2] only 1024B ECC size is supported
 [3] both 512B and 1024B ECC sizes are supported

For [3], the actually used ECC size is specified by some registers.

Newer versions of this IP have the following registers:
  CFG_DATA_BLOCK_SIZE       (0x6b0)
  CFG_LAST_DATA_BLOCK_SIZE  (0x6c0)
  CFG_NUM_DATA_BLOCKS       (0x6d0)

For those versions, the software should set ecc.size and ecc.steps
to these registers.  Old versions do not have such registers, but
they are "reserved", so write accesses are safely ignored.

This commit adds new flags DENALI_CAP_ECC_SIZE_{512,1024}.

The DT property "nand-ecc-step-size" is still optional; a reasonable
default will be chosen for [1] and [2].  For case [3], if exists, it
is recommended to specify the desired ECC size explicitly.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---

Changes in v2:
  - Change the capability prefix DENALI_CAPS_ -> DENALI_CAP_
  - Make ECC 512 cap and ECC 1024 cap independent
  - Set up three CFG_... registers

 .../devicetree/bindings/mtd/denali-nand.txt        |  5 +++
 drivers/mtd/nand/denali.c                          | 44 +++++++++++++++-------
 drivers/mtd/nand/denali.h                          | 12 +++++-
 drivers/mtd/nand/denali_dt.c                       |  3 +-
 drivers/mtd/nand/denali_pci.c                      |  2 +
 5 files changed, 50 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index e593bbe..25313c7 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -7,6 +7,11 @@ Required properties:
   - reg-names: Should contain the reg names "nand_data" and "denali_reg"
   - interrupts : The interrupt number.
 
+Optional properties:
+  - nand-ecc-step-size: must be 512 or 1024.  If not specified, default to:
+      512   for "altr,socfpga-denali-nand"
+    see nand.txt for details.
+
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
 
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index a190cb2..cf8daba 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -875,8 +875,6 @@ static int denali_hw_ecc_fixup(struct mtd_info *mtd,
 	return max_bitflips;
 }
 
-#define ECC_SECTOR_SIZE 512
-
 #define ECC_SECTOR(x)	(((x) & ECC_ERROR_ADDRESS__SECTOR_NR) >> 12)
 #define ECC_BYTE(x)	(((x) & ECC_ERROR_ADDRESS__OFFSET))
 #define ECC_CORRECTION_VALUE(x) ((x) & ERR_CORRECTION_INFO__BYTEMASK)
@@ -887,6 +885,7 @@ static int denali_hw_ecc_fixup(struct mtd_info *mtd,
 static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 			       struct denali_nand_info *denali, uint8_t *buf)
 {
+	unsigned int ecc_size = denali->nand.ecc.size;
 	unsigned int bitflips = 0;
 	unsigned int max_bitflips = 0;
 	unsigned int total_bitflips = 0;
@@ -914,9 +913,9 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 
 		if (ECC_ERROR_UNCORRECTABLE(err_cor_info)) {
 			ret = -EBADMSG;
-		} else if (err_byte < ECC_SECTOR_SIZE) {
+		} else if (err_byte < ecc_size) {
 			/*
-			 * If err_byte is larger than ECC_SECTOR_SIZE, means error
+			 * If err_byte is larger than ecc_size, means error
 			 * happened in OOB, so we ignore it. It's no need for
 			 * us to correct it err_device is represented the NAND
 			 * error bits are happened in if there are more than
@@ -925,7 +924,7 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 			int offset;
 			unsigned int flips_in_byte;
 
-			offset = (err_sector * ECC_SECTOR_SIZE + err_byte) *
+			offset = (err_sector * ecc_size + err_byte) *
 						denali->devnum + err_device;
 
 			/* correct the ECC error */
@@ -1579,22 +1578,37 @@ int denali_init(struct denali_nand_info *denali)
 	/* no subpage writes on denali */
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
 
+	if (!chip->ecc.size) {
+		if (denali->caps & DENALI_CAP_ECC_SIZE_512)
+			chip->ecc.size = 512;
+		if (denali->caps & DENALI_CAP_ECC_SIZE_1024)
+			chip->ecc.size = 1024;
+		if (WARN(!chip->ecc.size, "must support at least 512 or 1024 ECC size"))
+			goto failed_req_irq;
+	}
+
+	if ((chip->ecc.size != 512 && chip->ecc.size != 1024) ||
+	    (chip->ecc.size == 512 && !(denali->caps & DENALI_CAP_ECC_SIZE_512)) ||
+	    (chip->ecc.size == 1024 && !(denali->caps & DENALI_CAP_ECC_SIZE_1024))) {
+		dev_err(denali->dev, "specified ECC size %d in not supported",
+			chip->ecc.size);
+		goto failed_req_irq;
+	}
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
@@ -1603,10 +1617,14 @@ int denali_init(struct denali_nand_info *denali)
 		iowrite32(8, denali->flash_reg + ECC_CORRECTION);
 	}
 
+	iowrite32(chip->ecc.size, denali->flash_reg + CFG_DATA_BLOCK_SIZE);
+	iowrite32(chip->ecc.size, denali->flash_reg + CFG_LAST_DATA_BLOCK_SIZE);
+	/* chip->ecc.steps is set by nand_scan_tail(); not available here */
+	iowrite32(mtd->writesize / chip->ecc.size,
+		  denali->flash_reg + CFG_NUM_DATA_BLOCKS);
+
 	mtd_set_ooblayout(mtd, &denali_ooblayout_ops);
 
-	/* override the default read operations */
-	chip->ecc.size = ECC_SECTOR_SIZE;
 	chip->ecc.read_page = denali_read_page;
 	chip->ecc.read_page_raw = denali_read_page_raw;
 	chip->ecc.write_page = denali_write_page;
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index d9232e4..aa6548a 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -270,6 +270,14 @@
 #define     ECC_COR_INFO__MAX_ERRORS			0x007f
 #define     ECC_COR_INFO__UNCOR_ERR			0x0080
 
+#define CFG_DATA_BLOCK_SIZE			0x6b0
+
+#define CFG_LAST_DATA_BLOCK_SIZE		0x6c0
+
+#define CFG_NUM_DATA_BLOCKS			0x6d0
+
+#define CFG_META_DATA_SIZE			0x6e0
+
 #define DMA_ENABLE				0x700
 #define     DMA_ENABLE__FLAG				0x0001
 
@@ -312,8 +320,6 @@
 #define MODE_10    0x08000000
 #define MODE_11    0x0C000000
 
-#define ECC_SECTOR_SIZE     512
-
 struct nand_buf {
 	int head;
 	int tail;
@@ -350,6 +356,8 @@ struct denali_nand_info {
 	unsigned int caps;
 #define DENALI_CAP_HW_ECC_FIXUP			BIT(0)
 #define DENALI_CAP_DMA_64BIT			BIT(1)
+#define DENALI_CAP_ECC_SIZE_512			BIT(2)
+#define DENALI_CAP_ECC_SIZE_1024		BIT(3)
 };
 
 extern int denali_init(struct denali_nand_info *denali);
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index df9ef36..1681a30 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -35,7 +35,8 @@ struct denali_dt_data {
 };
 
 static const struct denali_dt_data denali_socfpga_data = {
-	.caps = DENALI_CAP_HW_ECC_FIXUP,
+	.caps = DENALI_CAP_HW_ECC_FIXUP |
+		DENALI_CAP_ECC_SIZE_512,
 };
 
 static const struct of_device_id denali_nand_dt_ids[] = {
diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index ac84323..5202a11 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -85,6 +85,8 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		goto failed_remap_reg;
 	}
 
+	denali->caps |= DENALI_CAP_ECC_SIZE_512;
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
