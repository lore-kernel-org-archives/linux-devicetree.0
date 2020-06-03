Return-Path: <SRS0=VnZl=7Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F106C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 17:58:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80D862068D
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 17:58:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgFCR6c (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 13:58:32 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:45681 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgFCR6b (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jun 2020 13:58:31 -0400
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id C51AE240003;
        Wed,  3 Jun 2020 17:58:28 +0000 (UTC)
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
Subject: [PATCH v10 13/20] mtd: nand: Create helpers to set/extract the ECC requirements
Date:   Wed,  3 Jun 2020 19:57:52 +0200
Message-Id: <20200603175759.19948-14-miquel.raynal@bootlin.com>
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

Despite its current name, the eccreq field actually encodes both the
NAND requirements and the final ECC configuration. That works fine when
using on-die ECC since those 2 concepts match perfectly, but it starts
being a problem as soon as we use on-host ECC engines, where we're not
guaranteed to have a perfect match.

Let's hide the ECC requirements access behind helpers so we can later
split those 2 concepts. As the structures have not been clarified yet,
these helpers access the same internal variable as
nanddev_get_ecc_conf() for now.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/nand.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 9cbb41a5541c..348fb2ad4d90 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -533,6 +533,30 @@ nanddev_get_ecc_conf(struct nand_device *nand)
 	return &nand->eccreq;
 }
 
+/**
+ * nanddev_get_ecc_requirements() - Extract the ECC requirements from a NAND
+ *                                  device
+ * @nand: NAND device
+ */
+static inline const struct nand_ecc_props *
+nanddev_get_ecc_requirements(struct nand_device *nand)
+{
+	return &nand->eccreq;
+}
+
+/**
+ * nanddev_set_ecc_requirements() - Assign the ECC requirements of a NAND
+ *                                  device
+ * @nand: NAND device
+ * @reqs: Requirements
+ */
+static inline void
+nanddev_set_ecc_requirements(struct nand_device *nand,
+			     const struct nand_ecc_props *reqs)
+{
+	nand->eccreq = *reqs;
+}
+
 int nanddev_init(struct nand_device *nand, const struct nand_ops *ops,
 		 struct module *owner);
 void nanddev_cleanup(struct nand_device *nand);
-- 
2.20.1

