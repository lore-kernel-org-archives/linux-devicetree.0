From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: =?UTF-8?q?=5BPATCH=20v7=202/8=5D=20of=3A=20add=20helper=20to=20parse=20display=20timings?=
Date: Wed, 31 Oct 2012 10:28:02 +0100
Message-ID: <1351675689-26814-3-git-send-email-s.trumtrar@pengutronix.de>
References: <1351675689-26814-1-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1351675689-26814-1-git-send-email-s.trumtrar@pengutronix.de>
Sender: linux-media-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, Rob Herring <robherring2@gmail.com>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thierry Reding <thierry.reding@avionic-design.de>, Guennady Liakhovetski <g.liakhovetski@gmx.de>, linux-media@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, Stephen Warren <swarren@wwwdotorg.org>, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 .../devicetree/bindings/video/display-timings.txt  |  139 ++++++++++++=
+++
 drivers/of/Kconfig                                 |    6 +
 drivers/of/Makefile                                |    1 +
 drivers/of/of_display_timings.c                    |  185 ++++++++++++=
++++++++
 include/linux/of_display_timings.h                 |   20 +++
 5 files changed, 351 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/display-tim=
ings.txt
 create mode 100644 drivers/of/of_display_timings.c
 create mode 100644 include/linux/of_display_timings.h

diff --git a/Documentation/devicetree/bindings/video/display-timings.tx=
t b/Documentation/devicetree/bindings/video/display-timings.txt
new file mode 100644
index 0000000..04c94a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/display-timings.txt
@@ -0,0 +1,139 @@
+display-timings bindings
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+display-timings-node
+------------
+
+required properties:
+ - none
+
+optional properties:
+ - native-mode: the native mode for the display, in case multiple mode=
s are
+		provided. When omitted, assume the first node is the native.
+
+timings-subnode
+---------------
+
+required properties:
+ - hactive, vactive: Display resolution
+ - hfront-porch, hback-porch, hsync-len: Horizontal Display timing par=
ameters
+   in pixels
+   vfront-porch, vback-porch, vsync-len: Vertical display timing param=
eters in
+   lines
+ - clock-frequency: displayclock in Hz
+
+optional properties:
+ - hsync-active : Hsync pulse is active low/high/ignored
+ - vsync-active : Vsync pulse is active low/high/ignored
+ - de-active : Data-Enable pulse is active low/high/ignored
+ - pixelclk-inverted : pixelclock is inverted/non-inverted/ignored
+ - interlaced (bool)
+ - doublescan (bool)
+
+All the optional properties that are not bool follow the following log=
ic:
+    <1> : high active
+    <0> : low active
+    omitted : not used on hardware
+
+There are different ways of describing the capabilities of a display. =
The devicetree
+representation corresponds to the one commonly found in datasheets for=
 displays.
+If a display supports multiple signal timings, the native-mode can be =
specified.
+
+The parameters are defined as
+
+struct display_timing
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+  +----------+---------------------------------------------+----------=
+-------+
+  |          |                =E2=86=91                            |  =
        |       |
+  |          |                |vback_porch                 |          =
|       |
+  |          |                =E2=86=93                            |  =
        |       |
+  +----------###############################################----------=
+-------+
+  |          #                =E2=86=91                            #  =
        |       |
+  |          #                |                            #          =
|       |
+  |  hback   #                |                            #  hfront  =
| hsync |
+  |   porch  #                |       hactive              #  porch   =
|  len  |
+  |<-------->#<---------------+--------------------------->#<-------->=
|<----->|
+  |          #                |                            #          =
|       |
+  |          #                |vactive                     #          =
|       |
+  |          #                |                            #          =
|       |
+  |          #                =E2=86=93                            #  =
        |       |
+  +----------###############################################----------=
+-------+
+  |          |                =E2=86=91                            |  =
        |       |
+  |          |                |vfront_porch                |          =
|       |
+  |          |                =E2=86=93                            |  =
        |       |
+  +----------+---------------------------------------------+----------=
+-------+
+  |          |                =E2=86=91                            |  =
        |       |
+  |          |                |vsync_len                   |          =
|       |
+  |          |                =E2=86=93                            |  =
        |       |
