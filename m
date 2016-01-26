From: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 4/4] drm/layerscape: Add HDMI driver for freescale DCU
Date: Tue, 26 Jan 2016 12:00:33 +0800
Message-ID: <1453780833-32289-4-git-send-email-meng.yi@nxp.com>
References: <1453780833-32289-1-git-send-email-meng.yi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453780833-32289-1-git-send-email-meng.yi-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

DCU is the shortcut of 'display controller unit', some HDMI transmitter
attached to DCU, such as sii9022a, and this driver add the relavent
functions to DRM framewrok.

Signed-off-by: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
---
 .../bindings/display/bridge/sil,sii9022a.txt       |  40 +++
 drivers/gpu/drm/fsl-dcu/Makefile                   |   1 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h          |   1 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_hdmi.c         | 271 +++++++++++++++++++++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c          |  10 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_output.h       |  11 +
 6 files changed, 334 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/sil,sii9022a.txt
 create mode 100644 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_hdmi.c

diff --git a/Documentation/devicetree/bindings/display/bridge/sil,sii9022a.txt b/Documentation/devicetree/bindings/display/bridge/sil,sii9022a.txt
new file mode 100644
index 0000000..32a726a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/sil,sii9022a.txt
@@ -0,0 +1,40 @@
+Device-Tree bindings for the SiI902x hdmi transmitter.
+-----------------------------------------
+
+The SiI9022A is an ultra low-power HDMI transmitter. It supports resolutions from
+standard definition 480i/p and 576i/p all the way to high-definition 720p, 1080i,
+and 1080p, the highest resolution supported by HDTVs today. It also supports all
+PC resolutions up to UXGA for netbooks
+
+Required properties:
+- compatible: 	Should be "sil,sii9022a".
+- reg: 		The I2C address of the device.
+- interrupts:	Interrupt number to the cpu.
+
+Required nodes:
+
+The sii9022 has one video ports. Its connection is modelled using the OF
+graph bindings specified in Documentation/devicetree/bindings/graph.txt.
+
+- Video port 0 for the HDMI output
+
+Example:
+-------
+
+    sii9022: hdmi@39 {
+            compatible = "sil,sii9022a";
+            reg = <0x39>;
+            interrupts = <GIC_SPI 167 IRQ_TYPE_EDGE_RISING>;
+
+            ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                            reg = <1>;
+                            sii9022_out: endpoint {
+                                    remote-endpoint = <&hdmi_con>;
+                            };
+                    };
+            };
+    };
diff --git a/drivers/gpu/drm/fsl-dcu/Makefile b/drivers/gpu/drm/fsl-dcu/Makefile
index 6ea1523..98cacc2 100644
--- a/drivers/gpu/drm/fsl-dcu/Makefile
+++ b/drivers/gpu/drm/fsl-dcu/Makefile
@@ -1,6 +1,7 @@
 fsl-dcu-drm-y := fsl_dcu_drm_drv.o \
 		 fsl_dcu_drm_kms.o \
 		 fsl_dcu_drm_rgb.o \
