From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 15/15] drm/panel: Add Sharp LQ101R1SX01 support
Date: Mon, 13 Oct 2014 12:16:35 +0200
Message-ID: <1413195395-3355-15-git-send-email-thierry.reding@gmail.com>
References: <1413195395-3355-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1413195395-3355-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This panel requires dual-channel mode. The device accepts command-mode
data on 8 lanes and will therefore need a dual-channel DSI controller.
The two interfaces that make up this device need to be instantiated in
the controllers that gang up to provide the dual-channel DSI host.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/panel/sharp,lq101r1sx01.txt           |  46 +++
 drivers/gpu/drm/panel/Kconfig                      |  13 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c    | 426 +++++++++++++++++++++
 4 files changed, 486 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/sharp,lq101r1sx01.txt
 create mode 100644 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c

diff --git a/Documentation/devicetree/bindings/panel/sharp,lq101r1sx01.txt b/Documentation/devicetree/bindings/panel/sharp,lq101r1sx01.txt
new file mode 100644
index 000000000000..4ab4380ddac8
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/sharp,lq101r1sx01.txt
@@ -0,0 +1,46 @@
+Sharp Microelectronics 10.1" WQXGA TFT LCD panel
+
+This panel requires a dual-channel DSI host to operate. It supports two modes:
+- left-right: each channel drives the left or right half of the screen
+- even-odd: each channel drives the even or odd lines of the screen
+
+Each of the DSI channels controls a separate DSI peripheral. The peripheral
+driven by the first link (DSI-LINK1), left or even, is considered the primary
+peripheral and controls the device. The 'link2' property contains a phandle
+to the peripheral driven by the second link (DSI-LINK2, right or odd).
+
+Note that in video mode the DSI-LINK1 interface always provides the left/even
+pixels and DSI-LINK2 always provides the right/odd pixels. In command mode it
+is possible to program either link to drive the left/even or right/odd pixels
+but for the sake of consistency this binding assumes that the same assignment
+is chosen as for video mode.
+
+Required properties:
+- compatible: should be "sharp,lq101r1sx01"
+- link2: phandle to the DSI peripheral on the secondary link. Note that the
+  presence of this property marks the containing node as DSI-LINK1.
+- power-supply: phandle of the regulator that provides the supply voltage
+
+Optional properties:
+- backlight: phandle of the backlight device attached to the panel
+
+Example:
+
+	dsi@54300000 {
+		panel: panel@0 {
+			compatible = "sharp,lq101r1sx01";
+			reg = <0>;
+
+			link2 = <&secondary>;
+
+			power-supply = <...>;
+			backlight = <...>;
+		};
+	};
+
+	dsi@54400000 {
+		secondary: panel@0 {
+			compatible = "sharp,lq101r1sx01";
+			reg = <0>;
+		};
+	};
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index bee9f72b3a93..024e98ef8e4d 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -27,4 +27,17 @@ config DRM_PANEL_S6E8AA0
 	select DRM_MIPI_DSI
 	select VIDEOMODE_HELPERS
 
+config DRM_PANEL_SHARP_LQ101R1SX01
+	tristate "Sharp LQ101R1SX01 panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	help
+	  Say Y here if you want to enable support for Sharp LQ101R1SX01
+	  TFT-LCD modules. The panel has a 2560x1600 resolution and uses
+	  24 bit RGB per pixel. It provides a dual MIPI DSI interface to
+	  the host and has a built-in LED backlight.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called panel-sharp-lq101r1sx01.
+
 endmenu
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 8b929212fad7..4b2a0430804b 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
 obj-$(CONFIG_DRM_PANEL_LD9040) += panel-ld9040.o
 obj-$(CONFIG_DRM_PANEL_S6E8AA0) += panel-s6e8aa0.o
+obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) += panel-sharp-lq101r1sx01.o
diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
new file mode 100644
index 000000000000..09356697d22f
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -0,0 +1,426 @@
+/*
+ * Copyright (C) 2014 NVIDIA Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/backlight.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drmP.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
+
+#include <video/mipi_display.h>
+
+#include <linux/host1x.h>
+
+struct sharp_panel {
+	struct drm_panel base;
+	/* the datasheet refers to them as DSI-LINK1 and DSI-LINK2 */
+	struct mipi_dsi_device *link1;
+	struct mipi_dsi_device *link2;
+
+	struct backlight_device *backlight;
+	struct regulator *supply;
+
+	bool prepared;
+	bool enabled;
+
+	const struct drm_display_mode *mode;
+};
+
+static inline struct sharp_panel *to_sharp_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct sharp_panel, base);
+}
+
+static int sharp_panel_write(struct sharp_panel *sharp, u16 offset, u8 value)
+{
+	u8 payload[3] = { offset >> 8, offset & 0xff, value };
+	struct mipi_dsi_device *dsi = sharp->link1;
+	ssize_t err;
+
+	err = mipi_dsi_generic_write(dsi, payload, sizeof(payload));
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to write %02x to %04x: %d\n",
+			value, offset, err);
+
+	err = mipi_dsi_dcs_nop(dsi);
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to send DCS nop: %d\n", err);
+
+	usleep_range(10, 20);
+
+	return err;
+}
+
+static __maybe_unused int sharp_panel_read(struct sharp_panel *sharp,
+					   u16 offset, u8 *value)
+{
+	ssize_t err;
+
+	cpu_to_be16s(&offset);
+
+	err = mipi_dsi_generic_read(sharp->link1, &offset, sizeof(offset),
+				    value, sizeof(*value));
+	if (err < 0)
+		dev_err(&sharp->link1->dev, "failed to read from %04x: %d\n",
+			offset, err);
+
+	return err;
+}
+
+static int sharp_panel_disable(struct drm_panel *panel)
+{
+	struct sharp_panel *sharp = to_sharp_panel(panel);
+
+	if (!sharp->enabled)
+		return 0;
+
+	if (sharp->backlight) {
+		sharp->backlight->props.power = FB_BLANK_POWERDOWN;
+		backlight_update_status(sharp->backlight);
+	}
+
+	sharp->enabled = false;
+
+	return 0;
+}
+
+static int sharp_panel_unprepare(struct drm_panel *panel)
+{
+	struct sharp_panel *sharp = to_sharp_panel(panel);
+	int err;
+
+	if (!sharp->prepared)
+		return 0;
+
+	err = mipi_dsi_dcs_set_display_off(sharp->link1);
+	if (err < 0)
+		dev_err(panel->dev, "failed to set display off: %d\n", err);
+
+	err = mipi_dsi_dcs_enter_sleep_mode(sharp->link1);
+	if (err < 0)
+		dev_err(panel->dev, "failed to enter sleep mode: %d\n", err);
+
+	msleep(120);
+
+	regulator_disable(sharp->supply);
+
+	sharp->prepared = false;
+
+	return 0;
+}
+
+static int sharp_setup_symmetrical_split(struct mipi_dsi_device *left,
+					 struct mipi_dsi_device *right,
+					 const struct drm_display_mode *mode)
+{
+	int err;
+
+	err = mipi_dsi_dcs_set_column_address(left, 0, mode->hdisplay / 2 - 1);
+	if (err < 0)
+		dev_err(&left->dev, "failed to set column address: %d\n", err);
+
+	err = mipi_dsi_dcs_set_page_address(left, 0, mode->vdisplay - 1);
+	if (err < 0)
+		dev_err(&left->dev, "failed to set page address: %d\n", err);
+
+	err = mipi_dsi_dcs_set_column_address(right, mode->hdisplay / 2,
+					      mode->hdisplay - 1);
+	if (err < 0)
+		dev_err(&right->dev, "failed to set column address: %d\n", err);
+
+	err = mipi_dsi_dcs_set_page_address(right, 0, mode->vdisplay - 1);
+	if (err < 0)
+		dev_err(&right->dev, "failed to set page address: %d\n", err);
+
+	return 0;
+}
+
+static int sharp_panel_prepare(struct drm_panel *panel)
+{
+	struct sharp_panel *sharp = to_sharp_panel(panel);
+	u8 format = MIPI_DCS_PIXEL_FMT_24BIT;
+	int err;
+
+	if (sharp->prepared)
+		return 0;
+
+	err = regulator_enable(sharp->supply);
+	if (err < 0)
+		return err;
+
+	usleep_range(10000, 20000);
+
+	err = mipi_dsi_dcs_soft_reset(sharp->link1);
+	if (err < 0)
+		dev_err(panel->dev, "soft reset failed: %d\n", err);
+
+	msleep(120);
+
+	err = mipi_dsi_dcs_exit_sleep_mode(sharp->link1);
+	if (err < 0)
+		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
+
+	/*
+	 * The MIPI DCS specification mandates this delay only between the
+	 * exit_sleep_mode and enter_sleep_mode commands, so it isn't strictly
+	 * necessary here.
+	 */
+	/*
+	msleep(120);
+	*/
+
+	/* set left-right mode */
+	err = sharp_panel_write(sharp, 0x1000, 0x2a);
+	if (err < 0)
+		dev_err(panel->dev, "failed to set left-right mode: %d\n", err);
+
+	/* enable command mode */
+	err = sharp_panel_write(sharp, 0x1001, 0x01);
+	if (err < 0)
+		dev_err(panel->dev, "failed to enable command mode: %d\n", err);
+
+	err = mipi_dsi_dcs_set_pixel_format(sharp->link1, format);
+	if (err < 0)
+		dev_err(panel->dev, "failed to set pixel format: %d\n", err);
+
+	/*
+	 * TODO: The device supports both left-right and even-odd split
+	 * configurations, but this driver currently supports only the left-
+	 * right split. To support a different mode a mechanism needs to be
+	 * put in place to communicate the configuration back to the DSI host
+	 * controller.
+	 */
+	err = sharp_setup_symmetrical_split(sharp->link1, sharp->link2,
+					    sharp->mode);
+	if (err < 0)
+		dev_err(panel->dev, "failed to set up symmetrical split: %d\n",
+			err);
+
+	err = mipi_dsi_dcs_set_display_on(sharp->link1);
+	if (err < 0)
+		dev_err(panel->dev, "failed to set display on: %d\n", err);
+
+	sharp->prepared = true;
+
+	return err;
+}
+
+static int sharp_panel_enable(struct drm_panel *panel)
+{
+	struct sharp_panel *sharp = to_sharp_panel(panel);
+
+	if (sharp->enabled)
+		return 0;
+
+	if (sharp->backlight) {
+		sharp->backlight->props.power = FB_BLANK_UNBLANK;
+		backlight_update_status(sharp->backlight);
+	}
+
+	sharp->enabled = true;
+
+	return 0;
+}
+
+static const struct drm_display_mode default_mode = {
+	.clock = 278000,
+	.hdisplay = 2560,
+	.hsync_start = 2560 + 128,
+	.hsync_end = 2560 + 128 + 64,
+	.htotal = 2560 + 128 + 64 + 64,
+	.vdisplay = 1600,
+	.vsync_start = 1600 + 4,
+	.vsync_end = 1600 + 4 + 8,
+	.vtotal = 1600 + 4 + 8 + 32,
+	.vrefresh = 60,
+};
+
+static int sharp_panel_get_modes(struct drm_panel *panel)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(panel->drm, &default_mode);
+	if (!mode) {
+		dev_err(panel->drm->dev, "failed to add mode %ux%ux@%u\n",
+			default_mode.hdisplay, default_mode.vdisplay,
+			default_mode.vrefresh);
+		return -ENOMEM;
+	}
+
+	drm_mode_set_name(mode);
+
+	drm_mode_probed_add(panel->connector, mode);
+
+	panel->connector->display_info.width_mm = 217;
+	panel->connector->display_info.height_mm = 136;
+
+	return 1;
+}
+
+static const struct drm_panel_funcs sharp_panel_funcs = {
+	.disable = sharp_panel_disable,
+	.unprepare = sharp_panel_unprepare,
+	.prepare = sharp_panel_prepare,
+	.enable = sharp_panel_enable,
+	.get_modes = sharp_panel_get_modes,
+};
+
+static const struct of_device_id sharp_of_match[] = {
+	{ .compatible = "sharp,lq101r1sx01", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sharp_of_match);
+
+static int sharp_panel_add(struct sharp_panel *sharp)
+{
+	struct device_node *np;
+	int err;
+
+	sharp->mode = &default_mode;
+
+	sharp->supply = devm_regulator_get(&sharp->link1->dev, "power");
+	if (IS_ERR(sharp->supply))
+		return PTR_ERR(sharp->supply);
+
+	np = of_parse_phandle(sharp->link1->dev.of_node, "backlight", 0);
+	if (np) {
+		sharp->backlight = of_find_backlight_by_node(np);
+		of_node_put(np);
+
+		if (!sharp->backlight)
+			return -EPROBE_DEFER;
+	}
+
+	drm_panel_init(&sharp->base);
+	sharp->base.funcs = &sharp_panel_funcs;
+	sharp->base.dev = &sharp->link1->dev;
+
+	err = drm_panel_add(&sharp->base);
+	if (err < 0)
+		goto put_backlight;
+
+	return 0;
+
+put_backlight:
+	if (sharp->backlight)
+		put_device(&sharp->backlight->dev);
+
+	return err;
+}
+
+static void sharp_panel_del(struct sharp_panel *sharp)
+{
+	if (sharp->base.dev)
+		drm_panel_remove(&sharp->base);
+
+	if (sharp->backlight)
+		put_device(&sharp->backlight->dev);
+}
+
+static int sharp_panel_probe(struct mipi_dsi_device *dsi)
+{
+	struct mipi_dsi_device *secondary = NULL;
+	struct sharp_panel *sharp;
+	struct device_node *np;
+	int err;
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = 0;
+
+	/* Find DSI-LINK1 */
+	np = of_parse_phandle(dsi->dev.of_node, "link2", 0);
+	if (np) {
+		secondary = of_find_mipi_dsi_device_by_node(np);
+		of_node_put(np);
+
+		if (!secondary)
+			return -EPROBE_DEFER;
+	}
+
+	sharp = devm_kzalloc(&dsi->dev, sizeof(*sharp), GFP_KERNEL);
+	if (!sharp)
+		return -ENOMEM;
+
+	mipi_dsi_set_drvdata(dsi, sharp);
+
+	/* register a panel for only the DSI-LINK1 interface */
+	if (secondary) {
+		sharp->link2 = secondary;
+		sharp->link1 = dsi;
+
+		err = sharp_panel_add(sharp);
+		if (err < 0)
+			return err;
+	}
+
+	err = mipi_dsi_attach(dsi);
+	if (err < 0) {
+		sharp_panel_del(sharp);
+		return err;
+	}
+
+	return 0;
+}
+
+static int sharp_panel_remove(struct mipi_dsi_device *dsi)
+{
+	struct sharp_panel *sharp = mipi_dsi_get_drvdata(dsi);
+	int err;
+
+	/* only detach from host for the DSI-LINK2 interface */
+	if (!sharp->link2) {
+		mipi_dsi_detach(dsi);
+		return 0;
+	}
+
+	err = sharp_panel_disable(&sharp->base);
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
+
+	err = mipi_dsi_detach(dsi);
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
+
+	drm_panel_detach(&sharp->base);
+	drm_panel_remove(&sharp->base);
+
+	if (sharp->backlight)
+		put_device(&sharp->backlight->dev);
+
+	put_device(&sharp->link2->dev);
+
+	return 0;
+}
+
+static void sharp_panel_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct sharp_panel *sharp = mipi_dsi_get_drvdata(dsi);
+
+	sharp_panel_disable(&sharp->base);
+}
+
+static struct mipi_dsi_driver sharp_panel_driver = {
+	.driver = {
+		.name = "panel-sharp-lq101r1sx01",
+		.of_match_table = sharp_of_match,
+	},
+	.probe = sharp_panel_probe,
+	.remove = sharp_panel_remove,
+	.shutdown = sharp_panel_shutdown,
+};
+module_mipi_dsi_driver(sharp_panel_driver);
+
+MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
+MODULE_DESCRIPTION("Sharp LQ101R1SX01 panel driver");
+MODULE_LICENSE("GPL v2");
-- 
2.1.2
