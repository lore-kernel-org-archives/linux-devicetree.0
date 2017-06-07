From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v5 03/23] mtd: nand: denali: avoid hard-coding ECC step, strength, bytes
Date: Wed,  7 Jun 2017 20:52:12 +0900
Message-ID: <1496836352-8016-4-git-send-email-yamada.masahiro@socionext.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

This driver was originally written for the Intel MRST platform with
several platform-specific parameters hard-coded.

Currently, the ECC settings are hard-coded as follows:

  #define ECC_SECTOR_SIZE 512
  #define ECC_8BITS       14
  #define ECC_15BITS      26

Therefore, the driver can only support two cases.
 - ecc.size = 512, ecc.strength = 8    --> ecc.bytes = 14
 - ecc.size = 512, ecc.strength = 15   --> ecc.bytes = 26

However, these are actually customizable parameters, for example,
UniPhier platform supports the following:

 - ecc.size = 1024, ecc.strength = 8   --> ecc.bytes = 14
 - ecc.size = 1024, ecc.strength = 16  --> ecc.bytes = 28
 - ecc.size = 1024, ecc.strength = 24  --> ecc.bytes = 42

So, we need to handle the ECC parameters in a more generic manner.
Fortunately, the Denali User's Guide explains how to calculate the
ecc.bytes.  The formula is:

  ecc.bytes = 2 * CEIL(13 * ecc.strength / 16)  (for ecc.size = 512)
  ecc.bytes = 2 * CEIL(14 * ecc.strength / 16)  (for ecc.size = 1024)

For DT platforms, it would be reasonable to allow DT to specify ECC
strength by either "nand-ecc-strength" or "nand-ecc-maximize".  If
none of them is specified, the driver will try to meet the chip's ECC
requirement.

For PCI platforms, the max ECC strength is used to keep the original
behavior.

Newer versions of this IP need ecc.size and ecc.steps explicitly
set up via the following registers:
  CFG_DATA_BLOCK_SIZE       (0x6b0)
  CFG_LAST_DATA_BLOCK_SIZE  (0x6c0)
  CFG_NUM_DATA_BLOCKS       (0x6d0)

For older IP versions, write accesses to these registers are just
ignored.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes in v5:
  - Simplify denali_calc_ecc_bytes()
  - Adjust to the udpate of generic helpers
  - export denali_calc_ecc_bytes()

Changes in v4:
  - Rewrite by using generic helpers, nand_check_caps(),
    nand_match_ecc_req(), nand_maximize_ecc().

Changes in v3:
  - Move DENALI_CAP_ define out of struct denali_nand_info
  - Use chip->ecc_step_ds as a hint to choose chip->ecc.size
    where possible

Changes in v2:
  - Change the capability prefix DENALI_CAPS_ -> DENALI_CAP_
  - Make ECC 512 cap and ECC 1024 cap independent
  - Set up three CFG_... registers

 .../devicetree/bindings/mtd/denali-nand.txt        |  7 ++
 drivers/mtd/nand/denali.c                          | 87 +++++++++++++---------
 drivers/mtd/nand/denali.h                          | 12 ++-
 drivers/mtd/nand/denali_dt.c                       |  5 ++
 drivers/mtd/nand/denali_pci.c                      |  4 +
 5 files changed, 78 insertions(+), 37 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index e593bbeb2115..b7742a7363ea 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -7,6 +7,13 @@ Required properties:
   - reg-names: Should contain the reg names "nand_data" and "denali_reg"
   - interrupts : The interrupt number.
 
+Optional properties:
+  - nand-ecc-step-size: see nand.txt for details.  If present, the value must be
+      512        for "altr,socfpga-denali-nand"
+  - nand-ecc-strength: see nand.txt for details.  Valid values are:
+      8, 15      for "altr,socfpga-denali-nand"
+  - nand-ecc-maximize: see nand.txt for details
+
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
 
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 16634df2e39a..0fff11faf603 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -886,8 +886,6 @@ static int denali_hw_ecc_fixup(struct mtd_info *mtd,
 	return max_bitflips;
 }
 