+  +----------+---------------------------------------------+----------=
+-------+
+
+
+Example:
+
+	display-timings {
+		native-mode =3D <&timing0>;
+		timing0: 1920p24 {
+			/* 1920x1080p24 */
+			clock =3D <52000000>;
+			hactive =3D <1920>;
+			vactive =3D <1080>;
+			hfront-porch =3D <25>;
+			hback-porch =3D <25>;
+			hsync-len =3D <25>;
+			vback-porch =3D <2>;
+			vfront-porch =3D <2>;
+			vsync-len =3D <2>;
+			hsync-active =3D <1>;
+		};
+	};
+
+Every required property also supports the use of ranges, so the common=
ly used
+datasheet description with <min typ max>-tuples can be used.
+
+Example:
+
+	timing1: timing {
+		/* 1920x1080p24 */
+		clock =3D <148500000>;
+		hactive =3D <1920>;
+		vactive =3D <1080>;
+		hsync-len =3D <0 44 60>;
+		hfront-porch =3D <80 88 95>;
+		hback-porch =3D <100 148 160>;
+		vfront-porch =3D <0 4 6>;
+		vback-porch =3D <0 36 50>;
+		vsync-len =3D <0 5 6>;
+	};
+
+
+Usage in backend
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+A backend driver may choose to use the display-timings directly and co=
nvert the timing
+ranges to a suitable mode. Or it may just use the conversion of the di=
splay timings
+to the required mode via the generic videomode struct.
+
+					dtb
+					 |
+					 |  of_get_display_timing_list
+					 =E2=86=93
+			      struct display_timings
+					 |
+					 |  videomode_from_timing
+					 =E2=86=93
+			    ---  struct videomode ---
+			    |			    |
+ videomode_to_displaymode   |			    |   videomode_to_fb_videomode
+		            =E2=86=93			    =E2=86=93
+		     drm_display_mode         fb_videomode
+
+The functions of_get_fb_videomode and of_get_display_mode are provided
+to conveniently get the respective mode representation from the device=
tree.
+
+Conversion to videomode
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+As device drivers normally work with some kind of video mode, the timi=
ngs can be
+converted (may be just a simple copying of the typical value) to a gen=
eric videomode
+structure which then can be converted to the according mode used by th=
e backend.
diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index dfba3e6..781e773 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -83,4 +83,10 @@ config OF_MTD
 	depends on MTD
 	def_bool y
=20
+config OF_DISPLAY_TIMINGS
+	def_bool y
+	depends on DISPLAY_TIMING
+	help
+	  helper to parse display timings from the devicetree
+
 endmenu # OF
diff --git a/drivers/of/Makefile b/drivers/of/Makefile
index e027f44..c8e9603 100644
--- a/drivers/of/Makefile
+++ b/drivers/of/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_OF_MDIO)	+=3D of_mdio.o
 obj-$(CONFIG_OF_PCI)	+=3D of_pci.o
 obj-$(CONFIG_OF_PCI_IRQ)  +=3D of_pci_irq.o
 obj-$(CONFIG_OF_MTD)	+=3D of_mtd.o
