From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] of: add helper function to retrive match data
Date: Wed,  6 May 2015 20:09:09 +0200
Message-ID: <1430935749-3881-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: arnd-r2nGTMty4D4@public.gmane.org, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It's a common operation for device drivers to retrive the data
member from of_device_id struct in their probe function.

Most driver end up doing:
    const struct of_device_id *match;
    match = of_match_device(driver_of_match, &pdev->dev);
    driver->data = match->data;

With the of_device_get_match_data helper function all this can
done in one go.

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Hi DT maintainers,

Here is the patch to add of_device_get_match_data as indicated in:
http://marc.info/?l=devicetree&m=143068795621692&w=2

There are lot of device driver that can be simplified with this
helper function. After the function has gone upstream I will
spend some time getting some of them converted over.

Maybe someone with Coccinelle skills could create a script to
do some of the work also.

regards,
Joachim Eastwood

 drivers/of/device.c       | 12 ++++++++++++
 include/linux/of_device.h |  7 +++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 20c1332a0018..8b91ea241b10 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -163,6 +163,18 @@ void of_device_unregister(struct platform_device *ofdev)
 }
 EXPORT_SYMBOL(of_device_unregister);
 
+const void *of_device_get_match_data(const struct device *dev)
+{
+	const struct of_device_id *match;
+
+	match = of_match_device(dev->driver->of_match_table, dev);
+	if (!match)
+		return NULL;
+
+	return match->data;
+}
+EXPORT_SYMBOL(of_device_get_match_data);
+
 ssize_t of_device_get_modalias(struct device *dev, char *str, ssize_t len)
 {
 	const char *compat;
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index 22801b10cef5..3237d34e2ab1 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -33,6 +33,8 @@ extern int of_device_add(struct platform_device *pdev);
 extern int of_device_register(struct platform_device *ofdev);
 extern void of_device_unregister(struct platform_device *ofdev);
 
+extern const void *of_device_get_match_data(const struct device *dev);
+
 extern ssize_t of_device_get_modalias(struct device *dev,
 					char *str, ssize_t len);
 
@@ -65,6 +67,11 @@ static inline int of_driver_match_device(struct device *dev,
 static inline void of_device_uevent(struct device *dev,
 			struct kobj_uevent_env *env) { }
 
+static const void *of_device_get_match_data(const struct device *dev)
+{
+	return NULL;
+}
+
 static inline int of_device_get_modalias(struct device *dev,
 				   char *str, ssize_t len)
 {
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
