Return-Path: <SRS0=pmuo=6W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F44EC54E4B
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 May 2020 17:13:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15D1524958
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 May 2020 17:13:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbgEHRNt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 May 2020 13:13:49 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:19341 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727801AbgEHRNt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 May 2020 13:13:49 -0400
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 59DEE24000D;
        Fri,  8 May 2020 17:13:45 +0000 (UTC)
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
Subject: [PATCH v4 2/8] lib/bch: Allow easy bit swapping
Date:   Fri,  8 May 2020 19:13:33 +0200
Message-Id: <20200508171339.8052-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200508171339.8052-1-miquel.raynal@bootlin.com>
References: <20200508171339.8052-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

It seems that several hardware ECC engine use a swapped representation
of bytes compared to software. This might having to do with how the
ECC engine is wired to the NAND controller or the order the bits are
passed to the hardware BCH logic.

This means that when the software BCH engine is working in conjunction
with data generated with hardware, sometimes we might need to swap the
bits inside bytes, eg:

    0x0A = b0000_1010 -> b0101_0000 = 0x50

Make it possible by adding a boolean to the BCH initialization routine.

Regarding the implementation itself, this is a rather simple approach
that can probably be enhanced in the future by preparing the
->a_{mod,pow}_tab tables with the swapping in mind.

Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/devices/docg3.c     |  2 +-
 drivers/mtd/nand/raw/nand_bch.c |  2 +-
 include/linux/bch.h             |  5 +-
 lib/bch.c                       | 90 ++++++++++++++++++++++++++++-----
 4 files changed, 82 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 799df8d03357..a030792115bc 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1985,7 +1985,7 @@ static int __init docg3_probe(struct platform_device *pdev)
 	cascade->base = base;
 	mutex_init(&cascade->lock);
 	cascade->bch = bch_init(DOC_ECC_BCH_M, DOC_ECC_BCH_T,
-				DOC_ECC_BCH_PRIMPOLY);
+				DOC_ECC_BCH_PRIMPOLY, false);
 	if (!cascade->bch)
 		return ret;
 
diff --git a/drivers/mtd/nand/raw/nand_bch.c b/drivers/mtd/nand/raw/nand_bch.c
index d95fcc7358e9..d5af8c5fd02f 100644
--- a/drivers/mtd/nand/raw/nand_bch.c
+++ b/drivers/mtd/nand/raw/nand_bch.c
@@ -130,7 +130,7 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
 	if (!nbc)
 		goto fail;
 
-	nbc->bch = bch_init(m, t, 0);
+	nbc->bch = bch_init(m, t, 0, false);
 	if (!nbc->bch)
 		goto fail;
 
diff --git a/include/linux/bch.h b/include/linux/bch.h
index 9c35e7cd5890..85fdce83d4e2 100644
--- a/include/linux/bch.h
+++ b/include/linux/bch.h
@@ -33,6 +33,7 @@
  * @cache:      log-based polynomial representation buffer
  * @elp:        error locator polynomial
  * @poly_2t:    temporary polynomials of degree 2t
