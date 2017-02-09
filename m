From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Subject: [PATCH v3 1/2] mtd: name the mtd device with an optional label property
Date: Thu,  9 Feb 2017 10:21:07 +0100
Message-ID: <1486632068-14894-2-git-send-email-clg@kaod.org>
References: <1486632068-14894-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1486632068-14894-1-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This can be used to easily identify a specific chip on a system with
multiple chips.

Suggested-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
---

 Changes since v2:

 - only assign device name from label if mtd->name is undefined

 Changes since v1:

 - moved the use of the "label" property from mtd_set_dev_defaults()
   to mtd_set_of_node() to let drivers keep control on how mtd->name
   is set and allocated.

 include/linux/mtd/mtd.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 13f8052b9ff9..5a08ddff4f51 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -24,6 +24,7 @@
 #include <linux/uio.h>
 #include <linux/notifier.h>
 #include <linux/device.h>
+#include <linux/of.h>
 
 #include <mtd/mtd-abi.h>
 
@@ -385,6 +386,8 @@ static inline void mtd_set_of_node(struct mtd_info *mtd,
 				   struct device_node *np)
 {
 	mtd->dev.of_node = np;
+	if (!mtd->name)
+		of_property_read_string(np, "label", &mtd->name);
 }
 
 static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
