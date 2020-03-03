Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714A0C3F2CD
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 09:48:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 272ED20848
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 09:48:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgCCJsc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Mar 2020 04:48:32 -0500
Received: from lucky1.263xmail.com ([211.157.147.130]:41814 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbgCCJsc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Mar 2020 04:48:32 -0500
Received: from localhost (unknown [192.168.167.13])
        by lucky1.263xmail.com (Postfix) with ESMTP id D9AC288F1F;
        Tue,  3 Mar 2020 17:47:47 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from ubuntu18.lan (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P3521T140169581676288S1583228860405504_;
        Tue, 03 Mar 2020 17:47:47 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <e34bdfd2fe9be8d79433083ff36c7099>
X-RL-SENDER: yifeng.zhao@rock-chips.com
X-SENDER: zyf@rock-chips.com
X-LOGIN-NAME: yifeng.zhao@rock-chips.com
X-FST-TO: miquel.raynal@bootlin.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From:   Yifeng Zhao <yifeng.zhao@rock-chips.com>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        heiko@sntech.de, linux-rockchip@lists.infradead.org,
        Yifeng Zhao <yifeng.zhao@rock-chips.com>
Subject: [PATCH v3 1/3] mtd: rawnand: rockchip: NFC drivers for RK3308, RK3188 and others
Date:   Tue,  3 Mar 2020 17:47:34 +0800
Message-Id: <20200303094736.7490-2-yifeng.zhao@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303094736.7490-1-yifeng.zhao@rock-chips.com>
References: <20200303094736.7490-1-yifeng.zhao@rock-chips.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This driver supports Rockchip NFC (NAND Flash Controller) found on RK3308,
RK3368, RKPX30, RV1108 and other SOCs. The driver has been tested using
8-bit NAND interface on the ARM based RK3308 platform.

Support Rockchip NFC versions:
- V6: ECC 16, 24, 40 and 60 bits per 1KB data. Found on RK3066, RK3368,
      RK3229, RK3188, RK3288, RK3128, RKPX3SE, RKPx3, RKPX5, RK3036 and
      RK3126.
- V8: ECC 16 bits per 1KB data. Found on RV1108/7, RK3308.
- V9: ECC 16, 40, 60 and 70 bits per 1KB data. Found on RK3326, RKPX30.

Support feature:
- Read full page data by DMA.
- Support HW ECC(one step is 1KB).
- Support 2 - 32K page size.
- Support 4 CS(depend on Soc)

Limitations:
- Unsupport 512B ecc step.
- Raw page read and write without ecc redundancy code. So could not support
  raw data dump and restore.
- Untested on some SOCs.
- Unsupport subpage.
- Unsupport randomizer.
- The original bad block mask is not supported. It is recommended to use
  the BBT(bad block table).

Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
---

Changes in v3: None
Changes in v2:
- Fix compile error.
- Include header files sorted by file name

 drivers/mtd/nand/raw/Kconfig         |    7 +
 drivers/mtd/nand/raw/Makefile        |    1 +
 drivers/mtd/nand/raw/rockchip_nand.c | 1229 ++++++++++++++++++++++++++
 3 files changed, 1237 insertions(+)
 create mode 100644 drivers/mtd/nand/raw/rockchip_nand.c

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index a80a46bb5b8b..8313b12a9d85 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -433,6 +433,13 @@ config MTD_NAND_MESON
 	  Enables support for NAND controller on Amlogic's Meson SoCs.
 	  This controller is found on Meson SoCs.
 
+config MTD_NAND_ROCKCHIP
+	tristate "Rockchip NAND controller"
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on HAS_IOMEM
+	help
+	  Enables support for NAND controller on Rockchip SoCs.
+
 config MTD_NAND_GPIO
 	tristate "GPIO assisted NAND controller"
 	depends on GPIOLIB || COMPILE_TEST
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 2d136b158fb7..8bafa59b8940 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_MTD_NAND_TEGRA)		+= tegra_nand.o
 obj-$(CONFIG_MTD_NAND_STM32_FMC2)	+= stm32_fmc2_nand.o
 obj-$(CONFIG_MTD_NAND_MESON)		+= meson_nand.o
 obj-$(CONFIG_MTD_NAND_CADENCE)		+= cadence-nand-controller.o
+obj-$(CONFIG_MTD_NAND_ROCKCHIP)		+= rockchip_nand.o
 
 nand-objs := nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_ids.o
 nand-objs += nand_onfi.o
diff --git a/drivers/mtd/nand/raw/rockchip_nand.c b/drivers/mtd/nand/raw/rockchip_nand.c
new file mode 100644
index 000000000000..efeda609fbf2
--- /dev/null
+++ b/drivers/mtd/nand/raw/rockchip_nand.c
@@ -0,0 +1,1229 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Rockchip NAND Flash controller driver.
+ * Copyright (C) 2020 Rockchip Inc.
+ * Authors: Yifeng Zhao <yifeng.zhao@rock-chips.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmaengine.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/mtd/rawnand.h>
+#include <linux/mtd/mtd.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+/*
+ * NFC Page Data Layout:
+ *	1024 Bytes Data + 4Bytes sys data + 28Bytes~124Bytes ecc +
+ *	1024 Bytes Data + 4Bytes sys data + 28Bytes~124Bytes ecc +
+ *	......
+ * NAND Page Data Layout:
+ *	1024 * n Data + m Bytes oob
+ * Original Bad Block Mask Location:
+ *	first byte of oob(spare)
+ * nand_chip->oob_poi data layout:
+ *	4Bytes sys data + .... + 4Bytes sys data + ecc data
+ */
+
+/* NAND controller register definition */
+#define	NFC_VERSION_9		0x56393030
+#define	NFC_READ		(0)
+#define	NFC_WRITE		(1)
+#define	NFC_FMCTL		(0x00)
+#define		FMCTL_CE_SEL_M		0xFF
+#define		FMCTL_CE_SEL(x)		(1 << (x))
+#define		FMCTL_WP		BIT(8)
+#define		FMCTL_RDY		BIT(9)
+#define	NFC_FMWAIT		(0x04)
+#define	NFC_FLCTL_V6		(0x08)
+#define	NFC_FLCTL_V9		(0x10)
+#define		FLCTL_RST		BIT(0)
+#define		FLCTL_WR		(1)	/* 0: read, 1: write */
+#define		FLCTL_XFER_ST		BIT(2)
+#define		FLCTL_XFER_EN		BIT(3)
+#define		FLCTL_ACORRECT		BIT(10) /* auto correct error bits */
+#define		FLCTL_XFER_READY	BIT(20)
+#define		FLCTL_XFER_SECTOR	(22)
+#define		FLCTL_TOG_FIX		BIT(29)
+#define	NFC_BCHCTL_V6		(0x0C)
+#define		BCHCTL_BANK_M	(7 << 5)
+#define		BCHCTL_BANK	(5)
+#define	NFC_BCHCTL_V9		(0x20)
+#define	NFC_DMA_CFG_V6		(0x10)
+#define	NFC_DMA_CFG_V9		(0x30)
+#define		DMA_ST			BIT(0)
+#define		DMA_WR			(1)	/* 0: write, 1: read */
+#define		DMA_EN			BIT(2)
+#define		DMA_AHB_SIZE		(3)	/* 0: 1, 1: 2, 2: 4 */
+#define		DMA_BURST_SIZE		(6)	/* 0: 1, 3: 4, 5: 8, 7: 16 */
+#define		DMA_INC_NUM		(9)	/* 1 - 16 */
+#define	NFC_DMA_DATA_BUF_V6	(0x14)
+#define	NFC_DMA_DATA_BUF_V9	(0x34)
+#define	NFC_DMA_OOB_BUF_V6	(0x18)
+#define	NFC_DMA_OOB_BUF_V9	(0x38)
+#define	NFC_DMA_ST_V6		(0x1C)
+#define	NFC_DMA_ST_V9		(0x3C)
+#define	NFC_BCH_ST_V6		(0x20)
+#define	NFC_BCH_ST_V9		(0x150)
+#define		BCH_ST_ERR0_V6	BIT(2)
+#define		BCH_ST_ERR1_V6	BIT(15)
+#define		BCH_ST_ERR0_V9	BIT(2)
+#define		BCH_ST_ERR1_V9	BIT(18)
+#define		ECC_ERR_CNT0_V6(x) (((((x) & (0x1F << 3)) >> 3) \
+				| (((x) & (1 << 27)) >> 22)) & 0x3F)
+#define		ECC_ERR_CNT1_V6(x) (((((x) & (0x1F << 16)) >> 16) \
+				| (((x) & (1 << 29)) >> 24)) & 0x3F)
+#define		ECC_ERR_CNT0_V9(x) (((x) & (0x7F << 3)) >> 3)
+#define		ECC_ERR_CNT1_V9(x) (((x) & (0x7F << 19)) >> 19)
+#define	NFC_RANDMZ_V6		(0x150)
+#define	NFC_RANDMZ_V9		(0x208)
+#define	NFC_VER_V6		(0x160)
+#define	NFC_VER_V9		(0x80)
+#define	NFC_INTEN_V6		(0x16C)
+#define	NFC_INTEN_V9		(0x120)
+#define	NFC_INTCLR_V6		(0x170)
+#define	NFC_INTCLR_V9		(0x124)
+#define	NFC_INTST_V6		(0x174)
+#define	NFC_INTST_V9		(0x128)
+#define		INT_DMA			BIT(0)
+#define	NFC_OOB0_V6		(0x200)
+#define	NFC_OOB0_V9		(0x200)
+#define	NFC_OOB1_V6		(0x230)
+#define	NFC_OOB1_V9		(0x204)
+#define	NFC_BANK		(0x800)
+#define		BANK_DATA		(0x00)
+#define		BANK_ADDR		(0x04)
+#define		BANK_CMD		(0x08)
+#define	NFC_SRAM0		(0x1000)
+#define	NFC_SRAM1		(0x1400)
+
+#define	THIS_NAME		"rk-nand"
+
+#define	RK_TIMEOUT		(500000)
+#define	RK_NAND_MAX_NSELS	(4) /* Some Soc only has 1 or 2 CSs */
+#define	NFC_SYS_DATA_SIZE	(4) /* 4 bytes sys data in oob pre 1024 data */
+#define	RK_DEFAULT_CLOCK_RATE	(150 * 1000 * 1000) /* 150 Mhz*/
+#define	ACCTIMING(csrw, rwpw, rwcs) ((csrw) << 12 | (rwpw) << 5 | (rwcs))
+
+struct rk_nfc_nand_chip {
+	struct list_head node;
+	struct nand_chip nand;
+
+	u32 spare_per_sector;
+	u32 oob_buf_per_sector;
+
+	int nsels;
+	u8 sels[0];
+	/* nothing after this field */
+};
+
+struct rk_nfc_clk {
+	int nfc_rate;
+	struct clk *nfc_clk;
+	struct clk *ahb_clk;
+};
+
+struct rk_nfc {
+	struct nand_controller controller;
+	struct rk_nfc_clk clk;
+
+	struct device *dev;
+	void __iomem *regs;
+	int	nfc_version;
+	int	max_ecc_strength;
+	int	selected_bank;
+	int	band_offset;
+
+	struct completion done;
+	struct list_head chips;
+
+	u8 *buffer;
+	u8 *page_buf;
+	u32 *oob_buf;
+
+	unsigned long assigned_cs;
+};
+
+static inline struct rk_nfc_nand_chip *to_rk_nand(struct nand_chip *nand)
+{
+	return container_of(nand, struct rk_nfc_nand_chip, nand);
+}
+
+static inline u8 *data_ptr(struct nand_chip *chip, const u8 *p, int i)
+{
+	return (u8 *)p + i * chip->ecc.size;
+}
+
+static inline u8 *oob_ptr(struct nand_chip *chip, int i)
+{
+	u8 *poi;
+
+	poi = chip->oob_poi + i * NFC_SYS_DATA_SIZE;
+
+	return poi;
+}
+
+static inline int rk_data_len(struct nand_chip *chip)
+{
+	struct rk_nfc_nand_chip *rk_nand = to_rk_nand(chip);
+
+	return chip->ecc.size + rk_nand->spare_per_sector;
+}
+
+static inline u8 *rk_data_ptr(struct nand_chip *chip,  int i)
+{
+	struct rk_nfc *nfc = nand_get_controller_data(chip);
+
+	return nfc->buffer + i * rk_data_len(chip);
+}
+
+static inline u8 *rk_oob_ptr(struct nand_chip *chip, int i)
+{
+	struct rk_nfc *nfc = nand_get_controller_data(chip);
+
+	return nfc->buffer + i * rk_data_len(chip) + chip->ecc.size;
+}
+
+static inline void nfc_writel(struct rk_nfc *nfc, u32 val, u32 reg)
+{
+	writel(val, nfc->regs + reg);
+}
+
+static inline void nfc_writew(struct rk_nfc *nfc, u16 val, u32 reg)
+{
+	writew(val, nfc->regs + reg);
+}
+
+static inline void nfc_writeb(struct rk_nfc *nfc, u8 val, u32 reg)
+{
+	writeb(val, nfc->regs + reg);
+}
+
+static inline u32 nfc_readl(struct rk_nfc *nfc, u32 reg)
+{
+	return readl_relaxed(nfc->regs + reg);
+}
+
+static inline u16 nfc_readw(struct rk_nfc *nfc, u32 reg)
+{
+	return readw_relaxed(nfc->regs + reg);
+}
+
+static inline u8 nfc_readb(struct rk_nfc *nfc, u32 reg)
+{
+	return readb_relaxed(nfc->regs + reg);
+}
+
+static void rk_nfc_select_chip(struct nand_chip *nand, int chip)
+{
+	struct rk_nfc *nfc = nand_get_controller_data(nand);
+	struct rk_nfc_nand_chip *rk_nand = to_rk_nand(nand);
+	u32 val;
+
+	if (chip < 0) {
+		nfc->selected_bank = -1;
+		return;
+	}
+
+	nfc->selected_bank = rk_nand->sels[chip];
+	nfc->band_offset = NFC_BANK + nfc->selected_bank * 0x100;
+
+	val = nfc_readl(nfc, NFC_FMCTL);
+	val &= ~FMCTL_CE_SEL_M;
+	val |= FMCTL_CE_SEL(nfc->selected_bank);
+
+	nfc_writel(nfc, val, NFC_FMCTL);
+}
+
+static int rk_nfc_dev_ready(struct nand_chip *nand)
+{
+	struct rk_nfc *nfc = nand_get_controller_data(nand);
+
+	if (nfc_readl(nfc, NFC_FMCTL) & FMCTL_RDY)
+		return 1;
+
+	return 0;
+}
+
+static void rk_nfc_cmd_ctrl(struct nand_chip *chip, int dat,
+			     unsigned int ctrl)
+{
+	struct rk_nfc *nfc = nand_get_controller_data(chip);
+	int reg_offset = nfc->band_offset;
+
+	if (ctrl & NAND_ALE)
+		reg_offset += BANK_ADDR;
+	else if (ctrl & NAND_CLE)
+		reg_offset += BANK_CMD;
+
+	if (dat != NAND_CMD_NONE)
+		nfc_writeb(nfc, dat & 0xFF, reg_offset);
+}
+
+static inline void rk_nfc_wait_ioready(struct rk_nfc *nfc)
+{
+	int rc;
+	u32 val;
+
+	rc = readl_poll_timeout_atomic(nfc->regs + NFC_FMCTL, val,
+				       val & FMCTL_RDY, 10, RK_TIMEOUT);
+	if (rc < 0)
+		dev_err(nfc->dev, "data not ready\n");
+}
+
+static inline u8 rk_nfc_read_byte(struct nand_chip *chip)
+{
+	struct rk_nfc *nfc = nand_get_controller_data(chip);
+
+	return nfc_readb(nfc, nfc->band_offset + BANK_DATA);
+}
+
+static void rk_nfc_read_buf(struct nand_chip *chip, u8 *buf, int len)
+{
+	int i;
+
+	for (i = 0; i < len; i++)
+		buf[i] = rk_nfc_read_byte(chip);
+}
+
+static void rk_nfc_write_byte(struct nand_chip *chip, u8 byte)
+{
+	struct rk_nfc *nfc = nand_get_controller_data(chip);
+
+	nfc_writeb(nfc, byte, nfc->band_offset + BANK_DATA);
+}
+
+static void rk_nfc_write_buf(struct nand_chip *chip, const u8 *buf, int len)
+{
+	int i;
+
+	for (i = 0; i < len; i++)
+		rk_nfc_write_byte(chip, buf[i]);
+}
+
+static int rk_nfc_setup_data_interface(struct nand_chip *chip, int csline,
+					const struct nand_data_interface *conf)
+{
+	struct rk_nfc *nfc = nand_get_controller_data(chip);
+	const struct nand_sdr_timings *timings;
+	u32 rate, tc2rw, trwpw, trw2c;
+	u32 temp;
+
+	if (csline == NAND_DATA_IFACE_CHECK_ONLY)
+		return 0;
+
+	/* not onfi nand flash */
+	if (!chip->parameters.onfi)
+		return 0;
+
+	timings = nand_get_sdr_timings(conf);
+	if (IS_ERR(timings))
+		return -ENOTSUPP;
+
+	rate = clk_get_rate(nfc->clk.nfc_clk);
+
+	/* turn clock rate into KHZ */
+	rate /= 1000;
+
+	tc2rw = trw2c = 1;
+
+	trwpw = max(timings->tWC_min, timings->tRC_min) / 1000;
+	trwpw = DIV_ROUND_UP(trwpw * rate, 1000000);
+
+	temp = timings->tREA_max / 1000;
+	temp = DIV_ROUND_UP(temp * rate, 1000000);
+
+	if (trwpw < temp)
+		trwpw = temp;
+
+	if (trwpw > 6) {
+		tc2rw++;
+		trw2c++;
+		trwpw -= 2;
+	}
+
+	/*
+	 * ACCON: access timing control register
+	 * -------------------------------------
+	 * 31:18: reserved
+	 * 17:12: csrw, clock cycles from the falling edge of CSn to the
+		 falling edge of RDn or WRn
+	 * 11:11: reserved
+	 * 10:05: rwpw, the width of RDn or WRn in processor clock cycles
+	 * 04:00: rwcs, clock cycles from the rising edge of RDn or WRn to the
+		 rising edge of CSn
+	 */
+	temp = ACCTIMING(tc2rw, trwpw, trw2c);
+	nfc_writel(nfc, temp, NFC_FMWAIT);
+
+	return 0;
+}
+
+static void rk_nfc_format_page(struct mtd_info *mtd, const u8 *buf)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct rk_nfc *nfc = nand_get_controller_data(chip);
+	u32 i;
+
+	memset(nfc->buffer, 0xff, mtd->writesize + mtd->oobsize);
+	swap(chip->oob_poi[0], chip->oob_poi[7]);
+	for (i = 0; i < chip->ecc.steps; i++) {
+		if (buf)
+			memcpy(rk_data_ptr(chip, i), data_ptr(chip, buf, i),
+			       chip->ecc.size);
+
+		memcpy(rk_oob_ptr(chip, i), oob_ptr(chip, i),
+		       NFC_SYS_DATA_SIZE);
+	}
+}
+
+static void rk_nfc_xfer_start(struct rk_nfc *nfc, u8 rw, u8 n_KB,
+				dma_addr_t dma_data, dma_addr_t dma_oob)
+{
+	u32 dma_reg, fl_reg, bch_reg;
+
+	dma_reg = DMA_ST | ((!rw) << DMA_WR)  | DMA_EN | (2 << DMA_AHB_SIZE) |
+	      (7 << DMA_BURST_SIZE) | (16 << DMA_INC_NUM);
+
+	fl_reg = (rw << FLCTL_WR) | FLCTL_XFER_EN | FLCTL_ACORRECT |
+		 (n_KB << FLCTL_XFER_SECTOR) | FLCTL_TOG_FIX;
+
+	if (nfc->nfc_version == 6) {
+		bch_reg = nfc_readl(nfc, NFC_BCHCTL_V6);
+		bch_reg = (bch_reg & (~BCHCTL_BANK_M)) |
+			  (nfc->selected_bank << BCHCTL_BANK);
+		nfc_writel(nfc, bch_reg, NFC_BCHCTL_V6);
+
+		nfc_writel(nfc, dma_reg, NFC_DMA_CFG_V6);
+		nfc_writel(nfc, (u32)dma_data, NFC_DMA_DATA_BUF_V6);
+		nfc_writel(nfc, (u32)dma_oob, NFC_DMA_OOB_BUF_V6);
+		nfc_writel(nfc, fl_reg, NFC_FLCTL_V6);
+		fl_reg |= FLCTL_XFER_ST;
+		nfc_writel(nfc, fl_reg, NFC_FLCTL_V6);
+	} else {
+		nfc_writel(nfc, dma_reg, NFC_DMA_CFG_V9);
+		nfc_writel(nfc, (u32)dma_data, NFC_DMA_DATA_BUF_V9);
+		nfc_writel(nfc, (u32)dma_oob, NFC_DMA_OOB_BUF_V9);
+		nfc_writel(nfc, fl_reg, NFC_FLCTL_V9);
+		fl_reg |= FLCTL_XFER_ST;
+		nfc_writel(nfc, fl_reg, NFC_FLCTL_V9);
+	}
+}
+
+static int rk_nfc_wait_for_xfer_done(struct rk_nfc *nfc)
+{
+	u32 reg;
+	int ret = 0;
+	void __iomem *ptr;
+
+	if (nfc->nfc_version == 6)
+		ptr = nfc->regs + NFC_FLCTL_V6;
+	else
+		ptr = nfc->regs + NFC_FLCTL_V9;
+
+	ret = readl_poll_timeout_atomic(ptr, reg,
+					reg & FLCTL_XFER_READY,
+					10, RK_TIMEOUT);
+	if (ret)
+		dev_err(nfc->dev, "timeout reg=%x\n", reg);
+
+	return ret;
+}
+
+static int rk_nfc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
+			      const u8 *buf, int page, int raw)
+{
+	struct rk_nfc *nfc = nand_get_controller_data(chip);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	u8 *oob;
+	dma_addr_t dma_data, dma_oob;
+	int oob_step = (ecc->bytes > 60) ? 128 : 64;
+	int pages_per_blk = mtd->erasesize / mtd->writesize;
+	u32 reg;
+	int ret = 0, i;
+
+	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
+
+	if (!raw) {
+		memcpy(nfc->page_buf, buf, mtd->writesize);
+		memset(nfc->oob_buf, 0xff, oob_step * ecc->steps);
+		/*
+		 * The first 8 blocks is stored loader, the first
+		 * 32 bits of oob need link to next page address
+		 * in the same block for Bootrom.
+		 * Swap the first oob with the seventh oob,
+		 * and bad block mask save at seventh oob.
+		 */
+		swap(chip->oob_poi[0], chip->oob_poi[7]);
+		for (i = 0; i < ecc->steps; i++) {
+			oob = chip->oob_poi + i * NFC_SYS_DATA_SIZE;
+			reg = (oob[2] << 16) | (oob[3] << 24);
+			if (!i && page < pages_per_blk * 8)
+				reg |= (page & (pages_per_blk - 1)) * 4;
+			else
+				reg |= oob[0] | (oob[1] << 8);
+
+			if (nfc->nfc_version == 6)
+				nfc->oob_buf[i * oob_step / 4] = reg;
+			else
+				nfc->oob_buf[i] = reg;
+		}
+
+		dma_data = dma_map_single(nfc->dev, (void *)nfc->page_buf,
+					  mtd->writesize, DMA_TO_DEVICE);
+		dma_oob = dma_map_single(nfc->dev, nfc->oob_buf,
+					 ecc->steps * oob_step,
+					 DMA_TO_DEVICE);
+
+		init_completion(&nfc->done);
+		if (nfc->nfc_version == 6)
+			nfc_writel(nfc, INT_DMA, NFC_INTEN_V6);
+		else
+			nfc_writel(nfc, INT_DMA, NFC_INTEN_V9);
+
+		rk_nfc_xfer_start(nfc, NFC_WRITE, ecc->steps, dma_data,
+				  dma_oob);
+		ret = wait_for_completion_timeout(&nfc->done,
+						  msecs_to_jiffies(100));
+		if (!ret)
+			ret = -ETIMEDOUT;
+		ret = rk_nfc_wait_for_xfer_done(nfc);
+
+		dma_unmap_single(nfc->dev, dma_data, mtd->writesize,
+				 DMA_TO_DEVICE);
+		dma_unmap_single(nfc->dev, dma_oob, ecc->steps * oob_step,
+				 DMA_TO_DEVICE);
+	} else {
+		rk_nfc_write_buf(chip, buf, mtd->writesize + + mtd->oobsize);
+	}
+
+	if (ret)
+		return ret;
+
+	return nand_prog_page_end_op(chip);
+}
+
+static int rk_nfc_write_page_raw(struct nand_chip *chip, const u8 *buf,
+				  int oob_on, int page)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct rk_nfc *nfc = nand_get_controller_data(chip);
+
+	rk_nfc_format_page(mtd, buf);
+	return rk_nfc_write_page(mtd, chip, nfc->buffer, page, 1);
+}
+
+static int rk_nfc_write_oob_std(struct nand_chip *chip, int page)
+{
+	return rk_nfc_write_page_raw(chip, NULL, 1, page);
+}
+
+static int rk_nfc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
+				u32 data_offs, u32 readlen,
+				u8 *buf, int page, int raw)
+{
+	struct rk_nfc *nfc = nand_get_controller_data(chip);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	dma_addr_t dma_data, dma_oob;
+	int oob_step = (ecc->bytes > 60) ? 128 : 64;
+	int bitflips = 0;
+	int ret, i, bch_st;
+	u8 *oob;
+	u32 tmp;
+
+	nand_read_page_op(chip, page, 0, NULL, 0);
+	if (!raw) {
+		dma_data = dma_map_single(nfc->dev, nfc->page_buf,
+					  mtd->writesize,
+					  DMA_FROM_DEVICE);
+		dma_oob = dma_map_single(nfc->dev, nfc->oob_buf,
+					 ecc->steps * oob_step,
+					 DMA_FROM_DEVICE);
+		init_completion(&nfc->done);
+		if (nfc->nfc_version == 6)
+			nfc_writel(nfc, INT_DMA, NFC_INTEN_V6);
+		else
+			nfc_writel(nfc, INT_DMA, NFC_INTEN_V9);
+		rk_nfc_xfer_start(nfc, NFC_READ, ecc->steps, dma_data,
+				  dma_oob);
+		ret = wait_for_completion_timeout(&nfc->done,
+						  msecs_to_jiffies(100));
+		if (!ret)
+			dev_warn(nfc->dev, "read ahb/dma done timeout\n");
+		rk_nfc_wait_for_xfer_done(nfc);
+		dma_unmap_single(nfc->dev, dma_data, mtd->writesize,
+				 DMA_FROM_DEVICE);
+		dma_unmap_single(nfc->dev, dma_oob, ecc->steps * oob_step,
+				 DMA_FROM_DEVICE);
+
+		for (i = 0; i < ecc->steps; i++) {
+			oob = chip->oob_poi + i * NFC_SYS_DATA_SIZE;
+			if (nfc->nfc_version == 6)
+				tmp = nfc->oob_buf[i * oob_step / 4];
+			else
+				tmp = nfc->oob_buf[i];
+			*oob++ = (u8)tmp;
+			*oob++ = (u8)(tmp >> 8);
+			*oob++ = (u8)(tmp >> 16);
+			*oob++ = (u8)(tmp >> 24);
+		}
+		swap(chip->oob_poi[0], chip->oob_poi[7]);
+		if (nfc->nfc_version == 6) {
+			for (i = 0; i < ecc->steps / 2; i++) {
+				bch_st = nfc_readl(nfc, NFC_BCH_ST_V6 + i * 4);
+				if (bch_st & BCH_ST_ERR0_V6 ||
+				    bch_st & BCH_ST_ERR1_V6) {
+					mtd->ecc_stats.failed++;
+					bitflips = -1;
+				} else {
+					ret = ECC_ERR_CNT0_V6(bch_st);
+					mtd->ecc_stats.corrected += ret;
+					bitflips = max_t(u32, bitflips, ret);
+
+					ret = ECC_ERR_CNT1_V6(bch_st);
+					mtd->ecc_stats.corrected += ret;
+					bitflips = max_t(u32, bitflips, ret);
+				}
+			}
+		} else {
+			for (i = 0; i < ecc->steps / 2; i++) {
+				bch_st = nfc_readl(nfc, NFC_BCH_ST_V9 + i * 4);
+				if (bch_st & BCH_ST_ERR0_V9 ||
+				    bch_st & BCH_ST_ERR0_V9) {
+					mtd->ecc_stats.failed++;
+					bitflips = -1;
+				} else {
+					ret = ECC_ERR_CNT0_V9(bch_st);
+					mtd->ecc_stats.corrected += ret;
+					bitflips = max_t(u32, bitflips, ret);
+
+					ret = ECC_ERR_CNT1_V9(bch_st);
+					mtd->ecc_stats.corrected += ret;
+					bitflips = max_t(u32, bitflips, ret);
+				}
+			}
+		}
+		memcpy(buf, nfc->page_buf, mtd->writesize);
+
+		if (bitflips == -1)
+			dev_err(nfc->dev, "read_page %x %x %x %x %x %x\n",
+				page, bitflips, bch_st, ((u32 *)buf)[0],
+				((u32 *)buf)[1], (u32)dma_data);
+	} else {
+		rk_nfc_read_buf(chip, buf, mtd->writesize + mtd->oobsize);
+	}
+	return bitflips;
+}
+
+static int rk_nfc_write_page_hwecc(struct nand_chip *chip, const u8 *buf,
+				    int oob_on, int page)
+{
+	return rk_nfc_write_page(nand_to_mtd(chip), chip, buf, page, 0);
+}
+
+static int rk_nfc_read_page_hwecc(struct nand_chip *chip, u8 *p, int oob_on,
+				   int pg)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	return rk_nfc_read_page(mtd, chip, 0, mtd->writesize, p, pg, 0);
+}
+
+static int rk_nfc_read_page_raw(struct nand_chip *chip, u8 *buf, int oob_on,
+				 int page)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct rk_nfc *nfc = nand_get_controller_data(chip);
+	int i, ret;
+
+	ret = rk_nfc_read_page(mtd, chip, 0, mtd->writesize, nfc->buffer,
+				   page, 1);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < chip->ecc.steps; i++) {
+		memcpy(oob_ptr(chip, i), rk_oob_ptr(chip, i),
+		       NFC_SYS_DATA_SIZE);
+
+		if (buf)
+			memcpy(data_ptr(chip, buf, i), rk_data_ptr(chip, i),
+			       chip->ecc.size);
+	}
+	swap(chip->oob_poi[0], chip->oob_poi[7]);
+
+	return ret;
+}
+
+static int rk_nfc_read_oob_std(struct nand_chip *chip, int page)
+{
+	return rk_nfc_read_page_raw(chip, NULL, 1, page);
+}
+
+static inline void rk_nfc_hw_init(struct rk_nfc *nfc)
+{
+	u32 val;
+
+	val = nfc_readl(nfc, NFC_VER_V9);
+	if (val == NFC_VERSION_9) {
+		nfc->nfc_version = 9;
+		nfc->max_ecc_strength = 70;
+	} else {
+		nfc->nfc_version = 6;
+		val = nfc_readl(nfc, NFC_VER_V6);
+		if (val == 0x801)
+			nfc->max_ecc_strength = 16;
+		else
+			nfc->max_ecc_strength = 60;
+	}
+
+	/* disable flash wp */
+	nfc_writel(nfc, FMCTL_WP,  NFC_FMCTL);
+	/* config default timing */
+	nfc_writel(nfc, 0x1081,  NFC_FMWAIT);
+	/* disable randomizer and dma */
+
+	if (nfc->nfc_version == 6) {
+		nfc_writel(nfc, 0, NFC_RANDMZ_V6);
+		nfc_writel(nfc, 0, NFC_DMA_CFG_V6);
+		nfc_writel(nfc, FLCTL_RST, NFC_FLCTL_V6);
+	} else {
+		nfc_writel(nfc, 0, NFC_RANDMZ_V9);
+		nfc_writel(nfc, 0, NFC_DMA_CFG_V9);
+		nfc_writel(nfc, FLCTL_RST, NFC_FLCTL_V9);
+	}
+}
+
+static irqreturn_t rk_nfc_irq(int irq, void *id)
+{
+	struct rk_nfc *nfc = id;
+	u32 sta, ien;
+
+	if (nfc->nfc_version == 6) {
+		sta = nfc_readl(nfc, NFC_INTST_V6);
+		ien = nfc_readl(nfc, NFC_INTEN_V6);
+	} else {
+		sta = nfc_readl(nfc, NFC_INTST_V9);
+		ien = nfc_readl(nfc, NFC_INTEN_V9);
+	}
+
+	if (!(sta & ien))
+		return IRQ_NONE;
+	if (nfc->nfc_version == 6) {
+		nfc_writel(nfc, sta, NFC_INTCLR_V6);
+		nfc_writel(nfc, ~sta & ien, NFC_INTEN_V6);
+	} else {
+		nfc_writel(nfc, sta, NFC_INTCLR_V9);
+		nfc_writel(nfc, ~sta & ien, NFC_INTEN_V9);
+	}
+	complete(&nfc->done);
+
+	return IRQ_HANDLED;
+}
+
+static int rk_nfc_enable_clk(struct device *dev, struct rk_nfc_clk *clk)
+{
+	int ret;
+
+	ret = clk_prepare_enable(clk->nfc_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable nfc clk\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(clk->ahb_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable ahb clk\n");
+		clk_disable_unprepare(clk->nfc_clk);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void rk_nfc_disable_clk(struct rk_nfc_clk *clk)
+{
+	clk_disable_unprepare(clk->nfc_clk);
+	clk_disable_unprepare(clk->ahb_clk);
+}
+
+static int rk_nfc_ooblayout_free(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *oob_region)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+
+	if (section >= chip->ecc.steps)
+		return -ERANGE;
+
+	if (!section) {
+		/* The first byte is bad block mask flag */
+		oob_region->length = NFC_SYS_DATA_SIZE - 1;
+		oob_region->offset = 1;
+	} else {
+		oob_region->length = NFC_SYS_DATA_SIZE;
+		oob_region->offset = section * NFC_SYS_DATA_SIZE;
+	}
+
+	return 0;
+}
+
+static int rk_nfc_ooblayout_ecc(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *oob_region)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+
+	if (section)
+		return -ERANGE;
+
+	oob_region->offset = NFC_SYS_DATA_SIZE * chip->ecc.steps;
+	oob_region->length = mtd->oobsize - oob_region->offset;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops rk_nfc_ooblayout_ops = {
+	.free = rk_nfc_ooblayout_free,
+	.ecc = rk_nfc_ooblayout_ecc,
+};
+
+static int rk_nfc_hw_ecc_setup(struct mtd_info *mtd,
+				 struct nand_ecc_ctrl *ecc,
+				 uint32_t strength)
+{
+	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct rk_nfc *nfc = nand_get_controller_data(nand);
+	u32 reg;
+
+	ecc->strength = strength;
+	ecc->steps = mtd->writesize / ecc->size;
+	ecc->bytes = DIV_ROUND_UP(ecc->strength * 14, 8);
+	/* HW ECC always work with even numbers of ECC bytes */
+	ecc->bytes = ALIGN(ecc->bytes, 2);
+
+	if (nfc->nfc_version == 6) {
+		switch (ecc->strength) {
+		case 60:
+			reg = 0x00040010;
+			break;
+		case 40:
+			reg = 0x00040000;
+			break;
+		case 24:
+			reg = 0x00000010;
+			break;
+		case 16:
+			reg = 0x00000000;
+			break;
+		default:
+			return -EINVAL;
+		}
+		nfc_writel(nfc, reg, NFC_BCHCTL_V6);
+	} else {
+		switch (ecc->strength) {
+		case 70:
+			reg = 0x00000001;
+			break;
+		case 60:
+			reg = 0x06000001;
+			break;
+		case 40:
+			reg = 0x04000001;
+			break;
+		case 16:
+			reg = 0x02000001;
+			break;
+		default:
+			return -EINVAL;
+		}
+		nfc_writel(nfc, reg, NFC_BCHCTL_V9);
+	}
+
+	return 0;
+}
+
+static int rk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
+{
+	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct rk_nfc *nfc = nand_get_controller_data(nand);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	static u8 strengths_v9[4] = {70, 60, 40, 16};
+	static u8 strengths_v6[4] = {60, 40, 24, 16};
+	u8 *strengths;
+	u32 max_strength;
+	int i;
+
+	/* support only ecc hw mode */
+	if (ecc->mode != NAND_ECC_HW) {
+		dev_err(dev, "ecc.mode not supported\n");
+		return -EINVAL;
+	}
+
+	/* if optional dt settings not present */
+	if (!ecc->size || !ecc->strength ||
+	    ecc->strength > nfc->max_ecc_strength) {
+		/* use datasheet requirements */
+		ecc->strength = nand->base.eccreq.strength;
+		ecc->size = nand->base.eccreq.step_size;
+
+		/*
+		 * align eccstrength and eccsize
+		 * this controller only supports 512 and 1024 sizes
+		 */
+		if (nand->ecc.size < 1024) {
+			if (mtd->writesize > 512) {
+				nand->ecc.size = 1024;
+				nand->ecc.strength <<= 1;
+			} else {
+				dev_err(dev, "ecc.size not supported\n");
+				return -EINVAL;
+			}
+		} else {
+			nand->ecc.size = 1024;
+		}
+
+		ecc->steps = mtd->writesize / ecc->size;
+		max_strength = ((mtd->oobsize / ecc->steps) - 4) * 8 / 14;
+		if (max_strength > nfc->max_ecc_strength)
+			max_strength = nfc->max_ecc_strength;
+
+		strengths = strengths_v9;
+		if (nfc->nfc_version == 6)
+			strengths = strengths_v6;
+
+		for (i = 0; i < 4; i++) {
+			if (max_strength >= strengths[i])
+				break;
+		}
+
+		if (i >= 4) {
+			dev_err(nfc->dev, "unsupported strength\n");
+			return -ENOTSUPP;
+		}
+
+		ecc->strength = strengths[i];
+	}
+	rk_nfc_hw_ecc_setup(mtd, ecc, ecc->strength);
+	dev_info(dev, "eccsize %d eccstrength %d\n",
+		 nand->ecc.size, nand->ecc.strength);
+	return 0;
+}
+
+static int rk_nfc_attach_chip(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct device *dev = mtd->dev.parent;
+	struct rk_nfc *nfc = nand_get_controller_data(chip);
+	struct rk_nfc_nand_chip *rk_nand = to_rk_nand(chip);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	int len;
+	int ret;
+
+	if (chip->options & NAND_BUSWIDTH_16) {
+		dev_err(dev, "16bits buswidth not supported");
+		return -EINVAL;
+	}
+
+	ret = rk_nfc_ecc_init(dev, mtd);
+	if (ret)
+		return ret;
+	rk_nand->spare_per_sector = ecc->bytes + NFC_SYS_DATA_SIZE;
+
+	/* Check buffer first, avoid duplicate alloc buffer */
+	if (nfc->buffer)
+		return 0;
+
+	len = mtd->writesize + mtd->oobsize;
+	nfc->buffer = devm_kzalloc(dev, len, GFP_KERNEL | GFP_DMA);
+	if (!nfc->buffer)
+		return  -ENOMEM;
+
+	nfc->page_buf = nfc->buffer;
+	len = ecc->steps * 128;
+	nfc->oob_buf = devm_kzalloc(dev, len, GFP_KERNEL | GFP_DMA);
+	if (!nfc->oob_buf) {
+		devm_kfree(dev, nfc->buffer);
+		nfc->buffer = NULL;
+		nfc->oob_buf = NULL;
+		return  -ENOMEM;
+	}
+
+	return 0;
+}
+
+static const struct nand_controller_ops rk_nfc_controller_ops = {
+	.attach_chip = rk_nfc_attach_chip,
+	.setup_data_interface = rk_nfc_setup_data_interface,
+};
+
+static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
+				  struct device_node *np)
+{
+	struct rk_nfc_nand_chip *chip;
+	struct nand_chip *nand;
+	struct mtd_info *mtd;
+	int nsels;
+	u32 tmp;
+	int ret;
+	int i;
+
+	if (!of_get_property(np, "reg", &nsels))
+		return -ENODEV;
+	nsels /= sizeof(u32);
+	if (!nsels || nsels > RK_NAND_MAX_NSELS) {
+		dev_err(dev, "invalid reg property size %d\n", nsels);
+		return -EINVAL;
+	}
+
+	chip = devm_kzalloc(dev, sizeof(*chip) + nsels * sizeof(u8),
+			    GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->nsels = nsels;
+	for (i = 0; i < nsels; i++) {
+		ret = of_property_read_u32_index(np, "reg", i, &tmp);
+		if (ret) {
+			dev_err(dev, "reg property failure : %d\n", ret);
+			return ret;
+		}
+
+		if (tmp >= RK_NAND_MAX_NSELS) {
+			dev_err(dev, "invalid CS: %u\n", tmp);
+			return -EINVAL;
+		}
+
+		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
+			dev_err(dev, "CS %u already assigned\n", tmp);
+			return -EINVAL;
+		}
+
+		chip->sels[i] = tmp;
+	}
+
+	nand = &chip->nand;
+	nand->controller = &nfc->controller;
+
+	nand_set_flash_node(nand, np);
+	nand_set_controller_data(nand, nfc);
+
+	nand->options |= NAND_USE_BOUNCE_BUFFER | NAND_NO_SUBPAGE_WRITE;
+	nand->bbt_options = NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
+	nand->legacy.dev_ready = rk_nfc_dev_ready;
+	nand->legacy.select_chip = rk_nfc_select_chip;
+	nand->legacy.write_byte = rk_nfc_write_byte;
+	nand->legacy.write_buf = rk_nfc_write_buf;
+	nand->legacy.read_byte = rk_nfc_read_byte;
+	nand->legacy.read_buf = rk_nfc_read_buf;
+	nand->legacy.cmd_ctrl = rk_nfc_cmd_ctrl;
+
+	/* set default mode in case dt entry is missing */
+	nand->ecc.mode = NAND_ECC_HW;
+
+	nand->ecc.write_page_raw = rk_nfc_write_page_raw;
+	nand->ecc.write_page = rk_nfc_write_page_hwecc;
+	nand->ecc.write_oob_raw = rk_nfc_write_oob_std;
+	nand->ecc.write_oob = rk_nfc_write_oob_std;
+
+	nand->ecc.read_page_raw = rk_nfc_read_page_raw;
+	nand->ecc.read_page = rk_nfc_read_page_hwecc;
+	nand->ecc.read_oob_raw = rk_nfc_read_oob_std;
+	nand->ecc.read_oob = rk_nfc_read_oob_std;
+
+	mtd = nand_to_mtd(nand);
+	mtd->owner = THIS_MODULE;
+	mtd->dev.parent = dev;
+	mtd->name = THIS_NAME;
+	mtd_set_ooblayout(mtd, &rk_nfc_ooblayout_ops);
+	rk_nfc_hw_init(nfc);
+	ret = nand_scan(nand, nsels);
+	if (ret)
+		return ret;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		dev_err(dev, "mtd parse partition error\n");
+		nand_release(nand);
+		return ret;
+	}
+
+	list_add_tail(&chip->node, &nfc->chips);
+
+	return 0;
+}
+
+static int rk_nfc_nand_chips_init(struct device *dev, struct rk_nfc *nfc)
+{
+	struct device_node *np = dev->of_node;
+	struct device_node *nand_np;
+	int ret = -EINVAL;
+	int tmp;
+
+	for_each_child_of_node(np, nand_np) {
+		tmp = rk_nfc_nand_chip_init(dev, nfc, nand_np);
+		if (tmp) {
+			of_node_put(nand_np);
+			return ret;
+		}
+		/* At least one nand chip is initialized */
+		ret = 0;
+	}
+	return ret;
+}
+
+static const struct of_device_id rk_nfc_id_table[] = {
+	{.compatible = "rockchip,nfc"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, rk_nfc_id_table);
+
+static int rk_nfc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rk_nfc *nfc;
+	struct resource *res;
+	int ret, irq;
+
+	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	if (!nfc)
+		return -ENOMEM;
+
+	nand_controller_init(&nfc->controller);
+	INIT_LIST_HEAD(&nfc->chips);
+	nfc->controller.ops = &rk_nfc_controller_ops;
+	nfc->dev = dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	nfc->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(nfc->regs)) {
+		ret = PTR_ERR(nfc->regs);
+		goto release_nfc;
+	}
+	nfc->clk.nfc_clk = devm_clk_get(dev, "clk_nfc");
+	if (IS_ERR(nfc->clk.nfc_clk)) {
+		dev_err(dev, "no clk\n");
+		ret = PTR_ERR(nfc->clk.nfc_clk);
+		goto release_nfc;
+	}
+	nfc->clk.ahb_clk = devm_clk_get(dev, "clk_ahb");
+	if (IS_ERR(nfc->clk.ahb_clk)) {
+		dev_err(dev, "no pad clk\n");
+		ret = PTR_ERR(nfc->clk.ahb_clk);
+		goto release_nfc;
+	}
+	if (of_property_read_u32(dev->of_node, "clock-rates",
+	    &nfc->clk.nfc_rate))
+		nfc->clk.nfc_rate = RK_DEFAULT_CLOCK_RATE;
+	clk_set_rate(nfc->clk.nfc_clk, nfc->clk.nfc_rate);
+
+	ret = rk_nfc_enable_clk(dev, &nfc->clk);
+	if (ret)
+		goto release_nfc;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(dev, "no nfc irq resource\n");
+		ret = -EINVAL;
+		goto clk_disable;
+	}
+
+	if (nfc->nfc_version == 6)
+		nfc_writel(nfc, 0, NFC_INTEN_V6);
+	else
+		nfc_writel(nfc, 0, NFC_INTEN_V9);
+	ret = devm_request_irq(dev, irq, rk_nfc_irq, 0x0, "rk-nand", nfc);
+	if (ret) {
+		dev_err(dev, "failed to request nfc irq\n");
+		goto clk_disable;
+	}
+
+	platform_set_drvdata(pdev, nfc);
+
+	ret = rk_nfc_nand_chips_init(dev, nfc);
+	if (ret) {
+		dev_err(dev, "failed to init nand chips\n");
+		goto clk_disable;
+	}
+	return 0;
+
+clk_disable:
+	rk_nfc_disable_clk(&nfc->clk);
+release_nfc:
+	return ret;
+}
+
+static int rk_nfc_remove(struct platform_device *pdev)
+{
+	struct rk_nfc *nfc = platform_get_drvdata(pdev);
+	struct rk_nfc_nand_chip *chip;
+
+	while (!list_empty(&nfc->chips)) {
+		chip = list_first_entry(&nfc->chips, struct rk_nfc_nand_chip,
+					node);
+		nand_release(&chip->nand);
+		list_del(&chip->node);
+	}
+
+	rk_nfc_disable_clk(&nfc->clk);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int rk_nfc_suspend(struct device *dev)
+{
+	struct rk_nfc *nfc = dev_get_drvdata(dev);
+
+	rk_nfc_disable_clk(&nfc->clk);
+
+	return 0;
+}
+
+static int rk_nfc_resume(struct device *dev)
+{
+	struct rk_nfc *nfc = dev_get_drvdata(dev);
+	struct rk_nfc_nand_chip *chip;
+	struct nand_chip *nand;
+	int ret;
+	u32 i;
+
+	udelay(200);
+
+	ret = rk_nfc_enable_clk(dev, &nfc->clk);
+	if (ret)
+		return ret;
+
+	/* reset NAND chip if VCC was powered off */
+	list_for_each_entry(chip, &nfc->chips, node) {
+		nand = &chip->nand;
+		for (i = 0; i < chip->nsels; i++)
+			nand_reset(nand, i);
+	}
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(rk_nfc_pm_ops, rk_nfc_suspend, rk_nfc_resume);
+#endif
+
+static struct platform_driver rk_nfc_driver = {
+	.probe  = rk_nfc_probe,
+	.remove = rk_nfc_remove,
+	.driver = {
+		.name  = THIS_NAME,
+		.of_match_table = rk_nfc_id_table,
+#ifdef CONFIG_PM_SLEEP
+		.pm = &rk_nfc_pm_ops,
+#endif
+	},
+};
+
+module_platform_driver(rk_nfc_driver);
+
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_AUTHOR("Yifeng Zhao <yifeng.zhao@rock-chips.com>");
+MODULE_DESCRIPTION("Rockchip Nand Flash Controller Driver");
+MODULE_ALIAS("platform:rockchip_nand");
-- 
2.17.1



