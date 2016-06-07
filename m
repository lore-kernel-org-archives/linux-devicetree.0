From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v6 1/2] drm/bridge: Add sii902x driver
Date: Tue,  7 Jun 2016 13:59:22 +0200
Message-ID: <1465300763-19386-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Xiubo Li <lixiubo-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>, Alison Wang <alison.wang-3arQi8VN3Tc@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add basic support for the sii902x RGB -> HDMI bridge.
This driver does not support audio output yet.

Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Tested-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
Hello,

This patch is only adding basic support for the sii9022 chip.
As stated in the commit log, there's no audio support, but the
driver also hardcodes a lot of things (like the RGB input format to
use).

Best Regards,

Boris

Changes in v6:
- use HDMI_INFOFRAME_SIZE(AVI)
- fix reset_gpio initialization
- reduce the reset time based on Ming feedback

Changes in v5:
- drop the best_encoder() implementation

Changes in v4:
- make reset GPIO optional
- only support attaching to DRM devices supporting atomic updates

Changes in v3:
- fix get_modes() implementation to avoid turning the screen in power
  save mode
- rename the driver (sil902x -> sii902x)

Changes in v2:
- fix errors reported by the kbuild robot

fixup! drm: bridge: Add sii902x driver
---
 drivers/gpu/drm/bridge/Kconfig   |   8 +
 drivers/gpu/drm/bridge/Makefile  |   1 +
 drivers/gpu/drm/bridge/sii902x.c | 459 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 468 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/sii902x.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 8f7423f..a1419214 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -50,6 +50,14 @@ config DRM_PARADE_PS8622
 	---help---
 	  Parade eDP-LVDS bridge chip driver.
 
+config DRM_SII902X
+	tristate "Silicon Image sii902x RGB/HDMI bridge"
+	depends on OF
+	select DRM_KMS_HELPER
+	select REGMAP_I2C
+	---help---
+	  Silicon Image sii902x bridge chip driver.
+
 source "drivers/gpu/drm/bridge/analogix/Kconfig"
 
 endmenu
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 96b13b3..bfec9f8 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_DW_HDMI) += dw-hdmi.o
 obj-$(CONFIG_DRM_DW_HDMI_AHB_AUDIO) += dw-hdmi-ahb-audio.o
 obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
 obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
