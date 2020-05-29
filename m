Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1678C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 13:16:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B27B6206F1
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 13:16:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgE2NQQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 May 2020 09:16:16 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:50115 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgE2NQP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 May 2020 09:16:15 -0400
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 96C5BFF80B;
        Fri, 29 May 2020 13:16:10 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Chuanhong Guo <gch981213@gmail.com>,
        Weijie Gao <weijie.gao@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Mason Yang <masonccyang@mxic.com.tw>,
        Julien Su <juliensu@mxic.com.tw>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v8 2/5] mtd: rawnand: Hide the generic OOB layout objects behind helpers
Date:   Fri, 29 May 2020 15:15:59 +0200
Message-Id: <20200529131602.21532-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529131602.21532-1-miquel.raynal@bootlin.com>
References: <20200529131602.21532-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Stop exposing these objects, create helpers to retrieve them instead.

Also export an helper for the Hamming large page ops for later use.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c |  2 +-
 drivers/mtd/nand/raw/atmel/nand-controller.c  |  2 +-
 drivers/mtd/nand/raw/davinci_nand.c           |  3 +-
 .../mtd/nand/raw/ingenic/ingenic_nand_drv.c   |  6 ++--
 drivers/mtd/nand/raw/nand_base.c              | 35 ++++++++++++++-----
 drivers/mtd/nand/raw/nand_toshiba.c           |  2 +-
 drivers/mtd/nand/raw/vf610_nfc.c              |  2 +-
 include/linux/mtd/rawnand.h                   |  5 +--
 8 files changed, 38 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index a0b5c539ca73..6fe61393bd26 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -980,7 +980,7 @@ static int anfc_init_hw_ecc_controller(struct arasan_nfc *nfc,
 		return -EINVAL;
 	}
 
-	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+	mtd_set_ooblayout(mtd, nand_get_large_page_ooblayout());
 
 	ecc->steps = mtd->writesize / ecc->size;
 	ecc->algo = NAND_ECC_ALGO_BCH;
diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 3fba91d7991a..08df7f23b859 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1108,7 +1108,7 @@ static int atmel_nand_pmecc_init(struct nand_chip *chip)
 
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
 
-	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+	mtd_set_ooblayout(mtd, nand_get_large_page_ooblayout());
 
 	return 0;
 }
diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 58966a9706b1..427f320fb79b 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -645,7 +645,8 @@ static int davinci_nand_attach_chip(struct nand_chip *chip)
 				mtd_set_ooblayout(mtd,
 						  &hwecc4_small_ooblayout_ops);
 			} else if (chunks == 4 || chunks == 8) {
-				mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+				mtd_set_ooblayout(mtd,
+						  nand_get_large_page_ooblayout());
 				info->chip.ecc.read_page = nand_davinci_read_page_hwecc_oob_first;
 			} else {
 				return -EIO;
diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index 70309f18124c..0e9d426fe4f2 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -243,8 +243,10 @@ static int ingenic_nand_attach_chip(struct nand_chip *chip)
 	/* For legacy reasons we use a different layout on the qi,lb60 board. */
 	if (of_machine_is_compatible("qi,lb60"))
 		mtd_set_ooblayout(mtd, &qi_lb60_ooblayout_ops);
-	else
+	else if (nfc->soc_info->oob_layout)
 		mtd_set_ooblayout(mtd, nfc->soc_info->oob_layout);
+	else
+		mtd_set_ooblayout(mtd, nand_get_large_page_ooblayout());
 
 	return 0;
 }
