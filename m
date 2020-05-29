Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D0AC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 13:16:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EADE206F1
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 13:16:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgE2NQP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 May 2020 09:16:15 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:49919 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgE2NQM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 May 2020 09:16:12 -0400
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id A97B9FF817;
        Fri, 29 May 2020 13:16:08 +0000 (UTC)
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
Subject: [PATCH v8 1/5] mtd: nand: Convert generic NAND bits to use the ECC framework
Date:   Fri, 29 May 2020 15:15:58 +0200
Message-Id: <20200529131602.21532-2-miquel.raynal@bootlin.com>
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

Embed a generic NAND ECC high-level object in the nand_device
structure to carry all the ECC engine configuration/data.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c |  4 +++-
 include/linux/mtd/nand.h         | 12 ++++++------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index e8e22d79f422..ed0f642be993 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5984,7 +5984,9 @@ static int nand_scan_tail(struct nand_chip *chip)
 	/* ECC sanity check: warn if it's too weak */
 	if (!nand_ecc_strength_good(chip))
 		pr_warn("WARNING: %s: the ECC used on your system (%db/%dB) is too weak compared to the one required by the NAND chip (%db/%dB)\n",
-			mtd->name, chip->ecc.strength, chip->ecc.size,
+			mtd->name,
+			nanddev_get_ecc_conf(&chip->base)->strength,
+			nanddev_get_ecc_conf(&chip->base)->step_size,
 			nanddev_get_ecc_requirements(&chip->base)->strength,
 			nanddev_get_ecc_requirements(&chip->base)->step_size);
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 488d8b14b9ae..f5cc0aee565c 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -290,7 +290,7 @@ struct nand_ecc {
  * struct nand_device - NAND device
  * @mtd: MTD instance attached to the NAND device
  * @memorg: memory layout
- * @eccreq: ECC requirements
+ * @ecc: NAND ECC object attached to the NAND device
  * @rowconv: position to row address converter
  * @bbt: bad block table info
  * @ops: NAND operations attached to the NAND device
@@ -298,8 +298,8 @@ struct nand_ecc {
  * Generic NAND object. Specialized NAND layers (raw NAND, SPI NAND, OneNAND)
  * should declare their own NAND object embedding a nand_device struct (that's
  * how inheritance is done).
- * struct_nand_device->memorg and struct_nand_device->eccreq should be filled
- * at device detection time to reflect the NAND device
+ * struct_nand_device->memorg and struct_nand_device->ecc.requirements should
+ * be filled at device detection time to reflect the NAND device
  * capabilities/requirements. Once this is done nanddev_init() can be called.
  * It will take care of converting NAND information into MTD ones, which means
  * the specialized NAND layers should never manually tweak
@@ -308,7 +308,7 @@ struct nand_ecc {
 struct nand_device {
 	struct mtd_info mtd;
 	struct nand_memory_organization memorg;
-	struct nand_ecc_props eccreq;
+	struct nand_ecc ecc;
 	struct nand_row_converter rowconv;
 	struct nand_bbt bbt;
 	const struct nand_ops *ops;
@@ -519,7 +519,7 @@ nanddev_get_memorg(struct nand_device *nand)
 const struct nand_ecc_props *
 nanddev_get_ecc_conf(struct nand_device *nand)
 {
-	return &nand->eccreq;
+	return &nand->ecc.ctx.conf;
 }
 
 /**
@@ -530,7 +530,7 @@ nanddev_get_ecc_conf(struct nand_device *nand)
 const struct nand_ecc_props *
 nanddev_get_ecc_requirements(struct nand_device *nand)
 {
-	return &nand->eccreq;
+	return &nand->ecc.requirements;
 }
 
 int nanddev_init(struct nand_device *nand, const struct nand_ops *ops,
-- 
2.20.1

