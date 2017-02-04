From: <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: patch "of: device: Support loading a module with OF based modalias" added to usb-testing
Date: Sat, 04 Feb 2017 09:14:46 +0100
Message-ID: <148619608625164@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, peter.chen-3arQi8VN3Tc@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    of: device: Support loading a module with OF based modalias

to my usb git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
in the usb-testing branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will be merged to the usb-next branch sometime soon,
after it passes testing, and the merge window is open.

If you have any questions about this process, please let me know.


>From 9c829c097f2f1cbebcfff69a7254b1df9852fe4e Mon Sep 17 00:00:00 2001
From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Wed, 28 Dec 2016 14:56:47 -0800
Subject: of: device: Support loading a module with OF based modalias

In the case of ULPI devices, we want to be able to load the
driver before registering the device so that we don't get stuck
in a loop waiting for the phy module to appear and failing usb
controller probe. Currently we request the ulpi module via the
ulpi ids, but in the DT case we might need to request it with the
OF based modalias instead. Add a common function that allows
anyone to request a module with the OF based modalias.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
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
2.11.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
