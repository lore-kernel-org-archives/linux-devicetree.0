Return-Path: <SRS0=q8LW=7I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE04C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 19:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76E26208FE
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 19:56:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389324AbgEZT4k (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 15:56:40 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:46351 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390085AbgEZT4k (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 May 2020 15:56:40 -0400
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 77F99C0009;
        Tue, 26 May 2020 19:56:37 +0000 (UTC)
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
Subject: [RESEND v5 02/21] mtd: rawnand: Avoid a typedef
Date:   Tue, 26 May 2020 21:56:14 +0200
Message-Id: <20200526195633.11543-3-miquel.raynal@bootlin.com>
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

In new code, the use of typedef is discouraged. Turn this one in the
raw NAND core into a regular enumeration.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/nand_base.c               | 4 ++--
 include/linux/mtd/rawnand.h                    | 6 +++---
 include/linux/platform_data/mtd-davinci.h      | 2 +-
 include/linux/platform_data/mtd-nand-s3c2410.h | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 384a9b2d1610..e2cdfbb45923 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5104,8 +5104,8 @@ static int of_get_nand_ecc_mode(struct device_node *np)
 
 	/*
 	 * For backward compatibility we support few obsoleted values that don't
-	 * have their mappings into nand_ecc_modes_t anymore (they were merged
-	 * with other enums).
+	 * have their mappings into the nand_ecc_mode enum anymore (they were
+	 * merged with other enums).
 	 */
 	if (!strcasecmp(pm, "soft_bch"))
 		return NAND_ECC_SOFT;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 2804c13e5662..0911e845cced 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -83,14 +83,14 @@ struct nand_chip;
 /*
  * Constants for ECC_MODES
  */
-typedef enum {
+enum nand_ecc_mode {
 	NAND_ECC_NONE,
 	NAND_ECC_SOFT,
 	NAND_ECC_HW,
 	NAND_ECC_HW_SYNDROME,
 	NAND_ECC_HW_OOB_FIRST,
 	NAND_ECC_ON_DIE,
-} nand_ecc_modes_t;
+};
 
 enum nand_ecc_algo {
 	NAND_ECC_UNKNOWN,
@@ -362,7 +362,7 @@ static const struct nand_ecc_caps __name = {			\
  * @write_oob:	function to write chip OOB data
  */
 struct nand_ecc_ctrl {
-	nand_ecc_modes_t mode;
+	enum nand_ecc_mode mode;
 	enum nand_ecc_algo algo;
 	int steps;
 	int size;
diff --git a/include/linux/platform_data/mtd-davinci.h b/include/linux/platform_data/mtd-davinci.h
index 08e639e047e5..03e92c71b3fa 100644
--- a/include/linux/platform_data/mtd-davinci.h
+++ b/include/linux/platform_data/mtd-davinci.h
@@ -68,7 +68,7 @@ struct davinci_nand_pdata {		/* platform_data */
 	 * Newer ones also support 4-bit ECC, but are awkward
 	 * using it with large page chips.
 	 */
-	nand_ecc_modes_t	ecc_mode;
+	enum nand_ecc_mode	ecc_mode;
 	u8			ecc_bits;
 
 	/* e.g. NAND_BUSWIDTH_16 */
diff --git a/include/linux/platform_data/mtd-nand-s3c2410.h b/include/linux/platform_data/mtd-nand-s3c2410.h
index deb849bcf0ec..08675b16f9e1 100644
--- a/include/linux/platform_data/mtd-nand-s3c2410.h
+++ b/include/linux/platform_data/mtd-nand-s3c2410.h
@@ -49,7 +49,7 @@ struct s3c2410_platform_nand {
 
 	unsigned int	ignore_unset_ecc:1;
 
-	nand_ecc_modes_t	ecc_mode;
+	enum nand_ecc_mode	ecc_mode;
 
 	int			nr_sets;
 	struct s3c2410_nand_set *sets;
-- 
2.20.1