-#define ECC_SECTOR_SIZE 512
-
 #define ECC_SECTOR(x)	(((x) & ECC_ERROR_ADDRESS__SECTOR_NR) >> 12)
 #define ECC_BYTE(x)	(((x) & ECC_ERROR_ADDRESS__OFFSET))
 #define ECC_CORRECTION_VALUE(x) ((x) & ERR_CORRECTION_INFO__BYTEMASK)
@@ -899,6 +897,7 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 			       struct denali_nand_info *denali,
 			       unsigned long *uncor_ecc_flags, uint8_t *buf)
 {
+	unsigned int ecc_size = denali->nand.ecc.size;
 	unsigned int bitflips = 0;
 	unsigned int max_bitflips = 0;
 	uint32_t err_addr, err_cor_info;
@@ -928,9 +927,9 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 			 * an erased sector.
 			 */
 			*uncor_ecc_flags |= BIT(err_sector);
-		} else if (err_byte < ECC_SECTOR_SIZE) {
+		} else if (err_byte < ecc_size) {
 			/*
-			 * If err_byte is larger than ECC_SECTOR_SIZE, means error
+			 * If err_byte is larger than ecc_size, means error
 			 * happened in OOB, so we ignore it. It's no need for
 			 * us to correct it err_device is represented the NAND
 			 * error bits are happened in if there are more than
@@ -939,7 +938,7 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 			int offset;
 			unsigned int flips_in_byte;
 
-			offset = (err_sector * ECC_SECTOR_SIZE + err_byte) *
+			offset = (err_sector * ecc_size + err_byte) *
 						denali->devnum + err_device;
 
 			/* correct the ECC error */
@@ -1345,13 +1344,39 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	denali_irq_init(denali);
 }
 
-/*
- * Althogh controller spec said SLC ECC is forceb to be 4bit,
- * but denali controller in MRST only support 15bit and 8bit ECC
- * correction
- */
-#define ECC_8BITS	14
-#define ECC_15BITS	26
+int denali_calc_ecc_bytes(int step_size, int strength)
+{
+	/* BCH code.  Denali requires ecc.bytes to be multiple of 2 */
+	return DIV_ROUND_UP(strength * fls(step_size * 8), 16) * 2;
+}
+EXPORT_SYMBOL(denali_calc_ecc_bytes);
+
+static int denali_ecc_setup(struct mtd_info *mtd, struct nand_chip *chip,
+			    struct denali_nand_info *denali)
+{
+	int oobavail = mtd->oobsize - denali->bbtskipbytes;
+	int ret;
+
+	/*
+	 * If .size and .strength are already set (usually by DT),
+	 * check if they are supported by this controller.
+	 */
+	if (chip->ecc.size && chip->ecc.strength)
+		return nand_check_ecc_caps(chip, denali->ecc_caps, oobavail);
+
+	/*
+	 * We want .size and .strength closest to the chip's requirement
+	 * unless NAND_ECC_MAXIMIZE is requested.
+	 */
+	if (!(chip->ecc.options & NAND_ECC_MAXIMIZE)) {
+		ret = nand_match_ecc_req(chip, denali->ecc_caps, oobavail);
+		if (!ret)
+			return 0;
+	}
+
+	/* Max ECC strength is the last thing we can do */
+	return nand_maximize_ecc(chip, denali->ecc_caps, oobavail);
+}
 
 static int denali_ooblayout_ecc(struct mtd_info *mtd, int section,
 				struct mtd_oob_region *oobregion)
@@ -1586,34 +1611,26 @@ int denali_init(struct denali_nand_info *denali)
 	/* no subpage writes on denali */
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
 
