From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: =?UTF-8?q?=5BPATCH=201/2=5D=20of=3A=20add=20helper=20to=20parse=20display=20specs?=
Date: Mon, 24 Sep 2012 17:35:23 +0200
Message-ID: <1348500924-8551-2-git-send-email-s.trumtrar@pengutronix.de>
References: <1348500924-8551-1-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1348500924-8551-1-git-send-email-s.trumtrar@pengutronix.de>
Sender: linux-media-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: Rob Herring <robherring2@gmail.com>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de, linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Parse a display-node with timings and hardware-specs from devictree.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/video/display |  208 +++++++++++++++=
++++++++
 drivers/of/Kconfig                              |    5 +
 drivers/of/Makefile                             |    1 +
 drivers/of/of_display.c                         |  157 +++++++++++++++=
++
 include/linux/display.h                         |   85 +++++++++
 include/linux/of_display.h                      |   15 ++
 6 files changed, 471 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/display
 create mode 100644 drivers/of/of_display.c
 create mode 100644 include/linux/display.h
 create mode 100644 include/linux/of_display.h

diff --git a/Documentation/devicetree/bindings/video/display b/Document=
ation/devicetree/bindings/video/display
new file mode 100644
index 0000000..722766a
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/display
@@ -0,0 +1,208 @@
+display bindings
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+display-node
+------------
+
+required properties:
+ - none
+
+optional properties:
+ - default-timing: the default timing value
+ - width-mm, height-mm: Display dimensions in mm
+ - hsync-active-high (bool): Hsync pulse is active high
+ - vsync-active-high (bool): Vsync pulse is active high
+ - de-active-high (bool): Data-Enable pulse is active high
+ - pixelclk-inverted (bool): pixelclock is inverted
+ - pixel-per-clk
+ - link-width: number of channels (e.g. LVDS)
+ - bpp: bits-per-pixel
+
+timings-subnode
+---------------
+
+required properties:
+subnodes that specify
+ - hactive, vactive: Display resolution
+ - hfront-porch, hback-porch, hsync-len: Horizontal Display timing par=
ameters
+   in pixels
+   vfront-porch, vback-porch, vsync-len: Vertical display timing param=
eters in
+   lines
+ - clock: displayclock in Hz
+
+There are different ways of describing a display and its capabilities.=
 The devicetree
+representation corresponds to the one commonly found in datasheets for=
 displays.
+The description of the display and its timing is split in two parts: f=
irst the display
+properties like size in mm and (optionally) multiple subnodes with the=
 supported timings.
