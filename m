From: Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/panel: Add JDI LT070ME05000 WUXGA DSI Panel
Date: Wed, 13 Apr 2016 11:17:11 +0530
Message-ID: <1460526438-22224-1-git-send-email-simhavcs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:DRM PANEL DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for the JDI lt070me05000 WUXGA DSI panel used in
Nexus 7 2013 devices.

Programming sequence for the panel is was originally found in the
android-msm-flo-3.4-lollipop-release branch from:
    https://android.googlesource.com/kernel/msm.git

And video mode setting is from dsi-panel-jdi-dualmipi1-video.dtsi
file in:
    git://codeaurora.org/kernel/msm-3.10.git  LNX.LA.3.6_rb1.27

Other fixes folded in were provided
by Archit Taneja <archit.taneja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Signed-off-by: Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
[sumit.semwal: Ported to the drm/panel framework]
Signed-off-by: Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
[jstultz: Cherry-picked to mainline, folded down other fixes
 from Vinay and Archit]
Signed-off-by: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/display/panel/jdi,lt070me05000.txt    |  27 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     | 685 +++++++++++++=
++++++++
 5 files changed, 725 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/jdi=
,lt070me05000.txt
 create mode 100644 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c

diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070m=
e05000.txt b/Documentation/devicetree/bindings/display/panel/jdi,lt070m=
e05000.txt
new file mode 100644
index 0000000..35c5ac7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.=
txt
@@ -0,0 +1,27 @@
+JDI model LT070ME05000 1920x1200 7" DSI Panel
+
+Basic data sheet is at:
+	http://panelone.net/en/7-0-inch/JDI_LT070ME05000_7.0_inch-datasheet
+
+This panel has video mode implemented currently in the driver.
+
+Required properties:
+- compatible: should be "jdi,lt070me05000"
+
+Optional properties:
+- power-supply: phandle of the regulator that provides the supply volt=
age
+- reset-gpio: phandle of gpio for reset line
+- backlight: phandle of the backlight device attached to the panel
+
+Example:
+
+	dsi@54300000 {
+		panel: panel@0 {
+			compatible =3D "jdi,lt070me05000";
+			reg =3D <0>;
+
+			power-supply =3D <...>;
+			reset-gpio =3D <...>;
+			backlight =3D <...>;
+		};
+	};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Do=
cumentation/devicetree/bindings/vendor-prefixes.txt
index a580f3e..ec42bb4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -130,6 +130,7 @@ invensense	InvenSense Inc.
 isee	ISEE 2007 S.L.
 isil	Intersil
 issi	Integrated Silicon Solutions Inc.
+jdi	Japan Display Inc.
 jedec	JEDEC Solid State Technology Association
 karo	Ka-Ro electronics GmbH
 keymile	Keymile GmbH
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kcon=
fig
index 1500ab9..f41690e 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -61,6 +61,17 @@ config DRM_PANEL_SHARP_LQ101R1SX01
 	  To compile this driver as a module, choose M here: the module
 	  will be called panel-sharp-lq101r1sx01.
=20
+config DRM_PANEL_JDI_LT070ME05000
+	tristate "JDI LT070ME05000 WUXGA DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for JDI WUXGA DSI video/
+	  command mode panel as found in Google Nexus 7 (2013) devices.
+	  The panel has a 1200(RGB)=C3=971920 (WUXGA) resolution and uses
+	  24 bit RGB per pixel.
+
 config DRM_PANEL_SHARP_LS043T1LE01
 	tristate "Sharp LS043T1LE01 qHD video mode panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Mak=
efile
index f277eed..e6c6fc8 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) +=3D panel-samsu=
ng-ld9040.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) +=3D panel-samsung-s6e8aa0.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) +=3D panel-sharp-lq101r1sx01=
=2Eo
 obj-$(CONFIG_DRM_PANEL_SHARP_LS043T1LE01) +=3D panel-sharp-ls043t1le01=
