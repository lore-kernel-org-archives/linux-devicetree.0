From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2 1/4] mtd: nand: add new enum for storing ECC algorithm
Date: Wed, 23 Mar 2016 11:19:00 +0100
Message-ID: <1458728343-1234-2-git-send-email-zajec5@gmail.com>
References: <1458728343-1234-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458728343-1234-1-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Our nand_ecc_modes_t is already a bit abused by value NAND_ECC_SOFT_BCH=
=2E
This enum should store ECC mode only and putting algorithm details ther=
e
is a bad idea. It would result in too many values impossible to support
in a sane way.

To solve this problem let's add a new enum. We'll have to modify all
drivers to set it properly but once it's done it'll be possible to drop
NAND_ECC_SOFT_BCH. That will result in a cleaner design and more
possibilities like setting ECC algorithm for hardware ECC mode.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 include/linux/mtd/nand.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 7604f4b..b818eb3 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -119,6 +119,12 @@ typedef enum {
 	NAND_ECC_SOFT_BCH,
 } nand_ecc_modes_t;
=20
+enum nand_ecc_algo {
+	NAND_ECC_UNKNOWN,
+	NAND_ECC_HAMMING,
+	NAND_ECC_BCH,
+};
+
 /*
  * Constants for Hardware ECC
  */
@@ -508,6 +514,7 @@ struct nand_hw_control {
  */
 struct nand_ecc_ctrl {
 	nand_ecc_modes_t mode;
+	enum nand_ecc_algo algo;
 	int steps;
 	int size;
 	int bytes;
--=20
1.8.4.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