+If a display supports multiple signal timings, the default-timing can =
be specified.
+
+Example:
+
+	display@0 {
+		width-mm =3D <800>;
+		height-mm =3D <480>;
+		default-timing =3D <&timing0>;
+		timings {
+			timing0: timing@0 {
+				/* 1920x1080p24 */
+				clock =3D <52000000>;
+				hactive =3D <1920>;
+				vactive =3D <1080>;
+				hfront-porch =3D <25>;
+				hback-porch =3D <25>;
+				hsync-len =3D <25>;
+				vback-porch =3D <2>;
+				vfront-porch =3D <2>;
+				vsync-len =3D <2>;
+				hsync-active-high;
+			};
+		};
+	};
+
+Every property also supports the use of ranges, so the commonly used d=
atasheet
+description with <min typ max>-tuples can be used.
+
+Example:
+
+	timing1: timing@1 {
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
+The "display"-property in a connector-node (e.g. hdmi, ldb,...) is use=
d to connect
+the display to that driver.=20
+of_display expects a phandle, that specifies the display-node, in that=
 property.
+
+Example:
+
+	hdmi@00120000 {
+		status =3D "okay";
+		display =3D <&acme>;
+	};
+
+Usage in backend
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+A backend driver may choose to use the display directly and convert th=
e timing
+ranges to a suitable mode. Or it may just use the conversion of the di=
splay timings
+to the required mode via the generic videomode struct.
+
+					dtb
+					 |
+					 |  of_get_display
+					 =E2=86=93
+				   struct display
+					 |
+					 |  videomode_from_timings
+					 =E2=86=93
+			    ---  struct videomode ---
+			    |			    |
+ videomode_to_displaymode   |			    |   videomode_to_fb_videomode
+		            =E2=86=93			    =E2=86=93
+		     drm_display_mode         fb_videomode
+
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
+
+Supported modes
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The generic videomode read in by the driver can be converted to the fo=
llowing
+modes with the following parameters
+
+struct fb_videomode
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+  +----------+---------------------------------------------+----------=
+-------+
+  |          |                =E2=86=91                            |  =
        |       |
+  |          |                |upper_margin                |          =
|       |
+  |          |                =E2=86=93                            |  =
        |       |
+  +----------###############################################----------=
+-------+
+  |          #                =E2=86=91                            #  =
        |       |
+  |          #                |                            #          =
|       |
+  |          #                |                            #          =
|       |
+  |          #                |                            #          =
|       |
+  |   left   #                |                            #  right   =
| hsync |
+  |  margin  #                |       xres                 #  margin  =
|  len  |
+  |<-------->#<---------------+--------------------------->#<-------->=
|<----->|
+  |          #                |                            #          =
|       |
+  |          #                |                            #          =
|       |
+  |          #                |                            #          =
|       |
+  |          #                |yres                        #          =
|       |
+  |          #                |                            #          =
|       |
+  |          #                |                            #          =
|       |
+  |          #                |                            #          =
|       |
+  |          #                |                            #          =
|       |
+  |          #                |                            #          =
|       |
+  |          #                |                            #          =
|       |
+  |          #                |                            #          =
|       |
+  |          #                |                            #          =
|       |
+  |          #                =E2=86=93                            #  =
        |       |
+  +----------###############################################----------=
+-------+
+  |          |                =E2=86=91                            |  =
        |       |
+  |          |                |lower_margin                |          =
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
+clock in nanoseconds
+
+struct drm_display_mode
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+  +----------+---------------------------------------------+----------=
+-------+
+  |          |                                             |          =
|       |  =E2=86=91
+  |          |                                             |          =
|       |  |
+  |          |                                             |          =
|       |  |
+  +----------###############################################----------=
+-------+  |
+  |          #   =E2=86=91         =E2=86=91          =E2=86=91       =
             #          |       |  |
+  |          #   |         |          |                    #          =
|       |  |
+  |          #   |         |          |                    #          =
|       |  |
+  |          #   |         |          |                    #          =
|       |  |
+  |          #   |         |          |                    #          =
|       |  |
+  |          #   |         |          |       hdisplay     #          =
|       |  |
+  |          #<--+--------------------+------------------->#          =
|       |  |
+  |          #   |         |          |                    #          =
|       |  |
+  |          #   |vsync_start         |                    #          =
|       |  |
+  |          #   |         |          |                    #          =
|       |  |
+  |          #   |         |vsync_end |                    #          =
|       |  |
+  |          #   |         |          |vdisplay            #          =
|       |  |
+  |          #   |         |          |                    #          =
|       |  |
+  |          #   |         |          |                    #          =
|       |  |
+  |          #   |         |          |                    #          =
|       |  | vtotal
+  |          #   |         |          |                    #          =
|       |  |
+  |          #   |         |          |     hsync_start    #          =
|       |  |
+  |          #<--+---------+----------+------------------------------>=
|       |  |
+  |          #   |         |          |                    #          =
|       |  |
+  |          #   |         |          |     hsync_end      #          =
|       |  |
+  |          #<--+---------+----------+-------------------------------=
------->|  |
+  |          #   |         |          =E2=86=93                    #  =
        |       |  |
+  +----------####|#########|################################----------=
+-------+  |
+  |          |   |         |                               |          =
|       |  |
+  |          |   |         |                               |          =
|       |  |
+  |          |   =E2=86=93         |                               |  =
        |       |  |
+  +----------+-------------+-------------------------------+----------=
+-------+  |
+  |          |             |                               |          =
|       |  |
+  |          |             |                               |          =
|       |  |
+  |          |             =E2=86=93                               |  =
        |       |  =E2=86=93
+  +----------+---------------------------------------------+----------=
+-------+
+                                   htotal
+   <------------------------------------------------------------------=
------->
+
+clock in kilohertz
diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index dfba3e6..a4e3074 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -83,4 +83,9 @@ config OF_MTD
 	depends on MTD
 	def_bool y
=20
+config OF_DISPLAY
+	def_bool y
+	help
+	  helper to parse displays from the devicetree
+
 endmenu # OF
diff --git a/drivers/of/Makefile b/drivers/of/Makefile
index e027f44..0756bee 100644
--- a/drivers/of/Makefile
+++ b/drivers/of/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_OF_MDIO)	+=3D of_mdio.o
 obj-$(CONFIG_OF_PCI)	+=3D of_pci.o
 obj-$(CONFIG_OF_PCI_IRQ)  +=3D of_pci_irq.o
 obj-$(CONFIG_OF_MTD)	+=3D of_mtd.o
