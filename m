Return-Path: <SRS0=VnZl=7Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73739C433E1
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 17:58:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CB3C206A2
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 17:58:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgFCR6N (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 13:58:13 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:58583 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbgFCR6N (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jun 2020 13:58:13 -0400
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0E39524000E;
        Wed,  3 Jun 2020 17:58:08 +0000 (UTC)
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
Subject: [PATCH v10 03/20] mtd: rawnand: Move the nand_ecc_algo enum to the generic NAND layer
Date:   Wed,  3 Jun 2020 19:57:42 +0200
Message-Id: <20200603175759.19948-4-miquel.raynal@bootlin.com>
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

This enumeration is generic and will be reused NAND-wide.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/nand.h    | 14 ++++++++++++++
 include/linux/mtd/rawnand.h | 14 --------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index af99041ceaa9..986c7de83326 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -115,6 +115,20 @@ struct nand_page_io_req {
 	int mode;
 };
 
+/**
+ * enum nand_ecc_algo - NAND ECC algorithm
+ * @NAND_ECC_ALGO_UNKNOWN: Unknown algorithm
+ * @NAND_ECC_ALGO_HAMMING: Hamming algorithm
+ * @NAND_ECC_ALGO_BCH: Bose-Chaudhuri-Hocquenghem algorithm
+ * @NAND_ECC_ALGO_RS: Reed-Solomon algorithm
+ */
+enum nand_ecc_algo {
+	NAND_ECC_ALGO_UNKNOWN,
+	NAND_ECC_ALGO_HAMMING,
+	NAND_ECC_ALGO_BCH,
+	NAND_ECC_ALGO_RS,
+};
+
 /**
  * struct nand_ecc_props - NAND ECC properties
  * @strength: ECC strength
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index cf49aa678920..ce37569c3f57 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -92,20 +92,6 @@ enum nand_ecc_mode {
 	NAND_ECC_ON_DIE,
 };
 
-/**
- * enum nand_ecc_algo - NAND ECC algorithm
- * @NAND_ECC_ALGO_UNKNOWN: Unknown algorithm
- * @NAND_ECC_ALGO_HAMMING: Hamming algorithm
- * @NAND_ECC_ALGO_BCH: Bose-Chaudhuri-Hocquenghem algorithm
- * @NAND_ECC_ALGO_RS: Reed-Solomon algorithm
- */
-enum nand_ecc_algo {
-	NAND_ECC_ALGO_UNKNOWN,
-	NAND_ECC_ALGO_HAMMING,
-	NAND_ECC_ALGO_BCH,
-	NAND_ECC_ALGO_RS,
-};
-
 /*
  * Constants for Hardware ECC
  */
-- 
2.20.1

