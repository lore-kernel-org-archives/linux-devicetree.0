Return-Path: <SRS0=q8LW=7I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FEDC433E3
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 19:56:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03DE8207CB
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 19:56:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390118AbgEZT4s (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 15:56:48 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:52187 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389442AbgEZT4r (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 May 2020 15:56:47 -0400
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B31ECC0009;
        Tue, 26 May 2020 19:56:45 +0000 (UTC)
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
Subject: [RESEND v5 09/21] mtd: rawnand: Create a new enumeration to describe properly ECC types
Date:   Tue, 26 May 2020 21:56:21 +0200
Message-Id: <20200526195633.11543-10-miquel.raynal@bootlin.com>
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

Now that the misleading mix between ECC engine type and OOB placement
has been addressed, add a new enumeration to properly define ECC types
(also called provider or mode).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/nand_base.c |  7 +++++++
 include/linux/mtd/rawnand.h      | 16 ++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 515cd4681660..5c6ab5b93270 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5018,6 +5018,13 @@ static const char * const nand_ecc_modes[] = {
 	[NAND_ECC_ON_DIE]	= "on-die",
 };
 
+static const char * const nand_ecc_engine_providers[] = {
+	[NAND_ECC_ENGINE_NONE] = "none",
+	[NAND_ECC_ENGINE_SOFT] = "soft",
+	[NAND_ECC_ENGINE_CONTROLLER] = "hw",
+	[NAND_ECC_ENGINE_ON_DIE] = "on-die",
+};
+
 static const char * const nand_ecc_placement[] = {
 	[NAND_ECC_PLACEMENT_INTERLEAVED] = "interleaved",
 };
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index dc909fb977c7..a2078c5f3d21 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -92,6 +92,22 @@ enum nand_ecc_mode {
 	NAND_ECC_ON_DIE,
 };
 
+/**
+ * enum nand_ecc_engine_type - NAND ECC engine type/provider
+ * @NAND_ECC_ENGINE_INVALID: Invalid value
+ * @NAND_ECC_ENGINE_NONE: No ECC correction
+ * @NAND_ECC_ENGINE_SOFT: Software ECC correction
+ * @NAND_ECC_ENGINE_CONTROLLER: Hardware controller ECC correction
+ * @NAND_ECC_ENGINE_ON_DIE: On chip hardware ECC correction
+ */
+enum nand_ecc_engine_type {
+	NAND_ECC_ENGINE_INVALID,
+	NAND_ECC_ENGINE_NONE,
+	NAND_ECC_ENGINE_SOFT,
+	NAND_ECC_ENGINE_CONTROLLER,
+	NAND_ECC_ENGINE_ON_DIE,
+};
+
 /**
  * enum nand_ecc_placement - NAND ECC placement
  * @NAND_ECC_PLACEMENT_FREE: The driver can decide where to put ECC bytes.
-- 
2.20.1

