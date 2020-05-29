Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB47C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 00:25:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80BBA208E4
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 00:25:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437963AbgE2AZb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 20:25:31 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:45577 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438071AbgE2AZb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 20:25:31 -0400
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id CCE30200005;
        Fri, 29 May 2020 00:25:27 +0000 (UTC)
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
Subject: [PATCH v7 04/20] mtd: rawnand: Create a helper to retrieve the ECC placement
Date:   Fri, 29 May 2020 02:25:01 +0200
Message-Id: <20200529002517.3546-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529002517.3546-1-miquel.raynal@bootlin.com>
References: <20200529002517.3546-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Use it from nand_dt_init() to initialize the ECC structure.

This allows the deprecation of the hw_syndrome ECC mode.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/nand_base.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 9fbd2a474b62..fd0bfe9bf7ae 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5047,6 +5047,34 @@ static int of_get_nand_ecc_mode(struct device_node *np)
 	return -ENODEV;
 }
 
+enum nand_ecc_placement of_get_nand_ecc_placement(struct device_node *np)
+{
+	enum nand_ecc_placement placement;
+	const char *pm;
+	int err;
+
+	err = of_property_read_string(np, "nand-ecc-placement", &pm);
+	if (!err) {
+		for (placement = NAND_ECC_PLACEMENT_INTERLEAVED;
+		     placement < ARRAY_SIZE(nand_ecc_placement); placement++) {
+			if (!strcasecmp(pm, nand_ecc_placement[placement]))
+				return placement;
+		}
+	}
+
+	/*
+	 * For backward compatibility we support few obsoleted values that don't
+	 * have their mappings into the nand_ecc_placement enum anymore.
+	 */
+	err = of_property_read_string(np, "nand-ecc-mode", &pm);
+	if (!err) {
+		if (!strcasecmp(pm, "hw_syndrome"))
+			return NAND_ECC_PLACEMENT_INTERLEAVED;
+	}
+
+	return NAND_ECC_PLACEMENT_UNKNOWN;
+}
+
 static const char * const nand_ecc_algos[] = {
 	[NAND_ECC_HAMMING]	= "hamming",
 	[NAND_ECC_BCH]		= "bch",
@@ -5143,6 +5171,7 @@ static int nand_dt_init(struct nand_chip *chip)
 
 	ecc_mode = of_get_nand_ecc_mode(dn);
 	ecc_algo = of_get_nand_ecc_algo(dn);
+	chip->ecc.placement = of_get_nand_ecc_placement(dn);
 	ecc_strength = of_get_nand_ecc_strength(dn);
 	ecc_step = of_get_nand_ecc_step_size(dn);
 
-- 
2.20.1

