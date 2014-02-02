From: Davor Joja <davorjoja-bBue3UIS71U2IjGS+8YXRQ@public.gmane.org>
Subject: [RFC 1/2] gpu: drm: Xylon DRM binding example driver
Date: Sun, 2 Feb 2014 19:31:22 +0100
Message-ID: <12f913ba-b70f-41a0-8008-a284d03ded37@mail.xylon.local>
References: <1391365883-18071-1-git-send-email-davorjoja@logicbricks.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391365883-18071-1-git-send-email-davorjoja-bBue3UIS71U2IjGS+8YXRQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Davor Joja <davorjoja-bBue3UIS71U2IjGS+8YXRQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Xylon DRM driver as example for binding DRM driver and logiCVC IP core.

Signed-off-by: Davor Joja <davorjoja-bBue3UIS71U2IjGS+8YXRQ@public.gmane.org>
---
 drivers/gpu/drm/xylon-drm-binding/Kconfig         |    5 +
 drivers/gpu/drm/xylon-drm-binding/Makefile        |    3 +
 drivers/gpu/drm/xylon-drm-binding/xylon_drv.c     |  117 +++++++++++
 drivers/gpu/drm/xylon-drm-binding/xylon_logicvc.c |  223 +++++++++++++++++++++
 drivers/gpu/drm/xylon-drm-binding/xylon_logicvc.h |   27 +++
 5 files changed, 375 insertions(+)
 create mode 100644 drivers/gpu/drm/xylon-drm-binding/Kconfig
 create mode 100644 drivers/gpu/drm/xylon-drm-binding/Makefile
 create mode 100644 drivers/gpu/drm/xylon-drm-binding/xylon_drv.c
 create mode 100644 drivers/gpu/drm/xylon-drm-binding/xylon_logicvc.c
 create mode 100644 drivers/gpu/drm/xylon-drm-binding/xylon_logicvc.h