+obj-$(CONFIG_OF_DISPLAY) +=3D of_display.o
diff --git a/drivers/of/of_display.c b/drivers/of/of_display.c
new file mode 100644
index 0000000..632a351
--- /dev/null
+++ b/drivers/of/of_display.c
@@ -0,0 +1,157 @@
+/*
+ * OF helpers for parsing display timings
+ *=20
+ * Copyright (c) 2012 Steffen Trumtrar <s.trumtrar@pengutronix.de>, Pe=
ngutronix
+ *=20
+ * based on of_videomode.c by Sascha Hauer <s.hauer@pengutronix.de>
+ *
+ * This file is released under the GPLv2
+ */
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/display.h>
+#include <linux/of_display.h>
+#include <linux/fb.h>
+
+/* every signal_timing can be specified with either
+ * just the typical value or a range consisting of
+ * min/typ/max.
+ * This function helps handling this
+ */
+static int of_display_parse_property(struct device_node *np, char *nam=
e,
+				struct timing_entry *result)
+{
+	struct property *prop;
+	int length;
+	int cells;
+	int ret;
+
+	prop =3D of_find_property(np, name, &length);
+	if (!prop) {
+		pr_err("%s: could not find property %s\n", __func__,
+			name);
+		return -EINVAL;
+	}
+
+	cells =3D length / sizeof(u32);
+
+	if (cells =3D=3D 1)
+		ret =3D of_property_read_u32_array(np, name, &result->typ, cells);
+	else if (cells =3D=3D 3)
+		ret =3D of_property_read_u32_array(np, name, &result->min, cells);
+	else {
+		pr_err("%s: illegal timing specification in %s\n", __func__,
+			name);
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+struct display *of_get_display(struct device_node *np)
+{
+	struct device_node *display_np;
+	struct device_node *timing_np;
+	struct device_node *timings;
+	struct display *disp;
+	char *default_timing;
+
+	if (!np) {
+		pr_err("%s: no devicenode given\n", __func__);
+		return NULL;
+	}
+
+	display_np =3D of_parse_phandle(np, "display", 0);
+
+	if (!display_np) {
+		pr_err("%s: could not find display node\n", __func__);
+		return NULL;
+	}
+
+	disp =3D kmalloc(sizeof(struct display *), GFP_KERNEL);
+
+	memset(disp, 0, sizeof(struct display *));
+
+	of_property_read_u32(display_np, "width-mm", &disp->width_mm);
+	of_property_read_u32(display_np, "height-mm", &disp->height_mm);
+
+	timing_np =3D of_parse_phandle(display_np, "default-timing", 0);
+
+	if (!timing_np) {
+		pr_info("%s: no default-timing specified\n", __func__);
+		timing_np =3D of_find_node_by_name(np, "timing");
+	}
+
+	if (!timing_np) {
+		pr_info("%s: no timing specifications given\n", __func__);
+		return disp;
+	}
+
+	default_timing =3D (char *)timing_np->full_name;
+
+	timings =3D of_find_node_by_name(np, "timings");
+
+	disp->num_timings =3D 0;
+
+	disp->timings =3D kmalloc(sizeof(struct signal_timing *), GFP_KERNEL)=
;
+
+	for_each_child_of_node(timings, timing_np) {
+		struct signal_timing *st;
+		int ret;
+
+		st =3D kmalloc(sizeof(struct signal_timing *), GFP_KERNEL);
+		disp->timings[disp->num_timings] =3D kmalloc(sizeof(struct signal_ti=
ming *), GFP_KERNEL);
+
+		ret |=3D of_display_parse_property(timing_np, "hback-porch", &st->hb=
ack_porch);
+		ret |=3D of_display_parse_property(timing_np, "hfront-porch", &st->h=
front_porch);
+		ret |=3D of_display_parse_property(timing_np, "hactive", &st->hactiv=
e);
+		ret |=3D of_display_parse_property(timing_np, "hsync-len", &st->hsyn=
c_len);
+		ret |=3D of_display_parse_property(timing_np, "vback-porch", &st->vb=
ack_porch);
+		ret |=3D of_display_parse_property(timing_np, "vfront-porch", &st->v=
front_porch);
+		ret |=3D of_display_parse_property(timing_np, "vactive", &st->vactiv=
e);
+		ret |=3D of_display_parse_property(timing_np, "vsync-len", &st->vsyn=
c_len);
+		ret |=3D of_display_parse_property(timing_np, "clock", &st->pixelclo=
ck);
+
+		if (strcmp(default_timing, timing_np->full_name) =3D=3D 0)
+			disp->default_timing =3D disp->num_timings;
+
+		disp->timings[disp->num_timings] =3D st;
+		disp->num_timings++;
+	}
+
+	disp->vsync_pol_active_high =3D of_property_read_bool(display_np, "vs=
ync-active-high");
+	disp->hsync_pol_active_high =3D of_property_read_bool(display_np, "hs=
ync-active-high");
+	disp->de_pol_active_high =3D of_property_read_bool(display_np, "de-ac=
tive-high");
+	disp->pixelclk_pol_inverted =3D of_property_read_bool(display_np, "pi=
xelclk-inverted");
+	of_property_read_u32(display_np, "pixel-per-clk", &disp->if_pixel_per=
_clk);
+	of_property_read_u32(display_np, "link-width", &disp->if_link_width);
+	of_property_read_u32(display_np, "bpp", &disp->if_bpp);
+
+
+	pr_info("%s: got %d timings. Using #%d as default\n", __func__, disp-=
>num_timings, disp->default_timing + 1);
+
+	return disp;
+}
+EXPORT_SYMBOL(of_get_display);
+
+int of_display_exists(struct device_node *np)
+{
+	struct device_node *display_np;
+	struct device_node *timing_np;
+
+	if (!np)
+		return -EINVAL;
+
+	display_np =3D of_parse_phandle(np, "display", 0);
+
+	if (!display_np)
+		return -EINVAL;
+
+	timing_np =3D of_parse_phandle(np, "default-timing", 0);
+
+	if (timing_np)
+		return 0;
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(of_display_exists);
diff --git a/include/linux/display.h b/include/linux/display.h
new file mode 100644
index 0000000..bb84ed9
--- /dev/null
+++ b/include/linux/display.h
@@ -0,0 +1,85 @@
+/*
+ * Copyright 2012 Steffen Trumtrar <s.trumtrar@pengutronix.de>
+ *
+ * Hardware-description of a display
+ *
+ * This file is released under the GPLv2
+ */
+
+#ifndef __LINUX_DISPLAY_H
+#define __LINUX_DISPLAY_H
+
+#include <linux/list.h>
+
+#define OF_DEFAULT_TIMING -1
+
+struct display {
+	u32 width_mm;
+	u32 height_mm;
+	unsigned int num_timings;
+	unsigned int default_timing;
+
+	struct signal_timing **timings;
+
+	bool vsync_pol_active_high;
+	bool hsync_pol_active_high;
+	bool de_pol_active_high;
+	bool pixelclk_pol_inverted;
+
+	u32 if_bpp;
+	u32 if_link_width;
+	u32 if_pixel_per_clk;
+};
+
+struct timing_entry {
+	u32 min;
+	u32 typ;
+	u32 max;
+};
+
+struct signal_timing {
+	struct timing_entry pixelclock;
+
+	struct timing_entry hactive;
+	struct timing_entry hfront_porch;
+	struct timing_entry hback_porch;
+	struct timing_entry hsync_len;
+
+	struct timing_entry vactive;
+	struct timing_entry vfront_porch;
+	struct timing_entry vback_porch;
+	struct timing_entry vsync_len;
+};
+
+/* placeholder function until ranges are really needed */
+static inline u32 signal_timing_get_value(struct timing_entry *te, int=
 index)
+{
+	return te->typ;
+}
+
+static inline void timings_release(struct display *disp)
+{
+	int i;
+	for (i =3D 0; i < disp->num_timings; i++)
+		kfree(disp->timings[i]);
+}
+
+static inline void display_release(struct display *disp)
+{
+	timings_release(disp);
+	kfree(disp->timings);
+}
+
+static inline struct signal_timing *display_get_timing(struct display =
*disp, int index)
+{
+	if (disp->num_timings >=3D index)
+		return disp->timings[index];
+	else
+		return NULL;
+}
+
+
+int of_display_exists(struct device_node *np);
+struct display *of_get_display(struct device_node *np);
+
+#endif /* __LINUX_DISPLAY_H */
diff --git a/include/linux/of_display.h b/include/linux/of_display.h
new file mode 100644
index 0000000..500ff94
--- /dev/null
+++ b/include/linux/of_display.h
@@ -0,0 +1,15 @@
+/*
+ * Copyright 2012 Steffen Trumtrar <s.trumtrar@pengutronix.de>
+ *
+ * This file is released under the GPLv2
+ */
+
+#ifndef __LINUX_OF_DISPLAY_H
+#define __LINUX_OF_DISPALY_H
+
+#include <linux/fb.h>
+
+struct display *of_get_display(struct device_node *np);
+int of_display_exists(struct device_node *np);
+
+#endif
--=20
1.7.10.4
