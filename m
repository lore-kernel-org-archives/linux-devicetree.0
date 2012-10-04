From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: =?UTF-8?q?=5BPATCH=201/2=20v6=5D=20of=3A=20add=20helper=20to=20parse=20display=20timings?=
Date: Thu,  4 Oct 2012 19:59:19 +0200
Message-ID: <1349373560-11128-2-git-send-email-s.trumtrar@pengutronix.de>
References: <1349373560-11128-1-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1349373560-11128-1-git-send-email-s.trumtrar@pengutronix.de>
Sender: linux-media-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, Rob Herring <robherring2@gmail.com>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 .../devicetree/bindings/video/display-timings.txt  |  222 ++++++++++++=
++++++++
 drivers/of/Kconfig                                 |    5 +
 drivers/of/Makefile                                |    1 +
 drivers/of/of_display_timings.c                    |  183 ++++++++++++=
++++
 include/linux/of_display_timings.h                 |   85 ++++++++
 5 files changed, 496 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/display-tim=
ings.txt
 create mode 100644 drivers/of/of_display_timings.c
 create mode 100644 include/linux/of_display_timings.h

diff --git a/Documentation/devicetree/bindings/video/display-timings.tx=
t b/Documentation/devicetree/bindings/video/display-timings.txt
new file mode 100644
index 0000000..45e39bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/display-timings.txt
@@ -0,0 +1,222 @@
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
+ - default-timing: the default timing value
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
+ - clock: displayclock in Hz
+
+optional properties:
+ - hsync-active-high (bool): Hsync pulse is active high
+ - vsync-active-high (bool): Vsync pulse is active high
+ - de-active-high (bool): Data-Enable pulse is active high
+ - pixelclk-inverted (bool): pixelclock is inverted
+ - interlaced (bool)
+ - doublescan (bool)
+
+There are different ways of describing the capabilities of a display. =
The devicetree
+representation corresponds to the one commonly found in datasheets for=
 displays.
+If a display supports multiple signal timings, the default-timing can =
be specified.
+
+The parameters are defined as
+
+struct signal_timing
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
+		default-timing =3D <&timing0>;
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
+			hsync-active-high;
+		};
+	};
+
+Every property also supports the use of ranges, so the commonly used d=
atasheet
+description with <min typ max>-tuples can be used.
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
index dfba3e6..646deb0 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -83,4 +83,9 @@ config OF_MTD
 	depends on MTD
 	def_bool y