-	/*
-	 * Denali Controller only support 15bit and 8bit ECC in MRST,
-	 * so just let controller do 15bit ECC for MLC and 8bit ECC for
-	 * SLC if possible.
-	 * */
-	if (!nand_is_slc(chip) &&
-			(mtd->oobsize > (denali->bbtskipbytes +
-			ECC_15BITS * (mtd->writesize /
-			ECC_SECTOR_SIZE)))) {
-		/* if MLC OOB size is large enough, use 15bit ECC*/
-		chip->ecc.strength = 15;
-		chip->ecc.bytes = ECC_15BITS;
-		iowrite32(15, denali->flash_reg + ECC_CORRECTION);
-	} else if (mtd->oobsize < (denali->bbtskipbytes +
-			ECC_8BITS * (mtd->writesize /
-			ECC_SECTOR_SIZE))) {
-		pr_err("Your NAND chip OOB is not large enough to contain 8bit ECC correction codes");
+	ret = denali_ecc_setup(mtd, chip, denali);
+	if (ret) {
+		dev_err(denali->dev, "Failed to setup ECC settings.\n");
 		goto failed_req_irq;
-	} else {
-		chip->ecc.strength = 8;
-		chip->ecc.bytes = ECC_8BITS;
-		iowrite32(8, denali->flash_reg + ECC_CORRECTION);
 	}
 
+	dev_dbg(denali->dev,
+		"chosen ECC settings: step=%d, strength=%d, bytes=%d\n",
+		chip->ecc.size, chip->ecc.strength, chip->ecc.bytes);
+
+	iowrite32(chip->ecc.strength, denali->flash_reg + ECC_CORRECTION);
+
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
index 37833535a7a3..a06ed741b550 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -259,6 +259,14 @@
 #define     ECC_COR_INFO__MAX_ERRORS			GENMASK(6, 0)
 #define     ECC_COR_INFO__UNCOR_ERR			BIT(7)
 
+#define CFG_DATA_BLOCK_SIZE			0x6b0
+
+#define CFG_LAST_DATA_BLOCK_SIZE		0x6c0
+
+#define CFG_NUM_DATA_BLOCKS			0x6d0
+
+#define CFG_META_DATA_SIZE			0x6e0
+
 #define DMA_ENABLE				0x700
 #define     DMA_ENABLE__FLAG				BIT(0)
 
@@ -301,8 +309,6 @@
 #define MODE_10    0x08000000
 #define MODE_11    0x0C000000
 
-#define ECC_SECTOR_SIZE     512
-
 struct nand_buf {
 	int head;
 	int tail;
@@ -337,11 +343,13 @@ struct denali_nand_info {
 	int max_banks;
 	unsigned int revision;
 	unsigned int caps;
+	const struct nand_ecc_caps *ecc_caps;
 };
 
 #define DENALI_CAP_HW_ECC_FIXUP			BIT(0)
 #define DENALI_CAP_DMA_64BIT			BIT(1)
 
+int denali_calc_ecc_bytes(int step_size, int strength);
 extern int denali_init(struct denali_nand_info *denali);
 extern void denali_remove(struct denali_nand_info *denali);
 
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index b48430fe3cd4..bd1aa4cf4457 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -32,10 +32,14 @@ struct denali_dt {
 struct denali_dt_data {
 	unsigned int revision;
 	unsigned int caps;
+	const struct nand_ecc_caps *ecc_caps;
 };
 
+NAND_ECC_CAPS_SINGLE(denali_socfpga_ecc_caps, denali_calc_ecc_bytes,
+		     512, 8, 15);
 static const struct denali_dt_data denali_socfpga_data = {
 	.caps = DENALI_CAP_HW_ECC_FIXUP,
+	.ecc_caps = &denali_socfpga_ecc_caps,
 };
 
 static const struct of_device_id denali_nand_dt_ids[] = {
@@ -64,6 +68,7 @@ static int denali_dt_probe(struct platform_device *pdev)
 	if (data) {
 		denali->revision = data->revision;
 		denali->caps = data->caps;
+		denali->ecc_caps = data->ecc_caps;
 	}
 
 	denali->platform = DT;
diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index ac843238b77e..37dc0934c24c 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -27,6 +27,8 @@ static const struct pci_device_id denali_pci_ids[] = {
 };
 MODULE_DEVICE_TABLE(pci, denali_pci_ids);
 
+NAND_ECC_CAPS_SINGLE(denali_pci_ecc_caps, denali_calc_ecc_bytes, 512, 8, 15);
+
 static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int ret;
@@ -65,6 +67,8 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	pci_set_master(dev);
 	denali->dev = &dev->dev;
 	denali->irq = dev->irq;
+	denali->ecc_caps = &denali_pci_ecc_caps;
+	denali->nand.ecc.options |= NAND_ECC_MAXIMIZE;
 
 	ret = pci_request_regions(dev, DENALI_NAND_NAME);
 	if (ret) {
-- 
2.7.4
