From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: [RFC 09/11] iio: Simplify iio_map_array_unregister API
Date: Thu, 31 Jan 2013 13:43:06 -0800
Message-ID: <1359668588-13678-10-git-send-email-linux@roeck-us.net>
References: <1359668588-13678-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359668588-13678-1-git-send-email-linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Instead of requiring the map to unregister, simply unregister all map entries
associated with the given iio device. This simplifies map removal and also works
for maps generated through devicetree.

Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
---
 drivers/iio/adc/lp8788_adc.c |   11 ++---------
 drivers/iio/adc/max1363.c    |    4 ++--
 drivers/iio/inkern.c         |   36 +++++++++++-------------------------
 include/linux/iio/driver.h   |    9 +++------
 4 files changed, 18 insertions(+), 42 deletions(-)

diff --git a/drivers/iio/adc/lp8788_adc.c b/drivers/iio/adc/lp8788_adc.c
index e5293d0..d6d509b 100644
--- a/drivers/iio/adc/lp8788_adc.c
+++ b/drivers/iio/adc/lp8788_adc.c
@@ -187,12 +187,6 @@ static int lp8788_iio_map_register(struct iio_dev *indio_dev,
 	return 0;
 }
 
-static inline void lp8788_iio_map_unregister(struct iio_dev *indio_dev,
-				struct lp8788_adc *adc)
-{
-	iio_map_array_unregister(indio_dev, adc->map);
-}
-
 static int lp8788_adc_probe(struct platform_device *pdev)
 {
 	struct lp8788 *lp = dev_get_drvdata(pdev->dev.parent);
@@ -231,7 +225,7 @@ static int lp8788_adc_probe(struct platform_device *pdev)
 	return 0;
 
 err_iio_device:
-	lp8788_iio_map_unregister(indio_dev, adc);
+	iio_map_array_unregister(indio_dev);
 err_iio_map:
 	iio_device_free(indio_dev);
 	return ret;
@@ -240,10 +234,9 @@ err_iio_map:
 static int lp8788_adc_remove(struct platform_device *pdev)
 {
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-	struct lp8788_adc *adc = iio_priv(indio_dev);
 
 	iio_device_unregister(indio_dev);
-	lp8788_iio_map_unregister(indio_dev, adc);
+	iio_map_array_unregister(indio_dev);
 	iio_device_free(indio_dev);
 
 	return 0;
diff --git a/drivers/iio/adc/max1363.c b/drivers/iio/adc/max1363.c
index fdc8be9..51165d6 100644
--- a/drivers/iio/adc/max1363.c
+++ b/drivers/iio/adc/max1363.c
@@ -1618,7 +1618,7 @@ error_disable_reg:
 error_put_reg:
 	regulator_put(st->reg);
 error_unregister_map:
-	iio_map_array_unregister(indio_dev, client->dev.platform_data);
+	iio_map_array_unregister(indio_dev);
 error_free_device:
 	iio_device_free(indio_dev);
 error_out:
@@ -1638,7 +1638,7 @@ static int max1363_remove(struct i2c_client *client)
 	kfree(indio_dev->available_scan_masks);
 	regulator_disable(st->reg);
 	regulator_put(st->reg);
-	iio_map_array_unregister(indio_dev, client->dev.platform_data);
+	iio_map_array_unregister(indio_dev);
 	iio_device_free(indio_dev);
 
 	return 0;
diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
index 58d0ffe..c42aba6 100644
--- a/drivers/iio/inkern.c
+++ b/drivers/iio/inkern.c
@@ -54,39 +54,25 @@ error_ret:
 EXPORT_SYMBOL_GPL(iio_map_array_register);
 
 
-/* Assumes the exact same array (e.g. memory locations)
- * used at unregistration as used at registration rather than
- * more complex checking of contents.
+/*
+ * Remove all map entries associated with the given iio device
  */
-int iio_map_array_unregister(struct iio_dev *indio_dev,
-			     struct iio_map *maps)
+int iio_map_array_unregister(struct iio_dev *indio_dev)
 {
-	int i = 0, ret = 0;
-	bool found_it;
+	int ret = -ENODEV;
 	struct iio_map_internal *mapi;
-
-	if (maps == NULL)
-		return 0;
+	struct list_head *pos, *tmp;
 
 	mutex_lock(&iio_map_list_lock);
-	while (maps[i].consumer_dev_name != NULL) {
-		found_it = false;
-		list_for_each_entry(mapi, &iio_map_list, l)
-			if (&maps[i] == mapi->map) {
-				list_del(&mapi->l);
-				kfree(mapi);
-				found_it = true;
-				break;
-			}
-		if (!found_it) {
-			ret = -ENODEV;
-			goto error_ret;
+	list_for_each_safe(pos, tmp, &iio_map_list) {
+		mapi = list_entry(pos, struct iio_map_internal, l);
+		if (indio_dev == mapi->indio_dev) {
+			list_del(&mapi->l);
+			kfree(mapi);
+			ret = 0;
 		}
-		i++;
 	}
-error_ret:
 	mutex_unlock(&iio_map_list_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(iio_map_array_unregister);
diff --git a/include/linux/iio/driver.h b/include/linux/iio/driver.h
index a4f8b2e..7dfb10e 100644
--- a/include/linux/iio/driver.h
+++ b/include/linux/iio/driver.h
@@ -22,13 +22,10 @@ int iio_map_array_register(struct iio_dev *indio_dev,
 			   struct iio_map *map);
 
 /**
- * iio_map_array_unregister() - tell the core to remove consumer mappings
+ * iio_map_array_unregister() - tell the core to remove consumer mappings for
+ *				the given provider device
  * @indio_dev:	provider device
- * @map:	array of mappings to remove. Note these must have same memory
- *		addresses as those originally added not just equal parameter
- *		values.
  */
-int iio_map_array_unregister(struct iio_dev *indio_dev,
-			     struct iio_map *map);
+int iio_map_array_unregister(struct iio_dev *indio_dev);
 
 #endif
-- 
1.7.9.7
