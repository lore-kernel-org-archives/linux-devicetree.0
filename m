From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/2] mtd: Kill the OF_MTD Kconfig option
Date: Sat, 17 Sep 2016 19:57:11 +0200
Message-ID: <1474135031-29443-2-git-send-email-boris.brezillon@free-electrons.com>
References: <1474135031-29443-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474135031-29443-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Commit d48f62b9a0a0 ("mtd: nand: move of_get_nand_xxx() helpers into
nand_base.c") removed the drivers/of/of_mtd.c file but did not remove
the associated OF_MTD Kconfig option.

Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/of/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index bc07ad30c9bf..ba7b034b2b91 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -90,10 +90,6 @@ config OF_PCI_IRQ
 	help
 	  OpenFirmware PCI IRQ routing helpers
 
-config OF_MTD
-	depends on MTD
-	def_bool y
-
 config OF_RESERVED_MEM
 	depends on OF_EARLY_FLATTREE
 	bool
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
