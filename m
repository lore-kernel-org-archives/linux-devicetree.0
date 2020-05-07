Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21776C38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:01:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0258C2083B
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:01:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgEGLBT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 07:01:19 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:47445 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbgEGLBT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 07:01:19 -0400
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7A56520003;
        Thu,  7 May 2020 11:01:14 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Michal Simek <monstr@monstr.eu>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 3/8] mtd: rawnand: Ensure the number of bitflips is consistent
Date:   Thu,  7 May 2020 13:00:29 +0200
Message-Id: <20200507110034.14736-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200507110034.14736-1-miquel.raynal@bootlin.com>
References: <20200507110034.14736-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The main NAND read page function can loop over "page reads" many times
in if the reading reports uncorrectable error(s) and if the chip
supports the read_retry feature.

In this case, the number of bitflips is summarized between
attempts. Fix this by re-initializing the entire mtd_ecc_stats object
each time we retry.

Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index dda82217e12c..25d298938aa9 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -3235,7 +3235,7 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 	oob_required = oob ? 1 : 0;
 
 	while (1) {
-		unsigned int ecc_failures = mtd->ecc_stats.failed;
+		struct mtd_ecc_stats ecc_stats = mtd->ecc_stats;
 
 		bytes = min(mtd->writesize - col, readlen);
 		aligned = (bytes == mtd->writesize);
@@ -3286,7 +3286,7 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 			 */
 			if (use_bounce_buf) {
 				if (!NAND_HAS_SUBPAGE_READ(chip) && !oob &&
-				    !(mtd->ecc_stats.failed - ecc_failures) &&
+				    !(mtd->ecc_stats.failed - ecc_stats.failed) &&
 				    (ops->mode != MTD_OPS_RAW)) {
 					chip->pagecache.page = realpage;
 					chip->pagecache.bitflips = ret;
@@ -3309,7 +3309,7 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 
 			nand_wait_readrdy(chip);
 
-			if (mtd->ecc_stats.failed - ecc_failures) {
+			if (mtd->ecc_stats.failed - ecc_stats.failed) {
 				if (retry_mode + 1 < chip->read_retries) {
 					retry_mode++;
 					ret = nand_setup_read_retry(chip,
@@ -3317,8 +3317,8 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 					if (ret < 0)
 						break;
 
-					/* Reset failures; retry */
-					mtd->ecc_stats.failed = ecc_failures;
+					/* Reset ecc_stats; retry */
+					mtd->ecc_stats = ecc_stats;
 					goto read_retry;
 				} else {
 					/* No more retry modes; real failure */
-- 
2.20.1

