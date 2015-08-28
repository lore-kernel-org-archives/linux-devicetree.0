From: Milo Kim <milo.kim@ti.com>
Subject: [RFC 1/4] of: add of_dev_get_platdata()
Date: Fri, 28 Aug 2015 18:12:05 +0900
Message-ID: <1440753128-3288-2-git-send-email-milo.kim@ti.com>
References: <1440753128-3288-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440753128-3288-1-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@linaro.org, devicetree@vger.kernel.org
Cc: Milo Kim <milo.kim@ti.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

of_dev_get_platdata()
  - provides unified handling of getting device platform data
  - supports DT and non-DT(legacy) cases
    if CONFIG_OF is not defined, then returns legacy function,
    'dev_get_platdata()'.
  - removes duplicated code from each driver
  - keeps driver specific code simple in each driver

Parser function - of_parse_dt_fn()
  Caller(aka driver) gets allocated platform data and optional private
  data. Then, it will parse the DT and copy properties into allocated
  platform data and use the private data if needed.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Felipe Balbi <balbi@ti.com>
Cc: Grant Likely <grant.likely@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 drivers/of/device.c       | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of_device.h | 12 ++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 8b91ea2..5793ba0 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -286,3 +286,49 @@ int of_device_uevent_modalias(struct device *dev, struct kobj_uevent_env *env)
 
 	return 0;
 }
+
+/**
+ * of_dev_get_platdata - get the platform data.
+ * @dev: device to get the platform data.
+ * @size: size of the platform data.
+ * @of_parse_dt_fn: device specific function to parse the device tree.
+ * @priv: driver private data to be passed to of_parse_dt_fn.
+ *
+ * This routine provides unified way of getting device platform data.
+ * If the platform data exists, just return it. It's exactly same as
+ * how to get device platform data by using dev_get_platdata().
+ * If the platform data is null, checks the device node. If the device tree is
+ * is supported, then allocates the device platform data and call back to
+ * driver specific 'of_parse_dt_fn'. The caller driver should handle data
+ * manipulation inside this function.
+ *
+ * of_parse_dt_fn() has three arguments. The first is device structure.
+ * The second is the pointer of allocated device platform data.
+ * The last one is private data pointer which is used in of_parse_dt_fn().
+ *
+ * Return value is a pointer of device platform data.
+ * Caller should check IS_ERR(pdata) and return PTR_ERR(pdata).
+ */
+void *of_dev_get_platdata(struct device *dev, size_t size,
+			  of_parse_dt_t of_parse_dt_fn, void *priv)
+{
+	void *pdata = dev_get_platdata(dev);
+	int err;
+
+	if (pdata)
+		return pdata;
+
+	if (!dev_of_node(dev) || !of_parse_dt_fn)
+		return NULL;
+
+	pdata = devm_kzalloc(dev, size, GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	err = of_parse_dt_fn(dev, pdata, priv);
+	if (err)
+		return ERR_PTR(err);
+
+	return pdata;
+}
+EXPORT_SYMBOL_GPL(of_dev_get_platdata);
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index cc7dd687..b24b3d8 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -10,6 +10,9 @@
 
 struct device;
 
+/* Device specific DT parser function */
+typedef int (*of_parse_dt_t)(struct device *, void *, void *);
+
 #ifdef CONFIG_OF
 extern const struct of_device_id *of_match_device(
 	const struct of_device_id *matches, const struct device *dev);
@@ -56,6 +59,9 @@ static inline struct device_node *of_cpu_device_node_get(int cpu)
 }
 
 void of_dma_configure(struct device *dev, struct device_node *np);
+
+extern void *of_dev_get_platdata(struct device *dev, size_t size,
+				 of_parse_dt_t of_parse_dt_fn, void *priv);
 #else /* CONFIG_OF */
 
 static inline int of_driver_match_device(struct device *dev,
@@ -100,6 +106,12 @@ static inline struct device_node *of_cpu_device_node_get(int cpu)
 }
 static inline void of_dma_configure(struct device *dev, struct device_node *np)
 {}
+
+static inline void *of_dev_get_platdata(struct device *dev, size_t size,
+				of_parse_dt_t of_parse_dt_fn, void *priv)
+{
+	return dev_get_platdata(dev);
+}
 #endif /* CONFIG_OF */
 
 #endif /* _LINUX_OF_DEVICE_H */
-- 
1.9.1