diff --git a/drivers/gpu/drm/xylon-drm-binding/Kconfig b/drivers/gpu/drm/xylon-drm-binding/Kconfig
new file mode 100644
index 0000000..db04702
--- /dev/null
+++ b/drivers/gpu/drm/xylon-drm-binding/Kconfig
@@ -0,0 +1,5 @@
+config DRM_XYLON_BINDING
+	tristate "Xylon DRM binding"
+	depends on DRM
+	help
+	  DRM driver for Xylon logiCVC IP core binding.
diff --git a/drivers/gpu/drm/xylon-drm-binding/Makefile b/drivers/gpu/drm/xylon-drm-binding/Makefile
new file mode 100644
index 0000000..c4cbbc4
--- /dev/null
+++ b/drivers/gpu/drm/xylon-drm-binding/Makefile
@@ -0,0 +1,3 @@
+xylon_drm_binding-y := xylon_drv.o xylon_logicvc.o
+
+obj-$(CONFIG_DRM_XYLON_BINDING) += xylon_drm_binding.o
diff --git a/drivers/gpu/drm/xylon-drm-binding/xylon_drv.c b/drivers/gpu/drm/xylon-drm-binding/xylon_drv.c
new file mode 100644
index 0000000..6137477
--- /dev/null
+++ b/drivers/gpu/drm/xylon-drm-binding/xylon_drv.c
@@ -0,0 +1,117 @@
+/*
+ * Xylon logiCVC binding
+ *
+ * Author: Davor Joja <davor.joja-bBue3UIS71U2IjGS+8YXRQ@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <drm/drmP.h>
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "xylon_logicvc.h"
+
+#define DEVICE_NAME "logicvc"
+
+#define DRIVER_NAME "xylon-drm"
+#define DRIVER_DESCRIPTION "Xylon DRM driver for logiCVC IP core"
+#define DRIVER_VERSION "1.0"
+#define DRIVER_DATE "20140131"
+
+#define DRIVER_MAJOR 1
+#define DRIVER_MINOR 0
+
+static int xylon_drm_load(struct drm_device *dev, unsigned long flags)
+{
+	struct platform_device *pdev = dev->platformdev;
+	struct device_node *dn;
+	struct xylon_cvc *cvc;
+	u32 var32;
+	int ret;
+
+	dn = of_parse_phandle(dev->dev->of_node, "device", 0);
+	if (!dn) {
+		DRM_ERROR("failed get logicvc\n");
+		return -ENODEV;
+	}
+
+	cvc = xylon_cvc_binding(dev->dev, dn);
+	if (IS_ERR(cvc)) {
+		DRM_ERROR("failed initialize logicvc\n");
+		return PTR_ERR(cvc);
+	}
+
+	ret = of_property_read_u32(dev->dev->of_node, "private-plane", &var32);
+	if (ret) {
+		DRM_ERROR("failed get private-plane\n");
+		return ret;
+	}
+	cvc->private_plane = (u8)var32;
+	DRM_INFO("private plane %d\n", cvc->private_plane);
+
+	dev->dev_private = cvc;
+
+	platform_set_drvdata(pdev, cvc);
+
+	return 0;
+}
+
+static int xylon_drm_unload(struct drm_device *dev)
+{
+	return 0;
+}
+
+static struct drm_driver xylon_drm_driver = {
+	.load = xylon_drm_load,
+	.unload = xylon_drm_unload,
+
+	.name = DRIVER_NAME,
+	.desc = DRIVER_DESCRIPTION,
+	.date = DRIVER_DATE,
+	.major = DRIVER_MAJOR,
+	.minor = DRIVER_MINOR,
+};
+
+static int xylon_drm_platform_probe(struct platform_device *pdev)
+{
+	return drm_platform_init(&xylon_drm_driver, pdev);
+}
+
+static int xylon_drm_platform_remove(struct platform_device *pdev)
+{
+	drm_platform_exit(&xylon_drm_driver, pdev);
+
+	return 0;
+}
+
+static const struct of_device_id xylon_drm_of_match[] = {
+	{ .compatible = "xylon,drm-1.00.a", },
+	{ /* end of table */ },
+};
+MODULE_DEVICE_TABLE(of, xylon_drm_of_match);
+
+static struct platform_driver xylon_drm_platform_driver = {
+	.probe = xylon_drm_platform_probe,
+	.remove = xylon_drm_platform_remove,
+	.driver = {
+		.owner = THIS_MODULE,
+		.name = DRIVER_NAME,
+		.of_match_table = xylon_drm_of_match,
+	},
+};
+
+module_platform_driver(xylon_drm_platform_driver);
+
+MODULE_AUTHOR("Xylon d.o.o.");
+MODULE_DESCRIPTION(DRIVER_DESCRIPTION);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/xylon-drm-binding/xylon_logicvc.c b/drivers/gpu/drm/xylon-drm-binding/xylon_logicvc.c
new file mode 100644
index 0000000..b5db248
--- /dev/null
+++ b/drivers/gpu/drm/xylon-drm-binding/xylon_logicvc.c
@@ -0,0 +1,223 @@
+/*
+ * Xylon logiCVC binding
+ *
+ * Author: Davor Joja <davor.joja-bBue3UIS71U2IjGS+8YXRQ@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <drm/drmP.h>
+
+#include <linux/errno.h>
+#include <linux/of.h>
+
+#include "xylon_logicvc.h"
+
+#define LOGICVC_MAX_LAYERS 5
+
+#define LOGICVC_READABLE_REGS 0x1
+#define LOGICVC_SIZE_POSITION 0x2
+
+struct xylon_cvc_layer_fix_data_info {
+	unsigned char id:4;
+};
+
+struct xylon_cvc_layer_fix_data {
+	struct xylon_cvc_layer_fix_data_info info;
+	u32 address;
+	u8 bpp;
+	u8 format;
+	u8 transparency;
+};
+
+struct xylon_cvc_layer_data {
+	struct xylon_cvc_layer_fix_data fix_data;
+	struct xylon_cvc *cvc;
+	unsigned char ctrl_flags;
+};
+
+struct xylon_cvc_hw {
+	struct xylon_cvc_layer_data *layer_data[LOGICVC_MAX_LAYERS];
+	u32 flags;
+	u16 pixel_stride;
+	u8 bg_layer_bpp;
+	u8 display_info;
+	u8 layers;
+};
+
+static int xylon_parse_hw_info(struct device *dev, struct device_node *dn,
+				struct xylon_cvc *cvc)
+{
+	struct xylon_cvc_hw *cvc_hw = cvc->cvc_hw;
+	int ret;
+	u32 var32;
+
+	if (of_property_read_bool(dn, "background-layer-bits-per-pixel")) {
+		ret = of_property_read_u32(dn,
+				"background-layer-bits-per-pixel", &var32);
+		if (ret) {
+			DRM_ERROR("failed get background-layer-bits-per-pixel\n");
+			goto error;
+		}
+		cvc_hw->bg_layer_bpp = (u8)var32;
+	}
+	DRM_INFO("bg layer bpp %d\n", cvc_hw->bg_layer_bpp);
+
+	ret = of_property_read_u32(dn, "interface", &var32);
+	if (ret) {
+		DRM_ERROR("failed get interface\n");
+		goto error;
+	}
+	cvc_hw->display_info = var32 << 4;
+
+	ret = of_property_read_u32(dn, "color-space", &var32);
+	if (ret) {
+		DRM_ERROR("failed get color-space\n");
+		goto error;
+	}
+	cvc_hw->display_info |= var32;
+	DRM_INFO("display info %X\n", cvc_hw->display_info);
+
+	if (of_property_read_bool(dn, "is-readable-regs"))
+		cvc_hw->flags |= LOGICVC_READABLE_REGS;
+	else
+		DRM_INFO("logicvc registers not readable\n");
+
+	if (of_property_read_bool(dn, "is-size-position"))
+		cvc_hw->flags |= LOGICVC_SIZE_POSITION;
+	else
+		DRM_INFO("logicvc size-position disabled\n");
+
+	ret = of_property_read_u32(dn, "pixel-stride", &var32);
+	if (ret) {
+		DRM_ERROR("failed get pixel-stride\n");
+		goto error;
+	}
+	cvc_hw->pixel_stride = (u16)var32;
+	DRM_INFO("line pixel stride %d\n", cvc_hw->pixel_stride);
+
+	return 0;
+
+error:
+	return ret;
+}
+
+static int xylonfb_parse_layer_info(struct device *dev,
+				struct device_node *parent_dn,
+				struct xylon_cvc *cvc, int id)
+{
+	struct xylon_cvc_hw *cvc_hw = cvc->cvc_hw;
+	struct device_node *dn;
+	struct xylon_cvc_layer_data *layer_data;
+	u32 var32;
+	int ret;
+	char layer_name[10];
+
+	snprintf(layer_name, sizeof(layer_name), "layer_%d", id);
+	dn = of_get_child_by_name(parent_dn, layer_name);
+	if (!dn)
+		return -ENOENT;
+
+	cvc_hw->layers++;
+
+	layer_data = devm_kzalloc(dev, sizeof(*layer_data), GFP_KERNEL);
+	if (!layer_data) {
+		DRM_ERROR("failed allocate layer data %d\n", id);
+		return -ENOMEM;
+	}
+	cvc_hw->layer_data[id] = layer_data;
+
+	layer_data->fix_data.info.id = id;
+
+	DRM_INFO("layer %d\n", id + 1);
+
+	if (of_property_read_bool(dn, "address")) {
+		ret = of_property_read_u32(dn, "address",
+					&layer_data->fix_data.address);
+		if (ret) {
+			DRM_ERROR("failed get address\n");
+			goto error;
+		}
+	}
+	DRM_INFO("address 0x%X\n", layer_data->fix_data.address);
+
+	ret = of_property_read_u32(dn, "bits-per-pixel", &var32);
+	if (ret) {
+		DRM_ERROR("failed get bits-per-pixel\n");
+		goto error;
+	}
+	layer_data->fix_data.bpp = (u8)var32;
+	DRM_INFO("bits per pixel %d\n", layer_data->fix_data.bpp);
+
+	ret = of_property_read_u32(dn, "format", &var32);
+	if (ret) {
+		DRM_ERROR("failed get format\n");
+		goto error;
+	}
+	layer_data->fix_data.format = (u8)var32;
+	DRM_INFO("format %d\n", layer_data->fix_data.format);
+
+	ret = of_property_read_u32(dn, "transparency", &var32);
+	if (ret) {
+		DRM_ERROR("failed get transparency\n");
+		goto error;
+	}
+	layer_data->fix_data.transparency = (u8)var32;
+	DRM_INFO("transparency %d\n", layer_data->fix_data.transparency);
+
+	return 0;
+
+error:
+	return ret;
+}
+
+static struct of_device_id cvc_of_match[] = {
+	{ .compatible = "xylon,logicvc-4.00.a" },
+	{/* end of table */},
+};
+MODULE_DEVICE_TABLE(of, cvc_of_match);
+
+struct xylon_cvc *xylon_cvc_binding(struct device *dev, struct device_node *dn)
+{
+	const struct of_device_id *match;
+	struct xylon_cvc *cvc;
+	struct xylon_cvc_hw *cvc_hw;
+	int i;
+	int ret;
+
+	match = of_match_node(cvc_of_match, dn);
+	if (!match) {
+		DRM_ERROR("failed match cvc\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	cvc = devm_kzalloc(dev, sizeof(*cvc), GFP_KERNEL);
+	if (!cvc) {
+		DRM_ERROR("failed allocate cvc\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	cvc_hw = devm_kzalloc(dev, sizeof(*cvc_hw), GFP_KERNEL);
+	if (!cvc_hw) {
+		DRM_ERROR("failed allocate cvc_hw\n");
+		return ERR_PTR(-ENOMEM);
+	}
+	cvc->cvc_hw = cvc_hw;
+
+	ret = xylon_parse_hw_info(dev, dn, cvc);
+	if (ret)
+		return ERR_PTR(ret);
+
+	for (i = 0; i < LOGICVC_MAX_LAYERS; i++)
+		if (xylonfb_parse_layer_info(dev, dn, cvc, i))
+			break;
+
+	return cvc;
+}
diff --git a/drivers/gpu/drm/xylon-drm-binding/xylon_logicvc.h b/drivers/gpu/drm/xylon-drm-binding/xylon_logicvc.h
new file mode 100644
index 0000000..1b3e3db
--- /dev/null
+++ b/drivers/gpu/drm/xylon-drm-binding/xylon_logicvc.h
@@ -0,0 +1,27 @@
+/*
+ * Xylon logiCVC binding
+ *
+ * Author: Davor Joja <davor.joja-bBue3UIS71U2IjGS+8YXRQ@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _XYLON_LOGICVC_H_
+#define _XYLON_LOGICVC_H_
+
+struct xylon_cvc {
+	struct xylon_cvc_hw *cvc_hw;
+	u8 private_plane;
+};
+
+struct xylon_cvc
+*xylon_cvc_binding(struct device *dev, struct device_node *node);
+
+#endif /* _XYLON_LOGICVC_H_ */
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
