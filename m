From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/5] mtd: nand: add core support for on-die ECC
Date: Tue, 21 Mar 2017 11:38:03 +0100
Message-ID: <1490092686-16509-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490092686-16509-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490092686-16509-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

A number of NAND flashes have a capability called "on-die ECC" where the
NAND chip itself is capable of detecting and correcting errors.

Linux already has support for using the ECC implementation of the NAND
controller, or a software based ECC implementation, but not for using
the ECC implementation of the NAND controller. However, such an
implementation is sometimes useful in situations where the NAND
controller provides ECC algorithms that are not strong enough for the
NAND chip used on the system. A typical case is a NAND chip that
requires a 4-bit ECC, while the NAND controller only provides a 1-bit
ECC algorithm.

This commit introduces the support for the NAND_ECC_ON_DIE ECC mode:

 - Parsing of the "on-die" value for the "nand-ecc-mode" Device Tree
   property

 - Handling NAND_ECC_ON_DIE case in nand_scan_tail(). The idea is that
   the vendor specific code for the NAND chip must implement
   ->read_page() and ->write_page(). It may optionally provide its own
   ->read_page_raw() and ->write_page_raw() as well. For OOB operation,
   we assume the standard operations are good enough, but they can be
   overridden by the vendor specific code if needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/mtd/nand/nand_base.c | 13 +++++++++++++
 include/linux/mtd/nand.h     |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 685376d..3a5512a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4107,6 +4107,7 @@ static const char * const nand_ecc_modes[] = {
 	[NAND_ECC_HW]		= "hw",
 	[NAND_ECC_HW_SYNDROME]	= "hw_syndrome",
 	[NAND_ECC_HW_OOB_FIRST]	= "hw_oob_first",
+	[NAND_ECC_ON_DIE]	= "on-die",
 };
 
 static int of_get_nand_ecc_mode(struct device_node *np)
@@ -4641,6 +4642,18 @@ int nand_scan_tail(struct mtd_info *mtd)
 		}
 		break;
 
+	case NAND_ECC_ON_DIE:
+		if (!ecc->read_page || !ecc->write_page) {
+			WARN(1, "No ECC functions supplied; on-die ECC not possible\n");
+			ret = -EINVAL;
+			goto err_free;
+		}
+		if (!ecc->read_oob)
+			ecc->read_oob = nand_read_oob_std;
+		if (!ecc->write_oob)
+			ecc->write_oob = nand_write_oob_std;
+		break;
+
 	case NAND_ECC_NONE:
 		pr_warn("NAND_ECC_NONE selected by board driver. This is not recommended!\n");
 		ecc->read_page = nand_read_page_raw;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c7de017..d27374c 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -116,6 +116,7 @@ typedef enum {
 	NAND_ECC_HW,
 	NAND_ECC_HW_SYNDROME,
 	NAND_ECC_HW_OOB_FIRST,
+	NAND_ECC_ON_DIE,
 } nand_ecc_modes_t;
 
 enum nand_ecc_algo {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
