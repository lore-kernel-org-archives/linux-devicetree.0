From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: function to retrive of_device_id data
Date: Sun,  3 May 2015 23:19:03 +0200
Message-ID: <1430687943-13051-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi DT maintainers,

A common driver pattern for retrieving the data field in a of_device_id struct seems to be:

    const struct of_device_id *match;
    match = of_match_device(driver_of_match, &pdev->dev);
    driver->data = match->data;

I was looking for a simple function to perform the above action but couldn't find one.

What do you think about the following patch to add such a function?

---
 drivers/of/device.c       | 12 ++++++++++++
 include/linux/of_device.h |  7 +++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 46d6c75c1404..fd07bc55194a 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -79,6 +79,18 @@ void of_device_unregister(struct platform_device *ofdev)
 }
 EXPORT_SYMBOL(of_device_unregister);
 
+const void *of_device_get_data(const struct device *dev)
+{
+	const struct of_device_id *match;
+
+	match = of_match_device(dev->driver->of_match_table, dev);
+	if (!match)
+		return NULL;
+
+	return match->data;
+}
+EXPORT_SYMBOL(of_device_get_data);
+
 ssize_t of_device_get_modalias(struct device *dev, char *str, ssize_t len)
 {
 	const char *compat;
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index ef370210ffb2..78fddff259a0 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -33,6 +33,8 @@ extern int of_device_add(struct platform_device *pdev);
 extern int of_device_register(struct platform_device *ofdev);
 extern void of_device_unregister(struct platform_device *ofdev);
 
+extern const void *of_device_get_data(const struct device *dev);
+
 extern ssize_t of_device_get_modalias(struct device *dev,
 					char *str, ssize_t len);
 
@@ -64,6 +66,11 @@ static inline int of_driver_match_device(struct device *dev,
 static inline void of_device_uevent(struct device *dev,
 			struct kobj_uevent_env *env) { }
 
+static const void *of_device_get_data(const struct device *dev)
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
