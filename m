From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v7 2/2] mtd: nand: Add support for Arasan NAND Flash Controller
Date: Mon, 9 Jan 2017 08:28:54 +0530
Message-ID: <1483930734-10309-2-git-send-email-punnaia@xilinx.com>
References: <1483930734-10309-1-git-send-email-punnaia@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483930734-10309-1-git-send-email-punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Added the basic driver for Arasan NAND Flash Controller used in
Zynq UltraScale+ MPSoC. It supports only Hw ECC and upto 24bit
correction.

Signed-off-by: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
Changes in v7:
- Implemented Marek suggestions and comments
- Corrected the acronyms those should be in caps
- Modified kconfig/Make file to keep arasan entry in sorted order
- Added is_vmlloc_addr check
- Used ioread/write32_rep variants to avoid compilation error for intel
  platforms
- separated PIO and DMA mode read/write functions
- Minor cleanup
Chnages in v6:
- Addressed most of the Brian and Boris comments
- Separated the nandchip from the nand controller
- Removed the ecc lookup table from driver
- Now use framework nand waitfunction and readoob
- Fixed the compiler warning
- Adapted the new frameowrk changes related to ecc and ooblayout
- Disabled the clocks after the nand_reelase
- Now using only one completion object
- Boris suggessions like adapting cmd_ctrl and rework on read/write byte
  are not implemented and i will patch them later
- Also check_erased_ecc_chunk for erase and check for is_vmalloc_addr will
  implement later once the basic driver is mainlined.
Changes in v5:
- Renamed the driver filei as arasan_nand.c
- Fixed all comments relaqted coding style
- Fixed comments related to propagating the errors
- Modified the anfc_write_page_hwecc as per the write_page
  prototype
Changes in v4:
- Added support for onfi timing mode configuration
- Added clock supppport
- Added support for multiple chipselects
Changes in v3:
- Removed unused variables
- Avoided busy loop and used jifies based implementation
- Fixed compiler warnings "right shift count >= width of type"
- Removed unneeded codei and improved error reporting
- Added onfi version check to ensure reading the valid address cycles
Changes in v2:
- Added missing of.h to avoid kbuild system report erro
---
 drivers/mtd/nand/Kconfig       |   8 +
 drivers/mtd/nand/Makefile      |   1 +
 drivers/mtd/nand/arasan_nand.c | 932 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 941 insertions(+)
 create mode 100644 drivers/mtd/nand/arasan_nand.c

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 7b7a887..c4cfca2 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -41,6 +41,14 @@ config MTD_SM_COMMON
 	tristate
 	default n
 
+config MTD_NAND_ARASAN
+	tristate "Support for Arasan Nand Flash controller"
+	depends on HAS_IOMEM
+	depends on HAS_DMA
+	help
+	  Enables the driver for the Arasan NAND Flash controller on
+	  Zynq UltraScale+ MPSoC.
+
 config MTD_NAND_DENALI
 	tristate
 
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index cafde6f..7754170 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_MTD_NAND_BCH)		+= nand_bch.o
 obj-$(CONFIG_MTD_NAND_IDS)		+= nand_ids.o
 obj-$(CONFIG_MTD_SM_COMMON) 		+= sm_common.o
 
+obj-$(CONFIG_MTD_NAND_ARASAN)		+= arasan_nand.o
 obj-$(CONFIG_MTD_NAND_CAFE)		+= cafe_nand.o
 obj-$(CONFIG_MTD_NAND_AMS_DELTA)	+= ams-delta.o
 obj-$(CONFIG_MTD_NAND_DENALI)		+= denali.o
