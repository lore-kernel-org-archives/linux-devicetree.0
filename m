From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH RESEND 3/5] mtd: nand: Cleanup/rework the atmel_nand driver
Date: Fri, 27 Jan 2017 17:42:02 +0100
Message-ID: <1485535324-28393-4-git-send-email-boris.brezillon@free-electrons.com>
References: <1485535324-28393-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1485535324-28393-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, linux-kernel@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is a complete rewrite of the driver whose main purpose is to
support the new DT representation where the NAND controller node is now
really visible in the DT and appears under the EBI bus. With this new
representation, we can add other devices under the EBI bus without
risking pinmuxing conflicts (the NAND controller is under the EBI
bus logic and as such, share some of its pins with other devices
connected on this bus).

Even though the goal of this rework was not necessarily to add new
features, the new driver has been designed with this in mind. With a
clearer separation between the different blocks and different IP
revisions, adding new functionalities should be easier (we already
have plans to support SMC timing configuration so that we no longer
have to rely on the configuration done by the bootloader/bootstrap).

Also note that we no longer have a custom ->cmdfunc() implementation,
which means we can now benefit from new features added in the core
implementation for free (support for new NAND operations for example).

The last thing that we gain with this rework is support for multi-chips
and multi-dies chips, thanks to the clean NAND controller <-> NAND
devices representation.

This new driver has been tested on several platforms (at91sam9261,
at91sam9g45, at91sam9x5, sama5d3 and sama5d4) to make sure it did not
introduce regressions, and it's worth mentioning that old bindings are
still supported (which partly explain the positive diffstat).

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 MAINTAINERS                       |    2 +-
 drivers/mtd/nand/Makefile         |    2 +-
 drivers/mtd/nand/atmel/Makefile   |    4 +
 drivers/mtd/nand/atmel/nfc.c      | 2168 ++++++++++++++++++++++++++++++++
 drivers/mtd/nand/atmel/pmecc.c    | 1011 +++++++++++++++
 drivers/mtd/nand/atmel/pmecc.h    |   73 ++
 drivers/mtd/nand/atmel_nand.c     | 2479 -------------------------------------
 drivers/mtd/nand/atmel_nand_ecc.h |  163 ---
 drivers/mtd/nand/atmel_nand_nfc.h |  103 --
 9 files changed, 3258 insertions(+), 2747 deletions(-)
 create mode 100644 drivers/mtd/nand/atmel/Makefile
 create mode 100644 drivers/mtd/nand/atmel/nfc.c
 create mode 100644 drivers/mtd/nand/atmel/pmecc.c
 create mode 100644 drivers/mtd/nand/atmel/pmecc.h
 delete mode 100644 drivers/mtd/nand/atmel_nand.c
 delete mode 100644 drivers/mtd/nand/atmel_nand_ecc.h
 delete mode 100644 drivers/mtd/nand/atmel_nand_nfc.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 26edd832c64e..4248f46e224d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2233,7 +2233,7 @@ M:	Wenyou Yang <wenyou.yang@atmel.com>
 M:	Josh Wu <rainyfeeling@outlook.com>
 L:	linux-mtd@lists.infradead.org
 S:	Supported
