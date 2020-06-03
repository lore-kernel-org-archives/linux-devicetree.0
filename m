Return-Path: <SRS0=VnZl=7Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1181C433E3
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 17:58:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDC94206A2
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 17:58:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgFCR6n (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 13:58:43 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:38191 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgFCR6n (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jun 2020 13:58:43 -0400
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 110A124000D;
        Wed,  3 Jun 2020 17:58:38 +0000 (UTC)
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
Subject: [PATCH v10 19/20] mtd: rawnand: Use the ECC framework user input parsing bits
Date:   Wed,  3 Jun 2020 19:57:58 +0200
Message-Id: <20200603175759.19948-20-miquel.raynal@bootlin.com>
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

Many helpers are generic to all NAND chips, they should not be
raw-NAND specific, so use the generic ones.

To avoid moving all the raw NAND core "history" into the generic NAND
layer, we keep a part of this parsing in the raw NAND core to ensure
backward compatibility.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 144 +++++++++++++++----------------
 include/linux/mtd/rawnand.h      |  12 ---
 2 files changed, 71 insertions(+), 85 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c69d60f791d0..53e07f25ae65 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4854,18 +4854,27 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 	return ret;
 }
 
-static const char * const nand_ecc_modes[] = {
-	[NAND_ECC_NONE]		= "none",
-	[NAND_ECC_SOFT]		= "soft",
-	[NAND_ECC_HW]		= "hw",
-	[NAND_ECC_HW_SYNDROME]	= "hw_syndrome",
-	[NAND_ECC_ON_DIE]	= "on-die",
-};
-
 static enum nand_ecc_engine_type
-of_get_nand_ecc_engine_type(struct device_node *np)
+of_get_rawnand_ecc_engine_type_legacy(struct device_node *np)
 {
-	enum nand_ecc_mode eng_type;
+	enum nand_ecc_legacy_mode {
+		NAND_ECC_INVALID,
+		NAND_ECC_NONE,
+		NAND_ECC_SOFT,
+		NAND_ECC_SOFT_BCH,
+		NAND_ECC_HW,
+		NAND_ECC_HW_SYNDROME,
+		NAND_ECC_ON_DIE,
+	};
+	const char * const nand_ecc_legacy_modes[] = {
+		[NAND_ECC_NONE]		= "none",
+		[NAND_ECC_SOFT]		= "soft",
+		[NAND_ECC_SOFT_BCH]	= "soft_bch",
+		[NAND_ECC_HW]		= "hw",
+		[NAND_ECC_HW_SYNDROME]	= "hw_syndrome",
+		[NAND_ECC_ON_DIE]	= "on-die",
+	};
+	enum nand_ecc_legacy_mode eng_type;
 	const char *pm;
 	int err;
 
@@ -4874,12 +4883,13 @@ of_get_nand_ecc_engine_type(struct device_node *np)
 		return NAND_ECC_ENGINE_TYPE_INVALID;
 
 	for (eng_type = NAND_ECC_NONE;
-	     eng_type < ARRAY_SIZE(nand_ecc_modes); eng_type++) {
-		if (!strcasecmp(pm, nand_ecc_modes[eng_type])) {
+	     eng_type < ARRAY_SIZE(nand_ecc_legacy_modes); eng_type++) {
+		if (!strcasecmp(pm, nand_ecc_legacy_modes[eng_type])) {
 			switch (eng_type) {
 			case NAND_ECC_NONE:
 				return NAND_ECC_ENGINE_TYPE_NONE;
 			case NAND_ECC_SOFT:
+			case NAND_ECC_SOFT_BCH:
 				return NAND_ECC_ENGINE_TYPE_SOFT;
 			case NAND_ECC_HW:
 			case NAND_ECC_HW_SYNDROME:
@@ -4892,43 +4902,29 @@ of_get_nand_ecc_engine_type(struct device_node *np)
 		}
 	}
 
-	/*
-	 * For backward compatibility we support few obsoleted values that don't
-	 * have their mappings into the nand_ecc_engine_providers enum anymore
-	 * (they were merged with other enums).
-	 */
-	if (!strcasecmp(pm, "soft_bch"))
-		return NAND_ECC_ENGINE_TYPE_SOFT;
-
 	return NAND_ECC_ENGINE_TYPE_INVALID;
 }
 
-static const char * const nand_ecc_algos[] = {
-	[NAND_ECC_ALGO_HAMMING]	= "hamming",
-	[NAND_ECC_ALGO_BCH]	= "bch",
-	[NAND_ECC_ALGO_RS]	= "rs",
-};
-
-static enum nand_ecc_algo of_get_nand_ecc_algo(struct device_node *np)
+enum nand_ecc_placement
+of_get_rawnand_ecc_placement_legacy(struct device_node *np)
 {
-	enum nand_ecc_algo ecc_algo;
 	const char *pm;
 	int err;
 
-	err = of_property_read_string(np, "nand-ecc-algo", &pm);
+	err = of_property_read_string(np, "nand-ecc-mode", &pm);
 	if (!err) {
-		for (ecc_algo = NAND_ECC_ALGO_HAMMING;
-		     ecc_algo < ARRAY_SIZE(nand_ecc_algos);
-		     ecc_algo++) {
-			if (!strcasecmp(pm, nand_ecc_algos[ecc_algo]))
-				return ecc_algo;
-		}
+		if (!strcasecmp(pm, "hw_syndrome"))
+			return NAND_ECC_PLACEMENT_INTERLEAVED;
 	}
 
-	/*
-	 * For backward compatibility we also read "nand-ecc-mode" checking
-	 * for some obsoleted values that were specifying ECC algorithm.
-	 */
+	return NAND_ECC_PLACEMENT_UNKNOWN;
+}
+
+static enum nand_ecc_algo of_get_rawnand_ecc_algo_legacy(struct device_node *np)
+{
+	const char *pm;
+	int err;
+
 	err = of_property_read_string(np, "nand-ecc-mode", &pm);
 	if (!err) {
 		if (!strcasecmp(pm, "soft"))
@@ -4940,22 +4936,19 @@ static enum nand_ecc_algo of_get_nand_ecc_algo(struct device_node *np)
 	return NAND_ECC_ALGO_UNKNOWN;
 }
 
-static int of_get_nand_ecc_step_size(struct device_node *np)
+static void of_get_nand_ecc_legacy_user_config(struct nand_chip *chip)
 {
-	int ret;
-	u32 val;
+	struct device_node *dn = nand_get_flash_node(chip);
+	struct nand_ecc_props *user_conf = &chip->base.ecc.user_conf;
 
-	ret = of_property_read_u32(np, "nand-ecc-step-size", &val);
-	return ret ? ret : val;
-}
+	if (user_conf->engine_type != NAND_ECC_ENGINE_TYPE_INVALID)
+		user_conf->engine_type = of_get_rawnand_ecc_engine_type_legacy(dn);
 
-static int of_get_nand_ecc_strength(struct device_node *np)
-{
-	int ret;
-	u32 val;
+	if (user_conf->algo != NAND_ECC_ALGO_UNKNOWN)
+		user_conf->algo = of_get_rawnand_ecc_algo_legacy(dn);
 
-	ret = of_property_read_u32(np, "nand-ecc-strength", &val);
-	return ret ? ret : val;
+	if (user_conf->placement != NAND_ECC_PLACEMENT_UNKNOWN)
+		user_conf->placement = of_get_rawnand_ecc_placement_legacy(dn);
 }
 
 static int of_get_nand_bus_width(struct device_node *np)
@@ -4979,12 +4972,10 @@ static bool of_get_nand_on_flash_bbt(struct device_node *np)
 	return of_property_read_bool(np, "nand-on-flash-bbt");
 }
 
-static int nand_dt_init(struct nand_chip *chip)
+static int rawnand_dt_init(struct nand_chip *chip)
 {
+	struct nand_device *nand = mtd_to_nanddev(nand_to_mtd(chip));
 	struct device_node *dn = nand_get_flash_node(chip);
-	enum nand_ecc_engine_type ecc_type;
-	enum nand_ecc_algo ecc_algo;
-	int ecc_strength, ecc_step;
 
 	if (!dn)
 		return 0;
@@ -4998,26 +4989,33 @@ static int nand_dt_init(struct nand_chip *chip)
 	if (of_get_nand_on_flash_bbt(dn))
 		chip->bbt_options |= NAND_BBT_USE_FLASH;
 
-	ecc_type = of_get_nand_ecc_engine_type(dn);
-	ecc_algo = of_get_nand_ecc_algo(dn);
-	ecc_strength = of_get_nand_ecc_strength(dn);
-	ecc_step = of_get_nand_ecc_step_size(dn);
-
-	if (ecc_type != NAND_ECC_ENGINE_TYPE_INVALID)
-		chip->ecc.engine_type = ecc_type;
-
-	if (ecc_algo != NAND_ECC_ALGO_UNKNOWN)
-		chip->ecc.algo = ecc_algo;
-
-	if (ecc_strength >= 0)
-		chip->ecc.strength = ecc_strength;
-
-	if (ecc_step > 0)
-		chip->ecc.size = ecc_step;
-
 	if (of_property_read_bool(dn, "nand-ecc-maximize"))
 		chip->ecc.options |= NAND_ECC_MAXIMIZE;
 
+	of_get_nand_ecc_user_config(nand);
+	of_get_nand_ecc_legacy_user_config(chip);
+
+	/*
+	 * If neither the user nor the NAND controller have requested a specific
+	 * ECC engine type, we will default to NAND_ECC_ENGINE_TYPE_ON_HOST.
+	 */
+	nand->ecc.defaults.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
+
+	/*
+	 * Use the user requested engine type, unless there is none, in this
+	 * case default to the NAND controller choice, otherwise fallback to
+	 * the raw NAND default one.
+	 */
+	if (nand->ecc.user_conf.engine_type != NAND_ECC_ENGINE_TYPE_INVALID)
+		chip->ecc.engine_type = nand->ecc.user_conf.engine_type;
+	if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_INVALID)
+		chip->ecc.engine_type = nand->ecc.defaults.engine_type;
+
+	chip->ecc.placement = nand->ecc.user_conf.placement;
+	chip->ecc.algo = nand->ecc.user_conf.algo;
+	chip->ecc.strength = nand->ecc.user_conf.strength;
+	chip->ecc.size = nand->ecc.user_conf.step_size;
+
 	return 0;
 }
 
@@ -5054,7 +5052,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	/* Enforce the right timings for reset/detection */
 	onfi_fill_data_interface(chip, NAND_SDR_IFACE, 0);
 
-	ret = nand_dt_init(chip);
+	ret = rawnand_dt_init(chip);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index af02eb07207e..66f69a1d27a5 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -81,18 +81,6 @@ struct nand_chip;
 
 #define NAND_DATA_IFACE_CHECK_ONLY	-1
 
-/*
- * Constants for ECC_MODES
- */
-enum nand_ecc_mode {
-	NAND_ECC_INVALID,
-	NAND_ECC_NONE,
-	NAND_ECC_SOFT,
-	NAND_ECC_HW,
-	NAND_ECC_HW_SYNDROME,
-	NAND_ECC_ON_DIE,
-};
-
 /*
  * Constants for Hardware ECC
  */
-- 
2.20.1