diff --git a/drivers/mtd/nand/arasan_nand.c b/drivers/mtd/nand/arasan_nand.c
new file mode 100644
index 0000000..2103134
--- /dev/null
+++ b/drivers/mtd/nand/arasan_nand.c
@@ -0,0 +1,932 @@
+/*
+ * Arasan NAND Flash Controller Driver
+ *
+ * Copyright (C) 2014 - 2017 Xilinx, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation; either version 2 of the License, or (at your
+ * option) any later version.
+ */
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#define DRIVER_NAME			"arasan_nand"
+#define EVNT_TIMEOUT_MSEC		1000
+
+#define PKT_OFST			0x00
+#define MEM_ADDR1_OFST			0x04
+#define MEM_ADDR2_OFST			0x08
+#define CMD_OFST			0x0C
+#define PROG_OFST			0x10
+#define INTR_STS_EN_OFST		0x14
+#define INTR_SIG_EN_OFST		0x18
+#define INTR_STS_OFST			0x1C
+#define READY_STS_OFST			0x20
+#define DMA_ADDR1_OFST			0x24
+#define FLASH_STS_OFST			0x28
+#define DATA_PORT_OFST			0x30
+#define ECC_OFST			0x34
+#define ECC_ERR_CNT_OFST		0x38
+#define ECC_SPR_CMD_OFST		0x3C
+#define ECC_ERR_CNT_1BIT_OFST		0x40
+#define ECC_ERR_CNT_2BIT_OFST		0x44
+#define DMA_ADDR0_OFST			0x50
+#define DATA_INTERFACE_OFST		0x6C
+
+#define PKT_CNT_SHIFT			12
+
+#define ECC_ENABLE			BIT(31)
+#define DMA_EN_MASK			GENMASK(27, 26)
+#define DMA_ENABLE			0x2
+#define DMA_EN_SHIFT			26
+#define REG_PAGE_SIZE_SHIFT		23
+#define REG_PAGE_SIZE_512		0
+#define REG_PAGE_SIZE_1K		5
+#define REG_PAGE_SIZE_2K		1
+#define REG_PAGE_SIZE_4K		2
+#define REG_PAGE_SIZE_8K		3
+#define REG_PAGE_SIZE_16K		4
+#define CMD2_SHIFT			8
+#define ADDR_CYCLES_SHIFT		28
+
+#define XFER_COMPLETE			BIT(2)
+#define READ_READY			BIT(1)
+#define WRITE_READY			BIT(0)
+#define MBIT_ERROR			BIT(3)
+
+#define PROG_PGRD			BIT(0)
+#define PROG_ERASE			BIT(2)
+#define PROG_STATUS			BIT(3)
+#define PROG_PGPROG			BIT(4)
+#define PROG_RDID			BIT(6)
+#define PROG_RDPARAM			BIT(7)
+#define PROG_RST			BIT(8)
+#define PROG_GET_FEATURE		BIT(9)
+#define PROG_SET_FEATURE		BIT(10)
+
+#define PG_ADDR_SHIFT			16
+#define BCH_MODE_SHIFT			25
+#define BCH_EN_SHIFT			27
+#define ECC_SIZE_SHIFT			16
+
+#define MEM_ADDR_MASK			GENMASK(7, 0)
+#define BCH_MODE_MASK			GENMASK(27, 25)
+
+#define CS_MASK				GENMASK(31, 30)
+#define CS_SHIFT			30
+
+#define PAGE_ERR_CNT_MASK		GENMASK(16, 8)
+#define PKT_ERR_CNT_MASK		GENMASK(7, 0)
+
+#define NVDDR_MODE			BIT(9)
+#define NVDDR_TIMING_MODE_SHIFT		3
+
+#define ONFI_ID_LEN			8
+#define TEMP_BUF_SIZE			1024
+#define NVDDR_MODE_PACKET_SIZE		8
+#define SDR_MODE_PACKET_SIZE		4
+
+#define ONFI_DATA_INTERFACE_NVDDR      BIT(4)
+#define EVENT_MASK	(XFER_COMPLETE | READ_READY | WRITE_READY | MBIT_ERROR)
+
+/**
+ * struct anfc_nand_chip - Defines the nand chip related information
+ * @node:		used to store NAND chips into a list.
+ * @chip:		NAND chip information structure.
+ * @bch:		Bch / Hamming mode enable/disable.
+ * @bchmode:		Bch mode.
+ * @eccval:		Ecc config value.
+ * @raddr_cycles:	Row address cycle information.
+ * @caddr_cycles:	Column address cycle information.
+ * @pktsize:		Packet size for read / write operation.
+ * @csnum:		chipselect number to be used.
+ * @spktsize:		Packet size in ddr mode for status operation.
+ * @inftimeval		Data interface and timing mode information
+ */
+struct anfc_nand_chip {
+	struct list_head node;
+	struct nand_chip chip;
+	bool bch;
+	u32 bchmode;
+	u32 eccval;
+	u16 raddr_cycles;
+	u16 caddr_cycles;
+	u32 pktsize;
+	int csnum;
+	u32 spktsize;
+	u32 inftimeval;
+};
+
+/**
+ * struct anfc - Defines the Arasan NAND flash driver instance
+ * @controller:		base controller structure.
+ * @chips:		list of all nand chips attached to the ctrler.
+ * @dev:		Pointer to the device structure.
+ * @base:		Virtual address of the NAND flash device.
+ * @curr_cmd:		Current command issued.
+ * @clk_sys:		Pointer to the system clock.
+ * @clk_flash:		Pointer to the flash clock.
+ * @dma:		Dma enable/disable.
+ * @iswriteoob:		Identifies if oob write operation is required.
+ * @buf:		Buffer used for read/write byte operations.
+ * @irq:		irq number
+ * @bufshift:		Variable used for indexing buffer operation
+ * @csnum:		Chip select number currently inuse.
+ * @event:		Completion event for nand status events.
+ */
+struct anfc {
+	struct nand_hw_control controller;
+	struct list_head chips;
+	struct device *dev;
+	void __iomem *base;
+	int curr_cmd;
+	struct clk *clk_sys;
+	struct clk *clk_flash;
+	bool dma;
+	bool iswriteoob;
+	u8 buf[TEMP_BUF_SIZE];
+	int irq;
+	u32 bufshift;
+	int csnum;
+	struct completion event;
+};
+
+static int anfc_ooblayout_ecc(struct mtd_info *mtd, int section,
+				    struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *nand = mtd_to_nand(mtd);
+
+	if (section)
+		return -ERANGE;
+
+	oobregion->length = nand->ecc.total;
+	oobregion->offset = mtd->oobsize - oobregion->length;
+
+	return 0;
+}
+
+static int anfc_ooblayout_free(struct mtd_info *mtd, int section,
+				     struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *nand = mtd_to_nand(mtd);
+
+	if (section)
+		return -ERANGE;
+
+	oobregion->offset = 2;
+	oobregion->length = mtd->oobsize - nand->ecc.total - 2;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops anfc_ooblayout_ops = {
+	.ecc = anfc_ooblayout_ecc,
+	.free = anfc_ooblayout_free,
+};
+
+static inline struct anfc_nand_chip *to_anfc_nand(struct nand_chip *nand)
+{
+	return container_of(nand, struct anfc_nand_chip, chip);
+}
+
+static inline struct anfc *to_anfc(struct nand_hw_control *ctrl)
+{
+	return container_of(ctrl, struct anfc, controller);
+}
+
+static u8 anfc_page(u32 pagesize)
+{
+	switch (pagesize) {
+	case 512:
+		return REG_PAGE_SIZE_512;
+	case 1024:
+		return REG_PAGE_SIZE_1K;
+	case 2048:
+		return REG_PAGE_SIZE_2K;
+	case 4096:
+		return REG_PAGE_SIZE_4K;
+	case 8192:
+		return REG_PAGE_SIZE_8K;
+	case 16384:
+		return REG_PAGE_SIZE_16K;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static inline void anfc_enable_intrs(struct anfc *nfc, u32 val)
+{
+	writel(val, nfc->base + INTR_STS_EN_OFST);
+	writel(val, nfc->base + INTR_SIG_EN_OFST);
+}
+
+static inline void anfc_config_ecc(struct anfc *nfc, int on)
+{
+	u32 val;
+
+	val = readl(nfc->base + CMD_OFST);
+	if (on)
+		val |= ECC_ENABLE;
+	else
+		val &= ~ECC_ENABLE;
+	writel(val, nfc->base + CMD_OFST);
+}
+
+static inline void anfc_config_dma(struct anfc *nfc, int on)
+{
+	u32 val;
+
+	val = readl(nfc->base + CMD_OFST);
+	val &= ~DMA_EN_MASK;
+	if (on)
+		val |= DMA_ENABLE << DMA_EN_SHIFT;
+	writel(val, nfc->base + CMD_OFST);
+}
+
+static inline int anfc_wait_for_event(struct anfc *nfc)
+{
+	return wait_for_completion_timeout(&nfc->event,
+					msecs_to_jiffies(EVNT_TIMEOUT_MSEC));
+}
+
+static inline void anfc_setpktszcnt(struct anfc *nfc, u32 pktsize,
+				    u32 pktcount)
+{
+	writel(pktsize | (pktcount << PKT_CNT_SHIFT), nfc->base + PKT_OFST);
+}
+
+static inline void anfc_set_eccsparecmd(struct anfc *nfc,
+				struct anfc_nand_chip *achip, u8 cmd1, u8 cmd2)
+{
+	writel(cmd1 | (cmd2 << CMD2_SHIFT) |
+	       (achip->caddr_cycles << ADDR_CYCLES_SHIFT),
+	       nfc->base + ECC_SPR_CMD_OFST);
+}
+
+static void anfc_setpagecoladdr(struct anfc *nfc, u32 page, u16 col)
+{
+	u32 val;
+
+	writel(col | (page << PG_ADDR_SHIFT), nfc->base + MEM_ADDR1_OFST);
+
+	val = readl(nfc->base + MEM_ADDR2_OFST);
+	val = (val & ~MEM_ADDR_MASK) |
+	      ((page >> PG_ADDR_SHIFT) & MEM_ADDR_MASK);
+	writel(val, nfc->base + MEM_ADDR2_OFST);
+}
+
+static void anfc_prepare_cmd(struct anfc *nfc, u8 cmd1, u8 cmd2, u8 dmamode,
+			     u32 pagesize, u8 addrcycles)
+{
+	u32 regval;
+
+	regval = cmd1 | (cmd2 << CMD2_SHIFT);
+	if (dmamode && nfc->dma)
+		regval |= DMA_ENABLE << DMA_EN_SHIFT;
+	regval |= addrcycles << ADDR_CYCLES_SHIFT;
+	regval |= anfc_page(pagesize) << REG_PAGE_SIZE_SHIFT;
+	writel(regval, nfc->base + CMD_OFST);
+}
+
+static int anfc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
+			  int page)
+{
+	struct anfc *nfc = to_anfc(chip->controller);
+
+	nfc->iswriteoob = true;
+	chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize, page);
+	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
+	nfc->iswriteoob = false;
+
+	return 0;
+}
+
+static void anfc_rw_buf_dma(struct mtd_info *mtd, uint8_t *buf, int len,
+			    int operation, u32 prog)
+{
+	dma_addr_t paddr;
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct anfc *nfc = to_anfc(chip->controller);
+	struct anfc_nand_chip *achip = to_anfc_nand(chip);
+	u32 eccintr = 0, dir;
+	u32 pktsize = len, pktcount = 1;
+
+	if ((nfc->curr_cmd == NAND_CMD_READ0) ||
+		((nfc->curr_cmd == NAND_CMD_SEQIN) && !nfc->iswriteoob)) {
+		pktsize = achip->pktsize;
+		pktcount = DIV_ROUND_UP(mtd->writesize, pktsize);
+	}
+	anfc_setpktszcnt(nfc, pktsize, pktcount);
+
+	if (!achip->bch && (nfc->curr_cmd == NAND_CMD_READ0))
+		eccintr = MBIT_ERROR;
+
+	if (operation)
+		dir = DMA_FROM_DEVICE;
+	else
+		dir = DMA_TO_DEVICE;
+
+	paddr = dma_map_single(nfc->dev, buf, len, dir);
+	if (dma_mapping_error(nfc->dev, paddr)) {
+		dev_err(nfc->dev, "Read buffer mapping error");
+		return;
+	}
+	lo_hi_writeq(paddr, nfc->base + DMA_ADDR0_OFST);
+	anfc_enable_intrs(nfc, (XFER_COMPLETE | eccintr));
+	writel(prog, nfc->base + PROG_OFST);
+	anfc_wait_for_event(nfc);
+	dma_unmap_single(nfc->dev, paddr, len, dir);
+}
+
+static void anfc_rw_buf_pio(struct mtd_info *mtd, uint8_t *buf, int len,
+			    int operation, int prog)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct anfc *nfc = to_anfc(chip->controller);
+	struct anfc_nand_chip *achip = to_anfc_nand(chip);
+	u32 *bufptr = (u32 *)buf;
+	u32 cnt = 0, intr = 0;
+	u32 pktsize = len, pktcount = 1;
+
+	anfc_config_dma(nfc, 0);
+
+	if ((nfc->curr_cmd == NAND_CMD_READ0) ||
+		((nfc->curr_cmd == NAND_CMD_SEQIN) && !nfc->iswriteoob)) {
+		pktsize = achip->pktsize;
+		pktcount = DIV_ROUND_UP(mtd->writesize, pktsize);
+	}
+	anfc_setpktszcnt(nfc, pktsize, pktcount);
+
+	if (!achip->bch && (nfc->curr_cmd == NAND_CMD_READ0))
+		intr = MBIT_ERROR;
+
+	if (operation)
+		intr |= READ_READY;
+	else
+		intr |= WRITE_READY;
+
+	anfc_enable_intrs(nfc, intr);
+	writel(prog, nfc->base + PROG_OFST);
+
+	while (cnt < pktcount) {
+		anfc_wait_for_event(nfc);
+		cnt++;
+		if (cnt == pktcount)
+			anfc_enable_intrs(nfc, XFER_COMPLETE);
+		if (operation)
+			ioread32_rep(nfc->base + DATA_PORT_OFST, bufptr,
+				     pktsize/4);
+		else
+			iowrite32_rep(nfc->base + DATA_PORT_OFST, bufptr,
+				      pktsize/4);
+		bufptr += (pktsize / 4);
+		if (cnt < pktcount)
+			anfc_enable_intrs(nfc, intr);
+	}
+
+	anfc_wait_for_event(nfc);
+}
+
+static void anfc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct anfc *nfc = to_anfc(chip->controller);
+
+	if (nfc->dma && !is_vmalloc_addr(buf))
+		anfc_rw_buf_dma(mtd, buf, len, 1, PROG_PGRD);
+	else
+		anfc_rw_buf_pio(mtd, buf, len, 1, PROG_PGRD);
+}
+
+static void anfc_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct anfc *nfc = to_anfc(chip->controller);
+
+	if (nfc->dma && !is_vmalloc_addr(buf))
+		anfc_rw_buf_dma(mtd, (char *)buf, len, 0, PROG_PGPROG);
+	else
+		anfc_rw_buf_pio(mtd, (char *)buf, len, 0, PROG_PGPROG);
+}
+
+static int anfc_read_page_hwecc(struct mtd_info *mtd,
+				struct nand_chip *chip, uint8_t *buf,
+				int oob_required, int page)
+{
+	u32 val;
+	struct anfc *nfc = to_anfc(chip->controller);
+	struct anfc_nand_chip *achip = to_anfc_nand(chip);
+
+	anfc_set_eccsparecmd(nfc, achip, NAND_CMD_RNDOUT, NAND_CMD_RNDOUTSTART);
+	anfc_config_ecc(nfc, 1);
+
+	val = readl(nfc->base + CMD_OFST);
+	val = val | ECC_ENABLE;
+	writel(val, nfc->base + CMD_OFST);
+
+	chip->read_buf(mtd, buf, mtd->writesize);
+
+	val = readl(nfc->base + ECC_ERR_CNT_OFST);
+	if (achip->bch) {
+		mtd->ecc_stats.corrected += val & PAGE_ERR_CNT_MASK;
+	} else {
+		val = readl(nfc->base + ECC_ERR_CNT_1BIT_OFST);
+		mtd->ecc_stats.corrected += val;
+		val = readl(nfc->base + ECC_ERR_CNT_2BIT_OFST);
+		mtd->ecc_stats.failed += val;
+		/* Clear ecc error count register 1Bit, 2Bit */
+		writel(0x0, nfc->base + ECC_ERR_CNT_1BIT_OFST);
+		writel(0x0, nfc->base + ECC_ERR_CNT_2BIT_OFST);
+	}
+
+	if (oob_required)
+		chip->ecc.read_oob(mtd, chip, page);
+
+	return 0;
+}
+
+static int anfc_write_page_hwecc(struct mtd_info *mtd,
+				 struct nand_chip *chip, const uint8_t *buf,
+				 int oob_required, int page)
+{
+	int ret;
+	struct anfc *nfc = to_anfc(chip->controller);
+	struct anfc_nand_chip *achip = to_anfc_nand(chip);
+	uint8_t *ecc_calc = chip->buffers->ecccalc;
+
+	anfc_set_eccsparecmd(nfc, achip, NAND_CMD_RNDIN, 0);
+	anfc_config_ecc(nfc, 1);
+
+	chip->write_buf(mtd, buf, mtd->writesize);
+
+	if (oob_required) {
+		chip->waitfunc(mtd, chip);
+		chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
+		chip->read_buf(mtd, ecc_calc, mtd->oobsize);
+		ret = mtd_ooblayout_set_eccbytes(mtd, ecc_calc, chip->oob_poi,
+						 0, chip->ecc.total);
+		if (ret)
+			return ret;
+		chip->ecc.write_oob(mtd, chip, page);
+	}
+
+	return 0;
+}
+
+static u8 anfc_read_byte(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct anfc *nfc = to_anfc(chip->controller);
+
+	return nfc->buf[nfc->bufshift++];
+}
+
+static int anfc_ecc_init(struct mtd_info *mtd,
+			 struct nand_ecc_ctrl *ecc)
+{
+	u32 ecc_addr;
+	unsigned int bchmode, steps;
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct anfc_nand_chip *achip = to_anfc_nand(chip);
+
+	ecc->mode = NAND_ECC_HW;
+	ecc->read_page = anfc_read_page_hwecc;
+	ecc->write_page = anfc_write_page_hwecc;
+	ecc->write_oob = anfc_write_oob;
+	mtd_set_ooblayout(mtd, &anfc_ooblayout_ops);
+
+	steps = mtd->writesize / chip->ecc_step_ds;
+
+	switch (chip->ecc_strength_ds) {
+	case 12:
+		bchmode = 0x1;
+		break;
+	case 8:
+		bchmode = 0x2;
+		break;
+	case 4:
+		bchmode = 0x3;
+		break;
+	case 24:
+		bchmode = 0x4;
+		break;
+	default:
+		bchmode = 0x0;
+	}
+
+	if (!bchmode)
+		ecc->total = 3 * steps;
+	else
+		ecc->total =
+		     DIV_ROUND_UP(fls(8 * chip->ecc_step_ds) *
+			 chip->ecc_strength_ds * steps, 8);
+
+	ecc->strength = chip->ecc_strength_ds;
+	ecc->size = chip->ecc_step_ds;
+	ecc->bytes = ecc->total / steps;
+	ecc->steps = steps;
+	achip->bchmode = bchmode;
+	achip->bch = achip->bchmode;
+	ecc_addr = mtd->writesize + (mtd->oobsize - ecc->total);
+
+	achip->eccval = ecc_addr | (ecc->total << ECC_SIZE_SHIFT) |
+			(achip->bch << BCH_EN_SHIFT);
+
+	if (chip->ecc_step_ds >= 1024)
+		achip->pktsize = 1024;
+	else
+		achip->pktsize = 512;
+
+	return 0;
+}
+
+static void anfc_cmd_function(struct mtd_info *mtd,
+			      unsigned int cmd, int column, int page_addr)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct anfc_nand_chip *achip = to_anfc_nand(chip);
+	struct anfc *nfc = to_anfc(chip->controller);
+	bool wait = false, read = false;
+	u32 addrcycles, prog;
+	u32 *bufptr = (u32 *)nfc->buf;
+
+	nfc->bufshift = 0;
+	nfc->curr_cmd = cmd;
+
+	if (page_addr == -1)
+		page_addr = 0;
+	if (column == -1)
+		column = 0;
+
+	switch (cmd) {
+	case NAND_CMD_RESET:
+		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 0);
+		prog = PROG_RST;
+		wait = true;
+		break;
+	case NAND_CMD_SEQIN:
+		addrcycles = achip->raddr_cycles + achip->caddr_cycles;
+		anfc_prepare_cmd(nfc, cmd, NAND_CMD_PAGEPROG, 1,
+				 mtd->writesize, addrcycles);
+		anfc_setpagecoladdr(nfc, page_addr, column);
+		break;
+	case NAND_CMD_READOOB:
+		column += mtd->writesize;
+	case NAND_CMD_READ0:
+	case NAND_CMD_READ1:
+		addrcycles = achip->raddr_cycles + achip->caddr_cycles;
+		anfc_prepare_cmd(nfc, NAND_CMD_READ0, NAND_CMD_READSTART, 1,
+				 mtd->writesize, addrcycles);
+		anfc_setpagecoladdr(nfc, page_addr, column);
+		break;
+	case NAND_CMD_RNDOUT:
+		anfc_prepare_cmd(nfc, cmd, NAND_CMD_RNDOUTSTART, 1,
+				 mtd->writesize, 2);
+		anfc_setpagecoladdr(nfc, page_addr, column);
+		break;
+	case NAND_CMD_PARAM:
+		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
+		anfc_setpagecoladdr(nfc, page_addr, column);
+		anfc_rw_buf_pio(mtd, nfc->buf,
+				(4 * sizeof(struct nand_onfi_params)),
+				1, PROG_RDPARAM);
+		break;
+	case NAND_CMD_READID:
+		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
+		anfc_setpagecoladdr(nfc, page_addr, column);
+		anfc_rw_buf_pio(mtd, nfc->buf, ONFI_ID_LEN, 1, PROG_RDID);
+		break;
+	case NAND_CMD_ERASE1:
+		addrcycles = achip->raddr_cycles;
+		prog = PROG_ERASE;
+		anfc_prepare_cmd(nfc, cmd, NAND_CMD_ERASE2, 0, 0, addrcycles);
+		column = page_addr & 0xffff;
+		page_addr = (page_addr >> PG_ADDR_SHIFT) & 0xffff;
+		anfc_setpagecoladdr(nfc, page_addr, column);
+		wait = true;
+		break;
+	case NAND_CMD_STATUS:
+		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 0);
+		anfc_setpktszcnt(nfc, achip->spktsize/4, 1);
+		anfc_setpagecoladdr(nfc, page_addr, column);
+		prog = PROG_STATUS;
+		wait = read = true;
+		break;
+	case NAND_CMD_GET_FEATURES:
+		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
+		anfc_setpagecoladdr(nfc, page_addr, column);
+		anfc_rw_buf_pio(mtd, nfc->buf, achip->spktsize, 1,
+				PROG_GET_FEATURE);
+		break;
+	case NAND_CMD_SET_FEATURES:
+		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
+		anfc_setpagecoladdr(nfc, page_addr, column);
+		break;
+	default:
+		return;
+	}
+
+	if (wait) {
+		anfc_enable_intrs(nfc, XFER_COMPLETE);
+		writel(prog, nfc->base + PROG_OFST);
+		anfc_wait_for_event(nfc);
+	}
+
+	if (read)
+		bufptr[0] = readl(nfc->base + FLASH_STS_OFST);
+}
+
+static void anfc_select_chip(struct mtd_info *mtd, int num)
+{
+	u32 val;
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct anfc_nand_chip *achip = to_anfc_nand(chip);
+	struct anfc *nfc = to_anfc(chip->controller);
+
+	if (num == -1)
+		return;
+
+	val = readl(nfc->base + MEM_ADDR2_OFST);
+	val &= (val & ~(CS_MASK | BCH_MODE_MASK));
+	val |= (achip->csnum << CS_SHIFT) | (achip->bchmode << BCH_MODE_SHIFT);
+	writel(val, nfc->base + MEM_ADDR2_OFST);
+	nfc->csnum = achip->csnum;
+	writel(achip->eccval, nfc->base + ECC_OFST);
+	writel(achip->inftimeval, nfc->base + DATA_INTERFACE_OFST);
+}
+
+static irqreturn_t anfc_irq_handler(int irq, void *ptr)
+{
+	struct anfc *nfc = ptr;
+	u32 status;
+
+	status = readl(nfc->base + INTR_STS_OFST);
+	if (status & EVENT_MASK) {
+		complete(&nfc->event);
+		writel((status & EVENT_MASK), nfc->base + INTR_STS_OFST);
+		writel(0, nfc->base + INTR_STS_EN_OFST);
+		writel(0, nfc->base + INTR_SIG_EN_OFST);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
+static int anfc_onfi_set_features(struct mtd_info *mtd, struct nand_chip *chip,
+				int addr, uint8_t *subfeature_param)
+{
+	struct anfc_nand_chip *achip = to_anfc_nand(chip);
+	int status;
+
+	if (!chip->onfi_version)
+		return -EINVAL;
+
+	if (!(le16_to_cpu(chip->onfi_params.opt_cmd) &
+		ONFI_OPT_CMD_SET_GET_FEATURES))
+		return -EINVAL;
+
+	chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, addr, -1);
+	anfc_rw_buf_pio(mtd, subfeature_param, achip->spktsize,
+			0, PROG_SET_FEATURE);
+	status = chip->waitfunc(mtd, chip);
+	if (status & NAND_STATUS_FAIL)
+		return -EIO;
+
+	return 0;
+}
+
+static int anfc_init_timing_mode(struct anfc *nfc,
+				 struct anfc_nand_chip *achip)
+{
+	int mode, err;
+	unsigned int feature[2];
+	u32 inftimeval;
+	struct nand_chip *chip = &achip->chip;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	memset(feature, 0, NVDDR_MODE_PACKET_SIZE);
+	/* Get nvddr timing modes */
+	mode = onfi_get_sync_timing_mode(chip) & 0xff;
+	if (!mode) {
+		mode = fls(onfi_get_async_timing_mode(chip)) - 1;
+		inftimeval = mode;
+	} else {
+		mode = fls(mode) - 1;
+		inftimeval = NVDDR_MODE | (mode << NVDDR_TIMING_MODE_SHIFT);
+		mode |= ONFI_DATA_INTERFACE_NVDDR;
+	}
+
+	feature[0] = mode;
+	chip->select_chip(mtd, achip->csnum);
+	err = chip->onfi_set_features(mtd, chip, ONFI_FEATURE_ADDR_TIMING_MODE,
+				      (uint8_t *)feature);
+	chip->select_chip(mtd, -1);
+	if (err)
+		return err;
+
+	achip->inftimeval = inftimeval;
+
+	if (mode & ONFI_DATA_INTERFACE_NVDDR)
+		achip->spktsize = NVDDR_MODE_PACKET_SIZE;
+
+	return 0;
+}
+
+static int anfc_nand_chip_init(struct anfc *nfc,
+				struct anfc_nand_chip *anand_chip,
+				struct device_node *np)
+{
+	struct nand_chip *chip = &anand_chip->chip;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int ret;
+
+	ret = of_property_read_u32(np, "reg", &anand_chip->csnum);
+	if (ret) {
+		dev_err(nfc->dev, "can't get chip-select\n");
+		return -ENXIO;
+	}
+
+	mtd->name = devm_kasprintf(nfc->dev, GFP_KERNEL, "arasan_nand.%d",
+				   anand_chip->csnum);
+	mtd->dev.parent = nfc->dev;
+
+	chip->cmdfunc = anfc_cmd_function;
+	chip->chip_delay = 30;
+	chip->controller = &nfc->controller;
+	chip->read_buf = anfc_read_buf;
+	chip->write_buf = anfc_write_buf;
+	chip->read_byte = anfc_read_byte;
+	chip->options = NAND_BUSWIDTH_AUTO | NAND_NO_SUBPAGE_WRITE;
+	chip->bbt_options = NAND_BBT_USE_FLASH;
+	chip->select_chip = anfc_select_chip;
+	chip->onfi_set_features = anfc_onfi_set_features;
+	nand_set_flash_node(chip, np);
+
+	anand_chip->spktsize = SDR_MODE_PACKET_SIZE;
+	ret = nand_scan_ident(mtd, 1, NULL);
+	if (ret) {
+		dev_err(nfc->dev, "nand_scan_ident for NAND failed\n");
+		return ret;
+	}
+	if (chip->onfi_version) {
+		anand_chip->raddr_cycles = chip->onfi_params.addr_cycles & 0xf;
+		anand_chip->caddr_cycles =
+				(chip->onfi_params.addr_cycles >> 4) & 0xf;
+	} else {
+		/* For non-ONFI devices, configuring the address cyles as 5 */
+		anand_chip->raddr_cycles = 3;
+		anand_chip->caddr_cycles = 2;
+	}
+
+	ret = anfc_init_timing_mode(nfc, anand_chip);
+	if (ret) {
+		dev_err(nfc->dev, "timing mode init failed\n");
+		return ret;
+	}
+
+	ret = anfc_ecc_init(mtd, &chip->ecc);
+	if (ret)
+		return ret;
+
+	ret = nand_scan_tail(mtd);
+	if (ret) {
+		dev_err(nfc->dev, "nand_scan_tail for NAND failed\n");
+		return ret;
+	}
+
+	return mtd_device_register(mtd, NULL, 0);
+}
+
+static int anfc_probe(struct platform_device *pdev)
+{
+	struct anfc *nfc;
+	struct anfc_nand_chip *anand_chip;
+	struct device_node *np = pdev->dev.of_node, *child;
+	struct resource *res;
+	int err;
+
+	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	if (!nfc)
+		return -ENOMEM;
+
+	init_waitqueue_head(&nfc->controller.wq);
+	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->event);
+	nfc->dev = &pdev->dev;
+	platform_set_drvdata(pdev, nfc);
+	nfc->csnum = -1;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	nfc->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(nfc->base))
+		return PTR_ERR(nfc->base);
+	nfc->dma = of_property_read_bool(pdev->dev.of_node,
+					 "arasan,has-mdma");
+	nfc->irq = platform_get_irq(pdev, 0);
+	if (nfc->irq < 0) {
+		dev_err(&pdev->dev, "platform_get_irq failed\n");
+		return -ENXIO;
+	}
+	err = devm_request_irq(&pdev->dev, nfc->irq, anfc_irq_handler,
+			       0, "arasannfc", nfc);
+	if (err)
+		return err;
+	nfc->clk_sys = devm_clk_get(&pdev->dev, "clk_sys");
+	if (IS_ERR(nfc->clk_sys)) {
+		dev_err(&pdev->dev, "sys clock not found.\n");
+		return PTR_ERR(nfc->clk_sys);
+	}
+
+	nfc->clk_flash = devm_clk_get(&pdev->dev, "clk_flash");
+	if (IS_ERR(nfc->clk_flash)) {
+		dev_err(&pdev->dev, "flash clock not found.\n");
+		return PTR_ERR(nfc->clk_flash);
+	}
+
+	err = clk_prepare_enable(nfc->clk_sys);
+	if (err) {
+		dev_err(&pdev->dev, "Unable to enable sys clock.\n");
+		return err;
+	}
+
+	err = clk_prepare_enable(nfc->clk_flash);
+	if (err) {
+		dev_err(&pdev->dev, "Unable to enable flash clock.\n");
+		goto clk_dis_sys;
+	}
+
+	for_each_available_child_of_node(np, child) {
+		anand_chip = devm_kzalloc(&pdev->dev, sizeof(*anand_chip),
+					  GFP_KERNEL);
+		if (!anand_chip) {
+			of_node_put(child);
+			err = -ENOMEM;
+			goto nandchip_clean_up;
+		}
+
+		err = anfc_nand_chip_init(nfc, anand_chip, child);
+		if (err) {
+			devm_kfree(&pdev->dev, anand_chip);
+			continue;
+		}
+
+		list_add_tail(&anand_chip->node, &nfc->chips);
+	}
+
+	return 0;
+
+nandchip_clean_up:
+	list_for_each_entry(anand_chip, &nfc->chips, node)
+		nand_release(nand_to_mtd(&anand_chip->chip));
+	clk_disable_unprepare(nfc->clk_flash);
+clk_dis_sys:
+	clk_disable_unprepare(nfc->clk_sys);
+
+	return err;
+}
+
+static int anfc_remove(struct platform_device *pdev)
+{
+	struct anfc *nfc = platform_get_drvdata(pdev);
+	struct anfc_nand_chip *anand_chip;
+
+	list_for_each_entry(anand_chip, &nfc->chips, node)
+		nand_release(nand_to_mtd(&anand_chip->chip));
+
+	clk_disable_unprepare(nfc->clk_sys);
+	clk_disable_unprepare(nfc->clk_flash);
+
+	return 0;
+}
+
+static const struct of_device_id anfc_ids[] = {
+	{ .compatible = "arasan,nfc-v3p10" },
+	{  }
+};
+MODULE_DEVICE_TABLE(of, anfc_ids);
+
+static struct platform_driver anfc_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = anfc_ids,
+	},
+	.probe = anfc_probe,
+	.remove = anfc_remove,
+};
+module_platform_driver(anfc_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Xilinx, Inc");
+MODULE_DESCRIPTION("Arasan NAND Flash Controller Driver");
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
