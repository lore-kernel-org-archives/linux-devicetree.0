From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [RESEND PATCH 3/3] mtd: nand: sunxi: Support ECC maximization
Date: Wed,  8 Jun 2016 17:04:24 +0200
Message-ID: <1465398264-8202-4-git-send-email-boris.brezillon@free-electrons.com>
References: <1465398264-8202-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465398264-8202-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Setup the maximum ECC config when NAND_ECC_MAXIMIZE is set.

Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/mtd/nand/sunxi_nand.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index 8dfcb65..21dad0b 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -1814,6 +1814,35 @@ static int sunxi_nand_hw_common_ecc_ctrl_init(struct mtd_info *mtd,
 	if (!data)
 		return -ENOMEM;
 
+	if (ecc->options & NAND_ECC_MAXIMIZE) {
+		int bytes;
+
+		ecc->size = 1024;
+		nsectors = mtd->writesize / ecc->size;
+
+		/* Reserve 2 bytes for the BBM */
+		bytes = (mtd->oobsize - 2) / nsectors;
+
+		/* 4 non-ECC bytes are added before each ECC bytes section */
+		bytes -= 4;
+
+		/* and bytes has to be even. */
+		if (bytes % 2)
+			bytes--;
+
+		ecc->strength = bytes * 8 / fls(8 * ecc->size);
+
+		for (i = 0; i < ARRAY_SIZE(strengths); i++) {
+			if (strengths[i] > ecc->strength)
+				break;
+		}
+
+		if (!i)
+			ecc->strength = 0;
+		else
+			ecc->strength = strengths[i - 1];
+	}
+
 	if (ecc->size != 512 && ecc->size != 1024)
 		return -EINVAL;
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
