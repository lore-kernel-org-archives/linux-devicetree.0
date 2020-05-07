Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2282C38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:01:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAA932083B
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:01:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgEGLBX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 07:01:23 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:59867 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726093AbgEGLBW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 07:01:22 -0400
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 115A22000B;
        Thu,  7 May 2020 11:01:17 +0000 (UTC)
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
Subject: [PATCH v3 4/8] mtd: rawnand: Add nand_extract_bits()
Date:   Thu,  7 May 2020 13:00:30 +0200
Message-Id: <20200507110034.14736-5-miquel.raynal@bootlin.com>
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

There are cases where ECC bytes are not byte-aligned. Indeed, BCH
implies using a number of ECC bits, which are not always a multiple of
8. We then need a helper like nand_extract_bits() to extract these
syndromes from a buffer.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 31 +++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h      |  4 ++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 25d298938aa9..b236e1bdddaf 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -224,6 +224,37 @@ static int check_offs_len(struct nand_chip *chip, loff_t ofs, uint64_t len)
 	return ret;
 }
 
+/* Copy unaligned bits from one buffer to another one (no overlap) */
+void nand_extract_bits(u8 *dst, const u8 *src, unsigned int src_off,
+		       unsigned int nbits)
+{
+	unsigned int dst_off = 0, tmp, n;
+
+	src += src_off / 8;
+	src_off %= 8;
+
+	while (nbits) {
+		n = min3(8 - dst_off, 8 - src_off, nbits);
+
+		tmp = (*src >> src_off) & GENMASK(n - 1, 0);
+		*dst |= tmp << dst_off;
+
+		dst_off += n;
+		if (dst_off >= 8) {
+			dst++;
+			dst_off -= 8;
+		}
+
+		src_off += n;
+		if (src_off >= 8) {
+			src++;
+			src_off -= 8;
+		}
+
+		nbits -= n;
+	}
+}
+
 /**
  * nand_select_target() - Select a NAND target (A.K.A. die)
  * @chip: NAND chip object
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 406e9ff0f45c..734564232545 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1404,6 +1404,10 @@ int nand_gpio_waitrdy(struct nand_chip *chip, struct gpio_desc *gpiod,
 void nand_select_target(struct nand_chip *chip, unsigned int cs);
 void nand_deselect_target(struct nand_chip *chip);
 
+/* Bitops */
+void nand_extract_bits(u8 *dst, const u8 *src, unsigned int src_off,
+		       unsigned int nbits);
+
 /**
  * nand_get_data_buf() - Get the internal page buffer
  * @chip: NAND chip object
-- 
2.20.1

