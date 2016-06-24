From: Han Xu <han.xu@nxp.com>
Subject: [PATCH v3 1/6] mtd: nand: gpmi: add GPMI NAND support for i.MX7D
Date: Fri, 24 Jun 2016 16:40:06 -0500
Message-ID: <1466804411-19874-2-git-send-email-han.xu@nxp.com>
References: <1466804411-19874-1-git-send-email-han.xu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466804411-19874-1-git-send-email-han.xu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: han.xu@nxp.com, boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

support GPMI NAND on i.MX7D

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 drivers/mtd/nand/gpmi-nand/bch-regs.h  | 14 +++++++-------
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  | 10 ++++++----
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 30 ++++++++++++++++++++++++------
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  7 +++++--
 4 files changed, 42 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpmi-nand/bch-regs.h
index 05bb91f..228142c 100644
--- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
+++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h
@@ -1,7 +1,7 @@
 /*
  * Freescale GPMI NAND Flash Driver
  *
- * Copyright 2008-2011 Freescale Semiconductor, Inc.
+ * Copyright 2008-2016 Freescale Semiconductor, Inc.
  * Copyright 2008 Embedded Alley Solutions, Inc.
  *
  * This program is free software; you can redistribute it and/or modify
@@ -54,7 +54,7 @@
 #define MX6Q_BP_BCH_FLASH0LAYOUT0_ECC0		11
 #define MX6Q_BM_BCH_FLASH0LAYOUT0_ECC0	(0x1f << MX6Q_BP_BCH_FLASH0LAYOUT0_ECC0)
 #define BF_BCH_FLASH0LAYOUT0_ECC0(v, x)				\
-	(GPMI_IS_MX6(x)					\
+	((GPMI_IS_MX6(x) || GPMI_IS_MX7(x))				\
 		? (((v) << MX6Q_BP_BCH_FLASH0LAYOUT0_ECC0)	\
 			& MX6Q_BM_BCH_FLASH0LAYOUT0_ECC0)	\
 		: (((v) << BP_BCH_FLASH0LAYOUT0_ECC0)		\
@@ -65,7 +65,7 @@
 #define MX6Q_BM_BCH_FLASH0LAYOUT0_GF_13_14			\
 				(0x1 << MX6Q_BP_BCH_FLASH0LAYOUT0_GF_13_14)
 #define BF_BCH_FLASH0LAYOUT0_GF(v, x)				\
-	((GPMI_IS_MX6(x) && ((v) == 14))			\
+	(((GPMI_IS_MX6(x) || GPMI_IS_MX7(x)) && ((v) == 14))	\
 		? (((1) << MX6Q_BP_BCH_FLASH0LAYOUT0_GF_13_14)	\
 			& MX6Q_BM_BCH_FLASH0LAYOUT0_GF_13_14)	\
 		: 0						\
@@ -77,7 +77,7 @@
 #define MX6Q_BM_BCH_FLASH0LAYOUT0_DATA0_SIZE	\
 			(0x3ff << BP_BCH_FLASH0LAYOUT0_DATA0_SIZE)
 #define BF_BCH_FLASH0LAYOUT0_DATA0_SIZE(v, x)				\
-	(GPMI_IS_MX6(x)						\
+	((GPMI_IS_MX6(x) || GPMI_IS_MX7(x))	\
 		? (((v) >> 2) & MX6Q_BM_BCH_FLASH0LAYOUT0_DATA0_SIZE)	\
 		: ((v) & BM_BCH_FLASH0LAYOUT0_DATA0_SIZE)		\
 	)
@@ -96,7 +96,7 @@
 #define MX6Q_BP_BCH_FLASH0LAYOUT1_ECCN		11
 #define MX6Q_BM_BCH_FLASH0LAYOUT1_ECCN	(0x1f << MX6Q_BP_BCH_FLASH0LAYOUT1_ECCN)
 #define BF_BCH_FLASH0LAYOUT1_ECCN(v, x)				\
-	(GPMI_IS_MX6(x)					\
+	((GPMI_IS_MX6(x) || GPMI_IS_MX7(x))				\
 		? (((v) << MX6Q_BP_BCH_FLASH0LAYOUT1_ECCN)	\
 			& MX6Q_BM_BCH_FLASH0LAYOUT1_ECCN)	\
 		: (((v) << BP_BCH_FLASH0LAYOUT1_ECCN)		\
@@ -107,7 +107,7 @@
 #define MX6Q_BM_BCH_FLASH0LAYOUT1_GF_13_14			\
 				(0x1 << MX6Q_BP_BCH_FLASH0LAYOUT1_GF_13_14)
 #define BF_BCH_FLASH0LAYOUT1_GF(v, x)				\
-	((GPMI_IS_MX6(x) && ((v) == 14))			\
+	(((GPMI_IS_MX6(x) || GPMI_IS_MX7(x)) && ((v) == 14))	\
 		? (((1) << MX6Q_BP_BCH_FLASH0LAYOUT1_GF_13_14)	\
 			& MX6Q_BM_BCH_FLASH0LAYOUT1_GF_13_14)	\
 		: 0						\
@@ -119,7 +119,7 @@
 #define MX6Q_BM_BCH_FLASH0LAYOUT1_DATAN_SIZE	\
 			(0x3ff << BP_BCH_FLASH0LAYOUT1_DATAN_SIZE)
 #define BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(v, x)				\
-	(GPMI_IS_MX6(x)						\
+	((GPMI_IS_MX6(x) || GPMI_IS_MX7(x))	\
 		? (((v) >> 2) & MX6Q_BM_BCH_FLASH0LAYOUT1_DATAN_SIZE)	\
 		: ((v) & BM_BCH_FLASH0LAYOUT1_DATAN_SIZE)		\
 	)
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index 0f68a99..358ff5d 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -1,7 +1,7 @@
 /*
  * Freescale GPMI NAND Flash Driver
  *
- * Copyright (C) 2008-2011 Freescale Semiconductor, Inc.
+ * Copyright (C) 2008-2016 Freescale Semiconductor, Inc.
  * Copyright (C) 2008 Embedded Alley Solutions, Inc.
  *
  * This program is free software; you can redistribute it and/or modify
@@ -971,7 +971,8 @@ int gpmi_extra_init(struct gpmi_nand_data *this)
 	struct nand_chip *chip = &this->nand;
 
 	/* Enable the asynchronous EDO feature. */
