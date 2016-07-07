From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 01/22] of: device: Support loading a module with OF based modalias
Date: Thu,  7 Jul 2016 15:20:52 -0700
Message-ID: <20160707222114.1673-2-stephen.boyd@linaro.org>
References: <20160707222114.1673-1-stephen.boyd@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160707222114.1673-1-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In the case of ULPI devices, we want to be able to load the
driver before registering the device so that we don't get stuck
in a loop waiting for the phy module to appear and failing usb
controller probe. Currently we request the ulpi module via the
ulpi ids, but in the DT case we might need to request it with the
OF based modalias instead. Add a common function that allows
anyone to request a module with the OF based modalias.

Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/device.c       | 23 +++++++++++++++++++++++
 include/linux/of_device.h |  6 ++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index fd5cfad7c403..8a22a253a830 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -226,6 +226,29 @@ ssize_t of_device_get_modalias(struct device *dev, char *str, ssize_t len)
 	return tsize;
 }
 
+int of_device_request_module(struct device *dev)
+{
+	char *str;
+	ssize_t size;
+	int ret;
+
+	size = of_device_get_modalias(dev, NULL, 0);
+	if (size < 0)
+		return size;
+
+	str = kmalloc(size + 1, GFP_KERNEL);
+	if (!str)
+		return -ENOMEM;
+
+	of_device_get_modalias(dev, str, size);
+	str[size] = '\0';
+	ret = request_module(str);
+	kfree(str);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(of_device_request_module);
+
 /**
  * of_device_uevent - Display OF related uevent information
  */
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index cc7dd687a89d..e9afbcc8de12 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -37,6 +37,7 @@ extern const void *of_device_get_match_data(const struct device *dev);
 
 extern ssize_t of_device_get_modalias(struct device *dev,
 					char *str, ssize_t len);
+extern int of_device_request_module(struct device *dev);
 
 extern void of_device_uevent(struct device *dev, struct kobj_uevent_env *env);
 extern int of_device_uevent_modalias(struct device *dev, struct kobj_uevent_env *env);
@@ -78,6 +79,11 @@ static inline int of_device_get_modalias(struct device *dev,
 	return -ENODEV;
 }
 
+static inline int of_device_request_module(struct device *dev)
+{
+	return -ENODEV;
+}
+
 static inline int of_device_uevent_modalias(struct device *dev,
 				   struct kobj_uevent_env *env)
 {
-- 
2.9.0.rc2.8.ga28705d

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
