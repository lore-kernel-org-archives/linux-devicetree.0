From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2] isp1760: Fix endianness-sensitivity in of_isp1760_probe()
Date: Fri,  2 Dec 2011 16:58:18 +0000
Message-ID: <1322845098-19516-1-git-send-email-dave.martin@linaro.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Arvid Brodin <arvid.brodin-AM1FMPraTHU@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Data read direct from device tree properties will be in the device
tree's native endianness (i.e., big-endian).

This patch uses of_property_read_u32() to read the bus-width
property in host byte order instead.

Signed-off-by: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
---
Changes since v1:

v2: Rebased against v3.2-rc3
    Fix typo'd call to of_property_read_u32()

    Tested on Versatile Express with Pawel Moll's DT support series:
    http://lists.infradead.org/pipermail/linux-arm-kernel/2011-November/074440.html

 drivers/usb/host/isp1760-if.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/isp1760-if.c b/drivers/usb/host/isp1760-if.c
index a7dc1e1..b605224 100644
--- a/drivers/usb/host/isp1760-if.c
+++ b/drivers/usb/host/isp1760-if.c
@@ -47,9 +47,9 @@ static int of_isp1760_probe(struct platform_device *dev)
 	int virq;
 	resource_size_t res_len;
 	int ret;
-	const unsigned int *prop;
 	unsigned int devflags = 0;
 	enum of_gpio_flags gpio_flags;
+	u32 bus_width = 0;
 
 	drvdata = kzalloc(sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
@@ -77,8 +77,8 @@ static int of_isp1760_probe(struct platform_device *dev)
 		devflags |= ISP1760_FLAG_ISP1761;
 
 	/* Some systems wire up only 16 of the 32 data lines */
-	prop = of_get_property(dp, "bus-width", NULL);
-	if (prop && *prop == 16)
+	of_property_read_u32(dp, "bus-width", &bus_width);
+	if (bus_width == 16)
 		devflags |= ISP1760_FLAG_BUS_WIDTH_16;
 
 	if (of_get_property(dp, "port1-otg", NULL) != NULL)
-- 
1.7.4.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