-	if (GPMI_IS_MX6(this) && chip->onfi_version) {
+	if ((GPMI_IS_MX6(this) || GPMI_IS_MX7(this)) &&
+	    chip->onfi_version) {
 		int mode = onfi_get_async_timing_mode(chip);
 
 		/* We only support the timing mode 4 and mode 5. */
@@ -1093,12 +1094,13 @@ int gpmi_is_ready(struct gpmi_nand_data *this, unsigned chip)
 	if (GPMI_IS_MX23(this)) {
 		mask = MX23_BM_GPMI_DEBUG_READY0 << chip;
 		reg = readl(r->gpmi_regs + HW_GPMI_DEBUG);
-	} else if (GPMI_IS_MX28(this) || GPMI_IS_MX6(this)) {
+	} else if (GPMI_IS_MX28(this) || GPMI_IS_MX6(this) ||
+	           GPMI_IS_MX7(this)) {
 		/*
 		 * In the imx6, all the ready/busy pins are bound
 		 * together. So we only need to check chip 0.
 		 */
-		if (GPMI_IS_MX6(this))
+		if (GPMI_IS_MX6(this) || GPMI_IS_MX7(this))
 			chip = 0;
 
 		/* MX28 shares the same R/B register as MX6Q. */
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 6e46156..a8936fd 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1,7 +1,7 @@
 /*
  * Freescale GPMI NAND Flash Driver
  *
- * Copyright (C) 2010-2015 Freescale Semiconductor, Inc.
+ * Copyright (C) 2010-2016 Freescale Semiconductor, Inc.
  * Copyright (C) 2008 Embedded Alley Solutions, Inc.
  *
  * This program is free software; you can redistribute it and/or modify
@@ -110,6 +110,12 @@ static const struct gpmi_devdata gpmi_devdata_imx6sx = {
 	.max_chain_delay = 12,
 };
 
+static const struct gpmi_devdata gpmi_devdata_imx7d = {
+	.type = IS_MX7D,
+	.bch_max_ecc_strength = 62,
+	.max_chain_delay = 12,
+};
+
 static irqreturn_t bch_irq(int irq, void *cookie)
 {
 	struct gpmi_nand_data *this = cookie;
@@ -601,6 +607,10 @@ static char *extra_clks_for_mx6q[GPMI_CLK_MAX] = {
 	"gpmi_apb", "gpmi_bch", "gpmi_bch_apb", "per1_bch",
 };
 
+static char *extra_clks_for_mx7d[GPMI_CLK_MAX] = {
+	"gpmi_bch_apb",
+};
+
 static int gpmi_get_clks(struct gpmi_nand_data *this)
 {
 	struct resources *r = &this->resources;
@@ -618,6 +628,8 @@ static int gpmi_get_clks(struct gpmi_nand_data *this)
 	/* Get extra clocks */
 	if (GPMI_IS_MX6(this))
 		extra_clks = extra_clks_for_mx6q;
+	if (GPMI_IS_MX7(this))
+		extra_clks = extra_clks_for_mx7d;
 	if (!extra_clks)
 		return 0;
 
@@ -634,7 +646,7 @@ static int gpmi_get_clks(struct gpmi_nand_data *this)
 		r->clock[i] = clk;
 	}
 
-	if (GPMI_IS_MX6(this))
+	if (GPMI_IS_MX6(this) || GPMI_IS_MX7(this))
 		/*
 		 * Set the default value for the gpmi clock.
 		 *
@@ -1965,8 +1977,8 @@ static int gpmi_init_last(struct gpmi_nand_data *this)
 	 *  (1) the chip is imx6, and
 	 *  (2) the size of the ECC parity is byte aligned.
 	 */
-	if (GPMI_IS_MX6(this) &&
-		((bch_geo->gf_len * bch_geo->ecc_strength) % 8) == 0) {
+	if ((GPMI_IS_MX6(this) || GPMI_IS_MX7(this)) &&
+	    ((bch_geo->gf_len * bch_geo->ecc_strength) % 8) == 0) {
 		ecc->read_subpage = gpmi_ecc_read_subpage;
 		chip->options |= NAND_SUBPAGE_READ;
 	}
@@ -1987,6 +1999,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	struct nand_chip *chip = &this->nand;
 	struct mtd_info  *mtd = nand_to_mtd(chip);
 	int ret;
+	int max_chips;
 
 	/* init current chip */
 	this->current_chip	= -1;
@@ -2021,7 +2034,8 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_out;
 
-	ret = nand_scan_ident(mtd, GPMI_IS_MX6(this) ? 2 : 1, NULL);
+	max_chips = (GPMI_IS_MX6(this) || GPMI_IS_MX7(this)) ? 2 : 1;
+	ret = nand_scan_ident(mtd, max_chips, NULL);
 	if (ret)
 		goto err_out;
 
@@ -2074,7 +2088,11 @@ static const struct of_device_id gpmi_nand_id_table[] = {
 	}, {
 		.compatible = "fsl,imx6sx-gpmi-nand",
 		.data = &gpmi_devdata_imx6sx,
-	}, {}
+	}, {
+		.compatible = "fsl,imx7d-gpmi-nand",
+		.data = &gpmi_devdata_imx7d,
+	}, { /* sentinel */ }
+
 };
 MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
 
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
index 4e49a1f..04a3584 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
@@ -1,7 +1,7 @@
 /*
  * Freescale GPMI NAND Flash Driver
  *
- * Copyright (C) 2010-2011 Freescale Semiconductor, Inc.
+ * Copyright (C) 2010-2016 Freescale Semiconductor, Inc.
  * Copyright (C) 2008 Embedded Alley Solutions, Inc.
  *
  * This program is free software; you can redistribute it and/or modify
@@ -123,7 +123,8 @@ enum gpmi_type {
 	IS_MX23,
 	IS_MX28,
 	IS_MX6Q,
-	IS_MX6SX
+	IS_MX6SX,
+	IS_MX7D,
 };
 
 struct gpmi_devdata {
@@ -305,6 +306,8 @@ void gpmi_copy_bits(u8 *dst, size_t dst_bit_off,
 #define GPMI_IS_MX28(x)		((x)->devdata->type == IS_MX28)
 #define GPMI_IS_MX6Q(x)		((x)->devdata->type == IS_MX6Q)
 #define GPMI_IS_MX6SX(x)	((x)->devdata->type == IS_MX6SX)
+#define GPMI_IS_MX7D(x)		((x)->devdata->type == IS_MX7D)
 
 #define GPMI_IS_MX6(x)		(GPMI_IS_MX6Q(x) || GPMI_IS_MX6SX(x))
+#define GPMI_IS_MX7(x)		(GPMI_IS_MX7D(x))
 #endif
-- 
1.9.1
