Return-Path: <SRS0=Pbk3=FX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:50137 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1162478AbeCAWE7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 1 Mar 2018 17:04:59 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v7 3/4 - variant 2] drm: rcar-du: Fix legacy DT to create LVDS encoder nodes
Date: Fri,  2 Mar 2018 00:05:39 +0200
Message-Id: <20180301220540.11959-5-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180301220540.11959-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180301220540.11959-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
To: dri-devel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The internal LVDS encoders now have their own DT bindings. Before
switching the driver infrastructure to those new bindings, implement
backward-compatibility through live DT patching.

Patching is disabled and will be enabled along with support for the new
DT bindings in the DU driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v6:

- Use of_overlay_fdt_apply()

Changes since v5:

- Use a private copy of rcar_du_of_changeset_add_property()

Changes since v3:

- Use the OF changeset API
- Use of_graph_get_endpoint_by_regs()
- Replace hardcoded constants by sizeof()

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
 drivers/gpu/drm/rcar-du/rcar_du_of.c               | 321 +++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_of.h               |  20 ++
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts    |  79 +++++
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts    |  53 ++++
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts    |  53 ++++
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts    |  53 ++++
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts    |  53 ++++
 9 files changed, 640 insertions(+), 1 deletion(-)
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
index 000000000000..4e3376c64dfd
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
@@ -0,0 +1,321 @@
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
+	unsigned int i;
+	int ovcs_id;
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
+	ovcs_id = 0;
+	return of_overlay_fdt_apply(dtb->begin, &ovcs_id);
+}
+
+static int __init rcar_du_of_add_property(struct of_changeset *ocs,
+					  struct device_node *np,
+					  const char *name, const void *value,
+					  int length)
+{
+	struct property *prop;
+	int ret = -ENOMEM;
+
+	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
+	if (!prop)
+		return -ENOMEM;
+
+	prop->name = kstrdup(name, GFP_KERNEL);
+	if (!prop->name)
+		goto out_err;
+
+	prop->value = kmemdup(value, length, GFP_KERNEL);
+	if (!prop->value)
+		goto out_err;
+
+	of_property_set_flag(prop, OF_DYNAMIC);
+
+	prop->length = length;
+
+	ret = of_changeset_add_property(ocs, np, prop);
+	if (!ret)
+		return 0;
+
+out_err:
+	kfree(prop->value);
+	kfree(prop->name);
+	kfree(prop);
+	return ret;
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
+static struct of_changeset rcar_du_lvds_changeset;
+
+static void __init rcar_du_of_lvds_patch_one(struct device_node *lvds,
+					     const struct of_phandle_args *clk,
+					     struct device_node *local,
+					     struct device_node *remote)
+{
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
+	of_changeset_init(&rcar_du_lvds_changeset);
+
+	value[0] = cpu_to_be32(clk->np->phandle);
+	for (i = 0; i < clk->args_count; ++i)
+		value[i + 1] = cpu_to_be32(clk->args[i]);
+
+	psize = (clk->args_count + 1) * 4;
+	ret = rcar_du_of_add_property(&rcar_du_lvds_changeset, lvds,
+				      "clocks", value, psize);
+	if (ret < 0)
+		goto done;
+
+	/*
+	 * Insert the node in the OF graph: patch the LVDS ports remote-endpoint
+	 * properties to point to the endpoints of the sibling nodes in the
+	 * graph. This can't be performed by the overlay: on the input side the
+	 * overlay would contain a phandle for the DU LVDS output port that
+	 * would clash with the system DT, and on the output side the connection
+	 * is board-specific.
+	 */
+	value[0] = cpu_to_be32(local->phandle);
+	value[1] = cpu_to_be32(remote->phandle);
+
+	for (i = 0; i < 2; ++i) {
+		struct device_node *endpoint;
+
+		endpoint = of_graph_get_endpoint_by_regs(lvds, i, 0);
+		if (!endpoint) {
+			ret = -EINVAL;
+			goto done;
+		}
+
+		ret = rcar_du_of_add_property(&rcar_du_lvds_changeset,
+					      endpoint, "remote-endpoint",
+					      &value[i], sizeof(value[i]));
+		of_node_put(endpoint);
+		if (ret < 0)
+			goto done;
+	}
+
+	ret = of_changeset_apply(&rcar_du_lvds_changeset);
+
+done:
+	if (ret < 0)
+		of_changeset_destroy(&rcar_du_lvds_changeset);
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
index 000000000000..f118a6ae7782
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
@@ -0,0 +1,79 @@
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
index 000000000000..7d865727928c
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
@@ -0,0 +1,53 @@
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
index 000000000000..bb263711834d
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
@@ -0,0 +1,53 @@
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
index 000000000000..9bbf7c9e5ce4
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
@@ -0,0 +1,53 @@
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
index 000000000000..d16f3e9e08ab
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
@@ -0,0 +1,53 @@
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

