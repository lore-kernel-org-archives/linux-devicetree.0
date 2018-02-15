From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 03/12] drm: rcar-du: Fix legacy DT to create LVDS encoder nodes
Date: Thu, 15 Feb 2018 02:04:06 +0200
Message-ID: <20180215000415.19077-4-laurent.pinchart+renesas@ideasonboard.com>
References: <20180215000415.19077-1-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180215000415.19077-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

The internal LVDS encoders now have their own DT bindings. Before
switching the driver infrastructure to those new bindings, implement
backward-compatibility through live DT patching.

Patching is disabled and will be enabled along with support for the new
DT bindings in the DU driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v2:

- Update the SPDX headers to use C-style comments in header files
- Removed the manually created __local_fixups__ node
- Perform manual fixups on live DT instead of overlay

Changes since v1:

- Select OF_FLATTREE
- Compile LVDS DT bindings patch code when DRM_RCAR_LVDS is selected
- Update the SPDX headers to use GPL-2.0 instead of GPL-2.0-only
- Turn __dtb_rcar_du_of_lvds_(begin|end) from u8 to char
- Pass void begin and end pointers to rcar_du_of_get_overlay()
- Use of_get_parent() instead of accessing the parent pointer directly
- Find the LVDS endpoints nodes based on the LVDS node instead of the
  root of the overlay
- Update to the <soc>-lvds compatible string format
---
 drivers/gpu/drm/rcar-du/Kconfig                    |   2 +
 drivers/gpu/drm/rcar-du/Makefile                   |   7 +-
 drivers/gpu/drm/rcar-du/rcar_du_of.c               | 374 +++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_of.h               |  20 ++
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts    |  81 +++++
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts    |  55 +++
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts    |  55 +++
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts    |  55 +++
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts    |  55 +++
 9 files changed, 703 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 5d0b4b7119af..3f83352a7313 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -22,6 +22,8 @@ config DRM_RCAR_LVDS
 	bool "R-Car DU LVDS Encoder Support"
 	depends on DRM_RCAR_DU
 	select DRM_PANEL
+	select OF_FLATTREE
+	select OF_OVERLAY
 	help
 	  Enable support for the R-Car Display Unit embedded LVDS encoders.
 
diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index 0cf5c11030e8..86b337b4be5d 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -8,7 +8,12 @@ rcar-du-drm-y := rcar_du_crtc.o \
 		 rcar_du_plane.o
 
 rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_lvdsenc.o
-
+rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
+					   rcar_du_of_lvds_r8a7790.dtb.o \
+					   rcar_du_of_lvds_r8a7791.dtb.o \
+					   rcar_du_of_lvds_r8a7793.dtb.o \
+					   rcar_du_of_lvds_r8a7795.dtb.o \
+					   rcar_du_of_lvds_r8a7796.dtb.o
 rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
 
 obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.c b/drivers/gpu/drm/rcar-du/rcar_du_of.c
