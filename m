From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 3/5] mtd: nand: export nand_{read,write}_page_raw()
Date: Tue, 21 Mar 2017 11:38:04 +0100
Message-ID: <1490092686-16509-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490092686-16509-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490092686-16509-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The nand_read_page_raw() and nand_write_page_raw() functions might be
re-used by vendor-specific implementations of the read_page/write_page
functions. Instead of having vendor-specific code duplicate this code,
it is much better to export those functions and allow them to be
re-used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/mtd/nand/nand_base.c | 10 ++++++----
 include/linux/mtd/nand.h     |  8 ++++++++
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 3a5512a..915c3d5 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1460,14 +1460,15 @@ EXPORT_SYMBOL(nand_check_erased_ecc_chunk);
  *
  * Not for syndrome calculating ECC controllers, which use a special oob layout.
  */
-static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-			      uint8_t *buf, int oob_required, int page)
+int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+		       uint8_t *buf, int oob_required, int page)
 {
 	chip->read_buf(mtd, buf, mtd->writesize);
 	if (oob_required)
 		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
 	return 0;
 }
+EXPORT_SYMBOL(nand_read_page_raw);
 
 /**
  * nand_read_page_raw_syndrome - [INTERN] read raw page data without ecc
@@ -2404,8 +2405,8 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
  *
  * Not for syndrome calculating ECC controllers, which use a special oob layout.
  */
-static int nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-			       const uint8_t *buf, int oob_required, int page)
+int nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+			const uint8_t *buf, int oob_required, int page)
 {
 	chip->write_buf(mtd, buf, mtd->writesize);
 	if (oob_required)
@@ -2413,6 +2414,7 @@ static int nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 
 	return 0;
 }
+EXPORT_SYMBOL(nand_write_page_raw);
 
 /**
  * nand_write_page_raw_syndrome - [INTERN] raw page write function
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index d27374c..5fc705d 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -1261,6 +1261,14 @@ int nand_read_oob_std(struct mtd_info *mtd, struct nand_chip *chip, int page);
 int nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 			   int page);
 
+/* Default read_page_raw implementation */
+int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+		       uint8_t *buf, int oob_required, int page);
+
+/* Default write_page_raw implementation */
+int nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+			const uint8_t *buf, int oob_required, int page);
+
 /* Reset and initialize a NAND device */
 int nand_reset(struct nand_chip *chip, int chipnr);
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