+ * @swap_bits:  swap bits within data and syndrome bytes
  */
 struct bch_control {
 	unsigned int    m;
@@ -51,9 +52,11 @@ struct bch_control {
 	int            *cache;
 	struct gf_poly *elp;
 	struct gf_poly *poly_2t[4];
+	bool		swap_bits;
 };
 
-struct bch_control *bch_init(int m, int t, unsigned int prim_poly);
+struct bch_control *bch_init(int m, int t, unsigned int prim_poly,
+			     bool swap_bits);
 
 void bch_free(struct bch_control *bch);
 
diff --git a/lib/bch.c b/lib/bch.c
index 1091841ac716..7c031ee8b93b 100644
--- a/lib/bch.c
+++ b/lib/bch.c
@@ -114,6 +114,49 @@ struct gf_poly_deg1 {
 	unsigned int   c[2];
 };
 
+static u8 swap_bits_table[] = {
+	0x00, 0x80, 0x40, 0xc0, 0x20, 0xa0, 0x60, 0xe0,
+	0x10, 0x90, 0x50, 0xd0, 0x30, 0xb0, 0x70, 0xf0,
+	0x08, 0x88, 0x48, 0xc8, 0x28, 0xa8, 0x68, 0xe8,
+	0x18, 0x98, 0x58, 0xd8, 0x38, 0xb8, 0x78, 0xf8,
+	0x04, 0x84, 0x44, 0xc4, 0x24, 0xa4, 0x64, 0xe4,
+	0x14, 0x94, 0x54, 0xd4, 0x34, 0xb4, 0x74, 0xf4,
+	0x0c, 0x8c, 0x4c, 0xcc, 0x2c, 0xac, 0x6c, 0xec,
+	0x1c, 0x9c, 0x5c, 0xdc, 0x3c, 0xbc, 0x7c, 0xfc,
+	0x02, 0x82, 0x42, 0xc2, 0x22, 0xa2, 0x62, 0xe2,
+	0x12, 0x92, 0x52, 0xd2, 0x32, 0xb2, 0x72, 0xf2,
+	0x0a, 0x8a, 0x4a, 0xca, 0x2a, 0xaa, 0x6a, 0xea,
+	0x1a, 0x9a, 0x5a, 0xda, 0x3a, 0xba, 0x7a, 0xfa,
+	0x06, 0x86, 0x46, 0xc6, 0x26, 0xa6, 0x66, 0xe6,
+	0x16, 0x96, 0x56, 0xd6, 0x36, 0xb6, 0x76, 0xf6,
+	0x0e, 0x8e, 0x4e, 0xce, 0x2e, 0xae, 0x6e, 0xee,
+	0x1e, 0x9e, 0x5e, 0xde, 0x3e, 0xbe, 0x7e, 0xfe,
+	0x01, 0x81, 0x41, 0xc1, 0x21, 0xa1, 0x61, 0xe1,
+	0x11, 0x91, 0x51, 0xd1, 0x31, 0xb1, 0x71, 0xf1,
+	0x09, 0x89, 0x49, 0xc9, 0x29, 0xa9, 0x69, 0xe9,
+	0x19, 0x99, 0x59, 0xd9, 0x39, 0xb9, 0x79, 0xf9,
+	0x05, 0x85, 0x45, 0xc5, 0x25, 0xa5, 0x65, 0xe5,
+	0x15, 0x95, 0x55, 0xd5, 0x35, 0xb5, 0x75, 0xf5,
+	0x0d, 0x8d, 0x4d, 0xcd, 0x2d, 0xad, 0x6d, 0xed,
+	0x1d, 0x9d, 0x5d, 0xdd, 0x3d, 0xbd, 0x7d, 0xfd,
+	0x03, 0x83, 0x43, 0xc3, 0x23, 0xa3, 0x63, 0xe3,
+	0x13, 0x93, 0x53, 0xd3, 0x33, 0xb3, 0x73, 0xf3,
+	0x0b, 0x8b, 0x4b, 0xcb, 0x2b, 0xab, 0x6b, 0xeb,
+	0x1b, 0x9b, 0x5b, 0xdb, 0x3b, 0xbb, 0x7b, 0xfb,
+	0x07, 0x87, 0x47, 0xc7, 0x27, 0xa7, 0x67, 0xe7,
+	0x17, 0x97, 0x57, 0xd7, 0x37, 0xb7, 0x77, 0xf7,
+	0x0f, 0x8f, 0x4f, 0xcf, 0x2f, 0xaf, 0x6f, 0xef,
+	0x1f, 0x9f, 0x5f, 0xdf, 0x3f, 0xbf, 0x7f, 0xff,
+};
+
+static u8 swap_bits(struct bch_control *bch, u8 in)
+{
+	if (!bch->swap_bits)
+		return in;
+
+	return swap_bits_table[in];
+}
+
 /*
  * same as bch_encode(), but process input data one byte at a time
  */
@@ -126,7 +169,9 @@ static void bch_encode_unaligned(struct bch_control *bch,
 	const int l = BCH_ECC_WORDS(bch)-1;
 
 	while (len--) {
-		p = bch->mod8_tab + (l+1)*(((ecc[0] >> 24)^(*data++)) & 0xff);
+		u8 tmp = swap_bits(bch, *data++);
+
+		p = bch->mod8_tab + (l+1)*(((ecc[0] >> 24)^(tmp)) & 0xff);
 
 		for (i = 0; i < l; i++)
 			ecc[i] = ((ecc[i] << 8)|(ecc[i+1] >> 24))^(*p++);
@@ -145,10 +190,16 @@ static void load_ecc8(struct bch_control *bch, uint32_t *dst,
 	unsigned int i, nwords = BCH_ECC_WORDS(bch)-1;
 
 	for (i = 0; i < nwords; i++, src += 4)
-		dst[i] = (src[0] << 24)|(src[1] << 16)|(src[2] << 8)|src[3];
+		dst[i] = ((u32)swap_bits(bch, src[0]) << 24) |
+			((u32)swap_bits(bch, src[1]) << 16) |
+			((u32)swap_bits(bch, src[2]) << 8) |
+			swap_bits(bch, src[3]);
 
 	memcpy(pad, src, BCH_ECC_BYTES(bch)-4*nwords);
-	dst[nwords] = (pad[0] << 24)|(pad[1] << 16)|(pad[2] << 8)|pad[3];
+	dst[nwords] = ((u32)swap_bits(bch, pad[0]) << 24) |
+		((u32)swap_bits(bch, pad[1]) << 16) |
+		((u32)swap_bits(bch, pad[2]) << 8) |
+		swap_bits(bch, pad[3]);
 }
 
 /*
@@ -161,15 +212,15 @@ static void store_ecc8(struct bch_control *bch, uint8_t *dst,
 	unsigned int i, nwords = BCH_ECC_WORDS(bch)-1;
 
 	for (i = 0; i < nwords; i++) {
-		*dst++ = (src[i] >> 24);
-		*dst++ = (src[i] >> 16) & 0xff;
-		*dst++ = (src[i] >>  8) & 0xff;
-		*dst++ = (src[i] >>  0) & 0xff;
+		*dst++ = swap_bits(bch, src[i] >> 24);
+		*dst++ = swap_bits(bch, src[i] >> 16);
+		*dst++ = swap_bits(bch, src[i] >> 8);
+		*dst++ = swap_bits(bch, src[i]);
 	}
-	pad[0] = (src[nwords] >> 24);
-	pad[1] = (src[nwords] >> 16) & 0xff;
-	pad[2] = (src[nwords] >>  8) & 0xff;
-	pad[3] = (src[nwords] >>  0) & 0xff;
+	pad[0] = swap_bits(bch, src[nwords] >> 24);
+	pad[1] = swap_bits(bch, src[nwords] >> 16);
+	pad[2] = swap_bits(bch, src[nwords] >> 8);
+	pad[3] = swap_bits(bch, src[nwords]);
 	memcpy(dst, pad, BCH_ECC_BYTES(bch)-4*nwords);
 }
 
@@ -240,7 +291,13 @@ void bch_encode(struct bch_control *bch, const uint8_t *data,
 	 */
 	while (mlen--) {
 		/* input data is read in big-endian format */
-		w = r[0]^cpu_to_be32(*pdata++);
+		w = cpu_to_be32(*pdata++);
+		if (bch->swap_bits)
+			w = (u32)swap_bits(bch, w) |
+			    ((u32)swap_bits(bch, w >> 8) << 8) |
+			    ((u32)swap_bits(bch, w >> 16) << 16) |
+			    ((u32)swap_bits(bch, w >> 24) << 24);
+		w ^= r[0];
 		p0 = tab0 + (l+1)*((w >>  0) & 0xff);
 		p1 = tab1 + (l+1)*((w >>  8) & 0xff);
 		p2 = tab2 + (l+1)*((w >> 16) & 0xff);
@@ -1048,7 +1105,9 @@ int bch_decode(struct bch_control *bch, const uint8_t *data, unsigned int len,
 				break;
 			}
 			errloc[i] = nbits-1-errloc[i];
-			errloc[i] = (errloc[i] & ~7)|(7-(errloc[i] & 7));
+			if (!bch->swap_bits)
+				errloc[i] = (errloc[i] & ~7) |
+					    (7-(errloc[i] & 7));
 		}
 	}
 	return (err >= 0) ? err : -EBADMSG;
@@ -1240,6 +1299,7 @@ static uint32_t *compute_generator_polynomial(struct bch_control *bch)
  * @m:          Galois field order, should be in the range 5-15
  * @t:          maximum error correction capability, in bits
  * @prim_poly:  user-provided primitive polynomial (or 0 to use default)
+ * @swap_bits:  swap bits within data and syndrome bytes
  *
  * Returns:
  *  a newly allocated BCH control structure if successful, NULL otherwise
@@ -1256,7 +1316,8 @@ static uint32_t *compute_generator_polynomial(struct bch_control *bch)
  * BCH control structure, ecc length in bytes is given by member @ecc_bytes of
  * the structure.
  */
-struct bch_control *bch_init(int m, int t, unsigned int prim_poly)
+struct bch_control *bch_init(int m, int t, unsigned int prim_poly,
+			     bool swap_bits)
 {
 	int err = 0;
 	unsigned int i, words;
@@ -1321,6 +1382,7 @@ struct bch_control *bch_init(int m, int t, unsigned int prim_poly)
 	bch->syn       = bch_alloc(2*t*sizeof(*bch->syn), &err);
 	bch->cache     = bch_alloc(2*t*sizeof(*bch->cache), &err);
 	bch->elp       = bch_alloc((t+1)*sizeof(struct gf_poly_deg1), &err);
+	bch->swap_bits = swap_bits;
 
 	for (i = 0; i < ARRAY_SIZE(bch->poly_2t); i++)
 		bch->poly_2t[i] = bch_alloc(GF_POLY_SZ(2*t), &err);
-- 
2.20.1

