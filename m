Return-Path: <SRS0=VnZl=7Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07026C433E4
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 17:58:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED0C42068D
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 17:58:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgFCR6o (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 13:58:44 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:44241 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbgFCR6o (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jun 2020 13:58:44 -0400
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id E1EBE24000E;
        Wed,  3 Jun 2020 17:58:40 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Mason Yang <masonccyang@mxic.com.tw>,
        Julien Su <juliensu@mxic.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v10 20/20] mtd: rawnand: Use the NAND framework user_conf object for ECC flags
Date:   Wed,  3 Jun 2020 19:57:59 +0200
Message-Id: <20200603175759.19948-21-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200603175759.19948-1-miquel.raynal@bootlin.com>
References: <20200603175759.19948-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Instead of storing the ECC flags in chip->ecc.options, use
nanddev->ecc.user_conf.flags.

There is currently only one to save: NAND_ECC_MAXIMIZE.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c |  3 ++-
 drivers/mtd/nand/raw/denali_pci.c            |  2 +-
 drivers/mtd/nand/raw/nand_base.c             | 14 +++++++-------
 drivers/mtd/nand/raw/sunxi_nand.c            |  3 ++-
 drivers/mtd/nand/raw/tegra_nand.c            |  5 +++--
 include/linux/mtd/rawnand.h                  |  1 -
 6 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 08df7f23b859..a594f5efb0a2 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1046,6 +1046,7 @@ static int atmel_nand_pmecc_init(struct nand_chip *chip)
 	const struct nand_ecc_props *requirements =
 		nanddev_get_ecc_requirements(&chip->base);
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct nand_device *nanddev = mtd_to_nanddev(mtd);
 	struct atmel_nand *nand = to_atmel_nand(chip);
 	struct atmel_nand_controller *nc;
 	struct atmel_pmecc_user_req req;
@@ -1070,7 +1071,7 @@ static int atmel_nand_pmecc_init(struct nand_chip *chip)
 			chip->ecc.size = val;
 	}
 
-	if (chip->ecc.options & NAND_ECC_MAXIMIZE)
+	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH)
 		req.ecc.strength = ATMEL_PMECC_MAXIMIZE_ECC_STRENGTH;
 	else if (chip->ecc.strength)
 		req.ecc.strength = chip->ecc.strength;
diff --git a/drivers/mtd/nand/raw/denali_pci.c b/drivers/mtd/nand/raw/denali_pci.c
index 2f77ee55e1bf..20c085a30adc 100644
--- a/drivers/mtd/nand/raw/denali_pci.c
+++ b/drivers/mtd/nand/raw/denali_pci.c
@@ -100,7 +100,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		goto out_remove_denali;
 	}
 
-	dchip->chip.ecc.options |= NAND_ECC_MAXIMIZE;
+	dchip->chip.base.ecc.user_conf.flags |= NAND_ECC_MAXIMIZE_STRENGTH;
 
 	dchip->nsels = nsels;
 
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 53e07f25ae65..c0d13f3b308a 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4989,9 +4989,6 @@ static int rawnand_dt_init(struct nand_chip *chip)
 	if (of_get_nand_on_flash_bbt(dn))
 		chip->bbt_options |= NAND_BBT_USE_FLASH;
 
-	if (of_property_read_bool(dn, "nand-ecc-maximize"))
-		chip->ecc.options |= NAND_ECC_MAXIMIZE;
-
 	of_get_nand_ecc_user_config(nand);
 	of_get_nand_ecc_legacy_user_config(chip);
 
@@ -5122,6 +5119,7 @@ static void nand_scan_ident_cleanup(struct nand_chip *chip)
 static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct nand_device *nanddev = mtd_to_nanddev(mtd);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 
 	if (WARN_ON(ecc->engine_type != NAND_ECC_ENGINE_TYPE_SOFT))
@@ -5197,7 +5195,7 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 		 * used.
 		 */
 		if (mtd->ooblayout == nand_get_large_page_ooblayout() &&
-		    ecc->options & NAND_ECC_MAXIMIZE) {
+		    nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
 			int steps, bytes;
 
 			/* Always prefer 1k blocks over 512bytes ones */
@@ -5437,11 +5435,12 @@ nand_maximize_ecc(struct nand_chip *chip,
  * @caps: ECC engine caps info structure
  * @oobavail: OOB size that the ECC engine can use
  *
- * Choose the ECC configuration according to following logic
+ * Choose the ECC configuration according to following logic.
  *
  * 1. If both ECC step size and ECC strength are already set (usually by DT)
  *    then check if it is supported by this controller.
- * 2. If NAND_ECC_MAXIMIZE is set, then select maximum ECC strength.
+ * 2. If the user provided the nand-ecc-maximize property, then select maximum
+ *    ECC strength.
  * 3. Otherwise, try to match the ECC step size and ECC strength closest
  *    to the chip's requirement. If available OOB size can't fit the chip
  *    requirement then fallback to the maximum ECC step size and ECC strength.
@@ -5452,6 +5451,7 @@ int nand_ecc_choose_conf(struct nand_chip *chip,
 			 const struct nand_ecc_caps *caps, int oobavail)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct nand_device *nanddev = mtd_to_nanddev(mtd);
 
 	if (WARN_ON(oobavail < 0 || oobavail > mtd->oobsize))
 		return -EINVAL;
@@ -5459,7 +5459,7 @@ int nand_ecc_choose_conf(struct nand_chip *chip,
 	if (chip->ecc.size && chip->ecc.strength)
 		return nand_check_ecc_caps(chip, caps, oobavail);
 
-	if (chip->ecc.options & NAND_ECC_MAXIMIZE)
+	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH)
 		return nand_maximize_ecc(chip, caps, oobavail);
 
 	if (!nand_match_ecc_req(chip, caps, oobavail))
diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 490ba485e939..cbd05cea5bad 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1609,12 +1609,13 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	static const u8 strengths[] = { 16, 24, 28, 32, 40, 48, 56, 60, 64 };
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
+	struct nand_device *nanddev = mtd_to_nanddev(mtd);
 	struct sunxi_nand_hw_ecc *data;
 	int nsectors;
 	int ret;
 	int i;
 
-	if (ecc->options & NAND_ECC_MAXIMIZE) {
+	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
 		int bytes;
 
 		ecc->size = 1024;
diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index fecdb7e8f9e8..5c94ecbf496f 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -840,9 +840,10 @@ static int tegra_nand_get_strength(struct nand_chip *chip, const int *strength,
 				   int strength_len, int bits_per_step,
 				   int oobsize)
 {
+	struct nand_device *base = mtd_to_nanddev(nand_to_mtd(chip));
 	const struct nand_ecc_props *requirements =
-		nanddev_get_ecc_requirements(&chip->base);
-	bool maximize = chip->ecc.options & NAND_ECC_MAXIMIZE;
+		nanddev_get_ecc_requirements(base);
+	bool maximize = base->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH;
 	int i;
 
 	/*
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 66f69a1d27a5..9d69fa6608ae 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -98,7 +98,6 @@ struct nand_chip;
  * pages and you want to rely on the default implementation.
  */
 #define NAND_ECC_GENERIC_ERASED_CHECK	BIT(0)
-#define NAND_ECC_MAXIMIZE		BIT(1)
 
 /*
  * Option constants for bizarre disfunctionality and real
-- 
2.20.1