new file mode 100644
index 000000000000..141f6eda6e98
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
@@ -0,0 +1,374 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * rcar_du_of.c - Legacy DT bindings compatibility
+ *
+ * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ *
+ * Based on work from Jyri Sarha <jsarha@ti.com>
+ * Copyright (C) 2015 Texas Instruments
+ */
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_fdt.h>
+#include <linux/of_graph.h>
+#include <linux/slab.h>
+
+#include "rcar_du_crtc.h"
+#include "rcar_du_drv.h"
+
+/* -----------------------------------------------------------------------------
+ * Generic Overlay Handling
+ */
+
+struct rcar_du_of_overlay {
+	const char *compatible;
+	void *begin;
+	void *end;
+};
+
+#define RCAR_DU_OF_DTB(type, soc)					\
+	extern char __dtb_rcar_du_of_##type##_##soc##_begin[];		\
+	extern char __dtb_rcar_du_of_##type##_##soc##_end[]
+
+#define RCAR_DU_OF_OVERLAY(type, soc)					\
+	{								\
+		.compatible = "renesas,du-" #soc,			\
+		.begin = __dtb_rcar_du_of_##type##_##soc##_begin,	\
+		.end = __dtb_rcar_du_of_##type##_##soc##_end,		\
+	}
+
+static int __init rcar_du_of_apply_overlay(const struct rcar_du_of_overlay *dtbs,
+					   const char *compatible)
+{
+	const struct rcar_du_of_overlay *dtb = NULL;
+	struct device_node *node = NULL;
+	unsigned int i;
+	int ovcs_id;
+	void *data;
+	void *mem;
+	int ret;
+
+	for (i = 0; dtbs[i].compatible; ++i) {
+		if (!strcmp(dtbs[i].compatible, compatible)) {
+			dtb = &dtbs[i];
+			break;
+		}
+	}
+
+	if (!dtb)
+		return -ENODEV;
+
+	data = kmemdup(dtb->begin, dtb->end - dtb->begin, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	mem = of_fdt_unflatten_tree(data, NULL, &node);
+	if (!mem) {
+		ret = -ENOMEM;
+		goto done;
+	}
+
+	ovcs_id = 0;
+	ret = of_overlay_apply(node, &ovcs_id);
+
+done:
+	of_node_put(node);
+	kfree(data);
+	kfree(mem);
+
+	return ret;
+}
+
+static struct device_node __init *
+rcar_du_of_find_node_by_path(struct device_node *parent, const char *path)
+{
+	parent = of_node_get(parent);
+	if (!parent)
+		return NULL;
+
+	while (parent && *path == '/') {
+		struct device_node *child = NULL;
+		struct device_node *node;
+		const char *next;
+		size_t len;
+
+		/* Skip the initial '/' delimiter and find the next one. */
+		path++;
+		next = strchrnul(path, '/');
+		len = next - path;
+		if (!len)
+			goto error;
+
+		for_each_child_of_node(parent, node) {
+			const char *name = kbasename(node->full_name);
+
+			if (strncmp(path, name, len) == 0 &&
+			    strlen(name) == len) {
+				child = node;
+				break;
+			}
+		}
+
+		if (!child)
+			goto error;
+
+		of_node_put(parent);
+		parent = child;
+		path = next;
+	}
+
+	return parent;
+
+error:
+	of_node_put(parent);
+	return NULL;
+}
+
+static int __init rcar_du_of_add_property(struct device_node *np,
+					  const char *name, const void *value,
+					  size_t length)
+{
+	struct property *prop;
+
+	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
+	if (!prop)
+		return -ENOMEM;
+
+	prop->name = kstrdup(name, GFP_KERNEL);
+	prop->value = kmemdup(value, length, GFP_KERNEL);
+	prop->length = length;
+
+	if (!prop->name || !prop->value) {
+		kfree(prop->name);
+		kfree(prop->value);
+		kfree(prop);
+		return -ENOMEM;
+	}
+
+	of_property_set_flag(prop, OF_DYNAMIC);
+
+	prop->next = np->properties;
+	np->properties = prop;
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * LVDS Overlays
+ */
+
+RCAR_DU_OF_DTB(lvds, r8a7790);
+RCAR_DU_OF_DTB(lvds, r8a7791);
+RCAR_DU_OF_DTB(lvds, r8a7793);
+RCAR_DU_OF_DTB(lvds, r8a7795);
+RCAR_DU_OF_DTB(lvds, r8a7796);
+
+static const struct rcar_du_of_overlay rcar_du_lvds_overlays[] __initconst = {
+	RCAR_DU_OF_OVERLAY(lvds, r8a7790),
+	RCAR_DU_OF_OVERLAY(lvds, r8a7791),
+	RCAR_DU_OF_OVERLAY(lvds, r8a7793),
+	RCAR_DU_OF_OVERLAY(lvds, r8a7795),
+	RCAR_DU_OF_OVERLAY(lvds, r8a7796),
+	{ /* Sentinel */ },
+};
+
+static void __init rcar_du_of_lvds_patch_one(struct device_node *lvds,
+					     const struct of_phandle_args *clk,
+					     struct device_node *local,
+					     struct device_node *remote)
+{
+	struct device_node *endpoints[2];
+	unsigned int psize;
+	unsigned int i;
+	__be32 value[4];
+	int ret;
+
+	/*
+	 * Set the LVDS clocks property. This can't be performed by the overlay
+	 * as the structure of the clock specifier has changed over time, and we
+	 * don't know at compile time which binding version the system we will
+	 * run on uses.
+	 */
+	if (clk->args_count >= ARRAY_SIZE(value) - 1)
+		return;
+
+	value[0] = cpu_to_be32(clk->np->phandle);
+	for (i = 0; i < clk->args_count; ++i)
+		value[i + 1] = cpu_to_be32(clk->args[i]);
+
+	psize = (clk->args_count + 1) * 4;
+	ret = rcar_du_of_add_property(lvds, "clocks", value, psize);
+	if (ret < 0)
+		return;
+
+	/*
+	 * Insert the node in the OF graph: patch the LVDS ports remote-endpoint
+	 * properties to point to the endpoints of the sibling nodes in the
+	 * graph. This can't be performed by the overlay: on the input side the
+	 * overlay would contain a phandle for the DU LVDS output port that
+	 * would clash with the system DT, and on the output side the connection
+	 * is board-specific.
+	 */
+	endpoints[0] = rcar_du_of_find_node_by_path(lvds,
+						    "/ports/port@0/endpoint");
+	endpoints[1] = rcar_du_of_find_node_by_path(lvds,
+						    "/ports/port@1/endpoint");
+	if (!endpoints[0] || !endpoints[1])
+		return;
+
+	value[0] = cpu_to_be32(local->phandle);
+	ret = rcar_du_of_add_property(endpoints[0], "remote-endpoint",
+				      value, 4);
+	if (ret < 0)
+		goto done;
+
+	value[0] = cpu_to_be32(remote->phandle);
+	ret = rcar_du_of_add_property(endpoints[1], "remote-endpoint",
+				      value, 4);
+	if (ret < 0)
+		goto done;
+
+done:
+	of_node_put(endpoints[0]);
+	of_node_put(endpoints[1]);
+}
+
+struct lvds_of_data {
+	struct resource res;
+	struct of_phandle_args clkspec;
+	struct device_node *local;
+	struct device_node *remote;
+};
+
+static void __init rcar_du_of_lvds_patch(const struct of_device_id *of_ids)
+{
+	const struct rcar_du_device_info *info;
+	const struct of_device_id *match;
+	struct lvds_of_data lvds_data[2] = { };
+	struct device_node *lvds_node;
+	struct device_node *soc_node;
+	struct device_node *du_node;
+	char compatible[21];
+	const char *soc_name;
+	unsigned int i;
+	int ret;
+
+	/* Get the DU node and exit if not present or disabled. */
+	du_node = of_find_matching_node_and_match(NULL, of_ids, &match);
+	if (!du_node || !of_device_is_available(du_node)) {
+		of_node_put(du_node);
+		return;
+	}
+
+	info = match->data;
+	soc_node = of_get_parent(du_node);
+
+	if (WARN_ON(info->num_lvds > ARRAY_SIZE(lvds_data)))
+		goto done;
+
+	/*
+	 * Skip if the LVDS nodes already exists.
+	 *
+	 * The nodes are searched based on the compatible string, which we
+	 * construct from the SoC name found in the DU compatible string. As a
+	 * match has been found we know the compatible string matches the
+	 * expected format and can thus skip some of the string manipulation
+	 * normal safety checks.
+	 */
+	soc_name = strchr(match->compatible, '-') + 1;
+	sprintf(compatible, "renesas,%s-lvds", soc_name);
+	lvds_node = of_find_compatible_node(NULL, NULL, compatible);
+	if (lvds_node) {
+		of_node_put(lvds_node);
+		return;
+	}
+
+	/*
+	 * Parse the DU node and store the register specifier, the clock
+	 * specifier and the local and remote endpoint of the LVDS link for
+	 * later use.
+	 */
+	for (i = 0; i < info->num_lvds; ++i) {
+		struct lvds_of_data *lvds = &lvds_data[i];
+		unsigned int port;
+		char name[7];
+		int index;
+
+		sprintf(name, "lvds.%u", i);
+		index = of_property_match_string(du_node, "clock-names", name);
+		if (index < 0)
+			continue;
+
+		ret = of_parse_phandle_with_args(du_node, "clocks",
+						 "#clock-cells", index,
+						 &lvds->clkspec);
+		if (ret < 0)
+			continue;
+
+		port = info->routes[RCAR_DU_OUTPUT_LVDS0 + i].port;
+
+		lvds->local = of_graph_get_endpoint_by_regs(du_node, port, 0);
+		if (!lvds->local)
+			continue;
+
+		lvds->remote = of_graph_get_remote_endpoint(lvds->local);
+		if (!lvds->remote)
+			continue;
+
+		index = of_property_match_string(du_node, "reg-names", name);
+		if (index < 0)
+			continue;
+
+		of_address_to_resource(du_node, index, &lvds->res);
+	}
+
+	/* Parse and apply the overlay. This will resolve phandles. */
+	ret = rcar_du_of_apply_overlay(rcar_du_lvds_overlays,
+				       match->compatible);
+	if (ret < 0)
+		goto done;
+
+	/* Patch the newly created LVDS encoder nodes. */
+	for_each_child_of_node(soc_node, lvds_node) {
+		struct resource res;
+
+		if (!of_device_is_compatible(lvds_node, compatible))
+			continue;
+
+		/* Locate the lvds_data entry based on the resource start. */
+		ret = of_address_to_resource(lvds_node, 0, &res);
+		if (ret < 0)
+			continue;
+
+		for (i = 0; i < ARRAY_SIZE(lvds_data); ++i) {
+			if (lvds_data[i].res.start == res.start)
+				break;
+		}
+
+		if (i == ARRAY_SIZE(lvds_data))
+			continue;
+
+		/* Patch the LVDS encoder. */
+		rcar_du_of_lvds_patch_one(lvds_node, &lvds_data[i].clkspec,
+					  lvds_data[i].local,
+					  lvds_data[i].remote);
+	}
+
+done:
+	for (i = 0; i < info->num_lvds; ++i) {
+		of_node_put(lvds_data[i].clkspec.np);
+		of_node_put(lvds_data[i].local);
+		of_node_put(lvds_data[i].remote);
+	}
+
+	of_node_put(soc_node);
+	of_node_put(du_node);
+}
+
+void __init rcar_du_of_init(const struct of_device_id *of_ids)
+{
+	rcar_du_of_lvds_patch(of_ids);
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.h b/drivers/gpu/drm/rcar-du/rcar_du_of.h
new file mode 100644
index 000000000000..c2e65a727e91
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_of.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * rcar_du_of.h - Legacy DT bindings compatibility
+ *
+ * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+#ifndef __RCAR_DU_OF_H__
+#define __RCAR_DU_OF_H__
+
+#include <linux/init.h>
+
+struct of_device_id;
+
+#ifdef CONFIG_DRM_RCAR_LVDS
+void __init rcar_du_of_init(const struct of_device_id *of_ids);
+#else
+static inline void rcar_du_of_init(const struct of_device_id *of_ids) { }
+#endif /* CONFIG_DRM_RCAR_LVDS */
+
+#endif /* __RCAR_DU_OF_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
new file mode 100644
index 000000000000..6ebb355b652a
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * rcar_du_of_lvds_r8a7790.dts - Legacy LVDS DT bindings conversion for R8A7790
+ *
+ * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ *
+ * Based on work from Jyri Sarha <jsarha@ti.com>
+ * Copyright (C) 2015 Texas Instruments
+ */
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/dts-v1/;
+/plugin/;
+/ {
+	fragment@0 {
+		target-path = "/";
+		__overlay__ {
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			lvds@feb90000 {
+				compatible = "renesas,r8a7790-lvds";
+				reg = <0 0xfeb90000 0 0x1c>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						lvds0_input: endpoint {
+						};
+					};
+					port@1 {
+						reg = <1>;
+						lvds0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			lvds@feb94000 {
+				compatible = "renesas,r8a7790-lvds";
+				reg = <0 0xfeb94000 0 0x1c>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						lvds1_input: endpoint {
+						};
+					};
+					port@1 {
+						reg = <1>;
+						lvds1_out: endpoint {
+						};
+					};
+				};
+			};
+		};
+	};
+
+	fragment@1 {
+		target-path = "/display@feb00000/ports";
+		__overlay__ {
+			port@1 {
+				endpoint {
+					remote-endpoint = <&lvds0_input>;
+				};
+			};
+			port@2 {
+				endpoint {
+					remote-endpoint = <&lvds1_input>;
+				};
+			};
+		};
+	};
+};
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
new file mode 100644
index 000000000000..601982bba27d
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * rcar_du_of_lvds_r8a7791.dts - Legacy LVDS DT bindings conversion for R8A7791
+ *
+ * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ *
+ * Based on work from Jyri Sarha <jsarha@ti.com>
+ * Copyright (C) 2015 Texas Instruments
+ */
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/dts-v1/;
+/plugin/;
+/ {
+	fragment@0 {
+		target-path = "/";
+		__overlay__ {
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			lvds@feb90000 {
+				compatible = "renesas,r8a7791-lvds";
+				reg = <0 0xfeb90000 0 0x1c>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						lvds0_input: endpoint {
+						};
+					};
+					port@1 {
+						reg = <1>;
+						lvds0_out: endpoint {
+						};
+					};
+				};
+			};
+		};
+	};
+
+	fragment@1 {
+		target-path = "/display@feb00000/ports";
+		__overlay__ {
+			port@1 {
+				endpoint {
+					remote-endpoint = <&lvds0_input>;
+				};
+			};
+		};
+	};
+};
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
new file mode 100644
index 000000000000..1c535954a529
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * rcar_du_of_lvds_r8a7793.dts - Legacy LVDS DT bindings conversion for R8A7793
+ *
+ * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ *
+ * Based on work from Jyri Sarha <jsarha@ti.com>
+ * Copyright (C) 2015 Texas Instruments
+ */
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/dts-v1/;
+/plugin/;
+/ {
+	fragment@0 {
+		target-path = "/";
+		__overlay__ {
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			lvds@feb90000 {
+				compatible = "renesas,r8a7793-lvds";
+				reg = <0 0xfeb90000 0 0x1c>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						lvds0_input: endpoint {
+						};
+					};
+					port@1 {
+						reg = <1>;
+						lvds0_out: endpoint {
+						};
+					};
+				};
+			};
+		};
+	};
+
+	fragment@1 {
+		target-path = "/display@feb00000/ports";
+		__overlay__ {
+			port@1 {
+				endpoint {
+					remote-endpoint = <&lvds0_input>;
+				};
+			};
+		};
+	};
+};
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
new file mode 100644
index 000000000000..44e52101ef05
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * rcar_du_of_lvds_r8a7795.dts - Legacy LVDS DT bindings conversion for R8A7795
+ *
+ * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ *
+ * Based on work from Jyri Sarha <jsarha@ti.com>
+ * Copyright (C) 2015 Texas Instruments
+ */
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/dts-v1/;
+/plugin/;
+/ {
+	fragment@0 {
+		target-path = "/soc";
+		__overlay__ {
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			lvds@feb90000 {
+				compatible = "renesas,r8a7795-lvds";
+				reg = <0 0xfeb90000 0 0x14>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						lvds0_input: endpoint {
+						};
+					};
+					port@1 {
+						reg = <1>;
+						lvds0_out: endpoint {
+						};
+					};
+				};
+			};
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc/display@feb00000/ports";
+		__overlay__ {
+			port@3 {
+				endpoint {
+					remote-endpoint = <&lvds0_input>;
+				};
+			};
+		};
+	};
+};
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
new file mode 100644
index 000000000000..8f45ebe140bd
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * rcar_du_of_lvds_r8a7796.dts - Legacy LVDS DT bindings conversion for R8A7796
+ *
+ * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ *
+ * Based on work from Jyri Sarha <jsarha@ti.com>
+ * Copyright (C) 2015 Texas Instruments
+ */
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/dts-v1/;
+/plugin/;
+/ {
+	fragment@0 {
+		target-path = "/soc";
+		__overlay__ {
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			lvds@feb90000 {
+				compatible = "renesas,r8a7796-lvds";
+				reg = <0 0xfeb90000 0 0x14>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						lvds0_input: endpoint {
+						};
+					};
+					port@1 {
+						reg = <1>;
+						lvds0_out: endpoint {
+						};
+					};
+				};
+			};
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc/display@feb00000/ports";
+		__overlay__ {
+			port@3 {
+				endpoint {
+					remote-endpoint = <&lvds0_input>;
+				};
+			};
+		};
+	};
+};
-- 
Regards,

Laurent Pinchart
