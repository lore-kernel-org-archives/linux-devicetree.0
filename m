Return-Path: <SRS0=q8LW=7I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1396BC433E2
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 19:56:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7D72207D8
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 19:56:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390106AbgEZT4o (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 15:56:44 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:58215 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389442AbgEZT4o (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 May 2020 15:56:44 -0400
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0359FC000C;
        Tue, 26 May 2020 19:56:41 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RESEND v5 06/21] mtd: rawnand: Add an invalid ECC mode to discriminate with valid ones
Date:   Tue, 26 May 2020 21:56:18 +0200
Message-Id: <20200526195633.11543-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526195633.11543-1-miquel.raynal@bootlin.com>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

NAND ECC modes (or providers) have their own enumeration but, unlike
their algorithms counterpart, there is no invalid or uninitialized
value to discriminate between an error and having chosen a no-ECC
situation. Add an "invalid" entry for this purpose.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/nand_base.c | 2 +-
 include/linux/mtd/rawnand.h      | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a756f3193558..ef70ca0828c3 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5027,7 +5027,7 @@ static int of_get_nand_ecc_mode(struct device_node *np)
 	if (err < 0)
 		return err;
 
-	for (i = 0; i < ARRAY_SIZE(nand_ecc_modes); i++)
+	for (i = NAND_ECC_NONE; i < ARRAY_SIZE(nand_ecc_modes); i++)
 		if (!strcasecmp(pm, nand_ecc_modes[i]))
 			return i;
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 7b87c5dc89bd..8187056dd3a0 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -84,6 +84,7 @@ struct nand_chip;
  * Constants for ECC_MODES
  */
 enum nand_ecc_mode {
+	NAND_ECC_INVALID,
 	NAND_ECC_NONE,
 	NAND_ECC_SOFT,
 	NAND_ECC_HW,
-- 
2.20.1