+		 fsl_dcu_drm_hdmi.o \
 		 fsl_dcu_drm_plane.o \
 		 fsl_dcu_drm_crtc.o \
 		 fsl_dcu_drm_fbdev.o
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
index 579b9e4..3c85072 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
@@ -187,6 +187,7 @@ struct fsl_dcu_drm_device {
 	struct drm_fbdev_cma *fbdev;
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
+	struct drm_encoder_slave *slave;
 	struct fsl_dcu_drm_connector connector;
 	const struct fsl_dcu_soc_data *soc;
 };
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_hdmi.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_hdmi.c
new file mode 100644
index 0000000..0b06060
--- /dev/null
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_hdmi.c
@@ -0,0 +1,271 @@
+/*
+ * Copyright 2015 Freescale Semiconductor, Inc.
+ *
+ * Freescale DCU drm device driver
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/console.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/fb.h>
+#include <linux/fsl_devices.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/backlight.h>
+#include <video/videomode.h>
+#include <video/of_display_timing.h>
+
+#include <drm/drmP.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_encoder_slave.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_edid.h>
+
+#include "fsl_dcu_drm_drv.h"
+#include "fsl_dcu_drm_output.h"
+
+#define to_drm_encoder_slave(e) \
+	container_of(e, struct drm_encoder_slave, base)
+#define to_slave_funcs(e)	(to_drm_encoder_slave(e)->slave_funcs)
+static void fsl_dcu_drm_hdmienc_mode_set(struct drm_encoder *encoder,
+					 struct drm_display_mode *mode,
+					 struct drm_display_mode *adjusted_mode)
+{
+	const struct drm_encoder_slave_funcs *sfuncs = to_slave_funcs(encoder);
+
+	if (sfuncs->mode_set)
+		sfuncs->mode_set(encoder, mode, adjusted_mode);
+
+}
+
+static int
+fsl_dcu_drm_hdmienc_atomic_check(struct drm_encoder *encoder,
+				 struct drm_crtc_state *crtc_state,
+				 struct drm_connector_state *conn_state)
+{
+	return 0;
+}
+
+static void fsl_dcu_drm_hdmienc_disable(struct drm_encoder *encoder)
+{
+	const struct drm_encoder_slave_funcs *sfuncs = to_slave_funcs(encoder);
+
+	if (sfuncs->dpms)
+		sfuncs->dpms(encoder, DRM_MODE_DPMS_OFF);
+}
+
+static void fsl_dcu_drm_hdmienc_enable(struct drm_encoder *encoder)
+{
+	const struct drm_encoder_slave_funcs *sfuncs = to_slave_funcs(encoder);
+
+	if (sfuncs->dpms)
+		sfuncs->dpms(encoder, DRM_MODE_DPMS_ON);
+}
+
+static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
+	.atomic_check = fsl_dcu_drm_hdmienc_atomic_check,
+	.disable = fsl_dcu_drm_hdmienc_disable,
+	.enable = fsl_dcu_drm_hdmienc_enable,
+	.mode_set = fsl_dcu_drm_hdmienc_mode_set,
+};
+
+static void fsl_dcu_drm_hdmienc_destroy(struct drm_encoder *encoder)
+{
+	drm_encoder_cleanup(encoder);
+}
+
+static const struct drm_encoder_funcs encoder_funcs = {
+	.destroy = fsl_dcu_drm_hdmienc_destroy,
+};
+int fsl_dcu_drm_hdmienc_create(struct fsl_dcu_drm_device *fsl_dev,
+			       struct drm_crtc *crtc)
+{
+	struct drm_i2c_encoder_driver *driver;
+	struct drm_encoder_slave *enc_slave;
+	struct drm_encoder *encoder;
+	struct i2c_client *i2c_slave;
+	int ret;
+
+
+	struct device_node *np = of_find_compatible_node(NULL,
+					NULL, "sil,sii9022a");
+	if (np == NULL)
+		return -1;
+
+	/* Locate the slave I2C device and driver. */
+	i2c_slave = of_find_i2c_device_by_node(np);
+	if (!i2c_slave || !i2c_get_clientdata(i2c_slave))
+		return -EPROBE_DEFER;
+
+	enc_slave = devm_kzalloc(fsl_dev->dev, sizeof(*enc_slave), GFP_KERNEL);
+	if (!enc_slave)
+		return -1;
+
+	/* Initialize the slave encoder. */
+	driver = to_drm_i2c_encoder_driver(
+					to_i2c_driver(i2c_slave->dev.driver));
+	ret = driver->encoder_init(i2c_slave, fsl_dev->drm, enc_slave);
+	if (ret < 0)
+		return -1;
+
+	fsl_dev->slave = enc_slave;
+	encoder = &enc_slave->base;
+
+
+	encoder->possible_crtcs = 1;
+	ret = drm_encoder_init(fsl_dev->drm, encoder, &encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret < 0)
+		return ret;
+
+	drm_encoder_helper_add(encoder, &encoder_helper_funcs);
+	encoder->crtc = crtc;
+
+	return 0;
+}
+
+#define to_fsl_dcu_drm_hdmicon(connector) \
+	container_of(connector, struct fsl_dcu_drm_hdmicon, connector)
+
+static struct drm_encoder *fsl_dcu_drm_hdmi_find_encoder(struct drm_device *dev)
+{
+	struct drm_encoder *encoder;
+
+	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head) {
+		if (encoder->encoder_type == DRM_MODE_ENCODER_TMDS)
+			return encoder;
+	}
+
+	return NULL;
+}
+
+static void fsl_dcu_drm_hdmicon_destroy(struct drm_connector *connector)
+{
+	drm_connector_unregister(connector);
+	drm_connector_cleanup(connector);
+}
+
+static enum drm_connector_status
+fsl_dcu_drm_hdmicon_detect(struct drm_connector *connector, bool force)
+{
+	struct fsl_dcu_drm_hdmicon *hdmicon = to_fsl_dcu_drm_hdmicon(connector);
+
+	if (hdmicon->status == connector_status_disconnected)
+		return connector_status_disconnected;
+	else
+		return connector_status_connected;
+}
+
+static const struct drm_connector_funcs fsl_dcu_drm_connector_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.destroy = fsl_dcu_drm_hdmicon_destroy,
+	.detect = fsl_dcu_drm_hdmicon_detect,
+	.dpms = drm_atomic_helper_connector_dpms,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.reset = drm_atomic_helper_connector_reset,
+};
+
+static struct drm_encoder *
+fsl_dcu_drm_hdmicon_best_encoder(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+
+	return fsl_dcu_drm_hdmi_find_encoder(dev);
+}
+
+
+static int fsl_dcu_drm_hdmicon_get_modes(struct drm_connector *connector)
+{
+	struct fsl_dcu_drm_hdmicon *con = to_fsl_dcu_drm_hdmicon(connector);
+	const struct drm_encoder_slave_funcs *sfuncs = con->slave->slave_funcs;
+
+	if (sfuncs->get_modes == NULL)
+		return 0;
+
+	return sfuncs->get_modes(NULL, connector);
+}
+
+static int fsl_dcu_drm_hdmicon_mode_valid(struct drm_connector *connector,
+					  struct drm_display_mode *mode)
+{
+	if (mode->hdisplay > 1024)
+		return MODE_VIRTUAL_X;
+	else if	(mode->vdisplay > 768)
+		return MODE_VIRTUAL_Y;
+
+	return MODE_OK;
+}
+
+static const struct drm_connector_helper_funcs connector_helper_funcs = {
+	.best_encoder = fsl_dcu_drm_hdmicon_best_encoder,
+	.get_modes = fsl_dcu_drm_hdmicon_get_modes,
+	.mode_valid = fsl_dcu_drm_hdmicon_mode_valid,
+};
+
+int fsl_dcu_drm_hdmicon_create(struct fsl_dcu_drm_device *fsl_dev)
+{
+	struct drm_device *dev = fsl_dev->drm;
+	struct fsl_dcu_drm_hdmicon *hdmicon;
+	struct drm_connector *connector;
+	struct drm_encoder *encoder;
+	int ret;
+
+	hdmicon = devm_kzalloc(fsl_dev->dev,
+			       sizeof(struct fsl_dcu_drm_hdmicon), GFP_KERNEL);
+	if (!hdmicon)
+		return -ENOMEM;
+
+	hdmicon->slave = fsl_dev->slave;
+	connector = &hdmicon->connector;
+
+	connector->display_info.width_mm = 0;
+	connector->display_info.height_mm = 0;
+	connector->polled = DRM_CONNECTOR_POLL_HPD;
+
+	ret = drm_connector_init(fsl_dev->drm, connector,
+				 &fsl_dcu_drm_connector_funcs,
+				 DRM_MODE_CONNECTOR_HDMIA);
+	if (ret < 0)
+		return ret;
+
+	connector->dpms = DRM_MODE_DPMS_OFF;
+	drm_connector_helper_add(connector, &connector_helper_funcs);
+	ret = drm_connector_register(connector);
+	if (ret < 0)
+		goto err_cleanup;
+
+	encoder = fsl_dcu_drm_hdmi_find_encoder(dev);
+	if (!encoder)
+		goto err_cleanup;
+	ret = drm_mode_connector_attach_encoder(connector, encoder);
+	if (ret < 0)
+		goto err_sysfs;
+
+	connector->encoder = encoder;
+
+	drm_object_property_set_value
+		(&connector->base, fsl_dev->drm->mode_config.dpms_property,
+		DRM_MODE_DPMS_OFF);
+
+	return 0;
+
+err_sysfs:
+	drm_connector_unregister(connector);
+err_cleanup:
+	drm_connector_cleanup(connector);
+	return ret;
+}
+
+MODULE_AUTHOR("Freescale Semiconductor, Inc.");
+MODULE_DESCRIPTION("SII902x DVI/HDMI driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c
index 0ef5959..f42ef5f 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c
@@ -17,10 +17,18 @@
 #include "fsl_dcu_drm_crtc.h"
 #include "fsl_dcu_drm_drv.h"
 
+static void fsl_dcu_drm_output_poll_changed(struct drm_device *dev)
+{
+	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
+
+	drm_fbdev_cma_hotplug_event(fsl_dev->fbdev);
+}
+
 static const struct drm_mode_config_funcs fsl_dcu_drm_mode_config_funcs = {
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 	.fb_create = drm_fb_cma_create,
+	.output_poll_changed = fsl_dcu_drm_output_poll_changed,
 };
 
 int fsl_dcu_drm_modeset_init(struct fsl_dcu_drm_device *fsl_dev)
@@ -36,7 +44,9 @@ int fsl_dcu_drm_modeset_init(struct fsl_dcu_drm_device *fsl_dev)
 	drm_kms_helper_poll_init(fsl_dev->drm);
 	fsl_dcu_drm_crtc_create(fsl_dev);
 	fsl_dcu_drm_encoder_create(fsl_dev, &fsl_dev->crtc);
+	fsl_dcu_drm_hdmienc_create(fsl_dev, &fsl_dev->crtc);
 	fsl_dcu_drm_connector_create(fsl_dev, &fsl_dev->encoder);
+	fsl_dcu_drm_hdmicon_create(fsl_dev);
 	drm_mode_config_reset(fsl_dev->drm);
 
 	return 0;
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_output.h b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_output.h
index 7093109..fa0d7ed 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_output.h
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_output.h
@@ -18,6 +18,13 @@ struct fsl_dcu_drm_connector {
 	struct drm_panel *panel;
 };
 
+struct fsl_dcu_drm_hdmicon {
+	struct drm_connector connector;
+	struct drm_encoder_slave *slave;
+	struct i2c_client *client;
+	enum drm_connector_status status;
+};
+
 static inline struct fsl_dcu_drm_connector *
 to_fsl_dcu_connector(struct drm_connector *con)
 {
@@ -29,5 +36,9 @@ int fsl_dcu_drm_connector_create(struct fsl_dcu_drm_device *fsl_dev,
 				 struct drm_encoder *encoder);
 int fsl_dcu_drm_encoder_create(struct fsl_dcu_drm_device *fsl_dev,
 			       struct drm_crtc *crtc);
+int fsl_dcu_drm_hdmicon_create(struct fsl_dcu_drm_device *fsl_dev);
+int fsl_dcu_drm_hdmienc_create(struct fsl_dcu_drm_device *fsl_dev,
+			       struct drm_crtc *crtc);
+
 
 #endif /* __FSL_DCU_DRM_CONNECTOR_H__ */
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