=2Eo
+obj-$(CONFIG_DRM_PANEL_JDI_LT070ME05000) +=3D panel-jdi-lt070me05000.o
diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/g=
pu/drm/panel/panel-jdi-lt070me05000.c
new file mode 100644
index 0000000..051aa1b
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -0,0 +1,685 @@
+/*
+ * Copyright (C) 2015 InforceComputing
+ * Author: Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * Copyright (C) 2015 Linaro Ltd
+ * Author: Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modif=
y it
+ * under the terms of the GNU General Public License version 2 as publ=
ished by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but=
 WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licen=
se for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License a=
long with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
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
+/*
+ * From internet archives, the panel for Nexus 7 2nd Gen, 2013 model i=
s a
+ * JDI model LT070ME05000, and its data sheet is at:
+ *  http://panelone.net/en/7-0-inch/JDI_LT070ME05000_7.0_inch-datashee=
t
+ */
+struct jdi_panel {
+	struct drm_panel base;
+	struct mipi_dsi_device *dsi;
+
+	/* TODO: Add backilght support */
+	struct backlight_device *backlight;
+	struct regulator *supply;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *enable_gpio;
+	struct gpio_desc *vcc_gpio;
+
+	struct regulator *backlit;
+	struct regulator *lvs7;
+	struct regulator *avdd;
+	struct regulator *iovdd;
+	struct gpio_desc *pwm_gpio;
+
+	bool prepared;
+	bool enabled;
+
+	const struct drm_display_mode *mode;
+};
+
+static inline struct jdi_panel *to_jdi_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct jdi_panel, base);
+}
+
+static char MCAP[2] =3D {0xB0, 0x00};
+static char interface_setting_cmd[6] =3D {0xB3, 0x04, 0x08, 0x00, 0x22=
, 0x00};
+static char interface_setting[6] =3D {0xB3, 0x26, 0x08, 0x00, 0x20, 0x=
00};
+
+static char interface_ID_setting[2] =3D {0xB4, 0x0C};
+static char DSI_control[3] =3D {0xB6, 0x3A, 0xD3};
+
+static char tear_scan_line[3] =3D {0x44, 0x03, 0x00};
+
+/* for fps control, set fps to 60.32Hz */
+static char LTPS_timing_setting[2] =3D {0xC6, 0x78};
+static char sequencer_timing_control[2] =3D {0xD6, 0x01};
+
+/* set brightness */
+static char write_display_brightness[] =3D {0x51, 0xFF};
+/* enable LEDPWM pin output, turn on LEDPWM output, turn off pwm dimmi=
ng */
+static char write_control_display[] =3D {0x53, 0x24};
+/*
+ * choose cabc mode, 0x00(-0%), 0x01(-15%), 0x02(-40%), 0x03(-54%),
+ * disable SRE(sunlight readability enhancement)
+ */
+static char write_cabc[] =3D {0x55, 0x00};
+/* for cabc mode 0x1(-15%) */
+static char backlight_control1[] =3D {0xB8, 0x07, 0x87, 0x26, 0x18, 0x=
00, 0x32};
+/* for cabc mode 0x2(-40%) */
+static char backlight_control2[] =3D {0xB9, 0x07, 0x75, 0x61, 0x20, 0x=
16, 0x87};
+/* for cabc mode 0x3(-54%) */
+static char backlight_control3[] =3D {0xBA, 0x07, 0x70, 0x81, 0x20, 0x=
45, 0xB4};
+/* for pwm frequency and dimming control */
+static char backlight_control4[] =3D {0xCE, 0x7D, 0x40, 0x48, 0x56, 0x=
67, 0x78,
+		0x88, 0x98, 0xA7, 0xB5, 0xC3, 0xD1, 0xDE, 0xE9, 0xF2, 0xFA,
+		0xFF, 0x37, 0xF5, 0x0F, 0x0F, 0x42, 0x00};
+
+static int jdi_panel_init(struct jdi_panel *jdi)
+{
+	struct mipi_dsi_device *dsi =3D jdi->dsi;
+	int ret;
+
+	dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
+
+	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
+		ret =3D mipi_dsi_dcs_soft_reset(dsi);
+		if (ret < 0)
+			return ret;
+
+		mdelay(10);
+
+		ret =3D mipi_dsi_dcs_set_pixel_format(dsi, 0x70);
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_dcs_set_column_address(dsi, 0x0000, 0x04AF);
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_dcs_set_page_address(dsi, 0x0000, 0x077F);
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_dcs_set_tear_on(dsi,
+					       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+		if (ret < 0)
+			return ret;
+		mdelay(5);
+
+		ret =3D mipi_dsi_generic_write(dsi, tear_scan_line,
+					     sizeof(tear_scan_line));
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_dcs_write_buffer(dsi, write_display_brightness,
+						sizeof(write_display_brightness)
+						);
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_dcs_write_buffer(dsi, write_control_display,
+						sizeof(write_control_display));
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_dcs_write_buffer(dsi, write_cabc,
+						sizeof(write_cabc));
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
+		if (ret < 0)
+			return ret;
+		mdelay(120);
+
+		ret =3D mipi_dsi_generic_write(dsi, MCAP, sizeof(MCAP));
+		if (ret < 0)
+			return ret;
+		mdelay(10);
+
+		ret =3D mipi_dsi_generic_write(dsi, interface_setting,
+					     sizeof(interface_setting));
+		if (ret < 0)
+			return ret;
+		mdelay(20);
+
+		backlight_control4[18] =3D 0x04;
+		backlight_control4[19] =3D 0x00;
+
+		ret =3D mipi_dsi_generic_write(dsi, backlight_control4,
+					     sizeof(backlight_control4));
+		if (ret < 0)
+			return ret;
+		mdelay(20);
+
+		MCAP[1] =3D 0x03;
+		ret =3D mipi_dsi_generic_write(dsi, MCAP, sizeof(MCAP));
+		if (ret < 0)
+			return ret;
+	} else {
+		/*
+		 * TODO : need to verify panel settings when
+		 * dsi cmd mode supported for apq8064 - simhavcs
+		 */
+		ret =3D mipi_dsi_dcs_soft_reset(dsi);
+		if (ret < 0)
+			return ret;
+
+		mdelay(5);
+
+		ret =3D mipi_dsi_generic_write(dsi, MCAP, sizeof(MCAP));
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_generic_write(dsi, interface_setting_cmd,
+					     sizeof(interface_setting_cmd));
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_generic_write(dsi, interface_ID_setting,
+					     sizeof(interface_ID_setting));
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_generic_write(dsi, DSI_control,
+					     sizeof(DSI_control));
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_generic_write(dsi, LTPS_timing_setting,
+					     sizeof(LTPS_timing_setting));
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_generic_write(dsi, sequencer_timing_control,
+					     sizeof(sequencer_timing_control));
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_dcs_write_buffer(dsi, write_display_brightness,
+						sizeof(write_display_brightness)
+						);
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_dcs_write_buffer(dsi, write_control_display,
+						sizeof(write_control_display));
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_dcs_write_buffer(dsi, write_cabc,
+						sizeof(write_cabc));
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_generic_write(dsi, backlight_control1,
+					     sizeof(backlight_control1));
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_generic_write(dsi, backlight_control2,
+					     sizeof(backlight_control2));
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_generic_write(dsi, backlight_control3,
+					     sizeof(backlight_control3));
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_generic_write(dsi, backlight_control4,
+					     sizeof(backlight_control4));
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_dcs_set_pixel_format(dsi, 0x77);
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_dcs_set_column_address(dsi, 0x0000, 0x04AF);
+		if (ret < 0)
+			return ret;
+
+		ret =3D mipi_dsi_dcs_set_page_address(dsi, 0x0000, 0x077F);
+		if (ret < 0)
+			return ret;
+		mdelay(120);
+
+		ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int jdi_panel_on(struct jdi_panel *jdi)
+{
+	struct mipi_dsi_device *dsi =3D jdi->dsi;
+	int ret;
+
+	dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
+
+	ret =3D mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int jdi_panel_off(struct jdi_panel *jdi)
+{
+	struct mipi_dsi_device *dsi =3D jdi->dsi;
+	int ret;
+
+	dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
+
+	ret =3D mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0)
+		return ret;
+
+	ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0)
+		return ret;
+
+	ret =3D mipi_dsi_dcs_set_tear_off(dsi);
+	if (ret < 0)
+		return ret;
+
+	msleep(100);
+
+	return 0;
+}
+
+static int jdi_panel_disable(struct drm_panel *panel)
+{
+	struct jdi_panel *jdi =3D to_jdi_panel(panel);
+
+	if (!jdi->enabled)
+		return 0;
+
+	DRM_DEBUG("disable\n");
+
+	if (jdi->backlight) {
+		jdi->backlight->props.power =3D FB_BLANK_POWERDOWN;
+		backlight_update_status(jdi->backlight);
+	}
+
+	jdi->enabled =3D false;
+
+	return 0;
+}
+
+static int jdi_panel_unprepare(struct drm_panel *panel)
+{
+	struct jdi_panel *jdi =3D to_jdi_panel(panel);
+	int ret;
+
+	if (!jdi->prepared)
+		return 0;
+
+	DRM_DEBUG("unprepare\n");
+
+	ret =3D jdi_panel_off(jdi);
+	if (ret) {
+		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
+		return ret;
+	}
+
+	regulator_disable(jdi->supply);
+
+	if (jdi->vcc_gpio)
+		gpiod_set_value(jdi->vcc_gpio, 0);
+
+	if (jdi->reset_gpio)
+		gpiod_set_value(jdi->reset_gpio, 0);
+
+	if (jdi->enable_gpio)
+		gpiod_set_value(jdi->enable_gpio, 0);
+
+	jdi->prepared =3D false;
+
+	return 0;
+}
+
+static int jdi_panel_prepare(struct drm_panel *panel)
+{
+	struct jdi_panel *jdi =3D to_jdi_panel(panel);
+	int ret;
+
+	if (jdi->prepared)
+		return 0;
+
+	DRM_DEBUG("prepare\n");
+
+	ret =3D regulator_enable(jdi->iovdd);
+	if (ret < 0)
+		return ret;
+
+	ret =3D regulator_enable(jdi->avdd);
+	if (ret < 0)
+		return ret;
+
+	ret =3D regulator_enable(jdi->backlit);
+	if (ret < 0)
+		return ret;
+
+	ret =3D regulator_enable(jdi->lvs7);
+	if (ret < 0)
+		return ret;
+
+	ret =3D regulator_enable(jdi->supply);
+	if (ret < 0)
+		return ret;
+
+	msleep(20);
+
+	if (jdi->vcc_gpio) {
+		gpiod_set_value(jdi->vcc_gpio, 1);
+		usleep_range(10, 20);
+	}
+
+	if (jdi->reset_gpio) {
+		gpiod_set_value(jdi->reset_gpio, 1);
+		usleep_range(10, 20);
+	}
+
+	if (jdi->pwm_gpio) {
+		gpiod_set_value(jdi->pwm_gpio, 1);
+		usleep_range(10, 20);
+	}
+
+	if (jdi->enable_gpio) {
+		gpiod_set_value(jdi->enable_gpio, 1);
+		usleep_range(10, 20);
+	}
+
+	ret =3D jdi_panel_init(jdi);
+	if (ret) {
+		dev_err(panel->dev, "failed to init panel: %d\n", ret);
+		goto poweroff;
+	}
+
+	ret =3D jdi_panel_on(jdi);
+	if (ret) {
+		dev_err(panel->dev, "failed to set panel on: %d\n", ret);
+		goto poweroff;
+	}
+
+	jdi->prepared =3D true;
+
+	return 0;
+
+poweroff:
+	regulator_disable(jdi->supply);
+	if (jdi->reset_gpio)
+		gpiod_set_value(jdi->reset_gpio, 0);
+	if (jdi->enable_gpio)
+		gpiod_set_value(jdi->enable_gpio, 0);
+	if (jdi->vcc_gpio)
+		gpiod_set_value(jdi->vcc_gpio, 0);
+
+	return ret;
+}
+
+static int jdi_panel_enable(struct drm_panel *panel)
+{
+	struct jdi_panel *jdi =3D to_jdi_panel(panel);
+
+	if (jdi->enabled)
+		return 0;
+
+	DRM_DEBUG("enable\n");
+
+	if (jdi->backlight) {
+		jdi->backlight->props.power =3D FB_BLANK_UNBLANK;
+		backlight_update_status(jdi->backlight);
+	}
+
+	jdi->enabled =3D true;
+
+	return 0;
+}
+
+static const struct drm_display_mode default_mode =3D {
+		.clock =3D 155000,
+		.hdisplay =3D 1200,
+		.hsync_start =3D 1200 + 48,
+		.hsync_end =3D 1200 + 48 + 32,
+		.htotal =3D 1200 + 48 + 32 + 60,
+		.vdisplay =3D 1920,
+		.vsync_start =3D 1920 + 3,
+		.vsync_end =3D 1920 + 3 + 5,
+		.vtotal =3D 1920 + 3 + 5 + 6,
+		.vrefresh =3D 60,
+		.flags =3D 0,
+};
+
+static int jdi_panel_get_modes(struct drm_panel *panel)
+{
+	struct drm_display_mode *mode;
+
+	mode =3D drm_mode_duplicate(panel->drm, &default_mode);
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
+	return 1;
+}
+
+static const struct drm_panel_funcs jdi_panel_funcs =3D {
+		.disable =3D jdi_panel_disable,
+		.unprepare =3D jdi_panel_unprepare,
+		.prepare =3D jdi_panel_prepare,
+		.enable =3D jdi_panel_enable,
+		.get_modes =3D jdi_panel_get_modes,
+};
+
+static const struct of_device_id jdi_of_match[] =3D {
+		{ .compatible =3D "jdi,lt070me05000", },
+		{ }
+};
+MODULE_DEVICE_TABLE(of, jdi_of_match);
+
+static int jdi_panel_add(struct jdi_panel *jdi)
+{
+	struct device *dev =3D &jdi->dsi->dev;
+	int ret;
+
+	jdi->mode =3D &default_mode;
+
+	/* lvs5 */
+	jdi->supply =3D devm_regulator_get(dev, "power");
+	if (IS_ERR(jdi->supply))
+		return PTR_ERR(jdi->supply);
+
+	/* l17 */
+	jdi->backlit =3D devm_regulator_get(dev, "backlit");
+	if (IS_ERR(jdi->supply))
+		return PTR_ERR(jdi->supply);
+
+	jdi->lvs7 =3D devm_regulator_get(dev, "lvs7");
+	if (IS_ERR(jdi->lvs7))
+		return PTR_ERR(jdi->lvs7);
+
+	jdi->avdd =3D devm_regulator_get(dev, "avdd");
+	if (IS_ERR(jdi->avdd))
+		return PTR_ERR(jdi->avdd);
+
+	jdi->iovdd =3D devm_regulator_get(dev, "iovdd");
+	if (IS_ERR(jdi->iovdd))
+		return PTR_ERR(jdi->iovdd);
+
+	jdi->vcc_gpio =3D devm_gpiod_get(dev, "vcc", GPIOD_OUT_LOW);
+	if (IS_ERR(jdi->vcc_gpio)) {
+		dev_err(dev, "cannot get vcc-gpio %ld\n",
+			PTR_ERR(jdi->vcc_gpio));
+		jdi->vcc_gpio =3D NULL;
+	} else {
+		gpiod_direction_output(jdi->vcc_gpio, 0);
+	}
+
+	jdi->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(jdi->reset_gpio)) {
+		dev_err(dev, "cannot get reset-gpios %ld\n",
+			PTR_ERR(jdi->reset_gpio));
+		jdi->reset_gpio =3D NULL;
+	} else {
+		gpiod_direction_output(jdi->reset_gpio, 0);
+	}
+
+	jdi->enable_gpio =3D devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(jdi->enable_gpio)) {
+		dev_err(dev, "cannot get enable-gpio %ld\n",
+			PTR_ERR(jdi->enable_gpio));
+		jdi->enable_gpio =3D NULL;
+	} else {
+		gpiod_direction_output(jdi->enable_gpio, 0);
+	}
+
+	jdi->pwm_gpio =3D devm_gpiod_get(dev, "pwm", GPIOD_OUT_LOW);
+	if (IS_ERR(jdi->pwm_gpio)) {
+		dev_err(dev, "cannot get pwm-gpio %ld\n",
+			PTR_ERR(jdi->pwm_gpio));
+		jdi->pwm_gpio =3D NULL;
+	} else {
+		gpiod_direction_output(jdi->pwm_gpio, 0);
+	}
+
+	/* we don't have backlight right now, proceed further */
+#ifdef BACKLIGHT
+	np =3D of_parse_phandle(dev->of_node, "backlight", 0);
+	if (np) {
+		jdi->backlight =3D of_find_backlight_by_node(np);
+		of_node_put(np);
+
+		if (!jdi->backlight)
+			return -EPROBE_DEFER;
+	}
+#endif
+
+	drm_panel_init(&jdi->base);
+	jdi->base.funcs =3D &jdi_panel_funcs;
+	jdi->base.dev =3D &jdi->dsi->dev;
+
+	ret =3D drm_panel_add(&jdi->base);
+	if (ret < 0)
+		goto put_backlight;
+
+	return 0;
+
+put_backlight:
+	if (jdi->backlight)
+		put_device(&jdi->backlight->dev);
+
+	return ret;
+}
+
+static void jdi_panel_del(struct jdi_panel *jdi)
+{
+	if (jdi->base.dev)
+		drm_panel_remove(&jdi->base);
+
+	if (jdi->backlight)
+		put_device(&jdi->backlight->dev);
+}
+
+static int jdi_panel_probe(struct mipi_dsi_device *dsi)
+{
+	struct jdi_panel *jdi;
+	int ret;
+
+	dsi->lanes =3D 4;
+	dsi->format =3D MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags =3D  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+			MIPI_DSI_MODE_VIDEO_HFP | MIPI_DSI_MODE_VIDEO_HBP |
+			MIPI_DSI_MODE_VIDEO_HSA |
+			MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	jdi =3D devm_kzalloc(&dsi->dev, sizeof(*jdi), GFP_KERNEL);
+	if (!jdi)
+		return -ENOMEM;
+
+	mipi_dsi_set_drvdata(dsi, jdi);
+
+	jdi->dsi =3D dsi;
+
+	ret =3D jdi_panel_add(jdi);
+	if (ret < 0)
+		return ret;
+
+	return mipi_dsi_attach(dsi);
+}
+
+static int jdi_panel_remove(struct mipi_dsi_device *dsi)
+{
+	struct jdi_panel *jdi =3D mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret =3D jdi_panel_disable(&jdi->base);
+	if (ret < 0)
+		dev_err(&dsi->dev, "failed to disable panel: %d\n", ret);
+
+	ret =3D mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n",
+			ret);
+
+	drm_panel_detach(&jdi->base);
+	jdi_panel_del(jdi);
+
+	return 0;
+}
+
+static void jdi_panel_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct jdi_panel *jdi =3D mipi_dsi_get_drvdata(dsi);
+
+	jdi_panel_disable(&jdi->base);
+}
+
+static struct mipi_dsi_driver jdi_panel_driver =3D {
+	.driver =3D {
+		.name =3D "panel-jdi-lt070me05000",
+		.of_match_table =3D jdi_of_match,
+	},
+	.probe =3D jdi_panel_probe,
+	.remove =3D jdi_panel_remove,
+	.shutdown =3D jdi_panel_shutdown,
+};
+module_mipi_dsi_driver(jdi_panel_driver);
+
+MODULE_AUTHOR("Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>");
+MODULE_AUTHOR("Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>");
+MODULE_DESCRIPTION("JDI WUXGA LT070ME05000 DSI video/command mode pane=
l driver");
+MODULE_LICENSE("GPL v2");
--=20
2.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