+obj-$(CONFIG_OF_DISPLAY_TIMINGS) +=3D of_display_timings.o
diff --git a/drivers/of/of_display_timings.c b/drivers/of/of_display_ti=
mings.c
new file mode 100644
index 0000000..388fe4c
--- /dev/null
+++ b/drivers/of/of_display_timings.c
@@ -0,0 +1,185 @@
+/*
+ * OF helpers for parsing display timings
+ *
+ * Copyright (c) 2012 Steffen Trumtrar <s.trumtrar@pengutronix.de>, Pe=
ngutronix
+ *
+ * based on of_videomode.c by Sascha Hauer <s.hauer@pengutronix.de>
+ *
+ * This file is released under the GPLv2
+ */
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/export.h>
+#include <linux/of_display_timings.h>
+
+/**
+ * parse_property - parse timing_entry from device_node
+ * @np: device_node with the property
+ * @name: name of the property
+ * @result: will be set to the return value
+ *
+ * DESCRIPTION:
+ * Every display_timing can be specified with either just the typical =
value or
+ * a range consisting of min/typ/max. This function helps handling thi=
s
+ **/
+static int parse_property(struct device_node *np, char *name,
+				struct timing_entry *result)
+{
+	struct property *prop;
+	int length;
+	int cells;
+	int ret;
+
+	prop =3D of_find_property(np, name, &length);
+	if (!prop) {
+		pr_err("%s: could not find property %s\n", __func__, name);
+		return -EINVAL;
+	}
+
+	cells =3D length / sizeof(u32);
+	if (cells =3D=3D 1) {
+		ret =3D of_property_read_u32_array(np, name, &result->typ, cells);
+		result->min =3D result->typ;
+		result->max =3D result->typ;
+	} else if (cells =3D=3D 3) {
+		ret =3D of_property_read_u32_array(np, name, &result->min, cells);
+	} else {
+		pr_err("%s: illegal timing specification in %s\n", __func__, name);
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+/**
+ * of_get_display_timing - parse display_timing entry from device_node
+ * @np: device_node with the properties
+ **/
+struct display_timing *of_get_display_timing(struct device_node *np)
+{
+	struct display_timing *dt;
+	int ret =3D 0;
+
+	dt =3D kzalloc(sizeof(*dt), GFP_KERNEL);
+	if (!dt) {
+		pr_err("%s: could not allocate display_timing struct\n", __func__);
+		return NULL;
+	}
+
+	ret |=3D parse_property(np, "hback-porch", &dt->hback_porch);
+	ret |=3D parse_property(np, "hfront-porch", &dt->hfront_porch);
+	ret |=3D parse_property(np, "hactive", &dt->hactive);
+	ret |=3D parse_property(np, "hsync-len", &dt->hsync_len);
+	ret |=3D parse_property(np, "vback-porch", &dt->vback_porch);
+	ret |=3D parse_property(np, "vfront-porch", &dt->vfront_porch);
+	ret |=3D parse_property(np, "vactive", &dt->vactive);
+	ret |=3D parse_property(np, "vsync-len", &dt->vsync_len);
+	ret |=3D parse_property(np, "clock-frequency", &dt->pixelclock);
+
+	of_property_read_u32(np, "vsync-active", &dt->vsync_pol_active);
+	of_property_read_u32(np, "hsync-active", &dt->hsync_pol_active);
+	of_property_read_u32(np, "de-active", &dt->de_pol_active);
+	of_property_read_u32(np, "pixelclk-inverted", &dt->pixelclk_pol);
+	dt->interlaced =3D of_property_read_bool(np, "interlaced");
+	dt->doublescan =3D of_property_read_bool(np, "doublescan");
+
+	if (ret) {
+		pr_err("%s: error reading timing properties\n", __func__);
+		return NULL;
+	}
+
+	return dt;
+}
+EXPORT_SYMBOL_GPL(of_get_display_timing);
+
+/**
+ * of_get_display_timing_list - parse all display_timing entries from =
a device_node
+ * @np: device_node with the subnodes
+ **/
+struct display_timings *of_get_display_timing_list(struct device_node =
*np)
+{
+	struct device_node *timings_np;
+	struct device_node *entry;
+	struct device_node *native_mode;
+	struct display_timings *disp;
+
+	if (!np) {
+		pr_err("%s: no devicenode given\n", __func__);
+		return NULL;
+	}
+
+	timings_np =3D of_find_node_by_name(np, "display-timings");
+	if (!timings_np) {
+		pr_err("%s: could not find display-timings node\n", __func__);
+		return NULL;
+	}
+
+	disp =3D kzalloc(sizeof(*disp), GFP_KERNEL);
+
+	entry =3D of_parse_phandle(timings_np, "native-mode", 0);
+	/* assume first child as native mode if none provided */
+	if (!entry)
+		entry =3D of_get_next_child(np, NULL);
+	if (!entry) {
+		pr_err("%s: no timing specifications given\n", __func__);
+		return NULL;
+	}
+
+	pr_info("%s: using %s as default timing\n", __func__, entry->name);
+
+	native_mode =3D entry;
+
+	disp->num_timings =3D of_get_child_count(timings_np);
+	disp->timings =3D kzalloc(sizeof(struct display_timing *)*disp->num_t=
imings,
+				GFP_KERNEL);
+	disp->num_timings =3D 0;
+	disp->native_mode =3D 0;
+
+	for_each_child_of_node(timings_np, entry) {
+		struct display_timing *dt;
+
+		dt =3D of_get_display_timing(entry);
+		if (!dt) {
+			/* to not encourage wrong devicetrees, fail in case of an error */
+			pr_err("%s: error in timing %d\n", __func__, disp->num_timings+1);
+			return NULL;
+		}
+
+		if (native_mode =3D=3D entry)
+			disp->native_mode =3D disp->num_timings;
+
+		disp->timings[disp->num_timings] =3D dt;
+		disp->num_timings++;
+	}
+	of_node_put(timings_np);
+
+	if (disp->num_timings > 0)
+		pr_info("%s: got %d timings. Using timing #%d as default\n", __func_=
_,
+			disp->num_timings , disp->native_mode + 1);
+	else {
+		pr_err("%s: no valid timings specified\n", __func__);
+		return NULL;
+	}
+	return disp;
+}
+EXPORT_SYMBOL_GPL(of_get_display_timing_list);
+
+/**
+ * of_display_timings_exists - check if a display-timings node is prov=
ided
+ * @np: device_node with the timing
+ **/
+int of_display_timings_exists(struct device_node *np)
+{
+	struct device_node *timings_np;
+	struct device_node *default_np;
+
+	if (!np)
+		return -EINVAL;
+
+	timings_np =3D of_parse_phandle(np, "display-timings", 0);
+	if (!timings_np)
+		return -EINVAL;
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(of_display_timings_exists);
diff --git a/include/linux/of_display_timings.h b/include/linux/of_disp=
lay_timings.h
new file mode 100644
index 0000000..e4e1f22
--- /dev/null
+++ b/include/linux/of_display_timings.h
@@ -0,0 +1,20 @@
+/*
+ * Copyright 2012 Steffen Trumtrar <s.trumtrar@pengutronix.de>
+ *
+ * display timings of helpers
+ *
+ * This file is released under the GPLv2
+ */
+
+#ifndef __LINUX_OF_DISPLAY_TIMINGS_H
+#define __LINUX_OF_DISPLAY_TIMINGS_H
+
+#include <linux/display_timing.h>
+
+#define OF_USE_NATIVE_MODE -1
+
+struct display_timings *of_get_display_timing_list(struct device_node =
*np);
+struct display_timing *of_get_display_timing(struct device_node *np);
+int of_display_timings_exists(struct device_node *np);
+
+#endif
--=20
1.7.10.4
