From: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 2/4][v4] driver: mtd: update struct map_info's swap as per map requirement
Date: Thu, 15 Feb 2018 17:20:00 +0530
Message-ID: <20180215115000.23684-1-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, leoyang.li-3arQi8VN3Tc@public.gmane.org, Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>, Jagdish Gediya <jagdish.gediya-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It is not necessary for all device's maps to be CFI_HOST_ENDIAN.
Maps device can be Big endian or little endian.

Currently it is being taken care using CONFIG_MTD_CFI_LE_BYTE_SWAP or
CONFIG_MTD_CFI_BE_BYTE_SWAP i.e. compile time.

Now update struct map_info's swap field based on device characteristics
defined in device tree.

Signed-off-by: Jagdish Gediya <jagdish.gediya-3arQi8VN3Tc@public.gmane.org>
Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
---
Changes for v2: Incorporated review comments from Boris Brezillon
http://patchwork.ozlabs.org/patch/758381/
Changes for v3: None
Changes for v4: Updated code as per new defined binding of physmap.txt

 drivers/mtd/maps/physmap_of_core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/maps/physmap_of_core.c b/drivers/mtd/maps/physmap_of_core.c
index b1bd4faecfb2..6eee160dfb3d 100644
--- a/drivers/mtd/maps/physmap_of_core.c
+++ b/drivers/mtd/maps/physmap_of_core.c
@@ -20,6 +20,7 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/concat.h>
+#include <linux/mtd/cfi_endian.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
@@ -233,6 +234,13 @@ static int of_flash_probe(struct platform_device *dev)
 		info->list[i].map.bankwidth = be32_to_cpup(width);
 		info->list[i].map.device_node = dp;
 
+		if (of_property_read_bool(dp, "big-endian"))
+			info->list[i].map.swap = CFI_BIG_ENDIAN;
+		else if (of_property_read_bool(dp, "little-endian"))
+			info->list[i].map.swap = CFI_LITTLE_ENDIAN;
+		else
+			info->list[i].map.swap = CFI_HOST_ENDIAN;
+
 		err = of_flash_probe_gemini(dev, dp, &info->list[i].map);
 		if (err)
 			goto err_out;
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
