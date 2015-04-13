From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Subject: [PATCH v6 2/3] nand: pl353: Add software ecc support
Date: Mon, 13 Apr 2015 21:42:29 +0530
Message-ID: <ec33dbe6-590e-4723-bd43-cb592a605fef@BL2FFO11FD026.protection.gbl>
References: <1428941550-4620-1-git-send-email-punnaia@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1428941550-4620-1-git-send-email-punnaia@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, michal.simek@xilinx.com, grant.likely@linaro.org, gregkh@linuxfoundation.org, jason@lakedaemon.net, ezequiel.garcia@free-electrons.com, arnd@arndb.de, dwmw2@infradead.org, computersforpeace@gmail.com, artem.bityutskiy@linux.intel.com, jussi.kivilinna@iki.fi, acourbot@nvidia.com, ivan.khoronzhuk@ti.com, joern@logfs.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, kalluripunnaiahchoudary@gmail.com, kpc528@gmail.com, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: devicetree@vger.kernel.org

Added software ecc support.

Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
---
Changes in v6:
- None
Changes in v5:
- None
Changes in v4:
- Updated the driver to sync with pl353_smc driver APIs
---
 drivers/mtd/nand/pl353_nand.c |  164 +++++++++++++++++++++++++++++++++++++++++
 1 files changed, 164 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/pl353_nand.c b/drivers/mtd/nand/pl353_nand.c