+obj-$(CONFIG_DRM_SII902X) += sii902x.o
 obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix/
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
new file mode 100644
index 0000000..d46bf98
--- /dev/null
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -0,0 +1,459 @@
+/*
+ * Copyright (C) 2014 Atmel
+ *		      Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
+ *
+ * Authors:	      Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
+ *		      Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
+ *		      Wu, Songjun <Songjun.Wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
+ *
+ *
+ * Copyright (C) 2010-2011 Freescale Semiconductor, Inc. All Rights Reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/component.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/regmap.h>
+
+#include <drm/drmP.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_encoder_slave.h>
+
+#define SIL902X_TPI_VIDEO_DATA			0x0
+
+#define SIL902X_TPI_PIXEL_REPETITION		0x8
+#define SIL902X_TPI_AVI_PIXEL_REP_BUS_24BIT     BIT(5)
+#define SIL902X_TPI_AVI_PIXEL_REP_RISING_EDGE   BIT(4)
+#define SIL902X_TPI_AVI_PIXEL_REP_4X		3
+#define SIL902X_TPI_AVI_PIXEL_REP_2X		1
+#define SIL902X_TPI_AVI_PIXEL_REP_NONE		0
+#define SIL902X_TPI_CLK_RATIO_HALF		(0 << 6)
+#define SIL902X_TPI_CLK_RATIO_1X		(1 << 6)
+#define SIL902X_TPI_CLK_RATIO_2X		(2 << 6)
+#define SIL902X_TPI_CLK_RATIO_4X		(3 << 6)
+
+#define SIL902X_TPI_AVI_IN_FORMAT		0x9
+#define SIL902X_TPI_AVI_INPUT_BITMODE_12BIT	BIT(7)
+#define SIL902X_TPI_AVI_INPUT_DITHER		BIT(6)
+#define SIL902X_TPI_AVI_INPUT_RANGE_LIMITED	(2 << 2)
+#define SIL902X_TPI_AVI_INPUT_RANGE_FULL	(1 << 2)
+#define SIL902X_TPI_AVI_INPUT_RANGE_AUTO	(0 << 2)
+#define SIL902X_TPI_AVI_INPUT_COLORSPACE_BLACK	(3 << 0)
+#define SIL902X_TPI_AVI_INPUT_COLORSPACE_YUV422	(2 << 0)
+#define SIL902X_TPI_AVI_INPUT_COLORSPACE_YUV444	(1 << 0)
+#define SIL902X_TPI_AVI_INPUT_COLORSPACE_RGB	(0 << 0)
+
+#define SIL902X_TPI_AVI_INFOFRAME		0x0c
+
+#define SIL902X_SYS_CTRL_DATA			0x1a
+#define SIL902X_SYS_CTRL_PWR_DWN		BIT(4)
+#define SIL902X_SYS_CTRL_AV_MUTE		BIT(3)
+#define SIL902X_SYS_CTRL_DDC_BUS_REQ		BIT(2)
+#define SIL902X_SYS_CTRL_DDC_BUS_GRTD		BIT(1)
+#define SIL902X_SYS_CTRL_OUTPUT_MODE		BIT(0)
+#define SIL902X_SYS_CTRL_OUTPUT_HDMI		1
+#define SIL902X_SYS_CTRL_OUTPUT_DVI		0
+
+#define SIL902X_REG_CHIPID(n)			(0x1b + (n))
+
+#define SIL902X_PWR_STATE_CTRL			0x1e
+#define SIL902X_AVI_POWER_STATE_MSK		GENMASK(1, 0)
+#define SIL902X_AVI_POWER_STATE_D(l)		((l) & SIL902X_AVI_POWER_STATE_MSK)
+
+#define SI902X_INT_ENABLE			0x3c
+#define SI902X_INT_STATUS			0x3d
+#define SI902X_HOTPLUG_EVENT			BIT(0)
+#define SI902X_PLUGGED_STATUS			BIT(2)
+
+#define SIL902X_REG_TPI_RQB			0xc7
+
+struct sii902x {
+	struct i2c_client *i2c;
+	struct regmap *regmap;
+	struct drm_bridge bridge;
+	struct drm_connector connector;
+	struct gpio_desc *reset_gpio;
+	struct work_struct hotplug_work;
+};
+
+static inline struct sii902x *bridge_to_sii902x(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct sii902x, bridge);
+}
+
+static inline struct sii902x *connector_to_sii902x(struct drm_connector *con)
+{
+	return container_of(con, struct sii902x, connector);
+}
+
+static void sii902x_reset(struct sii902x *sii902x)
+{
+	if (!sii902x->reset_gpio)
+		return;
+
+	gpiod_set_value(sii902x->reset_gpio, 1);
+
+	/* The datasheet says treset-min = 100us. Make it 150us to be sure. */
+	usleep_range(150, 200);
+
+	gpiod_set_value(sii902x->reset_gpio, 0);
+}
+
+static void sii902x_connector_destroy(struct drm_connector *connector)
+{
+	drm_connector_unregister(connector);
+	drm_connector_cleanup(connector);
+}
+
+static enum drm_connector_status
+sii902x_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct sii902x *sii902x = connector_to_sii902x(connector);
+	unsigned int status;
+
+	regmap_read(sii902x->regmap, SI902X_INT_STATUS, &status);
+
+	return (status & SI902X_PLUGGED_STATUS) ?
+	       connector_status_connected : connector_status_disconnected;
+}
+
+static const struct drm_connector_funcs sii902x_connector_funcs = {
+	.dpms = drm_atomic_helper_connector_dpms,
+	.detect = sii902x_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = sii902x_connector_destroy,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int sii902x_get_modes(struct drm_connector *connector)
+{
+	struct sii902x *sii902x = connector_to_sii902x(connector);
+	struct regmap *regmap = sii902x->regmap;
+	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	unsigned int status;
+	struct edid *edid;
+	int num = 0;
+	int ret;
+
+	ret = regmap_update_bits(regmap, SIL902X_SYS_CTRL_DATA,
+				 SIL902X_SYS_CTRL_DDC_BUS_REQ,
+				 SIL902X_SYS_CTRL_DDC_BUS_REQ);
+	if (ret)
+		return ret;
+
+	do {
+		ret = regmap_read(regmap, SIL902X_SYS_CTRL_DATA, &status);
+		if (ret)
+			return ret;
+	} while (!(status & SIL902X_SYS_CTRL_DDC_BUS_GRTD));
+
+	ret = regmap_write(regmap, SIL902X_SYS_CTRL_DATA, status);
+	if (ret)
+		return ret;
+
+	edid = drm_get_edid(connector, sii902x->i2c->adapter);
+	drm_mode_connector_update_edid_property(connector, edid);
+	if (edid) {
+		num = drm_add_edid_modes(connector, edid);
+		kfree(edid);
+	}
+
+	ret = drm_display_info_set_bus_formats(&connector->display_info,
+					       &bus_format, 1);
+	if (ret)
+		return ret;
+
+	regmap_read(regmap, SIL902X_SYS_CTRL_DATA, &status);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(regmap, SIL902X_SYS_CTRL_DATA,
+				 SIL902X_SYS_CTRL_DDC_BUS_REQ |
+				 SIL902X_SYS_CTRL_DDC_BUS_GRTD, 0);
+	if (ret)
+		return ret;
+
+	do {
+		ret = regmap_read(regmap, SIL902X_SYS_CTRL_DATA, &status);
+		if (ret)
+			return ret;
+	} while (status & (SIL902X_SYS_CTRL_DDC_BUS_REQ |
+			   SIL902X_SYS_CTRL_DDC_BUS_GRTD));
+
+	return num;
+}
+
+static enum drm_mode_status sii902x_mode_valid(struct drm_connector *connector,
+					       struct drm_display_mode *mode)
+{
+	/* TODO: check mode */
+
+	return MODE_OK;
+}
+
+static const struct drm_connector_helper_funcs sii902x_connector_helper_funcs = {
+	.get_modes = sii902x_get_modes,
+	.mode_valid = sii902x_mode_valid,
+};
+
+static void sii902x_bridge_disable(struct drm_bridge *bridge)
+{
+	struct sii902x *sii902x = bridge_to_sii902x(bridge);
+
+	regmap_update_bits(sii902x->regmap, SIL902X_SYS_CTRL_DATA,
+			   SIL902X_SYS_CTRL_PWR_DWN,
+			   SIL902X_SYS_CTRL_PWR_DWN);
+}
+
+static void sii902x_bridge_enable(struct drm_bridge *bridge)
+{
+	struct sii902x *sii902x = bridge_to_sii902x(bridge);
+
+	regmap_update_bits(sii902x->regmap, SIL902X_PWR_STATE_CTRL,
+			   SIL902X_AVI_POWER_STATE_MSK,
+			   SIL902X_AVI_POWER_STATE_D(0));
+	regmap_update_bits(sii902x->regmap, SIL902X_SYS_CTRL_DATA,
+			   SIL902X_SYS_CTRL_PWR_DWN, 0);
+}
+
+static void sii902x_bridge_mode_set(struct drm_bridge *bridge,
+				    struct drm_display_mode *mode,
+				    struct drm_display_mode *adj)
+{
+	struct sii902x *sii902x = bridge_to_sii902x(bridge);
+	struct regmap *regmap = sii902x->regmap;
+	u8 buf[HDMI_INFOFRAME_SIZE(AVI)];
+	struct hdmi_avi_infoframe frame;
+	int ret;
+
+	buf[0] = adj->clock;
+	buf[1] = adj->clock >> 8;
+	buf[2] = adj->vrefresh;
+	buf[3] = 0x00;
+	buf[4] = adj->hdisplay;
+	buf[5] = adj->hdisplay >> 8;
+	buf[6] = adj->vdisplay;
+	buf[7] = adj->vdisplay >> 8;
+	buf[8] = SIL902X_TPI_CLK_RATIO_1X | SIL902X_TPI_AVI_PIXEL_REP_NONE |
+		 SIL902X_TPI_AVI_PIXEL_REP_BUS_24BIT;
+	buf[9] = SIL902X_TPI_AVI_INPUT_RANGE_AUTO |
+		 SIL902X_TPI_AVI_INPUT_COLORSPACE_RGB;
+
+	ret = regmap_bulk_write(regmap, SIL902X_TPI_VIDEO_DATA, buf, 10);
+	if (ret)
+		return;
+
+	ret = drm_hdmi_avi_infoframe_from_display_mode(&frame, adj);
+	if (ret < 0) {
+		DRM_ERROR("couldn't fill AVI infoframe\n");
+		return;
+	}
+
+	ret = hdmi_avi_infoframe_pack(&frame, buf, sizeof(buf));
+	if (ret < 0) {
+		DRM_ERROR("failed to pack AVI infoframe: %d\n", ret);
+		return;
+	}
+
+	/* Do not send the infoframe header, but keep the CRC field. */
+	regmap_bulk_write(regmap, SIL902X_TPI_AVI_INFOFRAME,
+			  buf + HDMI_INFOFRAME_HEADER_SIZE - 1,
+			  HDMI_AVI_INFOFRAME_SIZE + 1);
+}
+
+static int sii902x_bridge_attach(struct drm_bridge *bridge)
+{
+	struct sii902x *sii902x = bridge_to_sii902x(bridge);
+	struct drm_device *drm = bridge->dev;
+	int ret;
+
+	drm_connector_helper_add(&sii902x->connector,
+				 &sii902x_connector_helper_funcs);
+
+	if (!drm_core_check_feature(drm, DRIVER_ATOMIC)) {
+		dev_err(&sii902x->i2c->dev,
+			"sii902x driver is only compatible with DRM devices supporting atomic updates");
+		return -ENOTSUPP;
+	}
+
+	ret = drm_connector_init(drm, &sii902x->connector,
+				 &sii902x_connector_funcs,
+				 DRM_MODE_CONNECTOR_HDMIA);
+	if (ret)
+		return ret;
+
+	if (sii902x->i2c->irq > 0)
+		sii902x->connector.polled = DRM_CONNECTOR_POLL_HPD;
+	else
+		sii902x->connector.polled = DRM_CONNECTOR_POLL_CONNECT;
+
+	drm_mode_connector_attach_encoder(&sii902x->connector, bridge->encoder);
+
+	return 0;
+}
+
+static const struct drm_bridge_funcs sii902x_bridge_funcs = {
+	.attach = sii902x_bridge_attach,
+	.mode_set = sii902x_bridge_mode_set,
+	.disable = sii902x_bridge_disable,
+	.enable = sii902x_bridge_enable,
+};
+
+static const struct regmap_range sii902x_volatile_ranges[] = {
+	{ .range_min = 0, .range_max = 0xff },
+};
+
+static const struct regmap_access_table sii902x_volatile_table = {
+	.yes_ranges = sii902x_volatile_ranges,
+	.n_yes_ranges = ARRAY_SIZE(sii902x_volatile_ranges),
+};
+
+static const struct regmap_config sii902x_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.volatile_table = &sii902x_volatile_table,
+	.cache_type = REGCACHE_NONE,
+};
+
+static irqreturn_t sii902x_interrupt(int irq, void *data)
+{
+	struct sii902x *sii902x = data;
+	unsigned int status = 0;
+
+	regmap_read(sii902x->regmap, SI902X_INT_STATUS, &status);
+	regmap_write(sii902x->regmap, SI902X_INT_STATUS, status);
+
+	if ((status & SI902X_HOTPLUG_EVENT) && sii902x->bridge.dev)
+		drm_helper_hpd_irq_event(sii902x->bridge.dev);
+
+	return IRQ_HANDLED;
+}
+
+static int sii902x_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	unsigned int status = 0;
+	struct sii902x *sii902x;
+	u8 chipid[4];
+	int ret;
+
+	sii902x = devm_kzalloc(dev, sizeof(*sii902x), GFP_KERNEL);
+	if (!sii902x)
+		return -ENOMEM;
+
+	sii902x->i2c = client;
+	sii902x->regmap = devm_regmap_init_i2c(client, &sii902x_regmap_config);
+	if (IS_ERR(sii902x->regmap))
+		return PTR_ERR(sii902x->regmap);
+
+	sii902x->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						      GPIOD_OUT_LOW);
+	if (IS_ERR(sii902x->reset_gpio)) {
+		dev_err(dev, "Failed to retrieve/request reset gpio: %ld\n",
+			PTR_ERR(sii902x->reset_gpio));
+		return PTR_ERR(sii902x->reset_gpio);
+	}
+
+	sii902x_reset(sii902x);
+
+	ret = regmap_write(sii902x->regmap, SIL902X_REG_TPI_RQB, 0x0);
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_read(sii902x->regmap, SIL902X_REG_CHIPID(0),
+			       &chipid, 4);
+	if (ret) {
+		dev_err(dev, "regmap_read failed %d\n", ret);
+		return ret;
+	}
+
+	if (chipid[0] != 0xb0) {
+		dev_err(dev, "Invalid chipid: %02x (expecting 0xb0)\n",
+			chipid[0]);
+		return -EINVAL;
+	}
+
+	/* Clear all pending interrupts */
+	regmap_read(sii902x->regmap, SI902X_INT_STATUS, &status);
+	regmap_write(sii902x->regmap, SI902X_INT_STATUS, status);
+
+	if (client->irq > 0) {
+		regmap_write(sii902x->regmap, SI902X_INT_ENABLE,
+			     SI902X_HOTPLUG_EVENT);
+
+		ret = devm_request_threaded_irq(dev, client->irq, NULL,
+						sii902x_interrupt,
+						IRQF_ONESHOT, dev_name(dev),
+						sii902x);
+		if (ret)
+			return ret;
+	}
+
+	sii902x->bridge.funcs = &sii902x_bridge_funcs;
+	sii902x->bridge.of_node = dev->of_node;
+	ret = drm_bridge_add(&sii902x->bridge);
+	if (ret) {
+		dev_err(dev, "Failed to add drm_bridge\n");
+		return ret;
+	}
+
+	i2c_set_clientdata(client, sii902x);
+
+	return 0;
+}
+
+static int sii902x_remove(struct i2c_client *client)
+
+{
+	struct sii902x *sii902x = i2c_get_clientdata(client);
+
+	drm_bridge_remove(&sii902x->bridge);
+
+	return 0;
+}
+
+static const struct of_device_id sii902x_dt_ids[] = {
+	{ .compatible = "sil,sii9022", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sii902x_dt_ids);
+
+static const struct i2c_device_id sii902x_i2c_ids[] = {
+	{ "sii9022", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, sii902x_i2c_ids);
+
+static struct i2c_driver sii902x_driver = {
+	.probe = sii902x_probe,
+	.remove = sii902x_remove,
+	.driver = {
+		.name = "sii902x",
+		.of_match_table = sii902x_dt_ids,
+	},
+	.id_table = sii902x_i2c_ids,
+};
+module_i2c_driver(sii902x_driver);
+
+MODULE_AUTHOR("Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>");
+MODULE_DESCRIPTION("SIL902x RGB -> HDMI bridges");
+MODULE_LICENSE("GPL");
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
