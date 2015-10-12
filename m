From: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv2 3/3] iio: ad5064: Always use external vref if there is no internal vref
Date: Mon, 12 Oct 2015 13:50:34 +0200
Message-ID: <1444650634-12025-3-git-send-email-paul.cercueil@analog.com>
References: <1444650634-12025-1-git-send-email-paul.cercueil@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444650634-12025-1-git-send-email-paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Michael Hennerich <Michael.Hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

If the device does not have an internal reference, there is no
other choice but to use the external reference. In that case,
it does not make much sense to have to specify it.

This patch ensures that the external reference is used if the
device does not feature an internal reference.

Signed-off-by: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
---
 drivers/iio/dac/ad5064.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

 v2: No change in this patch

diff --git a/drivers/iio/dac/ad5064.c b/drivers/iio/dac/ad5064.c
index e77631d..18674e5 100644
--- a/drivers/iio/dac/ad5064.c
+++ b/drivers/iio/dac/ad5064.c
@@ -464,14 +464,16 @@ static int ad5064_probe(struct device *dev, enum ad5064_type type,
 	for (i = 0; i < ad5064_num_vref(st); ++i)
 		st->vref_reg[i].supply = ad5064_vref_name(st, i);
 
-	if (dev->of_node) {
-		for (i = 0; ext_vref && i < ad5064_num_vref(st); ++i)
-			ext_vref = of_property_read_bool(dev->of_node,
-					ad5064_vref_name(st, i));
-	} else {
-		struct ad5064_platform_data *pdata = dev->platform_data;
-
-		ext_vref = pdata && pdata->use_external_ref;
+	if (st->chip_info->internal_vref) {
+		if (dev->of_node) {
+			for (i = 0; ext_vref && i < ad5064_num_vref(st); ++i)
+				ext_vref = of_property_read_bool(dev->of_node,
+						ad5064_vref_name(st, i));
+		} else {
+			struct ad5064_platform_data *pdata = dev->platform_data;
+
+			ext_vref = pdata && pdata->use_external_ref;
+		}
 	}
 
 	if (ext_vref) {
@@ -483,11 +485,6 @@ static int ad5064_probe(struct device *dev, enum ad5064_type type,
 		if (ret)
 			return ret;
 	} else {
-		if (!st->chip_info->internal_vref) {
-			dev_err(dev, "No vref available\n");
-			return -ENXIO;
-		}
-
 		st->use_internal_vref = true;
 		ret = ad5064_write(st, AD5064_CMD_CONFIG, 0,
 			AD5064_CONFIG_INT_VREF_ENABLE, 0);
-- 
2.5.3