index 1fe048f..4f4bf93 100644
--- a/drivers/mtd/nand/pl353_nand.c
+++ b/drivers/mtd/nand/pl353_nand.c
@@ -331,6 +331,71 @@ static int pl353_nand_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
+ * pl353_nand_read_page_raw - [Intern] read raw page data without ecc
+ * @mtd:		Pointer to the mtd info structure
+ * @chip:		Pointer to the NAND chip info structure
+ * @buf:		Pointer to the data buffer
+ * @oob_required:	Caller requires OOB data read to chip->oob_poi
+ * @page:		Page number to read
+ *
+ * Return:	Always return zero
+ */
+static int pl353_nand_read_page_raw(struct mtd_info *mtd,
+				struct nand_chip *chip,
+				uint8_t *buf, int oob_required, int page)
+{
+	unsigned long data_phase_addr;
+	uint8_t *p;
+
+	chip->read_buf(mtd, buf, mtd->writesize);
+
+	p = chip->oob_poi;
+	chip->read_buf(mtd, p,
+			(mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH));
+	p += (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH);
+
+	data_phase_addr = (unsigned long __force)chip->IO_ADDR_R;
+	data_phase_addr |= PL353_NAND_CLEAR_CS;
+	chip->IO_ADDR_R = (void __iomem * __force)data_phase_addr;
+
+	chip->read_buf(mtd, p, PL353_NAND_LAST_TRANSFER_LENGTH);
+	return 0;
+}
+
+/**
+ * pl353_nand_write_page_raw - [Intern] raw page write function
+ * @mtd:		Pointer to the mtd info structure
+ * @chip:		Pointer to the NAND chip info structure
+ * @buf:		Pointer to the data buffer
+ * @oob_required:	Caller requires OOB data read to chip->oob_poi
+ *
+ * Return:	Always return zero
+ */
+static int pl353_nand_write_page_raw(struct mtd_info *mtd,
+				    struct nand_chip *chip,
+				    const uint8_t *buf, int oob_required)
+{
+	unsigned long data_phase_addr;
+	uint8_t *p;
+
+	chip->write_buf(mtd, buf, mtd->writesize);
+
+	p = chip->oob_poi;
+	chip->write_buf(mtd, p,
+			(mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH));
+	p += (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH);
+
+	data_phase_addr = (unsigned long __force)chip->IO_ADDR_W;
+	data_phase_addr |= PL353_NAND_CLEAR_CS;
+	data_phase_addr |= (1 << END_CMD_VALID_SHIFT);
+	chip->IO_ADDR_W = (void __iomem * __force)data_phase_addr;
+
+	chip->write_buf(mtd, p, PL353_NAND_LAST_TRANSFER_LENGTH);
+
+	return 0;
+}
+
+/**
  * nand_write_page_hwecc - Hardware ECC based page write function
  * @mtd:		Pointer to the mtd info structure
  * @chip:		Pointer to the NAND chip info structure
@@ -396,6 +461,39 @@ static int pl353_nand_write_page_hwecc(struct mtd_info *mtd,
 }
 
 /**
+ * pl353_nand_write_page_swecc - [REPLACEABLE] software ecc based page write
+ * function
+ * @mtd:		Pointer to the mtd info structure
+ * @chip:		Pointer to the NAND chip info structure
+ * @buf:		Pointer to the data buffer
+ * @oob_required:	Caller requires OOB data read to chip->oob_poi
+ *
+ * Return:	Always return zero
+ */
+static int pl353_nand_write_page_swecc(struct mtd_info *mtd,
+				    struct nand_chip *chip, const uint8_t *buf,
+				    int oob_required)
+{
+	int i, eccsize = chip->ecc.size;
+	int eccbytes = chip->ecc.bytes;
+	int eccsteps = chip->ecc.steps;
+	uint8_t *ecc_calc = chip->buffers->ecccalc;
+	const uint8_t *p = buf;
+	uint32_t *eccpos = chip->ecc.layout->eccpos;
+
+	/* Software ecc calculation */
+	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize)
+		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
+
+	for (i = 0; i < chip->ecc.total; i++)
+		chip->oob_poi[eccpos[i]] = ecc_calc[i];
+
+	chip->ecc.write_page_raw(mtd, chip, buf, 1);
+
+	return 0;
+}
+
+/**
  * pl353_nand_read_page_hwecc - Hardware ECC based page read function
  * @mtd:		Pointer to the mtd info structure
  * @chip:		Pointer to the NAND chip info structure
@@ -477,6 +575,52 @@ static int pl353_nand_read_page_hwecc(struct mtd_info *mtd,
 }
 
 /**
+ * pl353_nand_read_page_swecc - [REPLACEABLE] software ecc based page read
+ * function
+ * @mtd:		Pointer to the mtd info structure
+ * @chip:		Pointer to the NAND chip info structure
+ * @buf:		Pointer to the buffer to store read data
+ * @oob_required:	Caller requires OOB data read to chip->oob_poi
+ * @page:		Page number to read
+ *
+ * Return:	Always return zero
+ */
+static int pl353_nand_read_page_swecc(struct mtd_info *mtd,
+				     struct nand_chip *chip,
+				     uint8_t *buf,  int oob_required, int page)
+{
+	int i, eccsize = chip->ecc.size;
+	int eccbytes = chip->ecc.bytes;
+	int eccsteps = chip->ecc.steps;
+	uint8_t *p = buf;
+	uint8_t *ecc_calc = chip->buffers->ecccalc;
+	uint8_t *ecc_code = chip->buffers->ecccode;
+	uint32_t *eccpos = chip->ecc.layout->eccpos;
+
+	chip->ecc.read_page_raw(mtd, chip, buf, page, 1);
+
+	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize)
+		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
+
+	for (i = 0; i < chip->ecc.total; i++)
+		ecc_code[i] = chip->oob_poi[eccpos[i]];
+
+	eccsteps = chip->ecc.steps;
+	p = buf;
+
+	for (i = 0 ; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
+		int stat;
+
+		stat = chip->ecc.correct(mtd, p, &ecc_code[i], &ecc_calc[i]);
+		if (stat < 0)
+			mtd->ecc_stats.failed++;
+		else
+			mtd->ecc_stats.corrected += stat;
+	}
+	return 0;
+}
+
+/**
  * pl353_nand_select_chip - Select the flash device
  * @mtd:	Pointer to the mtd info structure
  * @chip:	Pointer to the NAND chip info structure
@@ -708,6 +852,8 @@ static int pl353_nand_ecc_init(struct mtd_info *mtd)
 	nand_chip->ecc.read_oob = pl353_nand_read_oob;
 	nand_chip->ecc.write_oob = pl353_nand_write_oob;
 	nand_chip->ecc.strength = 1;
+	nand_chip->ecc.read_page_raw = pl353_nand_read_page_raw;
+	nand_chip->ecc.write_page_raw = pl353_nand_write_page_raw;
 
 	switch (xnand->ecc_mode) {
 	case NAND_ECC_HW:
@@ -734,6 +880,24 @@ static int pl353_nand_ecc_init(struct mtd_info *mtd)
 			nand_chip->ecc.layout = &nand_oob_64;
 
 		break;
+	case NAND_ECC_SOFT:
+		/*
+		 * The software ECC routines won't work with the
+		 * SMC controller
+		 */
+		nand_chip->ecc.mode = NAND_ECC_HW;
+		nand_chip->ecc.calculate = nand_calculate_ecc;
+		nand_chip->ecc.correct = nand_correct_data;
+		nand_chip->ecc.read_page = pl353_nand_read_page_swecc;
+		nand_chip->ecc.write_page = pl353_nand_write_page_swecc;
+		nand_chip->ecc.size = 256;
+		nand_chip->ecc.bytes = 3;
+		/* Bypass the controller ECC block */
+		pl353_smc_set_ecc_pg_size(mtd->dev.parent, mtd->writesize);
+		pl353_smc_set_ecc_mode(mtd->dev.parent,
+					PL353_SMC_ECCMODE_BYPASS);
+
+		break;
 	default:
 		return -ENOTSUPP;
 	}
-- 
1.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