-F:	drivers/mtd/nand/atmel_nand*
+F:	drivers/mtd/nand/atmel/*
 
 ATMEL SDMMC DRIVER
 M:	Ludovic Desroches <ludovic.desroches@atmel.com>
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 19a66e404d5b..aec629bbe26f 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -25,7 +25,7 @@ obj-$(CONFIG_MTD_NAND_SHARPSL)		+= sharpsl.o
 obj-$(CONFIG_MTD_NAND_NANDSIM)		+= nandsim.o
 obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x_nand.o
 obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
-obj-$(CONFIG_MTD_NAND_ATMEL)		+= atmel_nand.o
+obj-$(CONFIG_MTD_NAND_ATMEL)		+= atmel/
 obj-$(CONFIG_MTD_NAND_GPIO)		+= gpio.o
 omap2_nand-objs := omap2.o
 obj-$(CONFIG_MTD_NAND_OMAP2) 		+= omap2_nand.o
diff --git a/drivers/mtd/nand/atmel/Makefile b/drivers/mtd/nand/atmel/Makefile
new file mode 100644
index 000000000000..15bc4a014f33
--- /dev/null
+++ b/drivers/mtd/nand/atmel/Makefile
@@ -0,0 +1,4 @@
+obj-$(CONFIG_MTD_NAND_ATMEL)	+= atmel-nand-controller.o atmel-pmecc.o
+
+atmel-nand-controller-objs	:= nfc.o
+atmel-pmecc-objs		:= pmecc.o
diff --git a/drivers/mtd/nand/atmel/nfc.c b/drivers/mtd/nand/atmel/nfc.c
new file mode 100644
index 000000000000..3173e5f6c450
--- /dev/null
+++ b/drivers/mtd/nand/atmel/nfc.c
@@ -0,0 +1,2168 @@
+/*
+ * © Copyright 2016 ATMEL
+ * © Copyright 2016 Free Electrons
+ *
+ * Author: Boris Brezillon <boris.brezillon@free-electrons.com>
+ *
+ * Derived from the atmel_nand.c driver which contained the following
+ * copyrights:
+ *
+ *    Copyright © 2003 Rick Bronson
+ *
+ *    Derived from drivers/mtd/nand/autcpu12.c
+ *        Copyright © 2001 Thomas Gleixner (gleixner@autronix.de)
+ *
+ *    Derived from drivers/mtd/spia.c
+ *        Copyright © 2000 Steven J. Hill (sjhill@cotw.com)
+ *
+ *
+ *    Add Hardware ECC support for AT91SAM9260 / AT91SAM9263
+ *        Richard Genoud (richard.genoud@gmail.com), Adeneo Copyright © 2007
+ *
+ *        Derived from Das U-Boot source code
+ *              (u-boot-1.1.5/board/atmel/at91sam9263ek/nand.c)
+ *        © Copyright 2006 ATMEL Rousset, Lacressonniere Nicolas
+ *
+ *    Add Programmable Multibit ECC support for various AT91 SoC
+ *        © Copyright 2012 ATMEL, Hong Xu
+ *
+ *    Add Nand Flash Controller support for SAMA5 SoC
+ *        © Copyright 2013 ATMEL, Josh Wu (josh.wu@atmel.com)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmaengine.h>
+#include <linux/genalloc.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mfd/syscon/atmel-matrix.h>
+#include <linux/module.h>
+#include <linux/mtd/nand.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/iopoll.h>
+#include <linux/platform_device.h>
+#include <linux/platform_data/atmel.h>
+#include <linux/regmap.h>
+
+#include "pmecc.h"
+
+#define ATMEL_HSMC_NFC_CFG			0x0
+#define ATMEL_HSMC_NFC_CFG_SPARESIZE(x)		((x) << 24)
+#define ATMEL_HSMC_NFC_CFG_DTO(cyc, mul)	(((cyc) << 16) | ((mul) << 20))
+#define ATMEL_HSMC_NFC_CFG_DTO_MAX		GENMASK(22, 16)
+#define ATMEL_HSMC_NFC_CFG_RBEDGE		BIT(13)
+#define ATMEL_HSMC_NFC_CFG_FALLING_EDGE		BIT(12)
+#define ATMEL_HSMC_NFC_CFG_RSPARE		BIT(9)
+#define ATMEL_HSMC_NFC_CFG_WSPARE		BIT(8)
+#define ATMEL_HSMC_NFC_CFG_PAGESIZE_MASK	GENMASK(2, 0)
+#define ATMEL_HSMC_NFC_CFG_PAGESIZE(x)		(fls((x) / 512) - 1)
+
+#define ATMEL_HSMC_NFC_CTRL			0x4
+#define ATMEL_HSMC_NFC_CTRL_EN			BIT(0)
+#define ATMEL_HSMC_NFC_CTRL_DIS			BIT(1)
+
+#define ATMEL_HSMC_NFC_SR			0x8
+#define ATMEL_HSMC_NFC_IER			0xc
+#define ATMEL_HSMC_NFC_IDR			0x10
+#define ATMEL_HSMC_NFC_IMR			0x14
+#define ATMEL_HSMC_NFC_SR_ENABLED		BIT(1)
+#define ATMEL_HSMC_NFC_SR_RB_RISE		BIT(4)
+#define ATMEL_HSMC_NFC_SR_RB_FALL		BIT(5)
+#define ATMEL_HSMC_NFC_SR_BUSY			BIT(8)
+#define ATMEL_HSMC_NFC_SR_WR			BIT(11)
+#define ATMEL_HSMC_NFC_SR_CSID			GENMASK(14, 12)
+#define ATMEL_HSMC_NFC_SR_XFRDONE		BIT(16)
+#define ATMEL_HSMC_NFC_SR_CMDDONE		BIT(17)
+#define ATMEL_HSMC_NFC_SR_DTOE			BIT(20)
+#define ATMEL_HSMC_NFC_SR_UNDEF			BIT(21)
+#define ATMEL_HSMC_NFC_SR_AWB			BIT(22)
+#define ATMEL_HSMC_NFC_SR_NFCASE		BIT(23)
+#define ATMEL_HSMC_NFC_SR_RBEDGE(x)		BIT((x) + 24)
+
+#define ATMEL_HSMC_NFC_ADDR			0x18
+#define ATMEL_HSMC_NFC_BANK			0x1c
+
+#define ATMEL_NFC_MAX_RB_ID			7
+
+#define ATMEL_NFC_SRAM_SIZE			0x2400
+
+#define ATMEL_NFC_CMD(pos, cmd)			((cmd) << (((pos) * 8) + 2))
+#define ATMEL_NFC_VCMD2				BIT(18)
+#define ATMEL_NFC_ACYCLE(naddrs)		((naddrs) << 19)
+#define ATMEL_NFC_CSID(cs)			((cs) << 22)
+#define ATMEL_NFC_DATAEN			BIT(25)
+#define ATMEL_NFC_NFCWR				BIT(26)
+
+#define ATMEL_NAND_ALE_OFFSET			BIT(21)
+#define ATMEL_NAND_CLE_OFFSET			BIT(22)
+
+#define DEFAULT_TIMEOUT_MS			1000
+
+#define ATMEL_NFC_MIN_DMA_LEN			64
+
+enum atmel_nand_rb_type {
+	ATMEL_NAND_NO_RB,
+	ATMEL_NAND_NATIVE_RB,
+	ATMEL_NAND_GPIO_RB,
+};
+
+struct atmel_nand_rb {
+	enum atmel_nand_rb_type type;
+	union {
+		struct gpio_desc *gpio;
+		int id;
+	};
+};
+
+struct atmel_nand_cs {
+	int id;
+	struct atmel_nand_rb rb;
+	struct gpio_desc *csgpio;
+	struct {
+		void __iomem *virt;
+		dma_addr_t dma;
+	} io;
+};
+
+struct atmel_nand {
+	struct list_head node;
+	struct device *dev;
+	struct nand_chip base;
+	struct atmel_nand_cs *activecs;
+	struct atmel_pmecc_user *pmecc;
+	struct gpio_desc *cdgpio;
+	int numcs;
+	struct atmel_nand_cs cs[];
+};
+
+static inline struct atmel_nand *to_atmel_nand(struct nand_chip *chip)
+{
+	return container_of(chip, struct atmel_nand, base);
+}
+
+enum atmel_sama5_data_xfer {
+	ATMEL_NFC_NO_DATA,
+	ATMEL_NFC_READ_DATA,
+	ATMEL_NFC_WRITE_DATA,
+};
+
+struct atmel_sama5_op {
+	u8 cs;
+	u8 ncmds;
+	u8 cmds[2];
+	u8 naddrs;
+	u8 addrs[5];
+	enum atmel_sama5_data_xfer data;
+};
+
+struct atmel_nfc;
+struct atmel_nfc_caps;
+
+struct atmel_nfc_ops {
+	int (*probe)(struct platform_device *pdev,
+		     const struct atmel_nfc_caps *caps);
+	int (*remove)(struct atmel_nfc *nfc);
+	void (*nand_init)(struct atmel_nfc *nfc, struct atmel_nand *nand);
+	int (*ecc_init)(struct atmel_nand *nand);
+};
+
+struct atmel_nfc_caps {
+	bool has_dma;
+	bool legacy_of_bindings;
+	u32 ale_offs;
+	u32 cle_offs;
+	const struct atmel_nfc_ops *ops;
+};
+
+struct atmel_nfc {
+	struct nand_hw_control base;
+	const struct atmel_nfc_caps *caps;
+	struct device *dev;
+	struct regmap *smc;
+	struct regmap *matrix;
+	unsigned int ebi_csa_offs;
+	struct dma_chan *dmac;
+	struct atmel_pmecc *pmecc;
+	struct list_head chips;
+};
+
+static inline struct atmel_nfc *to_nfc(struct nand_hw_control *ctl)
+{
+	return container_of(ctl, struct atmel_nfc, base);
+}
+
+struct atmel_sama5_nfc {
+	struct atmel_nfc base;
+	struct {
+		struct gen_pool *pool;
+		void __iomem *virt;
+		dma_addr_t dma;
+	} sram;
+	struct regmap *io;
+	struct atmel_sama5_op op;
+	struct completion complete;
+	int irq;
+
+	/* Only used when instantiating from legacy DT bindings. */
+	struct clk *clk;
+};
+
+static inline struct atmel_sama5_nfc *to_sama5_nfc(struct nand_hw_control *ctl)
+{
+	return container_of(to_nfc(ctl), struct atmel_sama5_nfc, base);
+}
+
+static irqreturn_t atmel_sama5_nfc_interrupt(int irq, void *data)
+{
+	struct atmel_sama5_nfc *nfc = data;
+	u32 imr, sr;
+
+	regmap_read(nfc->base.smc, ATMEL_HSMC_NFC_IMR, &imr);
+	regmap_read(nfc->base.smc, ATMEL_HSMC_NFC_SR, &sr);
+
+	sr &= imr;
+
+	if (sr)
+		regmap_write(nfc->base.smc, ATMEL_HSMC_NFC_IDR, sr);
+
+	if (sr == imr)
+		complete(&nfc->complete);
+
+	return sr ? IRQ_HANDLED : IRQ_NONE;
+}
+
+static bool atmel_sama5_nfc_op_done(u32 *events, u32 status)
+{
+	*events ^= (status & *events);
+
+	return !*events;
+}
+
+static int atmel_sama5_nfc_wait(struct atmel_sama5_nfc *nfc, u32 events,
+				bool poll, unsigned int timeout_ms)
+{
+	int ret;
+
+	if (!timeout_ms)
+		timeout_ms = DEFAULT_TIMEOUT_MS;
+
+	if (poll) {
+		u32 status;
+
+		ret = regmap_read_poll_timeout(nfc->base.smc,
+					       ATMEL_HSMC_NFC_SR, status,
+					       atmel_sama5_nfc_op_done(&events,
+								       status),
+					       0, timeout_ms * 1000);
+	} else {
+		init_completion(&nfc->complete);
+		regmap_write(nfc->base.smc, ATMEL_HSMC_NFC_IER, events);
+		ret = wait_for_completion_timeout(&nfc->complete,
+						msecs_to_jiffies(timeout_ms));
+		regmap_write(nfc->base.smc, ATMEL_HSMC_NFC_IDR, 0xffffffff);
+	}
+
+	return ret;
+}
+
+static void atmel_nfc_dma_transfer_finished(void *data)
+{
+	struct completion *finished = data;
+
+	complete(finished);
+}
+
+static int atmel_nfc_dma_transfer(struct atmel_nfc *nfc, void *buf,
+				  dma_addr_t dev_dma, size_t len,
+				  enum dma_data_direction dir)
+{
+	DECLARE_COMPLETION_ONSTACK(finished);
+	dma_addr_t src_dma, dst_dma, buf_dma;
+	struct dma_async_tx_descriptor *tx;
+	dma_cookie_t cookie;
+
+	buf_dma = dma_map_single(nfc->dev, buf, len, dir);
+	if (dma_mapping_error(nfc->dev, dev_dma)) {
+		dev_err(nfc->dev,
+			"Failed to prepare a buffer for DMA access\n");
+		goto err;
+	}
+
+	if (dir == DMA_FROM_DEVICE) {
+		src_dma = dev_dma;
+		dst_dma = buf_dma;
+	} else {
+		src_dma = buf_dma;
+		dst_dma = dev_dma;
+	}
+
+	tx = dmaengine_prep_dma_memcpy(nfc->dmac, dst_dma, src_dma, len,
+				       DMA_CTRL_ACK | DMA_PREP_INTERRUPT);
+	if (!tx) {
+		dev_err(nfc->dev, "Failed to prepare DMA memcpy\n");
+		goto err_unmap;
+	}
+
+	tx->callback = atmel_nfc_dma_transfer_finished;
+	tx->callback_param = &finished;
+
+	cookie = dmaengine_submit(tx);
+	if (dma_submit_error(cookie)) {
+		dev_err(nfc->dev, "Failed to do DMA tx_submit\n");
+		goto err_unmap;
+	}
+
+	dma_async_issue_pending(nfc->dmac);
+	wait_for_completion(&finished);
+
+	return 0;
+
+err_unmap:
+	dma_unmap_single(nfc->dev, buf_dma, len, dir);
+
+err:
+	dev_dbg(nfc->dev, "Fall back to CPU I/O\n");
+
+	return -EIO;
+}
+
+static u8 atmel_nand_read_byte(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+
+	return ioread8(nand->activecs->io.virt);
+}
+
+static u16 atmel_nand_read_word(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+
+	return ioread16(nand->activecs->io.virt);
+}
+
+static void atmel_nand_write_byte(struct mtd_info *mtd, u8 byte)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+
+	if (chip->options & NAND_BUSWIDTH_16)
+		iowrite16(byte | (byte << 8), nand->activecs->io.virt);
+	else
+		iowrite8(byte, nand->activecs->io.virt);
+}
+
+static void atmel_nand_read_buf(struct mtd_info *mtd, u8 *buf, int len)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	struct atmel_nfc *nfc = to_nfc(chip->controller);
+
+	/*
+	 * If the controller supports DMA, the buffer address is DMA-able and
+	 * len is long enough to make DMA transfers profitable, let's trigger
+	 * a DMA transfer. If it fails, fallback to PIO mode.
+	 */
+	if (nfc->dmac && virt_addr_valid(buf) &&
+	    len >= ATMEL_NFC_MIN_DMA_LEN &&
+	    !atmel_nfc_dma_transfer(nfc, buf, nand->activecs->io.dma, len,
+				    DMA_FROM_DEVICE))
+		return;
+
+	if (chip->options & NAND_BUSWIDTH_16)
+		ioread16_rep(nand->activecs->io.virt, buf, len / 2);
+	else
+		ioread8_rep(nand->activecs->io.virt, buf, len);
+}
+
+static void atmel_nand_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	struct atmel_nfc *nfc = to_nfc(chip->controller);
+
+	/*
+	 * If the controller supports DMA, the buffer address is DMA-able and
+	 * len is long enough to make DMA transfers profitable, let's trigger
+	 * a DMA transfer. If it fails, fallback to PIO mode.
+	 */
+	if (nfc->dmac && virt_addr_valid(buf) &&
+	    len >= ATMEL_NFC_MIN_DMA_LEN &&
+	    !atmel_nfc_dma_transfer(nfc, (void *)buf, nand->activecs->io.dma,
+				    len, DMA_TO_DEVICE))
+		return;
+
+	if (chip->options & NAND_BUSWIDTH_16)
+		iowrite16_rep(nand->activecs->io.virt, buf, len / 2);
+	else
+		iowrite8_rep(nand->activecs->io.virt, buf, len);
+}
+
+static int atmel_nand_dev_ready(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+
+	return gpiod_get_value(nand->activecs->rb.gpio);
+}
+
+static void atmel_nand_select_chip(struct mtd_info *mtd, int cs)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+
+	if (cs < 0 || cs >= nand->numcs) {
+		nand->activecs = NULL;
+		chip->dev_ready = NULL;
+		return;
+	}
+
+	nand->activecs = &nand->cs[cs];
+
+	if (nand->activecs->rb.type == ATMEL_NAND_GPIO_RB)
+		chip->dev_ready = atmel_nand_dev_ready;
+}
+
+static int atmel_sama5_nfc_dev_ready(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	struct atmel_sama5_nfc *nfc = to_sama5_nfc(chip->controller);
+	u32 status;
+
+	regmap_read(nfc->base.smc, ATMEL_HSMC_NFC_SR, &status);
+
+	return status & ATMEL_HSMC_NFC_SR_RBEDGE(nand->activecs->rb.id);
+}
+
+static void atmel_sama5_nfc_select_chip(struct mtd_info *mtd, int cs)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	struct atmel_sama5_nfc *nfc = to_sama5_nfc(chip->controller);
+
+	atmel_nand_select_chip(mtd, cs);
+
+	if (!nand->activecs) {
+		regmap_write(nfc->base.smc, ATMEL_HSMC_NFC_CTRL,
+			     ATMEL_HSMC_NFC_CTRL_DIS);
+		return;
+	}
+
+	if (nand->activecs->rb.type == ATMEL_NAND_NATIVE_RB)
+		chip->dev_ready = atmel_sama5_nfc_dev_ready;
+
+	regmap_update_bits(nfc->base.smc, ATMEL_HSMC_NFC_CFG,
+			   ATMEL_HSMC_NFC_CFG_PAGESIZE_MASK,
+			   ATMEL_HSMC_NFC_CFG_PAGESIZE(mtd->writesize));
+	regmap_write(nfc->base.smc, ATMEL_HSMC_NFC_CTRL,
+		     ATMEL_HSMC_NFC_CTRL_EN);
+}
+
+static int atmel_sama5_nfc_exec_op(struct atmel_sama5_nfc *nfc)
+{
+	u32 addr, val, wait = ATMEL_HSMC_NFC_SR_CMDDONE;
+	u8 *addrs = nfc->op.addrs;
+	unsigned int op = 0;
+	int i, ret;
+
+	for (i = 0; i < nfc->op.ncmds; i++)
+		op |= ATMEL_NFC_CMD(i, nfc->op.cmds[i]);
+
+	if (nfc->op.naddrs == 5)
+		regmap_write(nfc->base.smc, ATMEL_HSMC_NFC_ADDR, *addrs++);
+
+	op |= ATMEL_NFC_CSID(nfc->op.cs) |
+	      ATMEL_NFC_ACYCLE(nfc->op.naddrs);
+
+	if (nfc->op.ncmds > 1)
+		op |= ATMEL_NFC_VCMD2;
+
+	addr = addrs[0] | (addrs[1] << 8) | (addrs[2] << 16) |
+	       (addrs[3] << 24);
+
+	if (nfc->op.data != ATMEL_NFC_NO_DATA) {
+		op |= ATMEL_NFC_DATAEN;
+		wait |= ATMEL_HSMC_NFC_SR_XFRDONE;
+
+		if (nfc->op.data == ATMEL_NFC_WRITE_DATA)
+			op |= ATMEL_NFC_NFCWR;
+	}
+
+	/* Clear all flags. */
+	regmap_read(nfc->base.smc, ATMEL_HSMC_NFC_SR, &val);
+
+	/* Send the command. */
+	regmap_write(nfc->io, op, addr);
+
+	ret = atmel_sama5_nfc_wait(nfc, wait, true, 0);
+	if (ret)
+		dev_err(nfc->base.dev,
+			"Failed to send NAND command (err = %d)!",
+			ret);
+
+	/* Reset the op state. */
+	memset(&nfc->op, 0, sizeof(nfc->op));
+
+	return ret;
+}
+
+static void atmel_sama5_nfc_cmd_ctrl(struct mtd_info *mtd, int dat,
+				     unsigned int ctrl)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	struct atmel_sama5_nfc *nfc = to_sama5_nfc(chip->controller);
+
+	if (ctrl & NAND_ALE) {
+		if (nfc->op.naddrs > 4)
+			return;
+
+		nfc->op.addrs[nfc->op.naddrs++] = dat;
+	} else if (ctrl & NAND_CLE) {
+		if (nfc->op.ncmds > 1)
+			return;
+
+		nfc->op.cmds[nfc->op.ncmds++] = dat;
+	}
+
+	if (dat == NAND_CMD_NONE) {
+		nfc->op.cs = nand->activecs->id;
+		atmel_sama5_nfc_exec_op(nfc);
+	}
+}
+
+static void atmel_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
+				unsigned int ctrl)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	struct atmel_nfc *nfc = to_nfc(chip->controller);
+
+	if (ctrl & NAND_CTRL_CHANGE && nand->activecs->csgpio) {
+		if (ctrl & NAND_NCE)
+			gpiod_set_value(nand->activecs->csgpio, 0);
+		else
+			gpiod_set_value(nand->activecs->csgpio, 1);
+	}
+
+	if (ctrl & NAND_ALE)
+		writeb(cmd, nand->activecs->io.virt + nfc->caps->ale_offs);
+	else if (ctrl & NAND_CLE)
+		writeb(cmd, nand->activecs->io.virt + nfc->caps->cle_offs);
+}
+
+static void atmel_sama5_nfc_copy_to_sram(struct nand_chip *chip, const u8 *buf,
+					 bool oob_required)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct atmel_sama5_nfc *nfc = to_sama5_nfc(chip->controller);
+	int ret = -EIO;
+
+	if (nfc->base.dmac)
+		ret = atmel_nfc_dma_transfer(&nfc->base, (void *)buf,
+					     nfc->sram.dma, mtd->writesize,
+					     DMA_TO_DEVICE);
+
+	/* Falling back to CPU copy. */
+	if (ret)
+		memcpy_toio(nfc->sram.virt, buf, mtd->writesize);
+
+	if (oob_required)
+		memcpy_toio(nfc->sram.virt + mtd->writesize, chip->oob_poi,
+			    mtd->oobsize);
+}
+
+static void atmel_sama5_nfc_copy_from_sram(struct nand_chip *chip, u8 *buf,
+					   bool oob_required)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct atmel_sama5_nfc *nfc = to_sama5_nfc(chip->controller);
+	int ret = -EIO;
+
+	if (nfc->base.dmac)
+		ret = atmel_nfc_dma_transfer(&nfc->base, buf, nfc->sram.dma,
+					     mtd->writesize, DMA_FROM_DEVICE);
+
+	/* Falling back to CPU copy. */
+	if (ret)
+		memcpy_fromio(buf, nfc->sram.virt, mtd->writesize);
+
+	if (oob_required)
+		memcpy_fromio(chip->oob_poi, nfc->sram.virt + mtd->writesize,
+			      mtd->oobsize);
+}
+
+static void atmel_sama5_nfc_set_op_addr(struct nand_chip *chip, int page,
+					int column)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct atmel_sama5_nfc *nfc = to_sama5_nfc(chip->controller);
+
+	if (column >= 0) {
+		nfc->op.addrs[nfc->op.naddrs++] = column;
+
+		/*
+		 * 2 address cycles for the column offset on large page NANDs.
+		 */
+		if (mtd->writesize > 512)
+			nfc->op.addrs[nfc->op.naddrs++] = column >> 8;
+	}
+
+	if (page >= 0) {
+		nfc->op.addrs[nfc->op.naddrs++] = page;
+		nfc->op.addrs[nfc->op.naddrs++] = page >> 8;
+
+		if ((mtd->writesize > 512 && chip->chipsize > SZ_128M) ||
+		    (mtd->writesize <= 512 && chip->chipsize > SZ_32M))
+			nfc->op.addrs[nfc->op.naddrs++] = page >> 16;
+	}
+}
+
+static int atmel_nfc_pmecc_enable(struct nand_chip *chip, int op, bool raw)
+{
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	struct atmel_nfc *nfc = to_nfc(chip->controller);
+	int ret;
+
+	if (raw)
+		return 0;
+
+	ret = atmel_pmecc_enable(nand->pmecc, op);
+	if (ret)
+		dev_err(nfc->dev,
+			"Failed to enable ECC engine (err = %d)\n", ret);
+
+	return ret;
+}
+
+static void atmel_nfc_pmecc_disable(struct nand_chip *chip, bool raw)
+{
+	struct atmel_nand *nand = to_atmel_nand(chip);
+
+	if (!raw)
+		atmel_pmecc_disable(nand->pmecc);
+}
+
+static int atmel_nfc_pmecc_generate_eccbytes(struct nand_chip *chip, bool raw)
+{
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct atmel_nfc *nfc = to_nfc(chip->controller);
+	struct mtd_oob_region oobregion;
+	void *eccbuf;
+	int ret, i;
+
+	if (raw)
+		return 0;
+
+	ret = atmel_pmecc_wait_rdy(nand->pmecc);
+	if (ret) {
+		dev_err(nfc->dev,
+			"Failed to transfer NAND page data (err = %d)\n",
+			ret);
+		return ret;
+	}
+
+	mtd_ooblayout_ecc(mtd, 0, &oobregion);
+	eccbuf = chip->oob_poi + oobregion.offset;
+
+	for (i = 0; i < chip->ecc.steps; i++) {
+		atmel_pmecc_get_generated_eccbytes(nand->pmecc, i,
+						   eccbuf);
+		eccbuf += chip->ecc.bytes;
+	}
+
+	return 0;
+}
+
+static int atmel_nfc_pmecc_correct_data(struct nand_chip *chip, void *buf,
+					bool raw)
+{
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct atmel_nfc *nfc = to_nfc(chip->controller);
+	struct mtd_oob_region oobregion;
+	int ret, i, max_bitflips = 0;
+	void *databuf, *eccbuf;
+
+	if (raw)
+		return 0;
+
+	ret = atmel_pmecc_wait_rdy(nand->pmecc);
+	if (ret) {
+		dev_err(nfc->dev,
+			"Failed to read NAND page data (err = %d)\n",
+			ret);
+		return ret;
+	}
+
+	mtd_ooblayout_ecc(mtd, 0, &oobregion);
+	eccbuf = chip->oob_poi + oobregion.offset;
+	databuf = buf;
+
+	for (i = 0; i < chip->ecc.steps; i++) {
+		ret = atmel_pmecc_correct_sector(nand->pmecc, i, databuf,
+						 eccbuf);
+		if (ret < 0 && !atmel_pmecc_correct_erased_chunks(nand->pmecc))
+			ret = nand_check_erased_ecc_chunk(databuf,
+							  chip->ecc.size,
+							  eccbuf,
+							  chip->ecc.bytes,
+							  NULL, 0,
+							  chip->ecc.strength);
+
+		if (ret >= 0)
+			max_bitflips = max(ret, max_bitflips);
+		else
+			mtd->ecc_stats.failed++;
+
+		databuf += chip->ecc.size;
+		eccbuf += chip->ecc.bytes;
+	}
+
+	return max_bitflips;
+}
+
+static int atmel_nfc_pmecc_write_pg(struct nand_chip *chip, const u8 *buf,
+				    bool oob_required, int page, bool raw)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	int ret;
+
+	ret = atmel_nfc_pmecc_enable(chip, NAND_ECC_WRITE, raw);
+	if (ret)
+		return ret;
+
+	atmel_nand_write_buf(mtd, buf, mtd->writesize);
+
+	ret = atmel_nfc_pmecc_generate_eccbytes(chip, raw);
+	if (ret) {
+		atmel_pmecc_disable(nand->pmecc);
+		return ret;
+	}
+
+	atmel_nfc_pmecc_disable(chip, raw);
+
+	atmel_nand_write_buf(mtd, chip->oob_poi, mtd->oobsize);
+
+	return 0;
+}
+
+static int atmel_nfc_pmecc_write_page(struct mtd_info *mtd,
+				      struct nand_chip *chip, const u8 *buf,
+				      int oob_required, int page)
+{
+	return atmel_nfc_pmecc_write_pg(chip, buf, oob_required, page, false);
+}
+
+static int atmel_nfc_pmecc_write_page_raw(struct mtd_info *mtd,
+					  struct nand_chip *chip,
+					  const u8 *buf, int oob_required,
+					  int page)
+{
+	return atmel_nfc_pmecc_write_pg(chip, buf, oob_required, page, true);
+}
+
+static int atmel_nfc_pmecc_read_pg(struct nand_chip *chip, u8 *buf,
+				   bool oob_required, int page, bool raw)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int ret;
+
+	ret = atmel_nfc_pmecc_enable(chip, NAND_ECC_READ, raw);
+	if (ret)
+		return ret;
+
+	atmel_nand_read_buf(mtd, buf, mtd->writesize);
+	atmel_nand_read_buf(mtd, chip->oob_poi, mtd->oobsize);
+
+	ret = atmel_nfc_pmecc_correct_data(chip, buf, raw);
+
+	atmel_nfc_pmecc_disable(chip, raw);
+
+	return ret;
+}
+
+static int atmel_nfc_pmecc_read_page(struct mtd_info *mtd,
+				     struct nand_chip *chip, u8 *buf,
+				     int oob_required, int page)
+{
+	return atmel_nfc_pmecc_read_pg(chip, buf, oob_required, page, false);
+}
+
+static int atmel_nfc_pmecc_read_page_raw(struct mtd_info *mtd,
+					 struct nand_chip *chip, u8 *buf,
+					 int oob_required, int page)
+{
+	return atmel_nfc_pmecc_read_pg(chip, buf, oob_required, page, true);
+}
+
+static int atmel_sama5_nfc_pmecc_write_pg(struct nand_chip *chip,
+					  const u8 *buf, bool oob_required,
+					  int page, bool raw)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	struct atmel_sama5_nfc *nfc = to_sama5_nfc(chip->controller);
+	int ret;
+
+	atmel_sama5_nfc_copy_to_sram(chip, buf, false);
+
+	nfc->op.cmds[0] = NAND_CMD_SEQIN;
+	nfc->op.ncmds = 1;
+	atmel_sama5_nfc_set_op_addr(chip, page, 0x0);
+	nfc->op.cs = nand->activecs->id;
+	nfc->op.data = ATMEL_NFC_WRITE_DATA;
+
+	ret = atmel_nfc_pmecc_enable(chip, NAND_ECC_WRITE, raw);
+	if (ret)
+		return ret;
+
+	ret = atmel_sama5_nfc_exec_op(nfc);
+	if (ret) {
+		atmel_nfc_pmecc_disable(chip, raw);
+		dev_err(nfc->base.dev,
+			"Failed to transfer NAND page data (err = %d)\n",
+			ret);
+		return ret;
+	}
+
+	ret = atmel_nfc_pmecc_generate_eccbytes(chip, raw);
+
+	atmel_nfc_pmecc_disable(chip, raw);
+
+	if (ret)
+		return ret;
+
+	atmel_nand_write_buf(mtd, chip->oob_poi, mtd->oobsize);
+
+	nfc->op.cmds[0] = NAND_CMD_PAGEPROG;
+	nfc->op.ncmds = 1;
+	nfc->op.cs = nand->activecs->id;
+	ret = atmel_sama5_nfc_exec_op(nfc);
+	if (ret)
+		dev_err(nfc->base.dev, "Failed to program NAND page (err = %d)\n",
+			ret);
+
+	return ret;
+}
+
+static int atmel_sama5_nfc_pmecc_write_page(struct mtd_info *mtd,
+					    struct nand_chip *chip,
+					    const u8 *buf, int oob_required,
+					    int page)
+{
+	return atmel_sama5_nfc_pmecc_write_pg(chip, buf, oob_required, page,
+					      false);
+}
+
+static int atmel_sama5_nfc_pmecc_write_page_raw(struct mtd_info *mtd,
+						struct nand_chip *chip,
+						const u8 *buf,
+						int oob_required, int page)
+{
+	return atmel_sama5_nfc_pmecc_write_pg(chip, buf, oob_required, page,
+					      true);
+}
+
+static int atmel_sama5_nfc_pmecc_read_pg(struct nand_chip *chip, u8 *buf,
+					 bool oob_required, int page, bool raw)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	struct atmel_sama5_nfc *nfc = to_sama5_nfc(chip->controller);
+	int ret;
+
+	/*
+	 * Optimized read page accessors only work when the NAND R/B pin is
+	 * connected to a native SoC R/B pin. If that's not the case, fallback
+	 * to the non-optimized one.
+	 */
+	if (nand->activecs->rb.type != ATMEL_NAND_NATIVE_RB) {
+		chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
+
+		return atmel_nfc_pmecc_read_pg(chip, buf, oob_required, page,
+					       raw);
+	}
+
+	nfc->op.cmds[nfc->op.ncmds++] = NAND_CMD_READ0;
+
+	if (mtd->writesize > 512)
+		nfc->op.cmds[nfc->op.ncmds++] = NAND_CMD_READSTART;
+
+	atmel_sama5_nfc_set_op_addr(chip, page, 0x0);
+	nfc->op.cs = nand->activecs->id;
+	nfc->op.data = ATMEL_NFC_READ_DATA;
+
+	ret = atmel_nfc_pmecc_enable(chip, NAND_ECC_READ, raw);
+	if (ret)
+		return ret;
+
+	ret = atmel_sama5_nfc_exec_op(nfc);
+	if (ret) {
+		atmel_nfc_pmecc_disable(chip, raw);
+		dev_err(nfc->base.dev,
+			"Failed to load NAND page data (err = %d)\n",
+			ret);
+		return ret;
+	}
+
+	atmel_sama5_nfc_copy_from_sram(chip, buf, false);
+	atmel_nand_read_buf(mtd, chip->oob_poi, mtd->oobsize);
+
+	ret = atmel_nfc_pmecc_correct_data(chip, buf, raw);
+
+	atmel_nfc_pmecc_disable(chip, raw);
+
+	return ret;
+}
+
+static int atmel_sama5_nfc_pmecc_read_page(struct mtd_info *mtd,
+					   struct nand_chip *chip, u8 *buf,
+					   int oob_required, int page)
+{
+	return atmel_sama5_nfc_pmecc_read_pg(chip, buf, oob_required, page,
+					     false);
+}
+
+static int atmel_sama5_nfc_pmecc_read_page_raw(struct mtd_info *mtd,
+					       struct nand_chip *chip, u8 *buf,
+					       int oob_required, int page)
+{
+	return atmel_sama5_nfc_pmecc_read_pg(chip, buf, oob_required, page,
+					     true);
+}
+
+static int atmel_nand_pmecc_init(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	struct atmel_nfc *nfc = to_nfc(chip->controller);
+	struct atmel_pmecc_user_req req;
+
+	if (!nfc->pmecc) {
+		dev_err(nfc->dev, "HW ECC not supported\n");
+		return -ENOTSUPP;
+	}
+
+	if (nfc->caps->legacy_of_bindings) {
+		u32 val;
+
+		if (!of_property_read_u32(nfc->dev->of_node, "atmel,pmecc-cap",
+					  &val))
+			chip->ecc.strength = val;
+
+		if (!of_property_read_u32(nfc->dev->of_node,
+					  "atmel,pmecc-sector-size",
+					  &val))
+			chip->ecc.size = val;
+	}
+
+	if (chip->ecc.options & NAND_ECC_MAXIMIZE)
+		req.ecc.strength = ATMEL_PMECC_MAXIMIZE_ECC_STRENGTH;
+	else if (chip->ecc.strength)
+		req.ecc.strength = chip->ecc.strength;
+	else if (chip->ecc_strength_ds)
+		req.ecc.strength = chip->ecc_strength_ds;
+	else
+		req.ecc.strength = ATMEL_PMECC_MAXIMIZE_ECC_STRENGTH;
+
+	if (chip->ecc.size)
+		req.ecc.sectorsize = chip->ecc.size;
+	else if (chip->ecc_step_ds)
+		req.ecc.sectorsize = chip->ecc_step_ds;
+	else
+		req.ecc.sectorsize = ATMEL_PMECC_SECTOR_SIZE_AUTO;
+
+	req.pagesize = mtd->writesize;
+	req.oobsize = mtd->oobsize;
+
+	if (mtd->writesize <= 512) {
+		req.ecc.bytes = 4;
+		req.ecc.ooboffset = 0;
+	} else {
+		req.ecc.bytes = mtd->oobsize - 2;
+		req.ecc.ooboffset = ATMEL_PMECC_OOBOFFSET_AUTO;
+	}
+
+	nand->pmecc = atmel_pmecc_create_user(nfc->pmecc, &req);
+	if (IS_ERR(nand->pmecc))
+		return PTR_ERR(nand->pmecc);
+
+	chip->ecc.algo = NAND_ECC_BCH;
+	chip->ecc.size = req.ecc.sectorsize;
+	chip->ecc.bytes = req.ecc.bytes / req.ecc.nsectors;
+	chip->ecc.strength = req.ecc.strength;
+
+	chip->options |= NAND_NO_SUBPAGE_WRITE;
+
+	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+
+	return 0;
+}
+
+static int atmel_nfc_ecc_init(struct atmel_nand *nand)
+{
+	struct nand_chip *chip = &nand->base;
+	struct atmel_nfc *nfc = to_nfc(chip->controller);
+	int ret;
+
+	switch (chip->ecc.mode) {
+	case NAND_ECC_NONE:
+	case NAND_ECC_SOFT:
+		/*
+		 * Nothing to do, the core will initialize everything for us.
+		 */
+		break;
+
+	case NAND_ECC_HW:
+		ret = atmel_nand_pmecc_init(chip);
+		if (ret)
+			return ret;
+
+		chip->ecc.read_page = atmel_nfc_pmecc_read_page;
+		chip->ecc.write_page = atmel_nfc_pmecc_write_page;
+		chip->ecc.read_page_raw = atmel_nfc_pmecc_read_page_raw;
+		chip->ecc.write_page_raw = atmel_nfc_pmecc_write_page_raw;
+		break;
+
+	default:
+		/* Other modes are not supported. */
+		dev_err(nfc->dev, "Unsupported ECC mode: %d\n",
+			chip->ecc.mode);
+		return -ENOTSUPP;
+	}
+
+	return 0;
+}
+
+static int atmel_sama5_nfc_ecc_init(struct atmel_nand *nand)
+{
+	struct nand_chip *chip = &nand->base;
+	int ret;
+
+	ret = atmel_nfc_ecc_init(nand);
+	if (ret)
+		return ret;
+
+	if (chip->ecc.mode != NAND_ECC_HW)
+		return 0;
+
+	/* Adjust the ECC operations for the SAMA5 IP. */
+	chip->ecc.read_page = atmel_sama5_nfc_pmecc_read_page;
+	chip->ecc.write_page = atmel_sama5_nfc_pmecc_write_page;
+	chip->ecc.read_page_raw = atmel_sama5_nfc_pmecc_read_page_raw;
+	chip->ecc.write_page_raw = atmel_sama5_nfc_pmecc_write_page_raw;
+	chip->ecc.options |= NAND_ECC_CUSTOM_PAGE_ACCESS;
+
+	return 0;
+}
+
+static void atmel_nfc_nand_init(struct atmel_nfc *nfc, struct atmel_nand *nand)
+{
+	struct nand_chip *chip = &nand->base;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	mtd->dev.parent = nfc->dev;
+	nand->base.controller = &nfc->base;
+
+	chip->cmd_ctrl = atmel_nand_cmd_ctrl;
+	chip->read_byte = atmel_nand_read_byte;
+	chip->read_word = atmel_nand_read_word;
+	chip->write_byte = atmel_nand_write_byte;
+	chip->read_buf = atmel_nand_read_buf;
+	chip->write_buf = atmel_nand_write_buf;
+	chip->select_chip = atmel_nand_select_chip;
+
+	/*
+	 * Use a bounce buffer when the buffer passed by the MTD user is not
+	 * suitable for DMA.
+	 */
+	if (nfc->dmac)
+		chip->options |= NAND_USE_BOUNCE_BUFFER;
+
+	/* Default to HW ECC if pmecc is available. */
+	if (nfc->pmecc)
+		chip->ecc.mode = NAND_ECC_HW;
+}
+
+static void atmel_sama5_nfc_nand_init(struct atmel_nfc *nfc,
+				      struct atmel_nand *nand)
+{
+	struct nand_chip *chip = &nand->base;
+
+	atmel_nfc_nand_init(nfc, nand);
+
+	/* Overload some methods for the SAMA5 controller. */
+	chip->cmd_ctrl = atmel_sama5_nfc_cmd_ctrl;
+	chip->select_chip = atmel_sama5_nfc_select_chip;
+}
+
+static int atmel_nfc_nand_detect(struct atmel_nand *nand)
+{
+	struct nand_chip *chip = &nand->base;
+	struct atmel_nfc *nfc = to_nfc(chip->controller);
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int ret;
+
+	ret = nand_scan_ident(mtd, nand->numcs, NULL);
+	if (ret)
+		dev_err(nfc->dev, "nand_scan_ident() failed: %d\n", ret);
+
+	return ret;
+}
+
+static int atmel_nfc_nand_unregister(struct atmel_nand *nand)
+{
+	struct nand_chip *chip = &nand->base;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int ret;
+
+	ret = mtd_device_unregister(mtd);
+	if (ret)
+		return ret;
+
+	nand_cleanup(chip);
+	list_del(&nand->node);
+
+	return 0;
+}
+
+static int atmel_nfc_nand_register(struct atmel_nand *nand)
+{
+	struct nand_chip *chip = &nand->base;
+	struct atmel_nfc *nfc = to_nfc(chip->controller);
+	struct atmel_nand_data *pdata = dev_get_platdata(nfc->dev);
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	const struct mtd_partition *parts = NULL;
+	int nparts = 0, ret;
+
+	if (nfc->caps->legacy_of_bindings || !nfc->dev->of_node) {
+		/*
+		 * We keep the MTD name unchanged to avoid breaking platforms
+		 * where the MTD cmdline parser is used and the bootloader
+		 * has not been updated to use the new naming scheme.
+		 */
+		mtd->name = "atmel_nand";
+	} else if (!mtd->name) {
+		/*
+		 * If the new bindings are used and the bootloader has not been
+		 * updated to pass a new mtdparts parameter on the cmdline, you
+		 * should define the following property in your nand node:
+		 *
+		 *	label = "atmel_nand";
+		 *
+		 * This way, mtd->name will be set by the core when
+		 * nand_set_flash_node() is called.
+		 */
+		mtd->name = devm_kasprintf(nfc->dev, GFP_KERNEL,
+					   "%s:nand.%d", dev_name(nfc->dev),
+					   nand->cs[0].id);
+		if (!mtd->name) {
+			dev_err(nfc->dev, "Failed to allocate mtd->name\n");
+			return -ENOMEM;
+		}
+	}
+
+	ret = nand_scan_tail(mtd);
+	if (ret) {
+		dev_err(nfc->dev, "nand_scan_tail() failed: %d\n", ret);
+		return ret;
+	}
+
+	if (pdata) {
+		parts = pdata->parts;
+		nparts = pdata->num_parts;
+	}
+
+	ret = mtd_device_register(mtd, parts, nparts);
+	if (ret) {
+		dev_err(nfc->dev, "Failed to register mtd device: %d\n", ret);
+		nand_cleanup(chip);
+		return ret;
+	}
+
+	list_add_tail(&nand->node, &nfc->chips);
+
+	return 0;
+}
+
+struct gpio_desc *atmel_nand_of_get_gpio(struct atmel_nfc *nfc,
+					 struct device_node *np,
+					 const char *name, int index,
+					 enum gpiod_flags flags)
+{
+	struct gpio_desc *gpio;
+	int ret;
+
+	gpio = devm_get_index_gpiod_from_child(nfc->dev, name, index,
+					       &np->fwnode);
+	if (IS_ERR(gpio)) {
+		if (PTR_ERR(gpio) == -ENOENT)
+			return NULL;
+
+		return gpio;
+	}
+
+	if (!(flags & GPIOD_FLAGS_BIT_DIR_SET))
+		return gpio;
+
+	/* Process flags */
+	if (flags & GPIOD_FLAGS_BIT_DIR_OUT)
+		ret = gpiod_direction_output(gpio,
+					!!(flags & GPIOD_FLAGS_BIT_DIR_VAL));
+	else
+		ret = gpiod_direction_input(gpio);
+
+	if (ret)
+		return ERR_PTR(ret);
+
+	return gpio;
+}
+
+struct gpio_desc *atmel_nand_pdata_get_gpio(struct atmel_nfc *nfc,
+					    int gpioid, const char *name,
+					    bool active_low,
+					    enum gpiod_flags flags)
+{
+	unsigned long oflags;
+	int ret;
+
+	if (!gpio_is_valid(gpioid))
+		return NULL;
+
+	switch (flags) {
+	case GPIOD_IN:
+		oflags = GPIOF_IN;
+		break;
+	case GPIOD_OUT_LOW:
+		oflags = GPIOF_OUT_INIT_LOW;
+		break;
+	case GPIOD_OUT_HIGH:
+		oflags = GPIOF_OUT_INIT_HIGH;
+		break;
+	default:
+		dev_err(nfc->dev, "Unsupported GPIO config\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (active_low)
+		oflags |= GPIOF_ACTIVE_LOW;
+
+	ret = devm_gpio_request_one(nfc->dev, gpioid, oflags, name);
+	if (ret < 0) {
+		dev_err(nfc->dev, "Could not request %s GPIO (err = %d)\n",
+			name, ret);
+		return ERR_PTR(ret);
+	}
+
+	return gpio_to_desc(gpioid);
+}
+
+static struct atmel_nand *atmel_nfc_of_nand_create(struct atmel_nfc *nfc,
+						   struct device_node *np,
+						   int reg_cells)
+{
+	struct atmel_nand *nand;
+	struct gpio_desc *gpio;
+	int numcs, ret, i;
+
+	numcs = of_property_count_elems_of_size(np, "reg",
+						reg_cells * sizeof(u32));
+	if (numcs < 1) {
+		dev_err(nfc->dev, "Missing or invalid reg property\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	nand = devm_kzalloc(nfc->dev,
+			    sizeof(*nand) + (numcs * sizeof(*nand->cs)),
+			    GFP_KERNEL);
+	if (!nand) {
+		dev_err(nfc->dev, "Failed to allocate NAND object\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	nand->numcs = numcs;
+
+	gpio = atmel_nand_of_get_gpio(nfc, np, "det", 0, GPIOD_IN);
+	if (IS_ERR(gpio)) {
+		dev_err(nfc->dev,
+			"Failed to get detect gpio (err = %ld)\n",
+			PTR_ERR(gpio));
+		return ERR_CAST(gpio);
+	}
+
+	nand->cdgpio = gpio;
+
+	for (i = 0; i < numcs; i++) {
+		struct resource res;
+		u32 val;
+
+		ret = of_address_to_resource(np, 0, &res);
+		if (ret) {
+			dev_err(nfc->dev, "Invalid reg property (err = %d)\n",
+				ret);
+			return ERR_PTR(ret);
+		}
+
+		ret = of_property_read_u32_index(np, "reg", i * reg_cells,
+						 &val);
+		if (ret) {
+			dev_err(nfc->dev, "Invalid reg property (err = %d)\n",
+				ret);
+			return ERR_PTR(ret);
+		}
+
+		nand->cs[i].id = val;
+
+		nand->cs[i].io.dma = res.start;
+		nand->cs[i].io.virt = devm_ioremap_resource(nfc->dev, &res);
+		if (IS_ERR(nand->cs[i].io.virt))
+			return ERR_CAST(nand->cs[i].io.virt);
+
+		if (!of_property_read_u32(np, "atmel,rb", &val)) {
+			if (val > ATMEL_NFC_MAX_RB_ID)
+				return ERR_PTR(-EINVAL);
+
+			nand->cs[i].rb.type = ATMEL_NAND_NATIVE_RB;
+			nand->cs[i].rb.id = val;
+		} else {
+			gpio = atmel_nand_of_get_gpio(nfc, np, "rb", i,
+						      GPIOD_IN);
+			if (IS_ERR(gpio)) {
+				dev_err(nfc->dev,
+					"Failed to get R/B gpio (err = %ld)\n",
+					PTR_ERR(gpio));
+				return ERR_CAST(gpio);
+			}
+
+			if (gpio) {
+				nand->cs[i].rb.type = ATMEL_NAND_GPIO_RB;
+				nand->cs[i].rb.gpio = gpio;
+			}
+		}
+
+		gpio = atmel_nand_of_get_gpio(nfc, np, "cs", i,
+					      GPIOD_OUT_HIGH);
+		if (IS_ERR(gpio)) {
+			dev_err(nfc->dev,
+				"Failed to get CS gpio (err = %ld)\n",
+				PTR_ERR(gpio));
+			return ERR_CAST(gpio);
+		}
+
+		nand->cs[i].csgpio = gpio;
+	}
+
+	nand_set_flash_node(&nand->base, np);
+
+	return nand;
+}
+
+static int atmel_nfc_add_nand(struct atmel_nfc *nfc, struct atmel_nand *nand)
+{
+	int ret;
+
+	/* No card inserted, skip this NAND. */
+	if (nand->cdgpio && gpiod_get_value(nand->cdgpio)) {
+		dev_info(nfc->dev, "No SmartMedia card inserted.\n");
+		return 0;
+	}
+
+	nfc->caps->ops->nand_init(nfc, nand);
+
+	/*
+	 * Attach the CS to the NAND Flash logic. Only required on pre-sama5
+	 * SoCs.
+	 */
+	if (nfc->matrix) {
+		int i;
+
+		for (i = 0; i < nand->numcs; i++)
+			regmap_update_bits(nfc->matrix, nfc->ebi_csa_offs,
+					   BIT(nand->cs[i].id),
+					   BIT(nand->cs[i].id));
+	}
+
+	ret = atmel_nfc_nand_detect(nand);
+	if (ret)
+		return ret;
+
+	ret = nfc->caps->ops->ecc_init(nand);
+	if (ret)
+		return ret;
+
+	return atmel_nfc_nand_register(nand);
+}
+
+static int atmel_nfc_remove_nands(struct atmel_nfc *nfc)
+{
+	struct atmel_nand *nand, *tmp;
+	int ret;
+
+	list_for_each_entry_safe(nand, tmp, &nfc->chips, node) {
+		ret = atmel_nfc_nand_unregister(nand);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int atmel_nfc_of_add_nands(struct atmel_nfc *nfc)
+{
+	struct device_node *np, *nand_np;
+	struct device *dev = nfc->dev;
+	int ret, reg_cells;
+	u32 val;
+
+	np = dev->of_node;
+
+	ret = of_property_read_u32(np, "#address-cells", &val);
+	if (ret) {
+		dev_err(dev, "missing #address-cells property\n");
+		return ret;
+	}
+
+	reg_cells = val;
+
+	ret = of_property_read_u32(np, "#size-cells", &val);
+	if (ret) {
+		dev_err(dev, "missing #address-cells property\n");
+		return ret;
+	}
+
+	reg_cells += val;
+
+	for_each_child_of_node(np, nand_np) {
+		struct atmel_nand *nand;
+
+		nand = atmel_nfc_of_nand_create(nfc, nand_np, reg_cells);
+		if (IS_ERR(nand)) {
+			ret = PTR_ERR(nand);
+			goto err;
+		}
+
+		ret = atmel_nfc_add_nand(nfc, nand);
+		if (ret)
+			goto err;
+	}
+
+	return 0;
+
+err:
+	atmel_nfc_remove_nands(nfc);
+
+	return ret;
+}
+
+static int atmel_nfc_legacy_add_nands(struct atmel_nfc *nfc)
+{
+	struct device *dev = nfc->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	struct atmel_nand_data *pdata = dev_get_platdata(dev);
+	struct atmel_nand *nand;
+	struct gpio_desc *gpio;
+	struct resource *res;
+
+	/*
+	 * Legacy bindings only allow connecting a single NAND with a unique CS
+	 * line to the controller.
+	 */
+	nand = devm_kzalloc(nfc->dev, sizeof(*nand) + sizeof(*nand->cs),
+			    GFP_KERNEL);
+	if (!nand)
+		return -ENOMEM;
+
+	nand->numcs = 1;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	nand->cs[0].io.virt = devm_ioremap_resource(dev, res);
+	if (IS_ERR(nand->cs[0].io.virt))
+		return PTR_ERR(nand->cs[0].io.virt);
+
+	nand->cs[0].io.dma = res->start;
+
+	/*
+	 * The old driver was hardcoding the CS id to 3 for all sama5
+	 * controllers. Since this id is only meaningful for the sama5
+	 * controller we can safely assign this id to 3 no matter the
+	 * controller.
+	 * If one wants to connect a NAND to a different CS line, he will
+	 * have to use the new bindings.
+	 */
+	nand->cs[0].id = 3;
+
+	/* R/B GPIO. */
+	if (pdata)
+		gpio = atmel_nand_pdata_get_gpio(nfc, pdata->rdy_pin,
+						 "nand-rb",
+						 pdata->rdy_pin_active_low,
+						 GPIOD_IN);
+	else
+		gpio = devm_gpiod_get_index_optional(dev, NULL, 0,
+						     GPIOD_IN);
+	if (IS_ERR(gpio)) {
+		dev_err(dev, "Failed to get R/B gpio (err = %ld)\n",
+			PTR_ERR(gpio));
+		return PTR_ERR(gpio);
+	}
+
+	if (gpio) {
+		nand->cs[0].rb.type = ATMEL_NAND_GPIO_RB;
+		nand->cs[0].rb.gpio = gpio;
+	}
+
+	/* CS GPIO. */
+	if (pdata)
+		gpio = atmel_nand_pdata_get_gpio(nfc, pdata->enable_pin,
+						 "nand-cs", 0, GPIOD_OUT_HIGH);
+	else
+		gpio = devm_gpiod_get_index_optional(dev, NULL, 1,
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(gpio)) {
+		dev_err(dev, "Failed to get CS gpio (err = %ld)\n",
+			PTR_ERR(gpio));
+		return PTR_ERR(gpio);
+	}
+
+	nand->cs[0].csgpio = gpio;
+
+	/* Card detect GPIO. */
+	if (pdata)
+		gpio = atmel_nand_pdata_get_gpio(nfc, pdata->det_pin,
+						 "nand-cd", 0, GPIOD_IN);
+	else
+		gpio = devm_gpiod_get_index_optional(nfc->dev, NULL, 2,
+						     GPIOD_IN);
+	if (IS_ERR(gpio)) {
+		dev_err(dev,
+			"Failed to get detect gpio (err = %ld)\n",
+			PTR_ERR(gpio));
+		return PTR_ERR(gpio);
+	}
+
+	nand->cdgpio = gpio;
+
+	if (pdata) {
+		if (pdata->bus_width_16)
+			nand->base.options |= NAND_BUSWIDTH_16;
+
+		/*
+		 * The only supported mode when pdata is involved is software
+		 * hamming ECC. Fallback to no ECC at all in other case.
+		 */
+		if (pdata->ecc_mode == NAND_ECC_SOFT) {
+			nand->base.ecc.mode = NAND_ECC_SOFT;
+			nand->base.ecc.algo = NAND_ECC_HAMMING;
+		}
+
+		if (pdata->on_flash_bbt)
+			nand->base.bbt_options |= NAND_BBT_USE_FLASH;
+	}
+
+	nand_set_flash_node(&nand->base, nfc->dev->of_node);
+
+	return atmel_nfc_add_nand(nfc, nand);
+}
+
+static int atmel_nfc_add_nands(struct atmel_nfc *nfc)
+{
+	/* We do not retrieve the SMC syscon when parsing old DTs or pdata. */
+	if (nfc->caps->legacy_of_bindings || !nfc->dev->of_node)
+		return atmel_nfc_legacy_add_nands(nfc);
+
+	return atmel_nfc_of_add_nands(nfc);
+}
+
+static void atmel_nfc_cleanup(struct atmel_nfc *nfc)
+{
+	if (nfc->dmac)
+		dma_release_channel(nfc->dmac);
+}
+
+static const struct of_device_id atmel_matrix_of_ids[] = {
+	{
+		.compatible = "atmel,at91sam9260-matrix",
+		.data = (void *)AT91SAM9260_MATRIX_EBICSA,
+	},
+	{
+		.compatible = "atmel,at91sam9261-matrix",
+		.data = (void *)AT91SAM9261_MATRIX_EBICSA,
+	},
+	{
+		.compatible = "atmel,at91sam9263-matrix",
+		.data = (void *)AT91SAM9263_MATRIX_EBI0CSA,
+	},
+	{
+		.compatible = "atmel,at91sam9rl-matrix",
+		.data = (void *)AT91SAM9RL_MATRIX_EBICSA,
+	},
+	{
+		.compatible = "atmel,at91sam9g45-matrix",
+		.data = (void *)AT91SAM9G45_MATRIX_EBICSA,
+	},
+	{
+		.compatible = "atmel,at91sam9n12-matrix",
+		.data = (void *)AT91SAM9N12_MATRIX_EBICSA,
+	},
+	{
+		.compatible = "atmel,at91sam9x5-matrix",
+		.data = (void *)AT91SAM9X5_MATRIX_EBICSA,
+	},
+};
+
+static int atmel_nfc_init(struct atmel_nfc *nfc, struct platform_device *pdev,
+			  const struct atmel_nfc_caps *caps)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	const struct of_device_id *match;
+	int ret;
+
+	nand_hw_control_init(&nfc->base);
+	INIT_LIST_HEAD(&nfc->chips);
+	nfc->dev = dev;
+	nfc->caps = caps;
+
+	platform_set_drvdata(pdev, nfc);
+
+	nfc->pmecc = devm_atmel_pmecc_get(dev);
+	if (IS_ERR(nfc->pmecc)) {
+		ret = PTR_ERR(nfc->pmecc);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Could not get PMECC object (err = %d)\n",
+				ret);
+		return ret;
+	}
+
+	if (nfc->caps->has_dma) {
+		dma_cap_mask_t mask;
+
+		dma_cap_zero(mask);
+		dma_cap_set(DMA_MEMCPY, mask);
+
+		nfc->dmac = dma_request_channel(mask, NULL, NULL);
+		if (!nfc->dmac)
+			dev_err(nfc->dev, "Failed to request DMA channel\n");
+	}
+
+	/* We do not retrieve the SMC syscon when parsing old DTs or pdata. */
+	if (nfc->caps->legacy_of_bindings || !nfc->dev->of_node)
+		return 0;
+
+	np = of_parse_phandle(dev->parent->of_node, "atmel,smc", 0);
+	if (!np) {
+		dev_err(dev, "Missing or invalid atmel,smc property\n");
+		return -EINVAL;
+	}
+
+	nfc->smc = syscon_node_to_regmap(np);
+	of_node_put(np);
+	if (IS_ERR(nfc->smc)) {
+		ret = IS_ERR(nfc->smc);
+		dev_err(dev, "Could not get SMC regmap (err = %d)\n", ret);
+		return ret;
+	}
+
+	np = of_parse_phandle(dev->parent->of_node, "atmel,matrix", 0);
+	if (!np)
+		return 0;
+
+	match = of_match_node(atmel_matrix_of_ids, np);
+	if (!match) {
+		of_node_put(np);
+		return 0;
+	}
+
+	nfc->matrix = syscon_node_to_regmap(np);
+	of_node_put(np);
+	if (IS_ERR(nfc->matrix)) {
+		ret = IS_ERR(nfc->matrix);
+		dev_err(dev, "Could not get SMC regmap (err = %d)\n", ret);
+		return ret;
+	}
+
+	nfc->ebi_csa_offs = (unsigned int)match->data;
+
+	/*
+	 * The at91sam9263 has 2 EBIs, if the NAND controller is under EBI1
+	 * add 4 to ->ebi_csa_offs.
+	 */
+	if (of_device_is_compatible(dev->parent->of_node,
+				    "atmel,at91sam9263-ebi1"))
+		nfc->ebi_csa_offs += 4;
+
+	return 0;
+}
+
+static int atmel_sama5_nfc_legacy_init(struct atmel_sama5_nfc *nfc)
+{
+	struct regmap_config regmap_conf = {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+		.val_bits = 32,
+	};
+
+	struct device *dev = nfc->base.dev;
+	struct device_node *nand_np, *nfc_np;
+	void __iomem *iomem;
+	struct resource res;
+	int ret;
+
+	nand_np = dev->of_node;
+	nfc_np = of_find_compatible_node(dev->of_node, NULL,
+					 "atmel,sama5d3-nfc");
+
+	nfc->clk = of_clk_get(nfc_np, 0);
+	if (IS_ERR(nfc->clk)) {
+		ret = PTR_ERR(nfc->clk);
+		dev_err(dev, "Failed to retrieve HSMC clock (err = %d)\n",
+			ret);
+		goto out;
+	}
+
+	ret = clk_prepare_enable(nfc->clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable the HSMC clock (err = %d)\n",
+			ret);
+		goto out;
+	}
+
+	nfc->irq = of_irq_get(nand_np, 0);
+	if (nfc->irq < 0) {
+		ret = nfc->irq;
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get IRQ number (err = %d)\n",
+				ret);
+		goto out;
+	}
+
+	ret = of_address_to_resource(nfc_np, 0, &res);
+	if (ret) {
+		dev_err(dev, "Invalid or missing NFC IO resource (err = %d)\n",
+			ret);
+		goto out;
+	}
+
+	iomem = devm_ioremap_resource(dev, &res);
+	if (IS_ERR(iomem)) {
+		ret = PTR_ERR(iomem);
+		goto out;
+	}
+
+	regmap_conf.name = "nfc-io";
+	regmap_conf.max_register = resource_size(&res) - 4;
+	nfc->io = devm_regmap_init_mmio(dev, iomem, &regmap_conf);
+	if (IS_ERR(nfc->io)) {
+		ret = PTR_ERR(nfc->io);
+		dev_err(dev, "Could not create NFC IO regmap (err = %d)\n",
+			ret);
+		goto out;
+	}
+
+	ret = of_address_to_resource(nfc_np, 1, &res);
+	if (ret) {
+		dev_err(dev, "Invalid or missing HSMC resource (err = %d)\n",
+			ret);
+		goto out;
+	}
+
+	iomem = devm_ioremap_resource(dev, &res);
+	if (IS_ERR(iomem)) {
+		ret = PTR_ERR(iomem);
+		goto out;
+	}
+
+	regmap_conf.name = "smc";
+	regmap_conf.max_register = resource_size(&res) - 4;
+	nfc->base.smc = devm_regmap_init_mmio(dev, iomem, &regmap_conf);
+	if (IS_ERR(nfc->base.smc)) {
+		ret = PTR_ERR(nfc->base.smc);
+		dev_err(dev, "Could not create NFC IO regmap (err = %d)\n",
+			ret);
+		goto out;
+	}
+
+	ret = of_address_to_resource(nfc_np, 2, &res);
+	if (ret) {
+		dev_err(dev, "Invalid or missing SRAM resource (err = %d)\n",
+			ret);
+		goto out;
+	}
+
+	nfc->sram.virt = devm_ioremap_resource(dev, &res);
+	if (IS_ERR(nfc->sram.virt)) {
+		ret = PTR_ERR(nfc->sram.virt);
+		goto out;
+	}
+
+	nfc->sram.dma = res.start;
+
+out:
+	of_node_put(nfc_np);
+
+	return ret;
+}
+
+static int atmel_sama5_nfc_init(struct atmel_sama5_nfc *nfc)
+{
+	struct device *dev = nfc->base.dev;
+	struct device_node *np;
+	int ret;
+
+	np = of_parse_phandle(dev->parent->of_node, "atmel,smc", 0);
+	if (!np) {
+		dev_err(dev, "Missing or invalid atmel,smc property\n");
+		return -EINVAL;
+	}
+
+	nfc->irq = of_irq_get(np, 0);
+	of_node_put(np);
+	if (nfc->irq < 0) {
+		if (nfc->irq != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get IRQ number (err = %d)\n",
+				nfc->irq);
+		return nfc->irq;
+	}
+
+	np = of_parse_phandle(dev->of_node, "atmel,nfc-io", 0);
+	if (!np) {
+		dev_err(dev, "Missing or invalid atmel,nfc-io property\n");
+		return -EINVAL;
+	}
+
+	nfc->io = syscon_node_to_regmap(np);
+	of_node_put(np);
+	if (IS_ERR(nfc->io)) {
+		ret = PTR_ERR(nfc->io);
+		dev_err(dev, "Could not get NFC IO regmap (err = %d)\n", ret);
+		return ret;
+	}
+
+	nfc->sram.pool = of_gen_pool_get(nfc->base.dev->of_node,
+					 "atmel,nfc-sram", 0);
+	if (!nfc->sram.pool) {
+		dev_err(nfc->base.dev, "Missing SRAM\n");
+		return -ENOMEM;
+	}
+
+	nfc->sram.virt = gen_pool_dma_alloc(nfc->sram.pool,
+					    ATMEL_NFC_SRAM_SIZE,
+					    &nfc->sram.dma);
+	if (!nfc->sram.virt) {
+		dev_err(nfc->base.dev,
+			"Could not allocate memory from the NFC SRAM pool\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int atmel_sama5_nfc_remove(struct atmel_nfc *nfc)
+{
+	struct atmel_sama5_nfc *sama5_nfc;
+	int ret;
+
+	ret = atmel_nfc_remove_nands(nfc);
+	if (ret)
+		return ret;
+
+	sama5_nfc = container_of(nfc, struct atmel_sama5_nfc, base);
+	if (sama5_nfc->sram.pool)
+		gen_pool_free(sama5_nfc->sram.pool,
+			      (unsigned long)sama5_nfc->sram.virt,
+			      ATMEL_NFC_SRAM_SIZE);
+
+	if (sama5_nfc->clk) {
+		clk_disable_unprepare(sama5_nfc->clk);
+		clk_put(sama5_nfc->clk);
+	}
+
+	atmel_nfc_cleanup(nfc);
+
+	return 0;
+}
+
+static int atmel_sama5_nfc_probe(struct platform_device *pdev,
+				 const struct atmel_nfc_caps *caps)
+{
+	struct device *dev = &pdev->dev;
+	struct atmel_sama5_nfc *nfc;
+	int ret;
+
+	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	if (!nfc)
+		return -ENOMEM;
+
+	ret = atmel_nfc_init(&nfc->base, pdev, caps);
+	if (ret)
+		return ret;
+
+	if (caps->legacy_of_bindings)
+		ret = atmel_sama5_nfc_legacy_init(nfc);
+	else
+		ret = atmel_sama5_nfc_init(nfc);
+
+	if (ret)
+		return ret;
+
+	/* Make sure all irqs are masked before registering our IRQ handler. */
+	regmap_write(nfc->base.smc, ATMEL_HSMC_NFC_IDR, 0xffffffff);
+	ret = devm_request_irq(dev, nfc->irq, atmel_sama5_nfc_interrupt,
+			       IRQF_SHARED, "nfc", nfc);
+	if (ret) {
+		dev_err(dev,
+			"Could not get register NFC interrupt handler (err = %d)\n",
+			ret);
+		goto err;
+	}
+
+	/* Initial NFC configuration. */
+	regmap_write(nfc->base.smc, ATMEL_HSMC_NFC_CFG,
+		     ATMEL_HSMC_NFC_CFG_DTO_MAX);
+
+	ret = atmel_nfc_add_nands(&nfc->base);
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	atmel_sama5_nfc_remove(&nfc->base);
+
+	return ret;
+}
+
+const struct atmel_nfc_ops atmel_sama5_nfc_ops = {
+	.probe = atmel_sama5_nfc_probe,
+	.remove = atmel_sama5_nfc_remove,
+	.ecc_init = atmel_sama5_nfc_ecc_init,
+	.nand_init = atmel_sama5_nfc_nand_init,
+};
+
+static const struct atmel_nfc_caps atmel_sama5_nfc_caps = {
+	.has_dma = true,
+	.ale_offs = 1 << 21,
+	.cle_offs = 1 << 22,
+	.ops = &atmel_sama5_nfc_ops,
+};
+
+/* Only used to parse old bindings. */
+static const struct atmel_nfc_caps atmel_sama5_nand_caps = {
+	.has_dma = true,
+	.ale_offs = 1 << 21,
+	.cle_offs = 1 << 22,
+	.ops = &atmel_sama5_nfc_ops,
+	.legacy_of_bindings = true,
+};
+
+static int atmel_rm9200_nfc_probe(struct platform_device *pdev,
+				  const struct atmel_nfc_caps *caps)
+{
+	struct device *dev = &pdev->dev;
+	struct atmel_nfc *nfc;
+	int ret;
+
+	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	if (!nfc)
+		return -ENOMEM;
+
+	ret = atmel_nfc_init(nfc, pdev, caps);
+	if (ret)
+		return ret;
+
+	return atmel_nfc_add_nands(nfc);
+}
+
+static int atmel_rm9200_nfc_remove(struct atmel_nfc *nfc)
+{
+	int ret;
+
+	ret = atmel_nfc_remove_nands(nfc);
+	if (ret)
+		return ret;
+
+	atmel_nfc_cleanup(nfc);
+
+	return 0;
+}
+
+const struct atmel_nfc_ops atmel_rm9200_nfc_ops = {
+	.probe = atmel_rm9200_nfc_probe,
+	.remove = atmel_rm9200_nfc_remove,
+	.ecc_init = atmel_nfc_ecc_init,
+	.nand_init = atmel_nfc_nand_init,
+};
+
+static const struct atmel_nfc_caps atmel_rm9200_nfc_caps = {
+	.ale_offs = 1 << 21,
+	.cle_offs = 1 << 22,
+	.ops = &atmel_rm9200_nfc_ops,
+};
+
+static const struct atmel_nfc_caps atmel_sam9261_nfc_caps = {
+	.ale_offs = 1 << 22,
+	.cle_offs = 1 << 21,
+	.ops = &atmel_rm9200_nfc_ops,
+};
+
+static const struct atmel_nfc_caps atmel_sam9g45_nfc_caps = {
+	.has_dma = true,
+	.ale_offs = 1 << 21,
+	.cle_offs = 1 << 22,
+	.ops = &atmel_rm9200_nfc_ops,
+};
+
+/* Only used to parse old bindings. */
+static const struct atmel_nfc_caps atmel_rm9200_nand_caps = {
+	.ale_offs = 1 << 21,
+	.cle_offs = 1 << 22,
+	.ops = &atmel_rm9200_nfc_ops,
+	.legacy_of_bindings = true,
+};
+
+static const struct atmel_nfc_caps atmel_sam9261_nand_caps = {
+	.ale_offs = 1 << 22,
+	.cle_offs = 1 << 21,
+	.ops = &atmel_rm9200_nfc_ops,
+	.legacy_of_bindings = true,
+};
+
+static const struct atmel_nfc_caps atmel_sam9g45_nand_caps = {
+	.has_dma = true,
+	.ale_offs = 1 << 21,
+	.cle_offs = 1 << 22,
+	.ops = &atmel_rm9200_nfc_ops,
+	.legacy_of_bindings = true,
+};
+
+static const struct of_device_id atmel_nfc_of_ids[] = {
+	{
+		.compatible = "atmel,at91rm9200-nand-controller",
+		.data = &atmel_rm9200_nfc_caps,
+	},
+	{
+		.compatible = "atmel,at91sam9261-nand-controller",
+		.data = &atmel_sam9261_nfc_caps,
+	},
+	{
+		.compatible = "atmel,at91sam9g45-nand-controller",
+		.data = &atmel_sam9g45_nfc_caps,
+	},
+	{
+		.compatible = "atmel,sama5d3-nand-controller",
+		.data = &atmel_sama5_nfc_caps,
+	},
+	/* Support for old/deprecated bindings: */
+	{
+		.compatible = "atmel,at91rm9200-nand",
+		.data = &atmel_rm9200_nand_caps,
+	},
+	{
+		.compatible = "atmel,sama5d4-nand",
+		.data = &atmel_rm9200_nand_caps,
+	},
+	{
+		.compatible = "atmel,sama5d2-nand",
+		.data = &atmel_rm9200_nand_caps,
+	},
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, atmel_nfc_id_table);
+
+static const struct platform_device_id atmel_nfc_platform_ids[] = {
+	{
+		.name = "atmel_nand",
+		.driver_data = (kernel_ulong_t)&atmel_rm9200_nfc_caps,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, atmel_nfc_platform_ids);
+
+static int atmel_nfc_probe(struct platform_device *pdev)
+{
+	const struct atmel_nfc_caps *caps;
+
+	if (pdev->id_entry)
+		caps = (void *)pdev->id_entry->driver_data;
+	else
+		caps = of_device_get_match_data(&pdev->dev);
+
+	if (!caps) {
+		dev_err(&pdev->dev, "Could not retrieve NFC caps\n");
+		return -EINVAL;
+	}
+
+	if (caps->legacy_of_bindings && pdev->dev.of_node) {
+		u32 ale_offs = 21;
+
+		/*
+		 * If we are parsing legacy DT props and the DT contains a
+		 * valid NFC node, forward the request to the sama5 logic.
+		 */
+		if (of_find_compatible_node(pdev->dev.of_node, NULL,
+					    "atmel,sama5d3-nfc"))
+			caps = &atmel_sama5_nand_caps;
+
+		/*
+		 * Even if the compatible says we are dealing with an
+		 * at91rm9200 controller, the atmel,nand-has-dma specify that
+		 * this controller supports DMA, which means we are in fact
+		 * dealing with an at91sam9g45+ controller.
+		 */
+		if (!caps->has_dma &&
+		    of_property_read_bool(pdev->dev.of_node,
+					  "atmel,nand-has-dma"))
+			caps = &atmel_sam9g45_nand_caps;
+
+		/*
+		 * All SoCs except the at91sam9261 are assigning ALE to A21 and
+		 * CLE to A22. If atmel,nand-addr-offset != 21 this means we're
+		 * actually dealing with an at91sam9261 controller.
+		 */
+		of_property_read_u32(pdev->dev.of_node,
+				     "atmel,nand-addr-offset", &ale_offs);
+		if (ale_offs != 21)
+			caps = &atmel_sam9261_nand_caps;
+	}
+
+	return caps->ops->probe(pdev, caps);
+}
+
+static int atmel_nfc_remove(struct platform_device *pdev)
+{
+	struct atmel_nfc *nfc = platform_get_drvdata(pdev);
+
+	return nfc->caps->ops->remove(nfc);
+}
+
+static struct platform_driver atmel_nfc_driver = {
+	.driver = {
+		.name = "atmel-nand-controller",
+		.of_match_table = of_match_ptr(atmel_nfc_of_ids),
+	},
+	.probe = atmel_nfc_probe,
+	.remove = atmel_nfc_remove,
+	.id_table = atmel_nfc_platform_ids
+};
+module_platform_driver(atmel_nfc_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Boris Brezillon <boris.brezillon@free-electrons.com>");
+MODULE_DESCRIPTION("NAND Flash Controller driver for Atmel SoCs");
+MODULE_ALIAS("platform:atmel-nand-controller");
diff --git a/drivers/mtd/nand/atmel/pmecc.c b/drivers/mtd/nand/atmel/pmecc.c
new file mode 100644
index 000000000000..9baccae5d5a5
--- /dev/null
+++ b/drivers/mtd/nand/atmel/pmecc.c
@@ -0,0 +1,1011 @@
+/*
+ * © Copyright 2016 ATMEL
+ * © Copyright 2016 Free Electrons
+ *
+ * Author: Boris Brezillon <boris.brezillon@free-electrons.com>
+ *
+ * Derived from the atmel_nand.c driver which contained the following
+ * copyrights:
+ *
+ *    Copyright © 2003 Rick Bronson
+ *
+ *    Derived from drivers/mtd/nand/autcpu12.c
+ *        Copyright © 2001 Thomas Gleixner (gleixner@autronix.de)
+ *
+ *    Derived from drivers/mtd/spia.c
+ *        Copyright © 2000 Steven J. Hill (sjhill@cotw.com)
+ *
+ *
+ *    Add Hardware ECC support for AT91SAM9260 / AT91SAM9263
+ *        Richard Genoud (richard.genoud@gmail.com), Adeneo Copyright © 2007
+ *
+ *        Derived from Das U-Boot source code
+ *              (u-boot-1.1.5/board/atmel/at91sam9263ek/nand.c)
+ *        © Copyright 2006 ATMEL Rousset, Lacressonniere Nicolas
+ *
+ *    Add Programmable Multibit ECC support for various AT91 SoC
+ *        © Copyright 2012 ATMEL, Hong Xu
+ *
+ *    Add Nand Flash Controller support for SAMA5 SoC
+ *        © Copyright 2013 ATMEL, Josh Wu (josh.wu@atmel.com)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/genalloc.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/mtd/nand.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "pmecc.h"
+
+/* Galois field dimension */
+#define PMECC_GF_DIMENSION_13			13
+#define PMECC_GF_DIMENSION_14			14
+
+/* Primitive Polynomial used by PMECC */
+#define PMECC_GF_13_PRIMITIVE_POLY		0x201b
+#define PMECC_GF_14_PRIMITIVE_POLY		0x4443
+
+#define PMECC_LOOKUP_TABLE_SIZE_512		0x2000
+#define PMECC_LOOKUP_TABLE_SIZE_1024		0x4000
+
+/* Time out value for reading PMECC status register */
+#define PMECC_MAX_TIMEOUT_MS			100
+
+/* PMECC Register Definitions */
+#define ATMEL_PMECC_CFG				0x0
+#define PMECC_CFG_BCH_STRENGTH(x)		(x)
+#define PMECC_CFG_BCH_STRENGTH_MASK		GENMASK(2, 0)
+#define PMECC_CFG_SECTOR512			(0 << 4)
+#define PMECC_CFG_SECTOR1024			(1 << 4)
+#define PMECC_CFG_NSECTORS(x)			((fls(x) - 1) << 8)
+#define PMECC_CFG_READ_OP			(0 << 12)
+#define PMECC_CFG_WRITE_OP			(1 << 12)
+#define PMECC_CFG_SPARE_ENABLE			BIT(16)
+#define PMECC_CFG_AUTO_ENABLE			BIT(20)
+
+#define ATMEL_PMECC_SAREA			0x4
+#define ATMEL_PMECC_SADDR			0x8
+#define ATMEL_PMECC_EADDR			0xc
+
+#define ATMEL_PMECC_CLK				0x10
+#define PMECC_CLK_133MHZ			(2 << 0)
+
+#define ATMEL_PMECC_CTRL			0x14
+#define PMECC_CTRL_RST				BIT(0)
+#define PMECC_CTRL_DATA				BIT(1)
+#define PMECC_CTRL_USER				BIT(2)
+#define PMECC_CTRL_ENABLE			BIT(4)
+#define PMECC_CTRL_DISABLE			BIT(5)
+
+#define ATMEL_PMECC_SR				0x18
+#define PMECC_SR_BUSY				BIT(0)
+#define PMECC_SR_ENABLE				BIT(4)
+
+#define ATMEL_PMECC_IER				0x1c
+#define ATMEL_PMECC_IDR				0x20
+#define ATMEL_PMECC_IMR				0x24
+#define ATMEL_PMECC_ISR				0x28
+#define PMECC_ERROR_INT				BIT(0)
+
+#define ATMEL_PMECC_ECC(sector, n)		\
+	((((sector) + 1) * 0x40) + (n))
+
+#define ATMEL_PMECC_REM(sector, n)		\
+	((((sector) + 1) * 0x40) + ((n) * 4) + 0x200)
+
+/* PMERRLOC Register Definitions */
+#define ATMEL_PMERRLOC_ELCFG			0x0
+#define PMERRLOC_ELCFG_SECTOR_512		(0 << 0)
+#define PMERRLOC_ELCFG_SECTOR_1024		(1 << 0)
+#define PMERRLOC_ELCFG_NUM_ERRORS(n)		((n) << 16)
+
+#define ATMEL_PMERRLOC_ELPRIM			0x4
+#define ATMEL_PMERRLOC_ELEN			0x8
+#define ATMEL_PMERRLOC_ELDIS			0xc
+#define PMERRLOC_DISABLE			BIT(0)
+
+#define ATMEL_PMERRLOC_ELSR			0x10
+#define PMERRLOC_ELSR_BUSY			BIT(0)
+
+#define ATMEL_PMERRLOC_ELIER			0x14
+#define ATMEL_PMERRLOC_ELIDR			0x18
+#define ATMEL_PMERRLOC_ELIMR			0x1c
+#define ATMEL_PMERRLOC_ELISR			0x20
+#define PMERRLOC_ERR_NUM_MASK			GENMASK(12, 8)
+#define PMERRLOC_CALC_DONE			BIT(0)
+
+#define ATMEL_PMERRLOC_SIGMA(x)			(((x) * 0x4) + 0x28)
+
+#define ATMEL_PMERRLOC_EL(offs, x)		(((x) * 0x4) + (offs))
+
+struct atmel_pmecc_gf_tables {
+	u16 *alpha_to;
+	u16 *index_of;
+};
+
+struct atmel_pmecc_caps {
+	const int *strengths;
+	int nstrengths;
+	int el_offset;
+	bool correct_erased_chunks;
+};
+
+struct atmel_pmecc {
+	struct device *dev;
+	const struct atmel_pmecc_caps *caps;
+
+	struct {
+		void __iomem *base;
+		void __iomem *errloc;
+	} regs;
+
+	struct mutex lock;
+};
+
+struct atmel_pmecc_user_conf_cache {
+	u32 cfg;
+	u32 sarea;
+	u32 saddr;
+	u32 eaddr;
+};
+
+struct atmel_pmecc_user {
+	struct atmel_pmecc_user_conf_cache cache;
+	struct atmel_pmecc *pmecc;
+	const struct atmel_pmecc_gf_tables *gf_tables;
+	int eccbytes;
+	s16 *partial_syn;
+	s16 *si;
+	s16 *lmu;
+	s16 *smu;
+	s32 *mu;
+	s32 *dmu;
+	s32 *delta;
+	u32 isr;
+};
+
+static DEFINE_MUTEX(pmecc_gf_tables_lock);
+static const struct atmel_pmecc_gf_tables *pmecc_gf_tables_512;
+static const struct atmel_pmecc_gf_tables *pmecc_gf_tables_1024;
+
+static inline int deg(unsigned int poly)
+{
+	/* polynomial degree is the most-significant bit index */
+	return fls(poly) - 1;
+}
+
+static int atmel_pmecc_build_gf_tables(int mm, unsigned int poly,
+				       struct atmel_pmecc_gf_tables *gf_tables)
+{
+	unsigned int i, x = 1;
+	const unsigned int k = 1 << deg(poly);
+	unsigned int nn = (1 << mm) - 1;
+
+	/* primitive polynomial must be of degree m */
+	if (k != (1u << mm))
+		return -EINVAL;
+
+	for (i = 0; i < nn; i++) {
+		gf_tables->alpha_to[i] = x;
+		gf_tables->index_of[x] = i;
+		if (i && (x == 1))
+			/* polynomial is not primitive (a^i=1 with 0<i<2^m-1) */
+			return -EINVAL;
+		x <<= 1;
+		if (x & k)
+			x ^= poly;
+	}
+	gf_tables->alpha_to[nn] = 1;
+	gf_tables->index_of[0] = 0;
+
+	return 0;
+}
+
+static const struct atmel_pmecc_gf_tables *
+atmel_pmecc_create_gf_tables(const struct atmel_pmecc_user_req *req)
+{
+	struct atmel_pmecc_gf_tables *gf_tables;
+	unsigned int poly, degree, table_size;
+	int ret;
+
+	if (req->ecc.sectorsize == 512) {
+		degree = PMECC_GF_DIMENSION_13;
+		poly = PMECC_GF_13_PRIMITIVE_POLY;
+		table_size = PMECC_LOOKUP_TABLE_SIZE_512;
+	} else {
+		degree = PMECC_GF_DIMENSION_14;
+		poly = PMECC_GF_14_PRIMITIVE_POLY;
+		table_size = PMECC_LOOKUP_TABLE_SIZE_1024;
+	}
+
+	gf_tables = kzalloc(sizeof(*gf_tables) +
+			    (2 * table_size * sizeof(u16)),
+			    GFP_KERNEL);
+	if (!gf_tables)
+		return ERR_PTR(-ENOMEM);
+
+	gf_tables->alpha_to = (void *)(gf_tables + 1);
+	gf_tables->index_of = gf_tables->alpha_to + table_size;
+
+	ret = atmel_pmecc_build_gf_tables(degree, poly, gf_tables);
+	if (ret) {
+		kfree(gf_tables);
+		return ERR_PTR(ret);
+	}
+
+	return gf_tables;
+}
+
+static const struct atmel_pmecc_gf_tables *
+atmel_pmecc_get_gf_tables(const struct atmel_pmecc_user_req *req)
+{
+	const struct atmel_pmecc_gf_tables **gf_tables, *ret;
+
+	mutex_lock(&pmecc_gf_tables_lock);
+	if (req->ecc.sectorsize == 512)
+		gf_tables = &pmecc_gf_tables_512;
+	else
+		gf_tables = &pmecc_gf_tables_1024;
+
+	ret = *gf_tables;
+
+	if (!ret) {
+		ret = atmel_pmecc_create_gf_tables(req);
+		if (!IS_ERR(ret))
+			*gf_tables = ret;
+	}
+	mutex_unlock(&pmecc_gf_tables_lock);
+
+	return ret;
+}
+
+static int atmel_pmecc_prepare_user_req(struct atmel_pmecc *pmecc,
+					struct atmel_pmecc_user_req *req)
+{
+	int i, max_eccbytes, eccbytes = 0, eccstrength = 0;
+
+	if (req->pagesize <= 0 || req->oobsize <= 0 || req->ecc.bytes <= 0)
+		return -EINVAL;
+
+	if (req->ecc.ooboffset >= 0 &&
+	    req->ecc.ooboffset + req->ecc.bytes > req->oobsize)
+		return -EINVAL;
+
+	if (req->ecc.sectorsize == ATMEL_PMECC_SECTOR_SIZE_AUTO) {
+		if (req->ecc.strength != ATMEL_PMECC_MAXIMIZE_ECC_STRENGTH)
+			return -EINVAL;
+
+		if (req->pagesize > 512)
+			req->ecc.sectorsize = 1024;
+		else
+			req->ecc.sectorsize = 512;
+	}
+
+	if (req->ecc.sectorsize != 512 && req->ecc.sectorsize != 1024)
+		return -EINVAL;
+
+	if (req->pagesize % req->ecc.sectorsize)
+		return -EINVAL;
+
+	req->ecc.nsectors = req->pagesize / req->ecc.sectorsize;
+
+	max_eccbytes = req->ecc.bytes;
+
+	for (i = 0; i < pmecc->caps->nstrengths; i++) {
+		int nbytes, strength = pmecc->caps->strengths[i];
+
+		if (req->ecc.strength != ATMEL_PMECC_MAXIMIZE_ECC_STRENGTH &&
+		    strength < req->ecc.strength)
+			continue;
+
+		nbytes = DIV_ROUND_UP(strength * fls(8 * req->ecc.sectorsize),
+				      8);
+		nbytes *= req->ecc.nsectors;
+
+		if (nbytes > max_eccbytes)
+			break;
+
+		eccstrength = strength;
+		eccbytes = nbytes;
+
+		if (req->ecc.strength != ATMEL_PMECC_MAXIMIZE_ECC_STRENGTH)
+			break;
+	}
+
+	if (!eccstrength)
+		return -EINVAL;
+
+	req->ecc.bytes = eccbytes;
+	req->ecc.strength = eccstrength;
+
+	if (req->ecc.ooboffset < 0)
+		req->ecc.ooboffset = req->oobsize - eccbytes;
+
+	return 0;
+}
+
+struct atmel_pmecc_user *
+atmel_pmecc_create_user(struct atmel_pmecc *pmecc,
+			struct atmel_pmecc_user_req *req)
+{
+	struct atmel_pmecc_user *user;
+	const struct atmel_pmecc_gf_tables *gf_tables;
+	int strength, size, ret;
+
+	ret = atmel_pmecc_prepare_user_req(pmecc, req);
+	if (ret)
+		return ERR_PTR(ret);
+
+	size = sizeof(*user);
+	size = ALIGN(size, sizeof(u16));
+	/* Reserve space for partial_syn, si and smu */
+	size += ((2 * req->ecc.strength) + 1) * sizeof(u16) *
+		(2 + req->ecc.strength + 2);
+	/* Reserve space for lmu. */
+	size += (req->ecc.strength + 1) * sizeof(u16);
+	/* Reserve space for mu, dmu and delta. */
+	size = ALIGN(size, sizeof(s32));
+	size += (req->ecc.strength + 1) * sizeof(s32);
+
+	user = kzalloc(size, GFP_KERNEL);
+	if (!user)
+		return ERR_PTR(-ENOMEM);
+
+	user->pmecc = pmecc;
+
+	user->partial_syn = (u16 *)PTR_ALIGN(user + 1, sizeof(u16));
+	user->si = user->partial_syn + ((2 * req->ecc.strength) + 1);
+	user->lmu = user->si + ((2 * req->ecc.strength) + 1);
+	user->smu = user->lmu + (req->ecc.strength + 1);
+	user->mu = (s32 *)PTR_ALIGN(user->smu +
+				    (((2 * req->ecc.strength) + 1) *
+				     (req->ecc.strength + 2)),
+				    sizeof(s32));
+	user->dmu = user->mu + req->ecc.strength + 1;
+	user->delta = user->dmu + req->ecc.strength + 1;
+
+	gf_tables = atmel_pmecc_get_gf_tables(req);
+	if (IS_ERR(gf_tables)) {
+		kfree(user);
+		return ERR_CAST(gf_tables);
+	}
+
+	user->gf_tables = gf_tables;
+
+	user->eccbytes = req->ecc.bytes / req->ecc.nsectors;
+
+	for (strength = 0; strength < pmecc->caps->nstrengths; strength++) {
+		if (pmecc->caps->strengths[strength] == req->ecc.strength)
+			break;
+	}
+
+	user->cache.cfg = PMECC_CFG_BCH_STRENGTH(strength) |
+			  PMECC_CFG_NSECTORS(req->ecc.nsectors);
+
+	if (req->ecc.sectorsize == 1024)
+		user->cache.cfg |= PMECC_CFG_SECTOR1024;
+
+	user->cache.sarea = req->oobsize - 1;
+	user->cache.saddr = req->ecc.ooboffset;
+	user->cache.eaddr = req->ecc.ooboffset + req->ecc.bytes - 1;
+
+	return user;
+}
+EXPORT_SYMBOL_GPL(atmel_pmecc_create_user);
+
+void atmel_pmecc_destroy_user(struct atmel_pmecc_user *user)
+{
+	kfree(user);
+}
+EXPORT_SYMBOL_GPL(atmel_pmecc_destroy_user);
+
+static int get_strength(struct atmel_pmecc_user *user)
+{
+	const int *strengths = user->pmecc->caps->strengths;
+
+	return strengths[user->cache.cfg & PMECC_CFG_BCH_STRENGTH_MASK];
+}
+
+static int get_sectorsize(struct atmel_pmecc_user *user)
+{
+	return user->cache.cfg & PMECC_LOOKUP_TABLE_SIZE_1024 ? 1024 : 512;
+}
+
+static void atmel_pmecc_gen_syndrome(struct atmel_pmecc_user *user, int sector)
+{
+	int strength = get_strength(user);
+	u32 value;
+	int i;
+
+	/* Fill odd syndromes */
+	for (i = 0; i < strength; i++) {
+		value = readl_relaxed(user->pmecc->regs.base +
+				      ATMEL_PMECC_REM(sector, i / 2));
+		if (i & 1)
+			value >>= 16;
+
+		user->partial_syn[(2 * i) + 1] = value;
+	}
+}
+
+static void atmel_pmecc_substitute(struct atmel_pmecc_user *user)
+{
+	int degree = get_sectorsize(user) == 512 ? 13 : 14;
+	int cw_len = (1 << degree) - 1;
+	int strength = get_strength(user);
+	s16 *alpha_to = user->gf_tables->alpha_to;
+	s16 *index_of = user->gf_tables->index_of;
+	s16 *partial_syn = user->partial_syn;
+	s16 *si;
+	int i, j;
+
+	/*
+	 * si[] is a table that holds the current syndrome value,
+	 * an element of that table belongs to the field
+	 */
+	si = user->si;
+
+	memset(&si[1], 0, sizeof(s16) * ((2 * strength) - 1));
+
+	/* Computation 2t syndromes based on S(x) */
+	/* Odd syndromes */
+	for (i = 1; i < 2 * strength; i += 2) {
+		for (j = 0; j < degree; j++) {
+			if (partial_syn[i] & ((unsigned short)0x1 << j))
+				si[i] = alpha_to[i * j] ^ si[i];
+		}
+	}
+	/* Even syndrome = (Odd syndrome) ** 2 */
+	for (i = 2, j = 1; j <= strength; i = ++j << 1) {
+		if (si[j] == 0) {
+			si[i] = 0;
+		} else {
+			s16 tmp;
+
+			tmp = index_of[si[j]];
+			tmp = (tmp * 2) % cw_len;
+			si[i] = alpha_to[tmp];
+		}
+	}
+}
+
+static void atmel_pmecc_get_sigma(struct atmel_pmecc_user *user)
+{
+	s16 *lmu = user->lmu;
+	s16 *si = user->si;
+	s32 *mu = user->mu;
+	s32 *dmu = user->dmu;
+	s32 *delta = user->delta;
+	int degree = get_sectorsize(user) == 512 ? 13 : 14;
+	int cw_len = (1 << degree) - 1;
+	int strength = get_strength(user);
+	int num = 2 * strength + 1;
+	s16 *index_of = user->gf_tables->index_of;
+	s16 *alpha_to = user->gf_tables->alpha_to;
+	int i, j, k;
+	u32 dmu_0_count, tmp;
+	s16 *smu = user->smu;
+
+	/* index of largest delta */
+	int ro;
+	int largest;
+	int diff;
+
+	dmu_0_count = 0;
+
+	/* First Row */
+
+	/* Mu */
+	mu[0] = -1;
+
+	memset(smu, 0, sizeof(s16) * num);
+	smu[0] = 1;
+
+	/* discrepancy set to 1 */
+	dmu[0] = 1;
+	/* polynom order set to 0 */
+	lmu[0] = 0;
+	delta[0] = (mu[0] * 2 - lmu[0]) >> 1;
+
+	/* Second Row */
+
+	/* Mu */
+	mu[1] = 0;
+	/* Sigma(x) set to 1 */
+	memset(&smu[num], 0, sizeof(s16) * num);
+	smu[num] = 1;
+
+	/* discrepancy set to S1 */
+	dmu[1] = si[1];
+
+	/* polynom order set to 0 */
+	lmu[1] = 0;
+
+	delta[1] = (mu[1] * 2 - lmu[1]) >> 1;
+
+	/* Init the Sigma(x) last row */
+	memset(&smu[(strength + 1) * num], 0, sizeof(s16) * num);
+
+	for (i = 1; i <= strength; i++) {
+		mu[i + 1] = i << 1;
+		/* Begin Computing Sigma (Mu+1) and L(mu) */
+		/* check if discrepancy is set to 0 */
+		if (dmu[i] == 0) {
+			dmu_0_count++;
+
+			tmp = ((strength - (lmu[i] >> 1) - 1) / 2);
+			if ((strength - (lmu[i] >> 1) - 1) & 0x1)
+				tmp += 2;
+			else
+				tmp += 1;
+
+			if (dmu_0_count == tmp) {
+				for (j = 0; j <= (lmu[i] >> 1) + 1; j++)
+					smu[(strength + 1) * num + j] =
+							smu[i * num + j];
+
+				lmu[strength + 1] = lmu[i];
+				return;
+			}
+
+			/* copy polynom */
+			for (j = 0; j <= lmu[i] >> 1; j++)
+				smu[(i + 1) * num + j] = smu[i * num + j];
+
+			/* copy previous polynom order to the next */
+			lmu[i + 1] = lmu[i];
+		} else {
+			ro = 0;
+			largest = -1;
+			/* find largest delta with dmu != 0 */
+			for (j = 0; j < i; j++) {
+				if ((dmu[j]) && (delta[j] > largest)) {
+					largest = delta[j];
+					ro = j;
+				}
+			}
+
+			/* compute difference */
+			diff = (mu[i] - mu[ro]);
+
+			/* Compute degree of the new smu polynomial */
+			if ((lmu[i] >> 1) > ((lmu[ro] >> 1) + diff))
+				lmu[i + 1] = lmu[i];
+			else
+				lmu[i + 1] = ((lmu[ro] >> 1) + diff) * 2;
+
+			/* Init smu[i+1] with 0 */
+			for (k = 0; k < num; k++)
+				smu[(i + 1) * num + k] = 0;
+
+			/* Compute smu[i+1] */
+			for (k = 0; k <= lmu[ro] >> 1; k++) {
+				s16 a, b, c;
+
+				if (!(smu[ro * num + k] && dmu[i]))
+					continue;
+
+				a = index_of[dmu[i]];
+				b = index_of[dmu[ro]];
+				c = index_of[smu[ro * num + k]];
+				tmp = a + (cw_len - b) + c;
+				a = alpha_to[tmp % cw_len];
+				smu[(i + 1) * num + (k + diff)] = a;
+			}
+
+			for (k = 0; k <= lmu[i] >> 1; k++)
+				smu[(i + 1) * num + k] ^= smu[i * num + k];
+		}
+
+		/* End Computing Sigma (Mu+1) and L(mu) */
+		/* In either case compute delta */
+		delta[i + 1] = (mu[i + 1] * 2 - lmu[i + 1]) >> 1;
+
+		/* Do not compute discrepancy for the last iteration */
+		if (i >= strength)
+			continue;
+
+		for (k = 0; k <= (lmu[i + 1] >> 1); k++) {
+			tmp = 2 * (i - 1);
+			if (k == 0) {
+				dmu[i + 1] = si[tmp + 3];
+			} else if (smu[(i + 1) * num + k] && si[tmp + 3 - k]) {
+				s16 a, b, c;
+
+				a = index_of[smu[(i + 1) * num + k]];
+				b = si[2 * (i - 1) + 3 - k];
+				c = index_of[b];
+				tmp = a + c;
+				tmp %= cw_len;
+				dmu[i + 1] = alpha_to[tmp] ^ dmu[i + 1];
+			}
+		}
+	}
+}
+
+static int atmel_pmecc_err_location(struct atmel_pmecc_user *user)
+{
+	int sector_size = get_sectorsize(user);
+	int degree = sector_size == 512 ? 13 : 14;
+	struct atmel_pmecc *pmecc = user->pmecc;
+	int strength = get_strength(user);
+	int ret, roots_nbr, i, err_nbr = 0;
+	int num = (2 * strength) + 1;
+	s16 *smu = user->smu;
+	u32 val;
+
+	writel(PMERRLOC_DISABLE, pmecc->regs.errloc + ATMEL_PMERRLOC_ELDIS);
+
+	for (i = 0; i <= user->lmu[strength + 1] >> 1; i++) {
+		writel_relaxed(smu[(strength + 1) * num + i],
+			       pmecc->regs.errloc + ATMEL_PMERRLOC_SIGMA(i));
+		err_nbr++;
+	}
+
+	val = (err_nbr - 1) << 16;
+	if (sector_size == 1024)
+		val |= 1;
+
+	writel(val, pmecc->regs.errloc + ATMEL_PMERRLOC_ELCFG);
+	writel((sector_size * 8) + (degree * strength),
+	       pmecc->regs.errloc + ATMEL_PMERRLOC_ELEN);
+
+	ret = readl_relaxed_poll_timeout(pmecc->regs.errloc +
+					 ATMEL_PMERRLOC_ELISR,
+					 val, val & PMERRLOC_CALC_DONE, 0,
+					 PMECC_MAX_TIMEOUT_MS * 1000);
+	if (ret) {
+		dev_err(pmecc->dev,
+			"PMECC: Timeout to calculate error location.\n");
+		return ret;
+	}
+
+	roots_nbr = (val & PMERRLOC_ERR_NUM_MASK) >> 8;
+	/* Number of roots == degree of smu hence <= cap */
+	if (roots_nbr == user->lmu[strength + 1] >> 1)
+		return err_nbr - 1;
+
+	/*
+	 * Number of roots does not match the degree of smu
+	 * unable to correct error.
+	 */
+	return -EBADMSG;
+}
+
+int atmel_pmecc_correct_sector(struct atmel_pmecc_user *user, int sector,
+			       void *data, void *ecc)
+{
+	struct atmel_pmecc *pmecc = user->pmecc;
+	int sectorsize = get_sectorsize(user);
+	int eccbytes = user->eccbytes;
+	int i, nerrors;
+
+	if (!(user->isr & BIT(sector)))
+		return 0;
+
+	atmel_pmecc_gen_syndrome(user, sector);
+	atmel_pmecc_substitute(user);
+	atmel_pmecc_get_sigma(user);
+
+	nerrors = atmel_pmecc_err_location(user);
+	if (nerrors < 0)
+		return nerrors;
+
+	for (i = 0; i < nerrors; i++) {
+		const char *area;
+		int byte, bit;
+		u32 errpos;
+		u8 *ptr;
+
+		errpos = readl_relaxed(pmecc->regs.errloc +
+				ATMEL_PMERRLOC_EL(pmecc->caps->el_offset, i));
+		errpos--;
+
+		byte = errpos / 8;
+		bit = errpos % 8;
+
+		if (byte < sectorsize) {
+			ptr = data + byte;
+			area = "data";
+		} else if (byte < sectorsize + eccbytes) {
+			ptr = ecc + byte - sectorsize;
+			area = "ECC";
+		} else {
+			dev_dbg(pmecc->dev,
+				"Invalid errpos value (%d, max is %d)\n",
+				errpos, (sectorsize + eccbytes) * 8);
+			return -EINVAL;
+		}
+
+		dev_dbg(pmecc->dev,
+			"Bit flip in %s area, byte %d: 0x%02x -> 0x%02x\n",
+			area, byte, *ptr, (unsigned int)(*ptr ^ BIT(bit)));
+
+		*ptr ^= BIT(bit);
+	}
+
+	return nerrors;
+}
+EXPORT_SYMBOL_GPL(atmel_pmecc_correct_sector);
+
+bool atmel_pmecc_correct_erased_chunks(struct atmel_pmecc_user *user)
+{
+	return user->pmecc->caps->correct_erased_chunks;
+}
+EXPORT_SYMBOL_GPL(atmel_pmecc_correct_erased_chunks);
+
+void atmel_pmecc_get_generated_eccbytes(struct atmel_pmecc_user *user,
+					int sector, void *ecc)
+{
+	struct atmel_pmecc *pmecc = user->pmecc;
+	u8 *ptr = ecc;
+	int i;
+
+	for (i = 0; i < user->eccbytes; i++)
+		ptr[i] = readb_relaxed(pmecc->regs.base +
+				       ATMEL_PMECC_ECC(sector, i));
+}
+EXPORT_SYMBOL_GPL(atmel_pmecc_get_generated_eccbytes);
+
+int atmel_pmecc_enable(struct atmel_pmecc_user *user, int op)
+{
+	struct atmel_pmecc *pmecc = user->pmecc;
+	u32 cfg;
+
+	if (op != NAND_ECC_READ && op != NAND_ECC_WRITE) {
+		dev_err(pmecc->dev, "Bad ECC operation!");
+		return -EINVAL;
+	}
+
+	mutex_lock(&user->pmecc->lock);
+
+	cfg = user->cache.cfg;
+	if (op == NAND_ECC_WRITE)
+		cfg |= PMECC_CFG_WRITE_OP;
+	else
+		cfg |= PMECC_CFG_AUTO_ENABLE;
+
+	writel(cfg, pmecc->regs.base + ATMEL_PMECC_CFG);
+	writel(user->cache.sarea, pmecc->regs.base + ATMEL_PMECC_SAREA);
+	writel(user->cache.saddr, pmecc->regs.base + ATMEL_PMECC_SADDR);
+	writel(user->cache.eaddr, pmecc->regs.base + ATMEL_PMECC_EADDR);
+
+	writel(PMECC_CTRL_ENABLE, pmecc->regs.base + ATMEL_PMECC_CTRL);
+	writel(PMECC_CTRL_DATA, pmecc->regs.base + ATMEL_PMECC_CTRL);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(atmel_pmecc_enable);
+
+void atmel_pmecc_disable(struct atmel_pmecc_user *user)
+{
+	struct atmel_pmecc *pmecc = user->pmecc;
+
+	writel(PMECC_CTRL_RST, pmecc->regs.base + ATMEL_PMECC_CTRL);
+	writel(PMECC_CTRL_DISABLE, pmecc->regs.base + ATMEL_PMECC_CTRL);
+	mutex_unlock(&user->pmecc->lock);
+}
+EXPORT_SYMBOL_GPL(atmel_pmecc_disable);
+
+int atmel_pmecc_wait_rdy(struct atmel_pmecc_user *user)
+{
+	struct atmel_pmecc *pmecc = user->pmecc;
+	u32 status;
+	int ret;
+
+	ret = readl_relaxed_poll_timeout(pmecc->regs.base +
+					 ATMEL_PMECC_SR,
+					 status, !(status & PMECC_SR_BUSY), 0,
+					 PMECC_MAX_TIMEOUT_MS * 1000);
+	if (ret) {
+		dev_err(pmecc->dev,
+			"Timeout while waiting for PMECC ready.\n");
+		return ret;
+	}
+
+	user->isr = readl_relaxed(pmecc->regs.base + ATMEL_PMECC_ISR);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(atmel_pmecc_wait_rdy);
+
+static struct atmel_pmecc *atmel_pmecc_create(struct platform_device *pdev,
+					const struct atmel_pmecc_caps *caps,
+					int pmecc_res_idx, int errloc_res_idx)
+{
+	struct device *dev = &pdev->dev;
+	struct atmel_pmecc *pmecc;
+	struct resource *res;
+
+	pmecc = devm_kzalloc(dev, sizeof(*pmecc), GFP_KERNEL);
+	if (!pmecc)
+		return ERR_PTR(-ENOMEM);
+
+	pmecc->caps = caps;
+	pmecc->dev = dev;
+	mutex_init(&pmecc->lock);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, pmecc_res_idx);
+	pmecc->regs.base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(pmecc->regs.base))
+		return ERR_CAST(pmecc->regs.base);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, errloc_res_idx);
+	pmecc->regs.errloc = devm_ioremap_resource(dev, res);
+	if (IS_ERR(pmecc->regs.errloc))
+		return ERR_CAST(pmecc->regs.errloc);
+
+	/* Disable all interrupts before registering the PMECC handler. */
+	writel(0xffffffff, pmecc->regs.base + ATMEL_PMECC_IDR);
+
+	/* Reset the ECC engine */
+	writel(PMECC_CTRL_RST, pmecc->regs.base + ATMEL_PMECC_CTRL);
+	writel(PMECC_CTRL_DISABLE, pmecc->regs.base + ATMEL_PMECC_CTRL);
+
+	return pmecc;
+}
+
+static void devm_atmel_pmecc_put(struct device *dev, void *res)
+{
+	struct atmel_pmecc **pmecc = res;
+
+	put_device((*pmecc)->dev);
+}
+
+static struct atmel_pmecc *atmel_pmecc_get_by_node(struct device *userdev,
+						   struct device_node *np)
+{
+	struct platform_device *pdev;
+	struct atmel_pmecc *pmecc, **ptr;
+
+	pdev = of_find_device_by_node(np);
+	if (!pdev || !platform_get_drvdata(pdev))
+		return ERR_PTR(-EPROBE_DEFER);
+
+	ptr = devres_alloc(devm_atmel_pmecc_put, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	get_device(&pdev->dev);
+	pmecc = platform_get_drvdata(pdev);
+
+	*ptr = pmecc;
+
+	devres_add(userdev, ptr);
+
+	return pmecc;
+}
+
+static const int atmel_pmecc_strengths[] = { 2, 4, 8, 12, 24, 32 };
+
+struct atmel_pmecc_caps at91sam9g45_caps = {
+	.strengths = atmel_pmecc_strengths,
+	.nstrengths = 5,
+	.el_offset = 0x8c,
+};
+
+struct atmel_pmecc_caps sama5d4_caps = {
+	.strengths = atmel_pmecc_strengths,
+	.nstrengths = 5,
+	.el_offset = 0x8c,
+	.correct_erased_chunks = true,
+};
+
+struct atmel_pmecc_caps sama5d2_caps = {
+	.strengths = atmel_pmecc_strengths,
+	.nstrengths = 6,
+	.el_offset = 0xac,
+	.correct_erased_chunks = true,
+};
+
+static const struct of_device_id atmel_pmecc_legacy_match[] = {
+	{ .compatible = "atmel,sama5d4-nand", &sama5d4_caps },
+	{ .compatible = "atmel,sama5d2-nand", &sama5d2_caps },
+	{ /* sentinel */ }
+};
+
+struct atmel_pmecc *devm_atmel_pmecc_get(struct device *userdev)
+{
+	struct atmel_pmecc *pmecc;
+	struct device_node *np;
+
+	if (!userdev)
+		return ERR_PTR(-EINVAL);
+
+	if (!userdev->of_node)
+		return NULL;
+
+	np = of_parse_phandle(userdev->of_node, "ecc-engine", 0);
+	if (np) {
+		pmecc = atmel_pmecc_get_by_node(userdev, np);
+		of_node_put(np);
+	} else {
+		/*
+		 * Support old DT bindings: in this case the PMECC iomem
+		 * resources are directly defined in the user pdev at position
+		 * 1 and 2. Extract all relevant information from there.
+		 */
+		struct platform_device *pdev = to_platform_device(userdev);
+		const struct atmel_pmecc_caps *caps;
+
+		/* No PMECC engine available. */
+		if (!of_property_read_bool(userdev->of_node,
+					   "atmel,has-pmecc"))
+			return NULL;
+
+		caps = &at91sam9g45_caps;
+
+		/*
+		 * Try to find the NFC subnode and extract the associated caps
+		 * from there.
+		 */
+		np = of_find_compatible_node(userdev->of_node, NULL,
+					     "atmel,sama5d3-nfc");
+		if (np) {
+			const struct of_device_id *match;
+
+			match = of_match_node(atmel_pmecc_legacy_match, np);
+			if (match && match->data)
+				caps = match->data;
+
+			of_node_put(np);
+		}
+
+		pmecc = atmel_pmecc_create(pdev, caps, 1, 2);
+	}
+
+	return pmecc;
+}
+EXPORT_SYMBOL(devm_atmel_pmecc_get);
+
+static const struct of_device_id atmel_pmecc_match[] = {
+	{ .compatible = "atmel,at91sam9g45-pmecc", &at91sam9g45_caps },
+	{ .compatible = "atmel,sama5d4-pmecc", &sama5d4_caps },
+	{ .compatible = "atmel,sama5d2-pmecc", &sama5d2_caps },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, atmel_pmecc_match);
+
+static int atmel_pmecc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct atmel_pmecc_caps *caps;
+	struct atmel_pmecc *pmecc;
+
+	caps = of_device_get_match_data(&pdev->dev);
+	if (!caps) {
+		dev_err(dev, "Invalid caps\n");
+		return -EINVAL;
+	}
+
+	pmecc = atmel_pmecc_create(pdev, caps, 0, 1);
+	if (IS_ERR(pmecc))
+		return PTR_ERR(pmecc);
+
+	platform_set_drvdata(pdev, pmecc);
+
+	return 0;
+}
+
+static struct platform_driver atmel_pmecc_driver = {
+	.driver = {
+		.name = "atmel-pmecc",
+		.of_match_table = of_match_ptr(atmel_pmecc_match),
+	},
+	.probe = atmel_pmecc_probe,
+};
+module_platform_driver(atmel_pmecc_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Boris Brezillon <boris.brezillon@free-electrons.com>");
+MODULE_DESCRIPTION("PMECC engine driver");
+MODULE_ALIAS("platform:atmel_pmecc");
diff --git a/drivers/mtd/nand/atmel/pmecc.h b/drivers/mtd/nand/atmel/pmecc.h
new file mode 100644
index 000000000000..a8ddbfca2ea5
--- /dev/null
+++ b/drivers/mtd/nand/atmel/pmecc.h
@@ -0,0 +1,73 @@
+/*
+ * © Copyright 2016 ATMEL
+ * © Copyright 2016 Free Electrons
+ *
+ * Author: Boris Brezillon <boris.brezillon@free-electrons.com>
+ *
+ * Derived from the atmel_nand.c driver which contained the following
+ * copyrights:
+ *
+ *    Copyright © 2003 Rick Bronson
+ *
+ *    Derived from drivers/mtd/nand/autcpu12.c
+ *        Copyright © 2001 Thomas Gleixner (gleixner@autronix.de)
+ *
+ *    Derived from drivers/mtd/spia.c
+ *        Copyright © 2000 Steven J. Hill (sjhill@cotw.com)
+ *
+ *
+ *    Add Hardware ECC support for AT91SAM9260 / AT91SAM9263
+ *        Richard Genoud (richard.genoud@gmail.com), Adeneo Copyright © 2007
+ *
+ *        Derived from Das U-Boot source code
+ *              (u-boot-1.1.5/board/atmel/at91sam9263ek/nand.c)
+ *        © Copyright 2006 ATMEL Rousset, Lacressonniere Nicolas
+ *
+ *    Add Programmable Multibit ECC support for various AT91 SoC
+ *        © Copyright 2012 ATMEL, Hong Xu
+ *
+ *    Add Nand Flash Controller support for SAMA5 SoC
+ *        © Copyright 2013 ATMEL, Josh Wu (josh.wu@atmel.com)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#ifndef ATMEL_PMECC_H
+#define ATMEL_PMECC_H
+
+#define ATMEL_PMECC_MAXIMIZE_ECC_STRENGTH	0
+#define ATMEL_PMECC_SECTOR_SIZE_AUTO		0
+#define ATMEL_PMECC_OOBOFFSET_AUTO		-1
+
+struct atmel_pmecc_user_req {
+	int pagesize;
+	int oobsize;
+	struct {
+		int strength;
+		int bytes;
+		int sectorsize;
+		int nsectors;
+		int ooboffset;
+	} ecc;
+};
+
+struct atmel_pmecc *devm_atmel_pmecc_get(struct device *dev);
+
+struct atmel_pmecc_user *
+atmel_pmecc_create_user(struct atmel_pmecc *pmecc,
+			struct atmel_pmecc_user_req *req);
+void atmel_pmecc_destroy_user(struct atmel_pmecc_user *user);
+
+int atmel_pmecc_enable(struct atmel_pmecc_user *user, int op);
+void atmel_pmecc_disable(struct atmel_pmecc_user *user);
+int atmel_pmecc_wait_rdy(struct atmel_pmecc_user *user);
+int atmel_pmecc_correct_sector(struct atmel_pmecc_user *user, int sector,
+			       void *data, void *ecc);
+bool atmel_pmecc_correct_erased_chunks(struct atmel_pmecc_user *user);
+void atmel_pmecc_get_generated_eccbytes(struct atmel_pmecc_user *user,
+					int sector, void *ecc);
+
+#endif /* ATMEL_PMECC_H */
diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
deleted file mode 100644
index 9ebd5ecefea6..000000000000
--- a/drivers/mtd/nand/atmel_nand.c
+++ /dev/null
@@ -1,2479 +0,0 @@
-/*
- *  Copyright © 2003 Rick Bronson
- *
- *  Derived from drivers/mtd/nand/autcpu12.c
- *	 Copyright © 2001 Thomas Gleixner (gleixner@autronix.de)
- *
- *  Derived from drivers/mtd/spia.c
- *	 Copyright © 2000 Steven J. Hill (sjhill@cotw.com)
- *
- *
- *  Add Hardware ECC support for AT91SAM9260 / AT91SAM9263
- *     Richard Genoud (richard.genoud@gmail.com), Adeneo Copyright © 2007
- *
- *     Derived from Das U-Boot source code
- *     		(u-boot-1.1.5/board/atmel/at91sam9263ek/nand.c)
- *     © Copyright 2006 ATMEL Rousset, Lacressonniere Nicolas
- *
- *  Add Programmable Multibit ECC support for various AT91 SoC
- *     © Copyright 2012 ATMEL, Hong Xu
- *
- *  Add Nand Flash Controller support for SAMA5 SoC
- *     © Copyright 2013 ATMEL, Josh Wu (josh.wu@atmel.com)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- */
-
-#include <linux/clk.h>
-#include <linux/dma-mapping.h>
-#include <linux/slab.h>
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/platform_device.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/of_gpio.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
-#include <linux/mtd/partitions.h>
-
-#include <linux/delay.h>
-#include <linux/dmaengine.h>
-#include <linux/gpio.h>
-#include <linux/interrupt.h>
-#include <linux/io.h>
-#include <linux/platform_data/atmel.h>
-
-static int use_dma = 1;
-module_param(use_dma, int, 0);
-
-static int on_flash_bbt = 0;
-module_param(on_flash_bbt, int, 0);
-
-/* Register access macros */
-#define ecc_readl(add, reg)				\
-	__raw_readl(add + ATMEL_ECC_##reg)
-#define ecc_writel(add, reg, value)			\
-	__raw_writel((value), add + ATMEL_ECC_##reg)
-
-#include "atmel_nand_ecc.h"	/* Hardware ECC registers */
-#include "atmel_nand_nfc.h"	/* Nand Flash Controller definition */
-
-struct atmel_nand_caps {
-	bool pmecc_correct_erase_page;
-	uint8_t pmecc_max_correction;
-};
-
-/*
- * oob layout for large page size
- * bad block info is on bytes 0 and 1
- * the bytes have to be consecutives to avoid
- * several NAND_CMD_RNDOUT during read
- *
- * oob layout for small page size
- * bad block info is on bytes 4 and 5
- * the bytes have to be consecutives to avoid
- * several NAND_CMD_RNDOUT during read
- */
-static int atmel_ooblayout_ecc_sp(struct mtd_info *mtd, int section,
-				  struct mtd_oob_region *oobregion)
-{
-	if (section)
-		return -ERANGE;
-
-	oobregion->length = 4;
-	oobregion->offset = 0;
-
-	return 0;
-}
-
-static int atmel_ooblayout_free_sp(struct mtd_info *mtd, int section,
-				   struct mtd_oob_region *oobregion)
-{
-	if (section)
-		return -ERANGE;
-
-	oobregion->offset = 6;
-	oobregion->length = mtd->oobsize - oobregion->offset;
-
-	return 0;
-}
-
-static const struct mtd_ooblayout_ops atmel_ooblayout_sp_ops = {
-	.ecc = atmel_ooblayout_ecc_sp,
-	.free = atmel_ooblayout_free_sp,
-};
-
-struct atmel_nfc {
-	void __iomem		*base_cmd_regs;
-	void __iomem		*hsmc_regs;
-	void			*sram_bank0;
-	dma_addr_t		sram_bank0_phys;
-	bool			use_nfc_sram;
-	bool			write_by_sram;
-
-	struct clk		*clk;
-
-	bool			is_initialized;
-	struct completion	comp_ready;
-	struct completion	comp_cmd_done;
-	struct completion	comp_xfer_done;
-
-	/* Point to the sram bank which include readed data via NFC */
-	void			*data_in_sram;
-	bool			will_write_sram;
-};
-static struct atmel_nfc	nand_nfc;
-
-struct atmel_nand_host {
-	struct nand_chip	nand_chip;
-	void __iomem		*io_base;
-	dma_addr_t		io_phys;
-	struct atmel_nand_data	board;
-	struct device		*dev;
-	void __iomem		*ecc;
-
-	struct completion	comp;
-	struct dma_chan		*dma_chan;
-
-	struct atmel_nfc	*nfc;
-
-	const struct atmel_nand_caps	*caps;
-	bool			has_pmecc;
-	u8			pmecc_corr_cap;
-	u16			pmecc_sector_size;
-	bool			has_no_lookup_table;
-	u32			pmecc_lookup_table_offset;
-	u32			pmecc_lookup_table_offset_512;
-	u32			pmecc_lookup_table_offset_1024;
-
-	int			pmecc_degree;	/* Degree of remainders */
-	int			pmecc_cw_len;	/* Length of codeword */
-
-	void __iomem		*pmerrloc_base;
-	void __iomem		*pmerrloc_el_base;
-	void __iomem		*pmecc_rom_base;
-
-	/* lookup table for alpha_to and index_of */
-	void __iomem		*pmecc_alpha_to;
-	void __iomem		*pmecc_index_of;
-
-	/* data for pmecc computation */
-	int16_t			*pmecc_partial_syn;
-	int16_t			*pmecc_si;
-	int16_t			*pmecc_smu;	/* Sigma table */
-	int16_t			*pmecc_lmu;	/* polynomal order */
-	int			*pmecc_mu;
-	int			*pmecc_dmu;
-	int			*pmecc_delta;
-};
-
-/*
- * Enable NAND.
- */
-static void atmel_nand_enable(struct atmel_nand_host *host)
-{
-	if (gpio_is_valid(host->board.enable_pin))
-		gpio_set_value(host->board.enable_pin, 0);
-}
-
-/*
- * Disable NAND.
- */
-static void atmel_nand_disable(struct atmel_nand_host *host)
-{
-	if (gpio_is_valid(host->board.enable_pin))
-		gpio_set_value(host->board.enable_pin, 1);
-}
-
-/*
- * Hardware specific access to control-lines
- */
-static void atmel_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
-{
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
-
-	if (ctrl & NAND_CTRL_CHANGE) {
-		if (ctrl & NAND_NCE)
-			atmel_nand_enable(host);
-		else
-			atmel_nand_disable(host);
-	}
-	if (cmd == NAND_CMD_NONE)
-		return;
-
-	if (ctrl & NAND_CLE)
-		writeb(cmd, host->io_base + (1 << host->board.cle));
-	else
-		writeb(cmd, host->io_base + (1 << host->board.ale));
-}
-
-/*
- * Read the Device Ready pin.
- */
-static int atmel_nand_device_ready(struct mtd_info *mtd)
-{
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
-
-	return gpio_get_value(host->board.rdy_pin) ^
-                !!host->board.rdy_pin_active_low;
-}
-
-/* Set up for hardware ready pin and enable pin. */
-static int atmel_nand_set_enable_ready_pins(struct mtd_info *mtd)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(chip);
-	int res = 0;
-
-	if (gpio_is_valid(host->board.rdy_pin)) {
-		res = devm_gpio_request(host->dev,
-				host->board.rdy_pin, "nand_rdy");
-		if (res < 0) {
-			dev_err(host->dev,
-				"can't request rdy gpio %d\n",
-				host->board.rdy_pin);
-			return res;
-		}
-
-		res = gpio_direction_input(host->board.rdy_pin);
-		if (res < 0) {
-			dev_err(host->dev,
-				"can't request input direction rdy gpio %d\n",
-				host->board.rdy_pin);
-			return res;
-		}
-
-		chip->dev_ready = atmel_nand_device_ready;
-	}
-
-	if (gpio_is_valid(host->board.enable_pin)) {
-		res = devm_gpio_request(host->dev,
-				host->board.enable_pin, "nand_enable");
-		if (res < 0) {
-			dev_err(host->dev,
-				"can't request enable gpio %d\n",
-				host->board.enable_pin);
-			return res;
-		}
-
-		res = gpio_direction_output(host->board.enable_pin, 1);
-		if (res < 0) {
-			dev_err(host->dev,
-				"can't request output direction enable gpio %d\n",
-				host->board.enable_pin);
-			return res;
-		}
-	}
-
-	return res;
-}
-
-/*
- * Minimal-overhead PIO for data access.
- */
-static void atmel_read_buf8(struct mtd_info *mtd, u8 *buf, int len)
-{
-	struct nand_chip	*nand_chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
-
-	if (host->nfc && host->nfc->use_nfc_sram && host->nfc->data_in_sram) {
-		memcpy(buf, host->nfc->data_in_sram, len);
-		host->nfc->data_in_sram += len;
-	} else {
-		__raw_readsb(nand_chip->IO_ADDR_R, buf, len);
-	}
-}
-
-static void atmel_read_buf16(struct mtd_info *mtd, u8 *buf, int len)
-{
-	struct nand_chip	*nand_chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
-
-	if (host->nfc && host->nfc->use_nfc_sram && host->nfc->data_in_sram) {
-		memcpy(buf, host->nfc->data_in_sram, len);
-		host->nfc->data_in_sram += len;
-	} else {
-		__raw_readsw(nand_chip->IO_ADDR_R, buf, len / 2);
-	}
-}
-
-static void atmel_write_buf8(struct mtd_info *mtd, const u8 *buf, int len)
-{
-	struct nand_chip	*nand_chip = mtd_to_nand(mtd);
-
-	__raw_writesb(nand_chip->IO_ADDR_W, buf, len);
-}
-
-static void atmel_write_buf16(struct mtd_info *mtd, const u8 *buf, int len)
-{
-	struct nand_chip	*nand_chip = mtd_to_nand(mtd);
-
-	__raw_writesw(nand_chip->IO_ADDR_W, buf, len / 2);
-}
-
-static void dma_complete_func(void *completion)
-{
-	complete(completion);
-}
-
-static int nfc_set_sram_bank(struct atmel_nand_host *host, unsigned int bank)
-{
-	/* NFC only has two banks. Must be 0 or 1 */
-	if (bank > 1)
-		return -EINVAL;
-
-	if (bank) {
-		struct mtd_info *mtd = nand_to_mtd(&host->nand_chip);
-
-		/* Only for a 2k-page or lower flash, NFC can handle 2 banks */
-		if (mtd->writesize > 2048)
-			return -EINVAL;
-		nfc_writel(host->nfc->hsmc_regs, BANK, ATMEL_HSMC_NFC_BANK1);
-	} else {
-		nfc_writel(host->nfc->hsmc_regs, BANK, ATMEL_HSMC_NFC_BANK0);
-	}
-
-	return 0;
-}
-
-static uint nfc_get_sram_off(struct atmel_nand_host *host)
-{
-	if (nfc_readl(host->nfc->hsmc_regs, BANK) & ATMEL_HSMC_NFC_BANK1)
-		return NFC_SRAM_BANK1_OFFSET;
-	else
-		return 0;
-}
-
-static dma_addr_t nfc_sram_phys(struct atmel_nand_host *host)
-{
-	if (nfc_readl(host->nfc->hsmc_regs, BANK) & ATMEL_HSMC_NFC_BANK1)
-		return host->nfc->sram_bank0_phys + NFC_SRAM_BANK1_OFFSET;
-	else
-		return host->nfc->sram_bank0_phys;
-}
-
-static int atmel_nand_dma_op(struct mtd_info *mtd, void *buf, int len,
-			       int is_read)
-{
-	struct dma_device *dma_dev;
-	enum dma_ctrl_flags flags;
-	dma_addr_t dma_src_addr, dma_dst_addr, phys_addr;
-	struct dma_async_tx_descriptor *tx = NULL;
-	dma_cookie_t cookie;
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(chip);
-	void *p = buf;
-	int err = -EIO;
-	enum dma_data_direction dir = is_read ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
-	struct atmel_nfc *nfc = host->nfc;
-
-	if (buf >= high_memory)
-		goto err_buf;
-
-	dma_dev = host->dma_chan->device;
-
-	flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
-
-	phys_addr = dma_map_single(dma_dev->dev, p, len, dir);
-	if (dma_mapping_error(dma_dev->dev, phys_addr)) {
-		dev_err(host->dev, "Failed to dma_map_single\n");
-		goto err_buf;
-	}
-
-	if (is_read) {
-		if (nfc && nfc->data_in_sram)
-			dma_src_addr = nfc_sram_phys(host) + (nfc->data_in_sram
-				- (nfc->sram_bank0 + nfc_get_sram_off(host)));
-		else
-			dma_src_addr = host->io_phys;
-
-		dma_dst_addr = phys_addr;
-	} else {
-		dma_src_addr = phys_addr;
-
-		if (nfc && nfc->write_by_sram)
-			dma_dst_addr = nfc_sram_phys(host);
-		else
-			dma_dst_addr = host->io_phys;
-	}
-
-	tx = dma_dev->device_prep_dma_memcpy(host->dma_chan, dma_dst_addr,
-					     dma_src_addr, len, flags);
-	if (!tx) {
-		dev_err(host->dev, "Failed to prepare DMA memcpy\n");
-		goto err_dma;
-	}
-
-	init_completion(&host->comp);
-	tx->callback = dma_complete_func;
-	tx->callback_param = &host->comp;
-
-	cookie = tx->tx_submit(tx);
-	if (dma_submit_error(cookie)) {
-		dev_err(host->dev, "Failed to do DMA tx_submit\n");
-		goto err_dma;
-	}
-
-	dma_async_issue_pending(host->dma_chan);
-	wait_for_completion(&host->comp);
-
-	if (is_read && nfc && nfc->data_in_sram)
-		/* After read data from SRAM, need to increase the position */
-		nfc->data_in_sram += len;
-
-	err = 0;
-
-err_dma:
-	dma_unmap_single(dma_dev->dev, phys_addr, len, dir);
-err_buf:
-	if (err != 0)
-		dev_dbg(host->dev, "Fall back to CPU I/O\n");
-	return err;
-}
-
-static void atmel_read_buf(struct mtd_info *mtd, u8 *buf, int len)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-
-	if (use_dma && len > mtd->oobsize)
-		/* only use DMA for bigger than oob size: better performances */
-		if (atmel_nand_dma_op(mtd, buf, len, 1) == 0)
-			return;
-
-	if (chip->options & NAND_BUSWIDTH_16)
-		atmel_read_buf16(mtd, buf, len);
-	else
-		atmel_read_buf8(mtd, buf, len);
-}
-
-static void atmel_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-
-	if (use_dma && len > mtd->oobsize)
-		/* only use DMA for bigger than oob size: better performances */
-		if (atmel_nand_dma_op(mtd, (void *)buf, len, 0) == 0)
-			return;
-
-	if (chip->options & NAND_BUSWIDTH_16)
-		atmel_write_buf16(mtd, buf, len);
-	else
-		atmel_write_buf8(mtd, buf, len);
-}
-
-/*
- * Return number of ecc bytes per sector according to sector size and
- * correction capability
- *
- * Following table shows what at91 PMECC supported:
- * Correction Capability	Sector_512_bytes	Sector_1024_bytes
- * =====================	================	=================
- *                2-bits                 4-bytes                  4-bytes
- *                4-bits                 7-bytes                  7-bytes
- *                8-bits                13-bytes                 14-bytes
- *               12-bits                20-bytes                 21-bytes
- *               24-bits                39-bytes                 42-bytes
- *               32-bits                52-bytes                 56-bytes
- */
-static int pmecc_get_ecc_bytes(int cap, int sector_size)
-{
-	int m = 12 + sector_size / 512;
-	return (m * cap + 7) / 8;
-}
-
-static void __iomem *pmecc_get_alpha_to(struct atmel_nand_host *host)
-{
-	int table_size;
-
-	table_size = host->pmecc_sector_size == 512 ?
-		PMECC_LOOKUP_TABLE_SIZE_512 : PMECC_LOOKUP_TABLE_SIZE_1024;
-
-	return host->pmecc_rom_base + host->pmecc_lookup_table_offset +
-			table_size * sizeof(int16_t);
-}
-
-static int pmecc_data_alloc(struct atmel_nand_host *host)
-{
-	const int cap = host->pmecc_corr_cap;
-	int size;
-
-	size = (2 * cap + 1) * sizeof(int16_t);
-	host->pmecc_partial_syn = devm_kzalloc(host->dev, size, GFP_KERNEL);
-	host->pmecc_si = devm_kzalloc(host->dev, size, GFP_KERNEL);
-	host->pmecc_lmu = devm_kzalloc(host->dev,
-			(cap + 1) * sizeof(int16_t), GFP_KERNEL);
-	host->pmecc_smu = devm_kzalloc(host->dev,
-			(cap + 2) * size, GFP_KERNEL);
-
-	size = (cap + 1) * sizeof(int);
-	host->pmecc_mu = devm_kzalloc(host->dev, size, GFP_KERNEL);
-	host->pmecc_dmu = devm_kzalloc(host->dev, size, GFP_KERNEL);
-	host->pmecc_delta = devm_kzalloc(host->dev, size, GFP_KERNEL);
-
-	if (!host->pmecc_partial_syn ||
-		!host->pmecc_si ||
-		!host->pmecc_lmu ||
-		!host->pmecc_smu ||
-		!host->pmecc_mu ||
-		!host->pmecc_dmu ||
-		!host->pmecc_delta)
-		return -ENOMEM;
-
-	return 0;
-}
-
-static void pmecc_gen_syndrome(struct mtd_info *mtd, int sector)
-{
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
-	int i;
-	uint32_t value;
-
-	/* Fill odd syndromes */
-	for (i = 0; i < host->pmecc_corr_cap; i++) {
-		value = pmecc_readl_rem_relaxed(host->ecc, sector, i / 2);
-		if (i & 1)
-			value >>= 16;
-		value &= 0xffff;
-		host->pmecc_partial_syn[(2 * i) + 1] = (int16_t)value;
-	}
-}
-
-static void pmecc_substitute(struct mtd_info *mtd)
-{
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
-	int16_t __iomem *alpha_to = host->pmecc_alpha_to;
-	int16_t __iomem *index_of = host->pmecc_index_of;
-	int16_t *partial_syn = host->pmecc_partial_syn;
-	const int cap = host->pmecc_corr_cap;
-	int16_t *si;
-	int i, j;
-
-	/* si[] is a table that holds the current syndrome value,
-	 * an element of that table belongs to the field
-	 */
-	si = host->pmecc_si;
-
-	memset(&si[1], 0, sizeof(int16_t) * (2 * cap - 1));
-
-	/* Computation 2t syndromes based on S(x) */
-	/* Odd syndromes */
-	for (i = 1; i < 2 * cap; i += 2) {
-		for (j = 0; j < host->pmecc_degree; j++) {
-			if (partial_syn[i] & ((unsigned short)0x1 << j))
-				si[i] = readw_relaxed(alpha_to + i * j) ^ si[i];
-		}
-	}
-	/* Even syndrome = (Odd syndrome) ** 2 */
-	for (i = 2, j = 1; j <= cap; i = ++j << 1) {
-		if (si[j] == 0) {
-			si[i] = 0;
-		} else {
-			int16_t tmp;
-
-			tmp = readw_relaxed(index_of + si[j]);
-			tmp = (tmp * 2) % host->pmecc_cw_len;
-			si[i] = readw_relaxed(alpha_to + tmp);
-		}
-	}
-
-	return;
-}
-
-static void pmecc_get_sigma(struct mtd_info *mtd)
-{
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
-
-	int16_t *lmu = host->pmecc_lmu;
-	int16_t *si = host->pmecc_si;
-	int *mu = host->pmecc_mu;
-	int *dmu = host->pmecc_dmu;	/* Discrepancy */
-	int *delta = host->pmecc_delta; /* Delta order */
-	int cw_len = host->pmecc_cw_len;
-	const int16_t cap = host->pmecc_corr_cap;
-	const int num = 2 * cap + 1;
-	int16_t __iomem	*index_of = host->pmecc_index_of;
-	int16_t __iomem	*alpha_to = host->pmecc_alpha_to;
-	int i, j, k;
-	uint32_t dmu_0_count, tmp;
-	int16_t *smu = host->pmecc_smu;
-
-	/* index of largest delta */
-	int ro;
-	int largest;
-	int diff;
-
-	dmu_0_count = 0;
-
-	/* First Row */
-
-	/* Mu */
-	mu[0] = -1;
-
-	memset(smu, 0, sizeof(int16_t) * num);
-	smu[0] = 1;
-
-	/* discrepancy set to 1 */
-	dmu[0] = 1;
-	/* polynom order set to 0 */
-	lmu[0] = 0;
-	delta[0] = (mu[0] * 2 - lmu[0]) >> 1;
-
-	/* Second Row */
-
-	/* Mu */
-	mu[1] = 0;
-	/* Sigma(x) set to 1 */
-	memset(&smu[num], 0, sizeof(int16_t) * num);
-	smu[num] = 1;
-
-	/* discrepancy set to S1 */
-	dmu[1] = si[1];
-
-	/* polynom order set to 0 */
-	lmu[1] = 0;
-
-	delta[1] = (mu[1] * 2 - lmu[1]) >> 1;
-
-	/* Init the Sigma(x) last row */
-	memset(&smu[(cap + 1) * num], 0, sizeof(int16_t) * num);
-
-	for (i = 1; i <= cap; i++) {
-		mu[i + 1] = i << 1;
-		/* Begin Computing Sigma (Mu+1) and L(mu) */
-		/* check if discrepancy is set to 0 */
-		if (dmu[i] == 0) {
-			dmu_0_count++;
-
-			tmp = ((cap - (lmu[i] >> 1) - 1) / 2);
-			if ((cap - (lmu[i] >> 1) - 1) & 0x1)
-				tmp += 2;
-			else
-				tmp += 1;
-
-			if (dmu_0_count == tmp) {
-				for (j = 0; j <= (lmu[i] >> 1) + 1; j++)
-					smu[(cap + 1) * num + j] =
-							smu[i * num + j];
-
-				lmu[cap + 1] = lmu[i];
-				return;
-			}
-
-			/* copy polynom */
-			for (j = 0; j <= lmu[i] >> 1; j++)
-				smu[(i + 1) * num + j] = smu[i * num + j];
-
-			/* copy previous polynom order to the next */
-			lmu[i + 1] = lmu[i];
-		} else {
-			ro = 0;
-			largest = -1;
-			/* find largest delta with dmu != 0 */
-			for (j = 0; j < i; j++) {
-				if ((dmu[j]) && (delta[j] > largest)) {
-					largest = delta[j];
-					ro = j;
-				}
-			}
-
-			/* compute difference */
-			diff = (mu[i] - mu[ro]);
-
-			/* Compute degree of the new smu polynomial */
-			if ((lmu[i] >> 1) > ((lmu[ro] >> 1) + diff))
-				lmu[i + 1] = lmu[i];
-			else
-				lmu[i + 1] = ((lmu[ro] >> 1) + diff) * 2;
-
-			/* Init smu[i+1] with 0 */
-			for (k = 0; k < num; k++)
-				smu[(i + 1) * num + k] = 0;
-
-			/* Compute smu[i+1] */
-			for (k = 0; k <= lmu[ro] >> 1; k++) {
-				int16_t a, b, c;
-
-				if (!(smu[ro * num + k] && dmu[i]))
-					continue;
-				a = readw_relaxed(index_of + dmu[i]);
-				b = readw_relaxed(index_of + dmu[ro]);
-				c = readw_relaxed(index_of + smu[ro * num + k]);
-				tmp = a + (cw_len - b) + c;
-				a = readw_relaxed(alpha_to + tmp % cw_len);
-				smu[(i + 1) * num + (k + diff)] = a;
-			}
-
-			for (k = 0; k <= lmu[i] >> 1; k++)
-				smu[(i + 1) * num + k] ^= smu[i * num + k];
-		}
-
-		/* End Computing Sigma (Mu+1) and L(mu) */
-		/* In either case compute delta */
-		delta[i + 1] = (mu[i + 1] * 2 - lmu[i + 1]) >> 1;
-
-		/* Do not compute discrepancy for the last iteration */
-		if (i >= cap)
-			continue;
-
-		for (k = 0; k <= (lmu[i + 1] >> 1); k++) {
-			tmp = 2 * (i - 1);
-			if (k == 0) {
-				dmu[i + 1] = si[tmp + 3];
-			} else if (smu[(i + 1) * num + k] && si[tmp + 3 - k]) {
-				int16_t a, b, c;
-				a = readw_relaxed(index_of +
-						smu[(i + 1) * num + k]);
-				b = si[2 * (i - 1) + 3 - k];
-				c = readw_relaxed(index_of + b);
-				tmp = a + c;
-				tmp %= cw_len;
-				dmu[i + 1] = readw_relaxed(alpha_to + tmp) ^
-					dmu[i + 1];
-			}
-		}
-	}
-
-	return;
-}
-
-static int pmecc_err_location(struct mtd_info *mtd)
-{
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
-	unsigned long end_time;
-	const int cap = host->pmecc_corr_cap;
-	const int num = 2 * cap + 1;
-	int sector_size = host->pmecc_sector_size;
-	int err_nbr = 0;	/* number of error */
-	int roots_nbr;		/* number of roots */
-	int i;
-	uint32_t val;
-	int16_t *smu = host->pmecc_smu;
-
-	pmerrloc_writel(host->pmerrloc_base, ELDIS, PMERRLOC_DISABLE);
-
-	for (i = 0; i <= host->pmecc_lmu[cap + 1] >> 1; i++) {
-		pmerrloc_writel_sigma_relaxed(host->pmerrloc_base, i,
-				      smu[(cap + 1) * num + i]);
-		err_nbr++;
-	}
-
-	val = (err_nbr - 1) << 16;
-	if (sector_size == 1024)
-		val |= 1;
-
-	pmerrloc_writel(host->pmerrloc_base, ELCFG, val);
-	pmerrloc_writel(host->pmerrloc_base, ELEN,
-			sector_size * 8 + host->pmecc_degree * cap);
-
-	end_time = jiffies + msecs_to_jiffies(PMECC_MAX_TIMEOUT_MS);
-	while (!(pmerrloc_readl_relaxed(host->pmerrloc_base, ELISR)
-		 & PMERRLOC_CALC_DONE)) {
-		if (unlikely(time_after(jiffies, end_time))) {
-			dev_err(host->dev, "PMECC: Timeout to calculate error location.\n");
-			return -1;
-		}
-		cpu_relax();
-	}
-
-	roots_nbr = (pmerrloc_readl_relaxed(host->pmerrloc_base, ELISR)
-		& PMERRLOC_ERR_NUM_MASK) >> 8;
-	/* Number of roots == degree of smu hence <= cap */
-	if (roots_nbr == host->pmecc_lmu[cap + 1] >> 1)
-		return err_nbr - 1;
-
-	/* Number of roots does not match the degree of smu
-	 * unable to correct error */
-	return -1;
-}
-
-static void pmecc_correct_data(struct mtd_info *mtd, uint8_t *buf, uint8_t *ecc,
-		int sector_num, int extra_bytes, int err_nbr)
-{
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
-	int i = 0;
-	int byte_pos, bit_pos, sector_size, pos;
-	uint32_t tmp;
-	uint8_t err_byte;
-
-	sector_size = host->pmecc_sector_size;
-
-	while (err_nbr) {
-		tmp = pmerrloc_readl_el_relaxed(host->pmerrloc_el_base, i) - 1;
-		byte_pos = tmp / 8;
-		bit_pos  = tmp % 8;
-
-		if (byte_pos >= (sector_size + extra_bytes))
-			BUG();	/* should never happen */
-
-		if (byte_pos < sector_size) {
-			err_byte = *(buf + byte_pos);
-			*(buf + byte_pos) ^= (1 << bit_pos);
-
-			pos = sector_num * host->pmecc_sector_size + byte_pos;
-			dev_dbg(host->dev, "Bit flip in data area, byte_pos: %d, bit_pos: %d, 0x%02x -> 0x%02x\n",
-				pos, bit_pos, err_byte, *(buf + byte_pos));
-		} else {
-			struct mtd_oob_region oobregion;
-
-			/* Bit flip in OOB area */
-			tmp = sector_num * nand_chip->ecc.bytes
-					+ (byte_pos - sector_size);
-			err_byte = ecc[tmp];
-			ecc[tmp] ^= (1 << bit_pos);
-
-			mtd_ooblayout_ecc(mtd, 0, &oobregion);
-			pos = tmp + oobregion.offset;
-			dev_dbg(host->dev, "Bit flip in OOB, oob_byte_pos: %d, bit_pos: %d, 0x%02x -> 0x%02x\n",
-				pos, bit_pos, err_byte, ecc[tmp]);
-		}
-
-		i++;
-		err_nbr--;
-	}
-
-	return;
-}
-
-static int pmecc_correction(struct mtd_info *mtd, u32 pmecc_stat, uint8_t *buf,
-	u8 *ecc)
-{
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
-	int i, err_nbr;
-	uint8_t *buf_pos;
-	int max_bitflips = 0;
-
-	for (i = 0; i < nand_chip->ecc.steps; i++) {
-		err_nbr = 0;
-		if (pmecc_stat & 0x1) {
-			buf_pos = buf + i * host->pmecc_sector_size;
-
-			pmecc_gen_syndrome(mtd, i);
-			pmecc_substitute(mtd);
-			pmecc_get_sigma(mtd);
-
-			err_nbr = pmecc_err_location(mtd);
-			if (err_nbr >= 0) {
-				pmecc_correct_data(mtd, buf_pos, ecc, i,
-						   nand_chip->ecc.bytes,
-						   err_nbr);
-			} else if (!host->caps->pmecc_correct_erase_page) {
-				u8 *ecc_pos = ecc + (i * nand_chip->ecc.bytes);
-
-				/* Try to detect erased pages */
-				err_nbr = nand_check_erased_ecc_chunk(buf_pos,
-							host->pmecc_sector_size,
-							ecc_pos,
-							nand_chip->ecc.bytes,
-							NULL, 0,
-							nand_chip->ecc.strength);
-			}
-
-			if (err_nbr < 0) {
-				dev_err(host->dev, "PMECC: Too many errors\n");
-				mtd->ecc_stats.failed++;
-				return -EIO;
-			}
-
-			mtd->ecc_stats.corrected += err_nbr;
-			max_bitflips = max_t(int, max_bitflips, err_nbr);
-		}
-		pmecc_stat >>= 1;
-	}
-
-	return max_bitflips;
-}
-
-static void pmecc_enable(struct atmel_nand_host *host, int ecc_op)
-{
-	u32 val;
-
-	if (ecc_op != NAND_ECC_READ && ecc_op != NAND_ECC_WRITE) {
-		dev_err(host->dev, "atmel_nand: wrong pmecc operation type!");
-		return;
-	}
-
-	pmecc_writel(host->ecc, CTRL, PMECC_CTRL_RST);
-	pmecc_writel(host->ecc, CTRL, PMECC_CTRL_DISABLE);
-	val = pmecc_readl_relaxed(host->ecc, CFG);
-
-	if (ecc_op == NAND_ECC_READ)
-		pmecc_writel(host->ecc, CFG, (val & ~PMECC_CFG_WRITE_OP)
-			| PMECC_CFG_AUTO_ENABLE);
-	else
-		pmecc_writel(host->ecc, CFG, (val | PMECC_CFG_WRITE_OP)
-			& ~PMECC_CFG_AUTO_ENABLE);
-
-	pmecc_writel(host->ecc, CTRL, PMECC_CTRL_ENABLE);
-	pmecc_writel(host->ecc, CTRL, PMECC_CTRL_DATA);
-}
-
-static int atmel_nand_pmecc_read_page(struct mtd_info *mtd,
-	struct nand_chip *chip, uint8_t *buf, int oob_required, int page)
-{
-	struct atmel_nand_host *host = nand_get_controller_data(chip);
-	int eccsize = chip->ecc.size * chip->ecc.steps;
-	uint8_t *oob = chip->oob_poi;
-	uint32_t stat;
-	unsigned long end_time;
-	int bitflips = 0;
-
-	if (!host->nfc || !host->nfc->use_nfc_sram)
-		pmecc_enable(host, NAND_ECC_READ);
-
-	chip->read_buf(mtd, buf, eccsize);
-	chip->read_buf(mtd, oob, mtd->oobsize);
-
-	end_time = jiffies + msecs_to_jiffies(PMECC_MAX_TIMEOUT_MS);
-	while ((pmecc_readl_relaxed(host->ecc, SR) & PMECC_SR_BUSY)) {
-		if (unlikely(time_after(jiffies, end_time))) {
-			dev_err(host->dev, "PMECC: Timeout to get error status.\n");
-			return -EIO;
-		}
-		cpu_relax();
-	}
-
-	stat = pmecc_readl_relaxed(host->ecc, ISR);
-	if (stat != 0) {
-		struct mtd_oob_region oobregion;
-
-		mtd_ooblayout_ecc(mtd, 0, &oobregion);
-		bitflips = pmecc_correction(mtd, stat, buf,
-					    &oob[oobregion.offset]);
-		if (bitflips < 0)
-			/* uncorrectable errors */
-			return 0;
-	}
-
-	return bitflips;
-}
-
-static int atmel_nand_pmecc_write_page(struct mtd_info *mtd,
-		struct nand_chip *chip, const uint8_t *buf, int oob_required,
-		int page)
-{
-	struct atmel_nand_host *host = nand_get_controller_data(chip);
-	struct mtd_oob_region oobregion = { };
-	int i, j, section = 0;
-	unsigned long end_time;
-
-	if (!host->nfc || !host->nfc->write_by_sram) {
-		pmecc_enable(host, NAND_ECC_WRITE);
-		chip->write_buf(mtd, (u8 *)buf, mtd->writesize);
-	}
-
-	end_time = jiffies + msecs_to_jiffies(PMECC_MAX_TIMEOUT_MS);
-	while ((pmecc_readl_relaxed(host->ecc, SR) & PMECC_SR_BUSY)) {
-		if (unlikely(time_after(jiffies, end_time))) {
-			dev_err(host->dev, "PMECC: Timeout to get ECC value.\n");
-			return -EIO;
-		}
-		cpu_relax();
-	}
-
-	for (i = 0; i < chip->ecc.steps; i++) {
-		for (j = 0; j < chip->ecc.bytes; j++) {
-			if (!oobregion.length)
-				mtd_ooblayout_ecc(mtd, section, &oobregion);
-
-			chip->oob_poi[oobregion.offset] =
-				pmecc_readb_ecc_relaxed(host->ecc, i, j);
-			oobregion.length--;
-			oobregion.offset++;
-			section++;
-		}
-	}
-	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
-
-	return 0;
-}
-
-static void atmel_pmecc_core_init(struct mtd_info *mtd)
-{
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
-	int eccbytes = mtd_ooblayout_count_eccbytes(mtd);
-	uint32_t val = 0;
-	struct mtd_oob_region oobregion;
-
-	pmecc_writel(host->ecc, CTRL, PMECC_CTRL_RST);
-	pmecc_writel(host->ecc, CTRL, PMECC_CTRL_DISABLE);
-
-	switch (host->pmecc_corr_cap) {
-	case 2:
-		val = PMECC_CFG_BCH_ERR2;
-		break;
-	case 4:
-		val = PMECC_CFG_BCH_ERR4;
-		break;
-	case 8:
-		val = PMECC_CFG_BCH_ERR8;
-		break;
-	case 12:
-		val = PMECC_CFG_BCH_ERR12;
-		break;
-	case 24:
-		val = PMECC_CFG_BCH_ERR24;
-		break;
-	case 32:
-		val = PMECC_CFG_BCH_ERR32;
-		break;
-	}
-
-	if (host->pmecc_sector_size == 512)
-		val |= PMECC_CFG_SECTOR512;
-	else if (host->pmecc_sector_size == 1024)
-		val |= PMECC_CFG_SECTOR1024;
-
-	switch (nand_chip->ecc.steps) {
-	case 1:
-		val |= PMECC_CFG_PAGE_1SECTOR;
-		break;
-	case 2:
-		val |= PMECC_CFG_PAGE_2SECTORS;
-		break;
-	case 4:
-		val |= PMECC_CFG_PAGE_4SECTORS;
-		break;
-	case 8:
-		val |= PMECC_CFG_PAGE_8SECTORS;
-		break;
-	}
-
-	val |= (PMECC_CFG_READ_OP | PMECC_CFG_SPARE_DISABLE
-		| PMECC_CFG_AUTO_DISABLE);
-	pmecc_writel(host->ecc, CFG, val);
-
-	pmecc_writel(host->ecc, SAREA, mtd->oobsize - 1);
-	mtd_ooblayout_ecc(mtd, 0, &oobregion);
-	pmecc_writel(host->ecc, SADDR, oobregion.offset);
-	pmecc_writel(host->ecc, EADDR,
-		     oobregion.offset + eccbytes - 1);
-	/* See datasheet about PMECC Clock Control Register */
-	pmecc_writel(host->ecc, CLK, 2);
-	pmecc_writel(host->ecc, IDR, 0xff);
-	pmecc_writel(host->ecc, CTRL, PMECC_CTRL_ENABLE);
-}
-
-/*
- * Get minimum ecc requirements from NAND.
- * If pmecc-cap, pmecc-sector-size in DTS are not specified, this function
- * will set them according to minimum ecc requirement. Otherwise, use the
- * value in DTS file.
- * return 0 if success. otherwise return error code.
- */
-static int pmecc_choose_ecc(struct atmel_nand_host *host,
-		int *cap, int *sector_size)
-{
-	/* Get minimum ECC requirements */
-	if (host->nand_chip.ecc_strength_ds) {
-		*cap = host->nand_chip.ecc_strength_ds;
-		*sector_size = host->nand_chip.ecc_step_ds;
-		dev_info(host->dev, "minimum ECC: %d bits in %d bytes\n",
-				*cap, *sector_size);
-	} else {
-		*cap = 2;
-		*sector_size = 512;
-		dev_info(host->dev, "can't detect min. ECC, assume 2 bits in 512 bytes\n");
-	}
-
-	/* If device tree doesn't specify, use NAND's minimum ECC parameters */
-	if (host->pmecc_corr_cap == 0) {
-		if (*cap > host->caps->pmecc_max_correction)
-			return -EINVAL;
-
-		/* use the most fitable ecc bits (the near bigger one ) */
-		if (*cap <= 2)
-			host->pmecc_corr_cap = 2;
-		else if (*cap <= 4)
-			host->pmecc_corr_cap = 4;
-		else if (*cap <= 8)
-			host->pmecc_corr_cap = 8;
-		else if (*cap <= 12)
-			host->pmecc_corr_cap = 12;
-		else if (*cap <= 24)
-			host->pmecc_corr_cap = 24;
-		else if (*cap <= 32)
-			host->pmecc_corr_cap = 32;
-		else
-			return -EINVAL;
-	}
-	if (host->pmecc_sector_size == 0) {
-		/* use the most fitable sector size (the near smaller one ) */
-		if (*sector_size >= 1024)
-			host->pmecc_sector_size = 1024;
-		else if (*sector_size >= 512)
-			host->pmecc_sector_size = 512;
-		else
-			return -EINVAL;
-	}
-	return 0;
-}
-
-static inline int deg(unsigned int poly)
-{
-	/* polynomial degree is the most-significant bit index */
-	return fls(poly) - 1;
-}
-
-static int build_gf_tables(int mm, unsigned int poly,
-		int16_t *index_of, int16_t *alpha_to)
-{
-	unsigned int i, x = 1;
-	const unsigned int k = 1 << deg(poly);
-	unsigned int nn = (1 << mm) - 1;
-
-	/* primitive polynomial must be of degree m */
-	if (k != (1u << mm))
-		return -EINVAL;
-
-	for (i = 0; i < nn; i++) {
-		alpha_to[i] = x;
-		index_of[x] = i;
-		if (i && (x == 1))
-			/* polynomial is not primitive (a^i=1 with 0<i<2^m-1) */
-			return -EINVAL;
-		x <<= 1;
-		if (x & k)
-			x ^= poly;
-	}
-	alpha_to[nn] = 1;
-	index_of[0] = 0;
-
-	return 0;
-}
-
-static uint16_t *create_lookup_table(struct device *dev, int sector_size)
-{
-	int degree = (sector_size == 512) ?
-			PMECC_GF_DIMENSION_13 :
-			PMECC_GF_DIMENSION_14;
-	unsigned int poly = (sector_size == 512) ?
-			PMECC_GF_13_PRIMITIVE_POLY :
-			PMECC_GF_14_PRIMITIVE_POLY;
-	int table_size = (sector_size == 512) ?
-			PMECC_LOOKUP_TABLE_SIZE_512 :
-			PMECC_LOOKUP_TABLE_SIZE_1024;
-
-	int16_t *addr = devm_kzalloc(dev, 2 * table_size * sizeof(uint16_t),
-			GFP_KERNEL);
-	if (addr && build_gf_tables(degree, poly, addr, addr + table_size))
-		return NULL;
-
-	return addr;
-}
-
-static int atmel_pmecc_nand_init_params(struct platform_device *pdev,
-					 struct atmel_nand_host *host)
-{
-	struct nand_chip *nand_chip = &host->nand_chip;
-	struct mtd_info *mtd = nand_to_mtd(nand_chip);
-	struct resource *regs, *regs_pmerr, *regs_rom;
-	uint16_t *galois_table;
-	int cap, sector_size, err_no;
-
-	err_no = pmecc_choose_ecc(host, &cap, &sector_size);
-	if (err_no) {
-		dev_err(host->dev, "The NAND flash's ECC requirement are not support!");
-		return err_no;
-	}
-
-	if (cap > host->pmecc_corr_cap ||
-			sector_size != host->pmecc_sector_size)
-		dev_info(host->dev, "WARNING: Be Caution! Using different PMECC parameters from Nand ONFI ECC reqirement.\n");
-
-	cap = host->pmecc_corr_cap;
-	sector_size = host->pmecc_sector_size;
-	host->pmecc_lookup_table_offset = (sector_size == 512) ?
-			host->pmecc_lookup_table_offset_512 :
-			host->pmecc_lookup_table_offset_1024;
-
-	dev_info(host->dev, "Initialize PMECC params, cap: %d, sector: %d\n",
-		 cap, sector_size);
-
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!regs) {
-		dev_warn(host->dev,
-			"Can't get I/O resource regs for PMECC controller, rolling back on software ECC\n");
-		nand_chip->ecc.mode = NAND_ECC_SOFT;
-		nand_chip->ecc.algo = NAND_ECC_HAMMING;
-		return 0;
-	}
-
-	host->ecc = devm_ioremap_resource(&pdev->dev, regs);
-	if (IS_ERR(host->ecc)) {
-		err_no = PTR_ERR(host->ecc);
-		goto err;
-	}
-
-	regs_pmerr = platform_get_resource(pdev, IORESOURCE_MEM, 2);
-	host->pmerrloc_base = devm_ioremap_resource(&pdev->dev, regs_pmerr);
-	if (IS_ERR(host->pmerrloc_base)) {
-		err_no = PTR_ERR(host->pmerrloc_base);
-		goto err;
-	}
-	host->pmerrloc_el_base = host->pmerrloc_base + ATMEL_PMERRLOC_SIGMAx +
-		(host->caps->pmecc_max_correction + 1) * 4;
-
-	if (!host->has_no_lookup_table) {
-		regs_rom = platform_get_resource(pdev, IORESOURCE_MEM, 3);
-		host->pmecc_rom_base = devm_ioremap_resource(&pdev->dev,
-								regs_rom);
-		if (IS_ERR(host->pmecc_rom_base)) {
-			dev_err(host->dev, "Can not get I/O resource for ROM, will build a lookup table in runtime!\n");
-			host->has_no_lookup_table = true;
-		}
-	}
-
-	if (host->has_no_lookup_table) {
-		/* Build the look-up table in runtime */
-		galois_table = create_lookup_table(host->dev, sector_size);
-		if (!galois_table) {
-			dev_err(host->dev, "Failed to build a lookup table in runtime!\n");
-			err_no = -EINVAL;
-			goto err;
-		}
-
-		host->pmecc_rom_base = (void __iomem *)galois_table;
-		host->pmecc_lookup_table_offset = 0;
-	}
-
-	nand_chip->ecc.size = sector_size;
-
-	/* set ECC page size and oob layout */
-	switch (mtd->writesize) {
-	case 512:
-	case 1024:
-	case 2048:
-	case 4096:
-	case 8192:
-		if (sector_size > mtd->writesize) {
-			dev_err(host->dev, "pmecc sector size is bigger than the page size!\n");
-			err_no = -EINVAL;
-			goto err;
-		}
-
-		host->pmecc_degree = (sector_size == 512) ?
-			PMECC_GF_DIMENSION_13 : PMECC_GF_DIMENSION_14;
-		host->pmecc_cw_len = (1 << host->pmecc_degree) - 1;
-		host->pmecc_alpha_to = pmecc_get_alpha_to(host);
-		host->pmecc_index_of = host->pmecc_rom_base +
-			host->pmecc_lookup_table_offset;
-
-		nand_chip->ecc.strength = cap;
-		nand_chip->ecc.bytes = pmecc_get_ecc_bytes(cap, sector_size);
-		nand_chip->ecc.steps = mtd->writesize / sector_size;
-		nand_chip->ecc.total = nand_chip->ecc.bytes *
-			nand_chip->ecc.steps;
-		if (nand_chip->ecc.total >
-				mtd->oobsize - PMECC_OOB_RESERVED_BYTES) {
-			dev_err(host->dev, "No room for ECC bytes\n");
-			err_no = -EINVAL;
-			goto err;
-		}
-
-		mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
-		break;
-	default:
-		dev_warn(host->dev,
-			"Unsupported page size for PMECC, use Software ECC\n");
-		/* page size not handled by HW ECC */
-		/* switching back to soft ECC */
-		nand_chip->ecc.mode = NAND_ECC_SOFT;
-		nand_chip->ecc.algo = NAND_ECC_HAMMING;
-		return 0;
-	}
-
-	/* Allocate data for PMECC computation */
-	err_no = pmecc_data_alloc(host);
-	if (err_no) {
-		dev_err(host->dev,
-				"Cannot allocate memory for PMECC computation!\n");
-		goto err;
-	}
-
-	nand_chip->options |= NAND_NO_SUBPAGE_WRITE;
-	nand_chip->ecc.read_page = atmel_nand_pmecc_read_page;
-	nand_chip->ecc.write_page = atmel_nand_pmecc_write_page;
-
-	atmel_pmecc_core_init(mtd);
-
-	return 0;
-
-err:
-	return err_no;
-}
-
-/*
- * Calculate HW ECC
- *
- * function called after a write
- *
- * mtd:        MTD block structure
- * dat:        raw data (unused)
- * ecc_code:   buffer for ECC
- */
-static int atmel_nand_calculate(struct mtd_info *mtd,
-		const u_char *dat, unsigned char *ecc_code)
-{
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
-	unsigned int ecc_value;
-
-	/* get the first 2 ECC bytes */
-	ecc_value = ecc_readl(host->ecc, PR);
-
-	ecc_code[0] = ecc_value & 0xFF;
-	ecc_code[1] = (ecc_value >> 8) & 0xFF;
-
-	/* get the last 2 ECC bytes */
-	ecc_value = ecc_readl(host->ecc, NPR) & ATMEL_ECC_NPARITY;
-
-	ecc_code[2] = ecc_value & 0xFF;
-	ecc_code[3] = (ecc_value >> 8) & 0xFF;
-
-	return 0;
-}
-
-/*
- * HW ECC read page function
- *
- * mtd:        mtd info structure
- * chip:       nand chip info structure
- * buf:        buffer to store read data
- * oob_required:    caller expects OOB data read to chip->oob_poi
- */
-static int atmel_nand_read_page(struct mtd_info *mtd, struct nand_chip *chip,
-				uint8_t *buf, int oob_required, int page)
-{
-	int eccsize = chip->ecc.size;
-	int eccbytes = chip->ecc.bytes;
-	uint8_t *p = buf;
-	uint8_t *oob = chip->oob_poi;
-	uint8_t *ecc_pos;
-	int stat;
-	unsigned int max_bitflips = 0;
-	struct mtd_oob_region oobregion = {};
-
-	/*
-	 * Errata: ALE is incorrectly wired up to the ECC controller
-	 * on the AP7000, so it will include the address cycles in the
-	 * ECC calculation.
-	 *
-	 * Workaround: Reset the parity registers before reading the
-	 * actual data.
-	 */
-	struct atmel_nand_host *host = nand_get_controller_data(chip);
-	if (host->board.need_reset_workaround)
-		ecc_writel(host->ecc, CR, ATMEL_ECC_RST);
-
-	/* read the page */
-	chip->read_buf(mtd, p, eccsize);
-
-	/* move to ECC position if needed */
-	mtd_ooblayout_ecc(mtd, 0, &oobregion);
-	if (oobregion.offset != 0) {
-		/*
-		 * This only works on large pages because the ECC controller
-		 * waits for NAND_CMD_RNDOUTSTART after the NAND_CMD_RNDOUT.
-		 * Anyway, for small pages, the first ECC byte is at offset
-		 * 0 in the OOB area.
-		 */
-		chip->cmdfunc(mtd, NAND_CMD_RNDOUT,
-			      mtd->writesize + oobregion.offset, -1);
-	}
-
-	/* the ECC controller needs to read the ECC just after the data */
-	ecc_pos = oob + oobregion.offset;
-	chip->read_buf(mtd, ecc_pos, eccbytes);
-
-	/* check if there's an error */
-	stat = chip->ecc.correct(mtd, p, oob, NULL);
-
-	if (stat < 0) {
-		mtd->ecc_stats.failed++;
-	} else {
-		mtd->ecc_stats.corrected += stat;
-		max_bitflips = max_t(unsigned int, max_bitflips, stat);
-	}
-
-	/* get back to oob start (end of page) */
-	chip->cmdfunc(mtd, NAND_CMD_RNDOUT, mtd->writesize, -1);
-
-	/* read the oob */
-	chip->read_buf(mtd, oob, mtd->oobsize);
-
-	return max_bitflips;
-}
-
-/*
- * HW ECC Correction
- *
- * function called after a read
- *
- * mtd:        MTD block structure
- * dat:        raw data read from the chip
- * read_ecc:   ECC from the chip (unused)
- * isnull:     unused
- *
- * Detect and correct a 1 bit error for a page
- */
-static int atmel_nand_correct(struct mtd_info *mtd, u_char *dat,
-		u_char *read_ecc, u_char *isnull)
-{
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
-	unsigned int ecc_status;
-	unsigned int ecc_word, ecc_bit;
-
-	/* get the status from the Status Register */
-	ecc_status = ecc_readl(host->ecc, SR);
-
-	/* if there's no error */
-	if (likely(!(ecc_status & ATMEL_ECC_RECERR)))
-		return 0;
-
-	/* get error bit offset (4 bits) */
-	ecc_bit = ecc_readl(host->ecc, PR) & ATMEL_ECC_BITADDR;
-	/* get word address (12 bits) */
-	ecc_word = ecc_readl(host->ecc, PR) & ATMEL_ECC_WORDADDR;
-	ecc_word >>= 4;
-
-	/* if there are multiple errors */
-	if (ecc_status & ATMEL_ECC_MULERR) {
-		/* check if it is a freshly erased block
-		 * (filled with 0xff) */
-		if ((ecc_bit == ATMEL_ECC_BITADDR)
-				&& (ecc_word == (ATMEL_ECC_WORDADDR >> 4))) {
-			/* the block has just been erased, return OK */
-			return 0;
-		}
-		/* it doesn't seems to be a freshly
-		 * erased block.
-		 * We can't correct so many errors */
-		dev_dbg(host->dev, "atmel_nand : multiple errors detected."
-				" Unable to correct.\n");
-		return -EBADMSG;
-	}
-
-	/* if there's a single bit error : we can correct it */
-	if (ecc_status & ATMEL_ECC_ECCERR) {
-		/* there's nothing much to do here.
-		 * the bit error is on the ECC itself.
-		 */
-		dev_dbg(host->dev, "atmel_nand : one bit error on ECC code."
-				" Nothing to correct\n");
-		return 0;
-	}
-
-	dev_dbg(host->dev, "atmel_nand : one bit error on data."
-			" (word offset in the page :"
-			" 0x%x bit offset : 0x%x)\n",
-			ecc_word, ecc_bit);
-	/* correct the error */
-	if (nand_chip->options & NAND_BUSWIDTH_16) {
-		/* 16 bits words */
-		((unsigned short *) dat)[ecc_word] ^= (1 << ecc_bit);
-	} else {
-		/* 8 bits words */
-		dat[ecc_word] ^= (1 << ecc_bit);
-	}
-	dev_dbg(host->dev, "atmel_nand : error corrected\n");
-	return 1;
-}
-
-/*
- * Enable HW ECC : unused on most chips
- */
-static void atmel_nand_hwctl(struct mtd_info *mtd, int mode)
-{
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
-
-	if (host->board.need_reset_workaround)
-		ecc_writel(host->ecc, CR, ATMEL_ECC_RST);
-}
-
-static int atmel_of_init_ecc(struct atmel_nand_host *host,
-			     struct device_node *np)
-{
-	u32 offset[2];
-	u32 val;
-
-	host->has_pmecc = of_property_read_bool(np, "atmel,has-pmecc");
-
-	/* Not using PMECC */
-	if (!(host->nand_chip.ecc.mode == NAND_ECC_HW) || !host->has_pmecc)
-		return 0;
-
-	/* use PMECC, get correction capability, sector size and lookup
-	 * table offset.
-	 * If correction bits and sector size are not specified, then find
-	 * them from NAND ONFI parameters.
-	 */
-	if (of_property_read_u32(np, "atmel,pmecc-cap", &val) == 0) {
-		if (val > host->caps->pmecc_max_correction) {
-			dev_err(host->dev,
-				"Required ECC strength too high: %u max %u\n",
-				val, host->caps->pmecc_max_correction);
-			return -EINVAL;
-		}
-		if ((val != 2)  && (val != 4)  && (val != 8) &&
-		    (val != 12) && (val != 24) && (val != 32)) {
-			dev_err(host->dev,
-				"Required ECC strength not supported: %u\n",
-				val);
-			return -EINVAL;
-		}
-		host->pmecc_corr_cap = (u8)val;
-	}
-
-	if (of_property_read_u32(np, "atmel,pmecc-sector-size", &val) == 0) {
-		if ((val != 512) && (val != 1024)) {
-			dev_err(host->dev,
-				"Required ECC sector size not supported: %u\n",
-				val);
-			return -EINVAL;
-		}
-		host->pmecc_sector_size = (u16)val;
-	}
-
-	if (of_property_read_u32_array(np, "atmel,pmecc-lookup-table-offset",
-			offset, 2) != 0) {
-		dev_err(host->dev, "Cannot get PMECC lookup table offset, will build a lookup table in runtime.\n");
-		host->has_no_lookup_table = true;
-		/* Will build a lookup table and initialize the offset later */
-		return 0;
-	}
-
-	if (!offset[0] && !offset[1]) {
-		dev_err(host->dev, "Invalid PMECC lookup table offset\n");
-		return -EINVAL;
-	}
-
-	host->pmecc_lookup_table_offset_512 = offset[0];
-	host->pmecc_lookup_table_offset_1024 = offset[1];
-
-	return 0;
-}
-
-static int atmel_of_init_port(struct atmel_nand_host *host,
-			      struct device_node *np)
-{
-	u32 val;
-	struct atmel_nand_data *board = &host->board;
-	enum of_gpio_flags flags = 0;
-
-	host->caps = (struct atmel_nand_caps *)
-		of_device_get_match_data(host->dev);
-
-	if (of_property_read_u32(np, "atmel,nand-addr-offset", &val) == 0) {
-		if (val >= 32) {
-			dev_err(host->dev, "invalid addr-offset %u\n", val);
-			return -EINVAL;
-		}
-		board->ale = val;
-	}
-
-	if (of_property_read_u32(np, "atmel,nand-cmd-offset", &val) == 0) {
-		if (val >= 32) {
-			dev_err(host->dev, "invalid cmd-offset %u\n", val);
-			return -EINVAL;
-		}
-		board->cle = val;
-	}
-
-	board->has_dma = of_property_read_bool(np, "atmel,nand-has-dma");
-
-	board->rdy_pin = of_get_gpio_flags(np, 0, &flags);
-	board->rdy_pin_active_low = (flags == OF_GPIO_ACTIVE_LOW);
-
-	board->enable_pin = of_get_gpio(np, 1);
-	board->det_pin = of_get_gpio(np, 2);
-
-	/* load the nfc driver if there is */
-	of_platform_populate(np, NULL, NULL, host->dev);
-
-	/*
-	 * Initialize ECC mode to NAND_ECC_SOFT so that we have a correct value
-	 * even if the nand-ecc-mode property is not defined.
-	 */
-	host->nand_chip.ecc.mode = NAND_ECC_SOFT;
-	host->nand_chip.ecc.algo = NAND_ECC_HAMMING;
-
-	return 0;
-}
-
-static int atmel_hw_nand_init_params(struct platform_device *pdev,
-					 struct atmel_nand_host *host)
-{
-	struct nand_chip *nand_chip = &host->nand_chip;
-	struct mtd_info *mtd = nand_to_mtd(nand_chip);
-	struct resource		*regs;
-
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!regs) {
-		dev_err(host->dev,
-			"Can't get I/O resource regs, use software ECC\n");
-		nand_chip->ecc.mode = NAND_ECC_SOFT;
-		nand_chip->ecc.algo = NAND_ECC_HAMMING;
-		return 0;
-	}
-
-	host->ecc = devm_ioremap_resource(&pdev->dev, regs);
-	if (IS_ERR(host->ecc))
-		return PTR_ERR(host->ecc);
-
-	/* ECC is calculated for the whole page (1 step) */
-	nand_chip->ecc.size = mtd->writesize;
-
-	/* set ECC page size and oob layout */
-	switch (mtd->writesize) {
-	case 512:
-		mtd_set_ooblayout(mtd, &atmel_ooblayout_sp_ops);
-		ecc_writel(host->ecc, MR, ATMEL_ECC_PAGESIZE_528);
-		break;
-	case 1024:
-		mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
-		ecc_writel(host->ecc, MR, ATMEL_ECC_PAGESIZE_1056);
-		break;
-	case 2048:
-		mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
-		ecc_writel(host->ecc, MR, ATMEL_ECC_PAGESIZE_2112);
-		break;
-	case 4096:
-		mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
-		ecc_writel(host->ecc, MR, ATMEL_ECC_PAGESIZE_4224);
-		break;
-	default:
-		/* page size not handled by HW ECC */
-		/* switching back to soft ECC */
-		nand_chip->ecc.mode = NAND_ECC_SOFT;
-		nand_chip->ecc.algo = NAND_ECC_HAMMING;
-		return 0;
-	}
-
-	/* set up for HW ECC */
-	nand_chip->ecc.calculate = atmel_nand_calculate;
-	nand_chip->ecc.correct = atmel_nand_correct;
-	nand_chip->ecc.hwctl = atmel_nand_hwctl;
-	nand_chip->ecc.read_page = atmel_nand_read_page;
-	nand_chip->ecc.bytes = 4;
-	nand_chip->ecc.strength = 1;
-
-	return 0;
-}
-
-static inline u32 nfc_read_status(struct atmel_nand_host *host)
-{
-	u32 err_flags = NFC_SR_DTOE | NFC_SR_UNDEF | NFC_SR_AWB | NFC_SR_ASE;
-	u32 nfc_status = nfc_readl(host->nfc->hsmc_regs, SR);
-
-	if (unlikely(nfc_status & err_flags)) {
-		if (nfc_status & NFC_SR_DTOE)
-			dev_err(host->dev, "NFC: Waiting Nand R/B Timeout Error\n");
-		else if (nfc_status & NFC_SR_UNDEF)
-			dev_err(host->dev, "NFC: Access Undefined Area Error\n");
-		else if (nfc_status & NFC_SR_AWB)
-			dev_err(host->dev, "NFC: Access memory While NFC is busy\n");
-		else if (nfc_status & NFC_SR_ASE)
-			dev_err(host->dev, "NFC: Access memory Size Error\n");
-	}
-
-	return nfc_status;
-}
-
-/* SMC interrupt service routine */
-static irqreturn_t hsmc_interrupt(int irq, void *dev_id)
-{
-	struct atmel_nand_host *host = dev_id;
-	u32 status, mask, pending;
-	irqreturn_t ret = IRQ_NONE;
-
-	status = nfc_read_status(host);
-	mask = nfc_readl(host->nfc->hsmc_regs, IMR);
-	pending = status & mask;
-
-	if (pending & NFC_SR_XFR_DONE) {
-		complete(&host->nfc->comp_xfer_done);
-		nfc_writel(host->nfc->hsmc_regs, IDR, NFC_SR_XFR_DONE);
-		ret = IRQ_HANDLED;
-	}
-	if (pending & NFC_SR_RB_EDGE) {
-		complete(&host->nfc->comp_ready);
-		nfc_writel(host->nfc->hsmc_regs, IDR, NFC_SR_RB_EDGE);
-		ret = IRQ_HANDLED;
-	}
-	if (pending & NFC_SR_CMD_DONE) {
-		complete(&host->nfc->comp_cmd_done);
-		nfc_writel(host->nfc->hsmc_regs, IDR, NFC_SR_CMD_DONE);
-		ret = IRQ_HANDLED;
-	}
-
-	return ret;
-}
-
-/* NFC(Nand Flash Controller) related functions */
-static void nfc_prepare_interrupt(struct atmel_nand_host *host, u32 flag)
-{
-	if (flag & NFC_SR_XFR_DONE)
-		init_completion(&host->nfc->comp_xfer_done);
-
-	if (flag & NFC_SR_RB_EDGE)
-		init_completion(&host->nfc->comp_ready);
-
-	if (flag & NFC_SR_CMD_DONE)
-		init_completion(&host->nfc->comp_cmd_done);
-
-	/* Enable interrupt that need to wait for */
-	nfc_writel(host->nfc->hsmc_regs, IER, flag);
-}
-
-static int nfc_wait_interrupt(struct atmel_nand_host *host, u32 flag)
-{
-	int i, index = 0;
-	struct completion *comp[3];	/* Support 3 interrupt completion */
-
-	if (flag & NFC_SR_XFR_DONE)
-		comp[index++] = &host->nfc->comp_xfer_done;
-
-	if (flag & NFC_SR_RB_EDGE)
-		comp[index++] = &host->nfc->comp_ready;
-
-	if (flag & NFC_SR_CMD_DONE)
-		comp[index++] = &host->nfc->comp_cmd_done;
-
-	if (index == 0) {
-		dev_err(host->dev, "Unknown interrupt flag: 0x%08x\n", flag);
-		return -EINVAL;
-	}
-
-	for (i = 0; i < index; i++) {
-		if (wait_for_completion_timeout(comp[i],
-				msecs_to_jiffies(NFC_TIME_OUT_MS)))
-			continue;	/* wait for next completion */
-		else
-			goto err_timeout;
-	}
-
-	return 0;
-
-err_timeout:
-	dev_err(host->dev, "Time out to wait for interrupt: 0x%08x\n", flag);
-	/* Disable the interrupt as it is not handled by interrupt handler */
-	nfc_writel(host->nfc->hsmc_regs, IDR, flag);
-	return -ETIMEDOUT;
-}
-
-static int nfc_send_command(struct atmel_nand_host *host,
-	unsigned int cmd, unsigned int addr, unsigned char cycle0)
-{
-	unsigned long timeout;
-	u32 flag = NFC_SR_CMD_DONE;
-	flag |= cmd & NFCADDR_CMD_DATAEN ? NFC_SR_XFR_DONE : 0;
-
-	dev_dbg(host->dev,
-		"nfc_cmd: 0x%08x, addr1234: 0x%08x, cycle0: 0x%02x\n",
-		cmd, addr, cycle0);
-
-	timeout = jiffies + msecs_to_jiffies(NFC_TIME_OUT_MS);
-	while (nfc_readl(host->nfc->hsmc_regs, SR) & NFC_SR_BUSY) {
-		if (time_after(jiffies, timeout)) {
-			dev_err(host->dev,
-				"Time out to wait for NFC ready!\n");
-			return -ETIMEDOUT;
-		}
-	}
-
-	nfc_prepare_interrupt(host, flag);
-	nfc_writel(host->nfc->hsmc_regs, CYCLE0, cycle0);
-	nfc_cmd_addr1234_writel(cmd, addr, host->nfc->base_cmd_regs);
-	return nfc_wait_interrupt(host, flag);
-}
-
-static int nfc_device_ready(struct mtd_info *mtd)
-{
-	u32 status, mask;
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
-
-	status = nfc_read_status(host);
-	mask = nfc_readl(host->nfc->hsmc_regs, IMR);
-
-	/* The mask should be 0. If not we may lost interrupts */
-	if (unlikely(mask & status))
-		dev_err(host->dev, "Lost the interrupt flags: 0x%08x\n",
-				mask & status);
-
-	return status & NFC_SR_RB_EDGE;
-}
-
-static void nfc_select_chip(struct mtd_info *mtd, int chip)
-{
-	struct nand_chip *nand_chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(nand_chip);
-
-	if (chip == -1)
-		nfc_writel(host->nfc->hsmc_regs, CTRL, NFC_CTRL_DISABLE);
-	else
-		nfc_writel(host->nfc->hsmc_regs, CTRL, NFC_CTRL_ENABLE);
-}
-
-static int nfc_make_addr(struct mtd_info *mtd, int command, int column,
-		int page_addr, unsigned int *addr1234, unsigned int *cycle0)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-
-	int acycle = 0;
-	unsigned char addr_bytes[8];
-	int index = 0, bit_shift;
-
-	BUG_ON(addr1234 == NULL || cycle0 == NULL);
-
-	*cycle0 = 0;
-	*addr1234 = 0;
-
-	if (column != -1) {
-		if (chip->options & NAND_BUSWIDTH_16 &&
-				!nand_opcode_8bits(command))
-			column >>= 1;
-		addr_bytes[acycle++] = column & 0xff;
-		if (mtd->writesize > 512)
-			addr_bytes[acycle++] = (column >> 8) & 0xff;
-	}
-
-	if (page_addr != -1) {
-		addr_bytes[acycle++] = page_addr & 0xff;
-		addr_bytes[acycle++] = (page_addr >> 8) & 0xff;
-		if (chip->chipsize > (128 << 20))
-			addr_bytes[acycle++] = (page_addr >> 16) & 0xff;
-	}
-
-	if (acycle > 4)
-		*cycle0 = addr_bytes[index++];
-
-	for (bit_shift = 0; index < acycle; bit_shift += 8)
-		*addr1234 += addr_bytes[index++] << bit_shift;
-
-	/* return acycle in cmd register */
-	return acycle << NFCADDR_CMD_ACYCLE_BIT_POS;
-}
-
-static void nfc_nand_command(struct mtd_info *mtd, unsigned int command,
-				int column, int page_addr)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(chip);
-	unsigned long timeout;
-	unsigned int nfc_addr_cmd = 0;
-
-	unsigned int cmd1 = command << NFCADDR_CMD_CMD1_BIT_POS;
-
-	/* Set default settings: no cmd2, no addr cycle. read from nand */
-	unsigned int cmd2 = 0;
-	unsigned int vcmd2 = 0;
-	int acycle = NFCADDR_CMD_ACYCLE_NONE;
-	int csid = NFCADDR_CMD_CSID_3;
-	int dataen = NFCADDR_CMD_DATADIS;
-	int nfcwr = NFCADDR_CMD_NFCRD;
-	unsigned int addr1234 = 0;
-	unsigned int cycle0 = 0;
-	bool do_addr = true;
-	host->nfc->data_in_sram = NULL;
-
-	dev_dbg(host->dev, "%s: cmd = 0x%02x, col = 0x%08x, page = 0x%08x\n",
-	     __func__, command, column, page_addr);
-
-	switch (command) {
-	case NAND_CMD_RESET:
-		nfc_addr_cmd = cmd1 | acycle | csid | dataen | nfcwr;
-		nfc_send_command(host, nfc_addr_cmd, addr1234, cycle0);
-		udelay(chip->chip_delay);
-
-		nfc_nand_command(mtd, NAND_CMD_STATUS, -1, -1);
-		timeout = jiffies + msecs_to_jiffies(NFC_TIME_OUT_MS);
-		while (!(chip->read_byte(mtd) & NAND_STATUS_READY)) {
-			if (time_after(jiffies, timeout)) {
-				dev_err(host->dev,
-					"Time out to wait status ready!\n");
-				break;
-			}
-		}
-		return;
-	case NAND_CMD_STATUS:
-		do_addr = false;
-		break;
-	case NAND_CMD_PARAM:
-	case NAND_CMD_READID:
-		do_addr = false;
-		acycle = NFCADDR_CMD_ACYCLE_1;
-		if (column != -1)
-			addr1234 = column;
-		break;
-	case NAND_CMD_RNDOUT:
-		cmd2 = NAND_CMD_RNDOUTSTART << NFCADDR_CMD_CMD2_BIT_POS;
-		vcmd2 = NFCADDR_CMD_VCMD2;
-		break;
-	case NAND_CMD_READ0:
-	case NAND_CMD_READOOB:
-		if (command == NAND_CMD_READOOB) {
-			column += mtd->writesize;
-			command = NAND_CMD_READ0; /* only READ0 is valid */
-			cmd1 = command << NFCADDR_CMD_CMD1_BIT_POS;
-		}
-		if (host->nfc->use_nfc_sram) {
-			/* Enable Data transfer to sram */
-			dataen = NFCADDR_CMD_DATAEN;
-
-			/* Need enable PMECC now, since NFC will transfer
-			 * data in bus after sending nfc read command.
-			 */
-			if (chip->ecc.mode == NAND_ECC_HW && host->has_pmecc)
-				pmecc_enable(host, NAND_ECC_READ);
-		}
-
-		cmd2 = NAND_CMD_READSTART << NFCADDR_CMD_CMD2_BIT_POS;
-		vcmd2 = NFCADDR_CMD_VCMD2;
-		break;
-	/* For prgramming command, the cmd need set to write enable */
-	case NAND_CMD_PAGEPROG:
-	case NAND_CMD_SEQIN:
-	case NAND_CMD_RNDIN:
-		nfcwr = NFCADDR_CMD_NFCWR;
-		if (host->nfc->will_write_sram && command == NAND_CMD_SEQIN)
-			dataen = NFCADDR_CMD_DATAEN;
-		break;
-	default:
-		break;
-	}
-
-	if (do_addr)
-		acycle = nfc_make_addr(mtd, command, column, page_addr,
-				&addr1234, &cycle0);
-
-	nfc_addr_cmd = cmd1 | cmd2 | vcmd2 | acycle | csid | dataen | nfcwr;
-	nfc_send_command(host, nfc_addr_cmd, addr1234, cycle0);
-
-	/*
-	 * Program and erase have their own busy handlers status, sequential
-	 * in, and deplete1 need no delay.
-	 */
-	switch (command) {
-	case NAND_CMD_CACHEDPROG:
-	case NAND_CMD_PAGEPROG:
-	case NAND_CMD_ERASE1:
-	case NAND_CMD_ERASE2:
-	case NAND_CMD_RNDIN:
-	case NAND_CMD_STATUS:
-	case NAND_CMD_RNDOUT:
-	case NAND_CMD_SEQIN:
-	case NAND_CMD_READID:
-		return;
-
-	case NAND_CMD_READ0:
-		if (dataen == NFCADDR_CMD_DATAEN) {
-			host->nfc->data_in_sram = host->nfc->sram_bank0 +
-				nfc_get_sram_off(host);
-			return;
-		}
-		/* fall through */
-	default:
-		nfc_prepare_interrupt(host, NFC_SR_RB_EDGE);
-		nfc_wait_interrupt(host, NFC_SR_RB_EDGE);
-	}
-}
-
-static int nfc_sram_write_page(struct mtd_info *mtd, struct nand_chip *chip,
-			uint32_t offset, int data_len, const uint8_t *buf,
-			int oob_required, int page, int cached, int raw)
-{
-	int cfg, len;
-	int status = 0;
-	struct atmel_nand_host *host = nand_get_controller_data(chip);
-	void *sram = host->nfc->sram_bank0 + nfc_get_sram_off(host);
-
-	/* Subpage write is not supported */
-	if (offset || (data_len < mtd->writesize))
-		return -EINVAL;
-
-	len = mtd->writesize;
-	/* Copy page data to sram that will write to nand via NFC */
-	if (use_dma) {
-		if (atmel_nand_dma_op(mtd, (void *)buf, len, 0) != 0)
-			/* Fall back to use cpu copy */
-			memcpy(sram, buf, len);
-	} else {
-		memcpy(sram, buf, len);
-	}
-
-	cfg = nfc_readl(host->nfc->hsmc_regs, CFG);
-	if (unlikely(raw) && oob_required) {
-		memcpy(sram + len, chip->oob_poi, mtd->oobsize);
-		len += mtd->oobsize;
-		nfc_writel(host->nfc->hsmc_regs, CFG, cfg | NFC_CFG_WSPARE);
-	} else {
-		nfc_writel(host->nfc->hsmc_regs, CFG, cfg & ~NFC_CFG_WSPARE);
-	}
-
-	if (chip->ecc.mode == NAND_ECC_HW && host->has_pmecc)
-		/*
-		 * When use NFC sram, need set up PMECC before send
-		 * NAND_CMD_SEQIN command. Since when the nand command
-		 * is sent, nfc will do transfer from sram and nand.
-		 */
-		pmecc_enable(host, NAND_ECC_WRITE);
-
-	host->nfc->will_write_sram = true;
-	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
-	host->nfc->will_write_sram = false;
-
-	if (likely(!raw))
-		/* Need to write ecc into oob */
-		status = chip->ecc.write_page(mtd, chip, buf, oob_required,
-					      page);
-
-	if (status < 0)
-		return status;
-
-	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
-	status = chip->waitfunc(mtd, chip);
-
-	if ((status & NAND_STATUS_FAIL) && (chip->errstat))
-		status = chip->errstat(mtd, chip, FL_WRITING, status, page);
-
-	if (status & NAND_STATUS_FAIL)
-		return -EIO;
-
-	return 0;
-}
-
-static int nfc_sram_init(struct mtd_info *mtd)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	struct atmel_nand_host *host = nand_get_controller_data(chip);
-	int res = 0;
-
-	/* Initialize the NFC CFG register */
-	unsigned int cfg_nfc = 0;
-
-	/* set page size and oob layout */
-	switch (mtd->writesize) {
-	case 512:
-		cfg_nfc = NFC_CFG_PAGESIZE_512;
-		break;
-	case 1024:
-		cfg_nfc = NFC_CFG_PAGESIZE_1024;
-		break;
-	case 2048:
-		cfg_nfc = NFC_CFG_PAGESIZE_2048;
-		break;
-	case 4096:
-		cfg_nfc = NFC_CFG_PAGESIZE_4096;
-		break;
-	case 8192:
-		cfg_nfc = NFC_CFG_PAGESIZE_8192;
-		break;
-	default:
-		dev_err(host->dev, "Unsupported page size for NFC.\n");
-		res = -ENXIO;
-		return res;
-	}
-
-	/* oob bytes size = (NFCSPARESIZE + 1) * 4
-	 * Max support spare size is 512 bytes. */
-	cfg_nfc |= (((mtd->oobsize / 4) - 1) << NFC_CFG_NFC_SPARESIZE_BIT_POS
-		& NFC_CFG_NFC_SPARESIZE);
-	/* default set a max timeout */
-	cfg_nfc |= NFC_CFG_RSPARE |
-			NFC_CFG_NFC_DTOCYC | NFC_CFG_NFC_DTOMUL;
-
-	nfc_writel(host->nfc->hsmc_regs, CFG, cfg_nfc);
-
-	host->nfc->will_write_sram = false;
-	nfc_set_sram_bank(host, 0);
-
-	/* Use Write page with NFC SRAM only for PMECC or ECC NONE. */
-	if (host->nfc->write_by_sram) {
-		if ((chip->ecc.mode == NAND_ECC_HW && host->has_pmecc) ||
-				chip->ecc.mode == NAND_ECC_NONE)
-			chip->write_page = nfc_sram_write_page;
-		else
-			host->nfc->write_by_sram = false;
-	}
-
-	dev_info(host->dev, "Using NFC Sram read %s\n",
-			host->nfc->write_by_sram ? "and write" : "");
-	return 0;
-}
-
-static struct platform_driver atmel_nand_nfc_driver;
-/*
- * Probe for the NAND device.
- */
-static int atmel_nand_probe(struct platform_device *pdev)
-{
-	struct atmel_nand_host *host;
-	struct mtd_info *mtd;
-	struct nand_chip *nand_chip;
-	struct resource *mem;
-	int res, irq;
-
-	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
-	if (!host)
-		return -ENOMEM;
-
-	res = platform_driver_register(&atmel_nand_nfc_driver);
-	if (res)
-		dev_err(&pdev->dev, "atmel_nand: can't register NFC driver\n");
-
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	host->io_base = devm_ioremap_resource(&pdev->dev, mem);
-	if (IS_ERR(host->io_base)) {
-		res = PTR_ERR(host->io_base);
-		goto err_nand_ioremap;
-	}
-	host->io_phys = (dma_addr_t)mem->start;
-
-	nand_chip = &host->nand_chip;
-	mtd = nand_to_mtd(nand_chip);
-	host->dev = &pdev->dev;
-	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node) {
-		nand_set_flash_node(nand_chip, pdev->dev.of_node);
-		/* Only when CONFIG_OF is enabled of_node can be parsed */
-		res = atmel_of_init_port(host, pdev->dev.of_node);
-		if (res)
-			goto err_nand_ioremap;
-	} else {
-		memcpy(&host->board, dev_get_platdata(&pdev->dev),
-		       sizeof(struct atmel_nand_data));
-		nand_chip->ecc.mode = host->board.ecc_mode;
-
-		/*
-		 * When using software ECC every supported avr32 board means
-		 * Hamming algorithm. If that ever changes we'll need to add
-		 * ecc_algo field to the struct atmel_nand_data.
-		 */
-		if (nand_chip->ecc.mode == NAND_ECC_SOFT)
-			nand_chip->ecc.algo = NAND_ECC_HAMMING;
-
-		/* 16-bit bus width */
-		if (host->board.bus_width_16)
-			nand_chip->options |= NAND_BUSWIDTH_16;
-	}
-
-	 /* link the private data structures */
-	nand_set_controller_data(nand_chip, host);
-	mtd->dev.parent = &pdev->dev;
-
-	/* Set address of NAND IO lines */
-	nand_chip->IO_ADDR_R = host->io_base;
-	nand_chip->IO_ADDR_W = host->io_base;
-
-	if (nand_nfc.is_initialized) {
-		/* NFC driver is probed and initialized */
-		host->nfc = &nand_nfc;
-
-		nand_chip->select_chip = nfc_select_chip;
-		nand_chip->dev_ready = nfc_device_ready;
-		nand_chip->cmdfunc = nfc_nand_command;
-
-		/* Initialize the interrupt for NFC */
-		irq = platform_get_irq(pdev, 0);
-		if (irq < 0) {
-			dev_err(host->dev, "Cannot get HSMC irq!\n");
-			res = irq;
-			goto err_nand_ioremap;
-		}
-
-		res = devm_request_irq(&pdev->dev, irq, hsmc_interrupt,
-				0, "hsmc", host);
-		if (res) {
-			dev_err(&pdev->dev, "Unable to request HSMC irq %d\n",
-				irq);
-			goto err_nand_ioremap;
-		}
-	} else {
-		res = atmel_nand_set_enable_ready_pins(mtd);
-		if (res)
-			goto err_nand_ioremap;
-
-		nand_chip->cmd_ctrl = atmel_nand_cmd_ctrl;
-	}
-
-	nand_chip->chip_delay = 40;		/* 40us command delay time */
-
-
-	nand_chip->read_buf = atmel_read_buf;
-	nand_chip->write_buf = atmel_write_buf;
-
-	platform_set_drvdata(pdev, host);
-	atmel_nand_enable(host);
-
-	if (gpio_is_valid(host->board.det_pin)) {
-		res = devm_gpio_request(&pdev->dev,
-				host->board.det_pin, "nand_det");
-		if (res < 0) {
-			dev_err(&pdev->dev,
-				"can't request det gpio %d\n",
-				host->board.det_pin);
-			goto err_no_card;
-		}
-
-		res = gpio_direction_input(host->board.det_pin);
-		if (res < 0) {
-			dev_err(&pdev->dev,
-				"can't request input direction det gpio %d\n",
-				host->board.det_pin);
-			goto err_no_card;
-		}
-
-		if (gpio_get_value(host->board.det_pin)) {
-			dev_info(&pdev->dev, "No SmartMedia card inserted.\n");
-			res = -ENXIO;
-			goto err_no_card;
-		}
-	}
-
-	if (!host->board.has_dma)
-		use_dma = 0;
-
-	if (use_dma) {
-		dma_cap_mask_t mask;
-
-		dma_cap_zero(mask);
-		dma_cap_set(DMA_MEMCPY, mask);
-		host->dma_chan = dma_request_channel(mask, NULL, NULL);
-		if (!host->dma_chan) {
-			dev_err(host->dev, "Failed to request DMA channel\n");
-			use_dma = 0;
-		}
-	}
-	if (use_dma)
-		dev_info(host->dev, "Using %s for DMA transfers.\n",
-					dma_chan_name(host->dma_chan));
-	else
-		dev_info(host->dev, "No DMA support for NAND access.\n");
-
-	/* first scan to find the device and get the page size */
-	res = nand_scan_ident(mtd, 1, NULL);
-	if (res)
-		goto err_scan_ident;
-
-	if (host->board.on_flash_bbt || on_flash_bbt)
-		nand_chip->bbt_options |= NAND_BBT_USE_FLASH;
-
-	if (nand_chip->bbt_options & NAND_BBT_USE_FLASH)
-		dev_info(&pdev->dev, "Use On Flash BBT\n");
-
-	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node) {
-		res = atmel_of_init_ecc(host, pdev->dev.of_node);
-		if (res)
-			goto err_hw_ecc;
-	}
-
-	if (nand_chip->ecc.mode == NAND_ECC_HW) {
-		if (host->has_pmecc)
-			res = atmel_pmecc_nand_init_params(pdev, host);
-		else
-			res = atmel_hw_nand_init_params(pdev, host);
-
-		if (res != 0)
-			goto err_hw_ecc;
-	}
-
-	/* initialize the nfc configuration register */
-	if (host->nfc && host->nfc->use_nfc_sram) {
-		res = nfc_sram_init(mtd);
-		if (res) {
-			host->nfc->use_nfc_sram = false;
-			dev_err(host->dev, "Disable use nfc sram for data transfer.\n");
-		}
-	}
-
-	/* second phase scan */
-	res = nand_scan_tail(mtd);
-	if (res)
-		goto err_scan_tail;
-
-	mtd->name = "atmel_nand";
-	res = mtd_device_register(mtd, host->board.parts,
-				  host->board.num_parts);
-	if (!res)
-		return res;
-
-err_scan_tail:
-	if (host->has_pmecc && host->nand_chip.ecc.mode == NAND_ECC_HW)
-		pmecc_writel(host->ecc, CTRL, PMECC_CTRL_DISABLE);
-err_hw_ecc:
-err_scan_ident:
-err_no_card:
-	atmel_nand_disable(host);
-	if (host->dma_chan)
-		dma_release_channel(host->dma_chan);
-err_nand_ioremap:
-	return res;
-}
-
-/*
- * Remove a NAND device.
- */
-static int atmel_nand_remove(struct platform_device *pdev)
-{
-	struct atmel_nand_host *host = platform_get_drvdata(pdev);
-	struct mtd_info *mtd = nand_to_mtd(&host->nand_chip);
-
-	nand_release(mtd);
-
-	atmel_nand_disable(host);
-
-	if (host->has_pmecc && host->nand_chip.ecc.mode == NAND_ECC_HW) {
-		pmecc_writel(host->ecc, CTRL, PMECC_CTRL_DISABLE);
-		pmerrloc_writel(host->pmerrloc_base, ELDIS,
-				PMERRLOC_DISABLE);
-	}
-
-	if (host->dma_chan)
-		dma_release_channel(host->dma_chan);
-
-	platform_driver_unregister(&atmel_nand_nfc_driver);
-
-	return 0;
-}
-
-/*
- * AT91RM9200 does not have PMECC or PMECC Errloc peripherals for
- * BCH ECC. Combined with the "atmel,has-pmecc", it is used to describe
- * devices from the SAM9 family that have those.
- */
-static const struct atmel_nand_caps at91rm9200_caps = {
-	.pmecc_correct_erase_page = false,
-	.pmecc_max_correction = 24,
-};
-
-static const struct atmel_nand_caps sama5d4_caps = {
-	.pmecc_correct_erase_page = true,
-	.pmecc_max_correction = 24,
-};
-
-/*
- * The PMECC Errloc controller starting in SAMA5D2 is not compatible,
- * as the increased correction strength requires more registers.
- */
-static const struct atmel_nand_caps sama5d2_caps = {
-	.pmecc_correct_erase_page = true,
-	.pmecc_max_correction = 32,
-};
-
-static const struct of_device_id atmel_nand_dt_ids[] = {
-	{ .compatible = "atmel,at91rm9200-nand", .data = &at91rm9200_caps },
-	{ .compatible = "atmel,sama5d4-nand", .data = &sama5d4_caps },
-	{ .compatible = "atmel,sama5d2-nand", .data = &sama5d2_caps },
-	{ /* sentinel */ }
-};
-
-MODULE_DEVICE_TABLE(of, atmel_nand_dt_ids);
-
-static int atmel_nand_nfc_probe(struct platform_device *pdev)
-{
-	struct atmel_nfc *nfc = &nand_nfc;
-	struct resource *nfc_cmd_regs, *nfc_hsmc_regs, *nfc_sram;
-	int ret;
-
-	nfc_cmd_regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	nfc->base_cmd_regs = devm_ioremap_resource(&pdev->dev, nfc_cmd_regs);
-	if (IS_ERR(nfc->base_cmd_regs))
-		return PTR_ERR(nfc->base_cmd_regs);
-
-	nfc_hsmc_regs = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	nfc->hsmc_regs = devm_ioremap_resource(&pdev->dev, nfc_hsmc_regs);
-	if (IS_ERR(nfc->hsmc_regs))
-		return PTR_ERR(nfc->hsmc_regs);
-
-	nfc_sram = platform_get_resource(pdev, IORESOURCE_MEM, 2);
-	if (nfc_sram) {
-		nfc->sram_bank0 = (void * __force)
-				devm_ioremap_resource(&pdev->dev, nfc_sram);
-		if (IS_ERR(nfc->sram_bank0)) {
-			dev_warn(&pdev->dev, "Fail to ioremap the NFC sram with error: %ld. So disable NFC sram.\n",
-					PTR_ERR(nfc->sram_bank0));
-		} else {
-			nfc->use_nfc_sram = true;
-			nfc->sram_bank0_phys = (dma_addr_t)nfc_sram->start;
-
-			if (pdev->dev.of_node)
-				nfc->write_by_sram = of_property_read_bool(
-						pdev->dev.of_node,
-						"atmel,write-by-sram");
-		}
-	}
-
-	nfc_writel(nfc->hsmc_regs, IDR, 0xffffffff);
-	nfc_readl(nfc->hsmc_regs, SR);	/* clear the NFC_SR */
-
-	nfc->clk = devm_clk_get(&pdev->dev, NULL);
-	if (!IS_ERR(nfc->clk)) {
-		ret = clk_prepare_enable(nfc->clk);
-		if (ret)
-			return ret;
-	} else {
-		dev_warn(&pdev->dev, "NFC clock missing, update your Device Tree");
-	}
-
-	nfc->is_initialized = true;
-	dev_info(&pdev->dev, "NFC is probed.\n");
-
-	return 0;
-}
-
-static int atmel_nand_nfc_remove(struct platform_device *pdev)
-{
-	struct atmel_nfc *nfc = &nand_nfc;
-
-	if (!IS_ERR(nfc->clk))
-		clk_disable_unprepare(nfc->clk);
-
-	return 0;
-}
-
-static const struct of_device_id atmel_nand_nfc_match[] = {
-	{ .compatible = "atmel,sama5d3-nfc" },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, atmel_nand_nfc_match);
-
-static struct platform_driver atmel_nand_nfc_driver = {
-	.driver = {
-		.name = "atmel_nand_nfc",
-		.of_match_table = of_match_ptr(atmel_nand_nfc_match),
-	},
-	.probe = atmel_nand_nfc_probe,
-	.remove = atmel_nand_nfc_remove,
-};
-
-static struct platform_driver atmel_nand_driver = {
-	.probe		= atmel_nand_probe,
-	.remove		= atmel_nand_remove,
-	.driver		= {
-		.name	= "atmel_nand",
-		.of_match_table	= of_match_ptr(atmel_nand_dt_ids),
-	},
-};
-
-module_platform_driver(atmel_nand_driver);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Rick Bronson");
-MODULE_DESCRIPTION("NAND/SmartMedia driver for AT91 / AVR32");
-MODULE_ALIAS("platform:atmel_nand");
diff --git a/drivers/mtd/nand/atmel_nand_ecc.h b/drivers/mtd/nand/atmel_nand_ecc.h
deleted file mode 100644
index 834d694487bd..000000000000
--- a/drivers/mtd/nand/atmel_nand_ecc.h
+++ /dev/null
@@ -1,163 +0,0 @@
-/*
- * Error Corrected Code Controller (ECC) - System peripherals regsters.
- * Based on AT91SAM9260 datasheet revision B.
- *
- * Copyright (C) 2007 Andrew Victor
- * Copyright (C) 2007 - 2012 Atmel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License as published by the
- * Free Software Foundation; either version 2 of the License, or (at your
- * option) any later version.
- */
-
-#ifndef ATMEL_NAND_ECC_H
-#define ATMEL_NAND_ECC_H
-
-#define ATMEL_ECC_CR		0x00			/* Control register */
-#define		ATMEL_ECC_RST		(1 << 0)		/* Reset parity */
-
-#define ATMEL_ECC_MR		0x04			/* Mode register */
-#define		ATMEL_ECC_PAGESIZE	(3 << 0)		/* Page Size */
-#define			ATMEL_ECC_PAGESIZE_528		(0)
-#define			ATMEL_ECC_PAGESIZE_1056		(1)
-#define			ATMEL_ECC_PAGESIZE_2112		(2)
-#define			ATMEL_ECC_PAGESIZE_4224		(3)
-
-#define ATMEL_ECC_SR		0x08			/* Status register */
-#define		ATMEL_ECC_RECERR		(1 << 0)		/* Recoverable Error */
-#define		ATMEL_ECC_ECCERR		(1 << 1)		/* ECC Single Bit Error */
-#define		ATMEL_ECC_MULERR		(1 << 2)		/* Multiple Errors */
-
-#define ATMEL_ECC_PR		0x0c			/* Parity register */
-#define		ATMEL_ECC_BITADDR	(0xf << 0)		/* Bit Error Address */
-#define		ATMEL_ECC_WORDADDR	(0xfff << 4)		/* Word Error Address */
-
-#define ATMEL_ECC_NPR		0x10			/* NParity register */
-#define		ATMEL_ECC_NPARITY	(0xffff << 0)		/* NParity */
-
-/* PMECC Register Definitions */
-#define ATMEL_PMECC_CFG			0x000	/* Configuration Register */
-#define		PMECC_CFG_BCH_ERR2		(0 << 0)
-#define		PMECC_CFG_BCH_ERR4		(1 << 0)
-#define		PMECC_CFG_BCH_ERR8		(2 << 0)
-#define		PMECC_CFG_BCH_ERR12		(3 << 0)
-#define		PMECC_CFG_BCH_ERR24		(4 << 0)
-#define		PMECC_CFG_BCH_ERR32		(5 << 0)
-
-#define		PMECC_CFG_SECTOR512		(0 << 4)
-#define		PMECC_CFG_SECTOR1024		(1 << 4)
-
-#define		PMECC_CFG_PAGE_1SECTOR		(0 << 8)
-#define		PMECC_CFG_PAGE_2SECTORS		(1 << 8)
-#define		PMECC_CFG_PAGE_4SECTORS		(2 << 8)
-#define		PMECC_CFG_PAGE_8SECTORS		(3 << 8)
-
-#define		PMECC_CFG_READ_OP		(0 << 12)
-#define		PMECC_CFG_WRITE_OP		(1 << 12)
-
-#define		PMECC_CFG_SPARE_ENABLE		(1 << 16)
-#define		PMECC_CFG_SPARE_DISABLE		(0 << 16)
-
-#define		PMECC_CFG_AUTO_ENABLE		(1 << 20)
-#define		PMECC_CFG_AUTO_DISABLE		(0 << 20)
-
-#define ATMEL_PMECC_SAREA		0x004	/* Spare area size */
-#define ATMEL_PMECC_SADDR		0x008	/* PMECC starting address */
-#define ATMEL_PMECC_EADDR		0x00c	/* PMECC ending address */
-#define ATMEL_PMECC_CLK			0x010	/* PMECC clock control */
-#define		PMECC_CLK_133MHZ		(2 << 0)
-
-#define ATMEL_PMECC_CTRL		0x014	/* PMECC control register */
-#define		PMECC_CTRL_RST			(1 << 0)
-#define		PMECC_CTRL_DATA			(1 << 1)
-#define		PMECC_CTRL_USER			(1 << 2)
-#define		PMECC_CTRL_ENABLE		(1 << 4)
-#define		PMECC_CTRL_DISABLE		(1 << 5)
-
-#define ATMEL_PMECC_SR			0x018	/* PMECC status register */
-#define		PMECC_SR_BUSY			(1 << 0)
-#define		PMECC_SR_ENABLE			(1 << 4)
-
-#define ATMEL_PMECC_IER			0x01c	/* PMECC interrupt enable */
-#define		PMECC_IER_ENABLE		(1 << 0)
-#define ATMEL_PMECC_IDR			0x020	/* PMECC interrupt disable */
-#define		PMECC_IER_DISABLE		(1 << 0)
-#define ATMEL_PMECC_IMR			0x024	/* PMECC interrupt mask */
-#define		PMECC_IER_MASK			(1 << 0)
-#define ATMEL_PMECC_ISR			0x028	/* PMECC interrupt status */
-#define ATMEL_PMECC_ECCx		0x040	/* PMECC ECC x */
-#define ATMEL_PMECC_REMx		0x240	/* PMECC REM x */
-
-/* PMERRLOC Register Definitions */
-#define ATMEL_PMERRLOC_ELCFG		0x000	/* Error location config */
-#define		PMERRLOC_ELCFG_SECTOR_512	(0 << 0)
-#define		PMERRLOC_ELCFG_SECTOR_1024	(1 << 0)
-#define		PMERRLOC_ELCFG_NUM_ERRORS(n)	((n) << 16)
-
-#define ATMEL_PMERRLOC_ELPRIM		0x004	/* Error location primitive */
-#define ATMEL_PMERRLOC_ELEN		0x008	/* Error location enable */
-#define ATMEL_PMERRLOC_ELDIS		0x00c	/* Error location disable */
-#define		PMERRLOC_DISABLE		(1 << 0)
-
-#define ATMEL_PMERRLOC_ELSR		0x010	/* Error location status */
-#define		PMERRLOC_ELSR_BUSY		(1 << 0)
-#define ATMEL_PMERRLOC_ELIER		0x014	/* Error location int enable */
-#define ATMEL_PMERRLOC_ELIDR		0x018	/* Error location int disable */
-#define ATMEL_PMERRLOC_ELIMR		0x01c	/* Error location int mask */
-#define ATMEL_PMERRLOC_ELISR		0x020	/* Error location int status */
-#define		PMERRLOC_ERR_NUM_MASK		(0x1f << 8)
-#define		PMERRLOC_CALC_DONE		(1 << 0)
-#define ATMEL_PMERRLOC_SIGMAx		0x028	/* Error location SIGMA x */
-
-/*
- * The ATMEL_PMERRLOC_ELx register location depends from the number of
- * bits corrected by the PMECC controller. Do not use it.
- */
-
-/* Register access macros for PMECC */
-#define pmecc_readl_relaxed(addr, reg) \
-	readl_relaxed((addr) + ATMEL_PMECC_##reg)
-
-#define pmecc_writel(addr, reg, value) \
-	writel((value), (addr) + ATMEL_PMECC_##reg)
-
-#define pmecc_readb_ecc_relaxed(addr, sector, n) \
-	readb_relaxed((addr) + ATMEL_PMECC_ECCx + ((sector) * 0x40) + (n))
-
-#define pmecc_readl_rem_relaxed(addr, sector, n) \
-	readl_relaxed((addr) + ATMEL_PMECC_REMx + ((sector) * 0x40) + ((n) * 4))
-
-#define pmerrloc_readl_relaxed(addr, reg) \
-	readl_relaxed((addr) + ATMEL_PMERRLOC_##reg)
-
-#define pmerrloc_writel(addr, reg, value) \
-	writel((value), (addr) + ATMEL_PMERRLOC_##reg)
-
-#define pmerrloc_writel_sigma_relaxed(addr, n, value) \
-	writel_relaxed((value), (addr) + ATMEL_PMERRLOC_SIGMAx + ((n) * 4))
-
-#define pmerrloc_readl_sigma_relaxed(addr, n) \
-	readl_relaxed((addr) + ATMEL_PMERRLOC_SIGMAx + ((n) * 4))
-
-#define pmerrloc_readl_el_relaxed(addr, n) \
-	readl_relaxed((addr) + ((n) * 4))
-
-/* Galois field dimension */
-#define PMECC_GF_DIMENSION_13			13
-#define PMECC_GF_DIMENSION_14			14
-
-/* Primitive Polynomial used by PMECC */
-#define PMECC_GF_13_PRIMITIVE_POLY		0x201b
-#define PMECC_GF_14_PRIMITIVE_POLY		0x4443
-
-#define PMECC_LOOKUP_TABLE_SIZE_512		0x2000
-#define PMECC_LOOKUP_TABLE_SIZE_1024		0x4000
-
-/* Time out value for reading PMECC status register */
-#define PMECC_MAX_TIMEOUT_MS			100
-
-/* Reserved bytes in oob area */
-#define PMECC_OOB_RESERVED_BYTES		2
-
-#endif
diff --git a/drivers/mtd/nand/atmel_nand_nfc.h b/drivers/mtd/nand/atmel_nand_nfc.h
deleted file mode 100644
index 4d5d26221a7e..000000000000
--- a/drivers/mtd/nand/atmel_nand_nfc.h
+++ /dev/null
@@ -1,103 +0,0 @@
-/*
- * Atmel Nand Flash Controller (NFC) - System peripherals regsters.
- * Based on SAMA5D3 datasheet.
- *
- * © Copyright 2013 Atmel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License as published by the
- * Free Software Foundation; either version 2 of the License, or (at your
- * option) any later version.
- */
-
-#ifndef ATMEL_NAND_NFC_H
-#define ATMEL_NAND_NFC_H
-
-/*
- * HSMC NFC registers
- */
-#define ATMEL_HSMC_NFC_CFG	0x00		/* NFC Configuration Register */
-#define		NFC_CFG_PAGESIZE	(7 << 0)
-#define			NFC_CFG_PAGESIZE_512	(0 << 0)
-#define			NFC_CFG_PAGESIZE_1024	(1 << 0)
-#define			NFC_CFG_PAGESIZE_2048	(2 << 0)
-#define			NFC_CFG_PAGESIZE_4096	(3 << 0)
-#define			NFC_CFG_PAGESIZE_8192	(4 << 0)
-#define		NFC_CFG_WSPARE		(1 << 8)
-#define		NFC_CFG_RSPARE		(1 << 9)
-#define		NFC_CFG_NFC_DTOCYC	(0xf << 16)
-#define		NFC_CFG_NFC_DTOMUL	(0x7 << 20)
-#define		NFC_CFG_NFC_SPARESIZE	(0x7f << 24)
-#define		NFC_CFG_NFC_SPARESIZE_BIT_POS	24
-
-#define ATMEL_HSMC_NFC_CTRL	0x04		/* NFC Control Register */
-#define		NFC_CTRL_ENABLE		(1 << 0)
-#define		NFC_CTRL_DISABLE	(1 << 1)
-
-#define ATMEL_HSMC_NFC_SR	0x08		/* NFC Status Register */
-#define		NFC_SR_BUSY		(1 << 8)
-#define		NFC_SR_XFR_DONE		(1 << 16)
-#define		NFC_SR_CMD_DONE		(1 << 17)
-#define		NFC_SR_DTOE		(1 << 20)
-#define		NFC_SR_UNDEF		(1 << 21)
-#define		NFC_SR_AWB		(1 << 22)
-#define		NFC_SR_ASE		(1 << 23)
-#define		NFC_SR_RB_EDGE		(1 << 24)
-
-#define ATMEL_HSMC_NFC_IER	0x0c
-#define ATMEL_HSMC_NFC_IDR	0x10
-#define ATMEL_HSMC_NFC_IMR	0x14
-#define ATMEL_HSMC_NFC_CYCLE0	0x18		/* NFC Address Cycle Zero */
-#define		ATMEL_HSMC_NFC_ADDR_CYCLE0	(0xff)
-
-#define ATMEL_HSMC_NFC_BANK	0x1c		/* NFC Bank Register */
-#define		ATMEL_HSMC_NFC_BANK0		(0 << 0)
-#define		ATMEL_HSMC_NFC_BANK1		(1 << 0)
-
-#define nfc_writel(addr, reg, value) \
-	writel((value), (addr) + ATMEL_HSMC_NFC_##reg)
-
-#define nfc_readl(addr, reg) \
-	readl_relaxed((addr) + ATMEL_HSMC_NFC_##reg)
-
-/*
- * NFC Address Command definitions
- */
-#define NFCADDR_CMD_CMD1	(0xff << 2)	/* Command for Cycle 1 */
-#define NFCADDR_CMD_CMD1_BIT_POS	2
-#define NFCADDR_CMD_CMD2	(0xff << 10)	/* Command for Cycle 2 */
-#define NFCADDR_CMD_CMD2_BIT_POS	10
-#define NFCADDR_CMD_VCMD2	(0x1 << 18)	/* Valid Cycle 2 Command */
-#define NFCADDR_CMD_ACYCLE	(0x7 << 19)	/* Number of Address required */
-#define		NFCADDR_CMD_ACYCLE_NONE		(0x0 << 19)
-#define		NFCADDR_CMD_ACYCLE_1		(0x1 << 19)
-#define		NFCADDR_CMD_ACYCLE_2		(0x2 << 19)
-#define		NFCADDR_CMD_ACYCLE_3		(0x3 << 19)
-#define		NFCADDR_CMD_ACYCLE_4		(0x4 << 19)
-#define		NFCADDR_CMD_ACYCLE_5		(0x5 << 19)
-#define NFCADDR_CMD_ACYCLE_BIT_POS	19
-#define NFCADDR_CMD_CSID	(0x7 << 22)	/* Chip Select Identifier */
-#define		NFCADDR_CMD_CSID_0		(0x0 << 22)
-#define		NFCADDR_CMD_CSID_1		(0x1 << 22)
-#define		NFCADDR_CMD_CSID_2		(0x2 << 22)
-#define		NFCADDR_CMD_CSID_3		(0x3 << 22)
-#define		NFCADDR_CMD_CSID_4		(0x4 << 22)
-#define		NFCADDR_CMD_CSID_5		(0x5 << 22)
-#define		NFCADDR_CMD_CSID_6		(0x6 << 22)
-#define		NFCADDR_CMD_CSID_7		(0x7 << 22)
-#define NFCADDR_CMD_DATAEN	(0x1 << 25)	/* Data Transfer Enable */
-#define NFCADDR_CMD_DATADIS	(0x0 << 25)	/* Data Transfer Disable */
-#define NFCADDR_CMD_NFCRD	(0x0 << 26)	/* NFC Read Enable */
-#define NFCADDR_CMD_NFCWR	(0x1 << 26)	/* NFC Write Enable */
-#define NFCADDR_CMD_NFCBUSY	(0x1 << 27)	/* NFC Busy */
-
-#define nfc_cmd_addr1234_writel(cmd, addr1234, nfc_base) \
-	writel((addr1234), (cmd) + nfc_base)
-
-#define nfc_cmd_readl(bitstatus, nfc_base) \
-	readl_relaxed((bitstatus) + nfc_base)
-
-#define NFC_TIME_OUT_MS		100
-#define	NFC_SRAM_BANK1_OFFSET	0x1200
-
-#endif
-- 
2.7.4