=20
+config OF_DISPLAY_TIMINGS
+	def_bool y
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
index 0000000..e47bc63
--- /dev/null
+++ b/drivers/of/of_display_timings.c
@@ -0,0 +1,183 @@
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
+#include <linux/export.h>
+#include <linux/of_display_timings.h>
+
+/* every signal_timing can be specified with either
+ * just the typical value or a range consisting of
+ * min/typ/max.
+ * This function helps handling this
+ */
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
+struct signal_timing *of_get_display_timing(struct device_node *np)
+{
+	struct signal_timing *st;
+	int ret =3D 0;
+
+	st =3D kzalloc(sizeof(*st), GFP_KERNEL);
+
+	if (!st) {
+		pr_err("%s: could not allocate signal_timing struct\n", __func__);
+		return NULL;
+	}
+
+	ret |=3D parse_property(np, "hback-porch", &st->hback_porch);
+	ret |=3D parse_property(np, "hfront-porch", &st->hfront_porch);
+	ret |=3D parse_property(np, "hactive", &st->hactive);
+	ret |=3D parse_property(np, "hsync-len", &st->hsync_len);
+	ret |=3D parse_property(np, "vback-porch", &st->vback_porch);
+	ret |=3D parse_property(np, "vfront-porch", &st->vfront_porch);
+	ret |=3D parse_property(np, "vactive", &st->vactive);
+	ret |=3D parse_property(np, "vsync-len", &st->vsync_len);
+	ret |=3D parse_property(np, "clock", &st->pixelclock);
+
+	st->vsync_pol_active_high =3D of_property_read_bool(np, "vsync-active=
-high");
+	st->hsync_pol_active_high =3D of_property_read_bool(np, "hsync-active=
-high");
+	st->de_pol_active_high =3D of_property_read_bool(np, "de-active-high"=
);
+	st->pixelclk_pol_inverted =3D of_property_read_bool(np, "pixelclk-inv=
erted");
+	st->interlaced =3D of_property_read_bool(np, "interlaced");
+	st->doublescan =3D of_property_read_bool(np, "doublescan");
+
+	if (ret) {
+		pr_err("%s: error reading timing properties\n", __func__);
+		return NULL;
+	}
+
+	return st;
+}
+EXPORT_SYMBOL_GPL(of_get_display_timing);
+
+struct display_timings *of_get_display_timing_list(struct device_node =
*np)
+{
+	struct device_node *timings_np;
+	struct device_node *entry;
+	struct display_timings *disp;
+	char *default_timing;
+
+	if (!np) {
+		pr_err("%s: no devicenode given\n", __func__);
+		return NULL;
+	}
+
+	timings_np =3D of_find_node_by_name(np, "display-timings");
+
+	if (!timings_np) {
+		pr_err("%s: could not find display-timings node\n", __func__);
+		return NULL;
+	}
+
+	disp =3D kzalloc(sizeof(*disp), GFP_KERNEL);
+
+	entry =3D of_parse_phandle(timings_np, "default-timing", 0);
+
+	if (!entry) {
+		pr_info("%s: no default-timing specified\n", __func__);
+		entry =3D of_find_node_by_name(np, "timing");
+	}
+
+	if (!entry) {
+		pr_info("%s: no timing specifications given\n", __func__);
+		return disp;
+	}
+
+	pr_info("%s: using %s as default timing\n", __func__, entry->name);
+
+	default_timing =3D (char *)entry->full_name;
+
+	disp->num_timings =3D 0;
+
+	for_each_child_of_node(timings_np, entry) {
+		disp->num_timings++;
+	}
+
+	disp->timings =3D kzalloc(sizeof(struct signal_timing *)*disp->num_ti=
mings,
+				GFP_KERNEL);
+
+	disp->num_timings =3D 0;
+
+	for_each_child_of_node(timings_np, entry) {
+		struct signal_timing *st;
+
+		st =3D of_get_display_timing(entry);
+
+		if (!st)
+			continue;
+
+		if (strcmp(default_timing, entry->full_name) =3D=3D 0)
+			disp->default_timing =3D disp->num_timings;
+
+		disp->timings[disp->num_timings] =3D st;
+		disp->num_timings++;
+	}
+
+
+	of_node_put(timings_np);
+
+	if (disp->num_timings >=3D 0)
+		pr_info("%s: got %d timings. Using timing #%d as default\n", __func_=
_,
+			disp->num_timings , disp->default_timing + 1);
+	else
+		pr_info("%s: no timings specified\n", __func__);
+
+	return disp;
+}
+EXPORT_SYMBOL_GPL(of_get_display_timing_list);
+
+int of_display_timings_exists(struct device_node *np)
+{
+	struct device_node *timings_np;
+	struct device_node *default_np;
+
+	if (!np)
+		return -EINVAL;
+
+	timings_np =3D of_parse_phandle(np, "display-timings", 0);
+
+	if (!timings_np)
+		return -EINVAL;
+
+	default_np =3D of_parse_phandle(np, "default-timing", 0);
+
+	if (default_np)
+		return 0;
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(of_display_timings_exists);
diff --git a/include/linux/of_display_timings.h b/include/linux/of_disp=
lay_timings.h
new file mode 100644
index 0000000..1ad719e
--- /dev/null
+++ b/include/linux/of_display_timings.h
@@ -0,0 +1,85 @@
+/*
+ * Copyright 2012 Steffen Trumtrar <s.trumtrar@pengutronix.de>
+ *
+ * description of display timings
+ *
+ * This file is released under the GPLv2
+ */
+
+#ifndef __LINUX_OF_DISPLAY_TIMINGS_H
+#define __LINUX_OF_DISPLAY_TIMINGS_H
+
+#define OF_DEFAULT_TIMING -1
+
+struct display_timings {
+	unsigned int num_timings;
+	unsigned int default_timing;
+
+	struct signal_timing **timings;
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
+
+	bool vsync_pol_active_high;
+	bool hsync_pol_active_high;
+	bool de_pol_active_high;
+	bool pixelclk_pol_inverted;
+	bool interlaced;
+	bool doublescan;
+};
+
+struct display_timings *of_get_display_timing_list(struct device_node =
*np);
+struct signal_timing *of_get_display_timing(struct device_node *np);
+int of_display_timings_exists(struct device_node *np);
+
+/* placeholder function until ranges are really needed */
+static inline u32 signal_timing_get_value(struct timing_entry *te, int=
 index)
+{
+	return te->typ;
+}
+
+static inline void timings_release(struct display_timings *disp)
+{
+	int i;
+
+	for (i =3D 0; i < disp->num_timings; i++)
+		kfree(disp->timings[i]);
+}
+
+static inline void display_timings_release(struct display_timings *dis=
p)
+{
+	timings_release(disp);
+	kfree(disp->timings);
+}
+
+static inline struct signal_timing *display_timings_get(struct display=
_timings *disp,
+							 int index)
+{
+	struct signal_timing *st;
+
+	if (disp->num_timings > index) {
+		st =3D disp->timings[index];
+		return st;
+	}
+	else
+		return NULL;
+}
+
+#endif
--=20
1.7.10.4