@@ -532,7 +534,6 @@ static const struct jz_soc_info jz4740_soc_info = {
 	.data_offset = 0x00000000,
 	.cmd_offset = 0x00008000,
 	.addr_offset = 0x00010000,
-	.oob_layout = &nand_ooblayout_lp_ops,
 };
 
 static const struct jz_soc_info jz4725b_soc_info = {
@@ -546,7 +547,6 @@ static const struct jz_soc_info jz4780_soc_info = {
 	.data_offset = 0x00000000,
 	.cmd_offset = 0x00400000,
 	.addr_offset = 0x00800000,
-	.oob_layout = &nand_ooblayout_lp_ops,
 };
 
 static const struct of_device_id ingenic_nand_dt_match[] = {
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index ed0f642be993..f120b0b4f591 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -95,11 +95,16 @@ static int nand_ooblayout_free_sp(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-const struct mtd_ooblayout_ops nand_ooblayout_sp_ops = {
+static const struct mtd_ooblayout_ops nand_ooblayout_sp_ops = {
 	.ecc = nand_ooblayout_ecc_sp,
 	.free = nand_ooblayout_free_sp,
 };
-EXPORT_SYMBOL_GPL(nand_ooblayout_sp_ops);
+
+const struct mtd_ooblayout_ops *nand_get_small_page_ooblayout(void)
+{
+	return &nand_ooblayout_sp_ops;
+}
+EXPORT_SYMBOL_GPL(nand_get_small_page_ooblayout);
 
 static int nand_ooblayout_ecc_lp(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
@@ -131,11 +136,16 @@ static int nand_ooblayout_free_lp(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-const struct mtd_ooblayout_ops nand_ooblayout_lp_ops = {
+static const struct mtd_ooblayout_ops nand_ooblayout_lp_ops = {
 	.ecc = nand_ooblayout_ecc_lp,
 	.free = nand_ooblayout_free_lp,
 };
-EXPORT_SYMBOL_GPL(nand_ooblayout_lp_ops);
+
+const struct mtd_ooblayout_ops *nand_get_large_page_ooblayout(void)
+{
+	return &nand_ooblayout_lp_ops;
+}
+EXPORT_SYMBOL_GPL(nand_get_large_page_ooblayout);
 
 /*
  * Support the old "large page" layout used for 1-bit Hamming ECC where ECC
@@ -205,6 +215,12 @@ static const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops = {
 	.free = nand_ooblayout_free_lp_hamming,
 };
 
+const struct mtd_ooblayout_ops *nand_get_large_page_hamming_ooblayout(void)
+{
+	return &nand_ooblayout_lp_hamming_ops;
+}
+EXPORT_SYMBOL_GPL(nand_get_large_page_hamming_ooblayout);
+
 static int nand_pairing_dist3_get_info(struct mtd_info *mtd, int page,
 				       struct mtd_pairing_info *info)
 {
@@ -5382,7 +5398,7 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 				return -EINVAL;
 			}
 
-			mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+			mtd_set_ooblayout(mtd, nand_get_large_page_ooblayout());
 
 		}
 
@@ -5391,7 +5407,7 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 		 * used, otherwise we don't know how many bytes can really be
 		 * used.
 		 */
-		if (mtd->ooblayout == &nand_ooblayout_lp_ops &&
+		if (mtd->ooblayout == nand_get_large_page_ooblayout() &&
 		    ecc->options & NAND_ECC_MAXIMIZE) {
 			int steps, bytes;
 
@@ -5793,11 +5809,12 @@ static int nand_scan_tail(struct nand_chip *chip)
 		switch (mtd->oobsize) {
 		case 8:
 		case 16:
-			mtd_set_ooblayout(mtd, &nand_ooblayout_sp_ops);
+			mtd_set_ooblayout(mtd, nand_get_small_page_ooblayout());
 			break;
 		case 64:
 		case 128:
-			mtd_set_ooblayout(mtd, &nand_ooblayout_lp_hamming_ops);
+			mtd_set_ooblayout(mtd,
+					  nand_get_large_page_hamming_ooblayout());
 			break;
 		default:
 			/*
@@ -5809,7 +5826,7 @@ static int nand_scan_tail(struct nand_chip *chip)
 			 */
 			if (ecc->engine_type == NAND_ECC_ENGINE_TYPE_NONE) {
 				mtd_set_ooblayout(mtd,
-						&nand_ooblayout_lp_ops);
+						  nand_get_large_page_ooblayout());
 				break;
 			}
 
diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
index 8fcf40d0ba0a..3174914e33e0 100644
--- a/drivers/mtd/nand/raw/nand_toshiba.c
+++ b/drivers/mtd/nand/raw/nand_toshiba.c
@@ -140,7 +140,7 @@ static void toshiba_nand_benand_init(struct nand_chip *chip)
 
 	chip->options |= NAND_SUBPAGE_READ;
 
-	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+	mtd_set_ooblayout(mtd, nand_get_large_page_ooblayout());
 }
 
 static void toshiba_nand_decode_id(struct nand_chip *chip)
diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 8ee2c1f539c4..50dc0c93140c 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -779,7 +779,7 @@ static int vf610_nfc_attach_chip(struct nand_chip *chip)
 		mtd->oobsize = 64;
 
 	/* Use default large page ECC layout defined in NAND core */
-	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+	mtd_set_ooblayout(mtd, nand_get_large_page_ooblayout());
 	if (chip->ecc.strength == 32) {
 		nfc->ecc_mode = ECC_60_BYTE;
 		chip->ecc.bytes = 60;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 8f7f1cce3b4b..f3eb47c09e57 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1159,8 +1159,9 @@ struct nand_chip {
 	int (*unlock_area)(struct nand_chip *chip, loff_t ofs, uint64_t len);
 };
 
-extern const struct mtd_ooblayout_ops nand_ooblayout_sp_ops;
-extern const struct mtd_ooblayout_ops nand_ooblayout_lp_ops;
+const struct mtd_ooblayout_ops *nand_get_small_page_ooblayout(void);
+const struct mtd_ooblayout_ops *nand_get_large_page_ooblayout(void);
+const struct mtd_ooblayout_ops *nand_get_large_page_hamming_ooblayout(void);
 
 static inline struct nand_chip *mtd_to_nand(struct mtd_info *mtd)
 {
-- 
2.20.1

