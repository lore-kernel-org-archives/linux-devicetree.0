From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 03/12] drm: rcar-du: Fix legacy DT to create LVDS
 encoder nodes
Date: Mon, 15 Jan 2018 11:09:53 -0600
Message-ID: <CAL_JsqK9yWE2nLX3AbSx-U6zAyE3fkYnURBY+r6KkJCogU5_sA@mail.gmail.com>
References: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com> <20180112231430.26943-4-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180112231430.26943-4-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Frank Rowand <frowand.list@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

+Frank

On Fri, Jan 12, 2018 at 5:14 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The internal LVDS encoders now have their own DT bindings. Before
> switching the driver infrastructure to those new bindings, implement
> backward-compatibility through live DT patching.

Uhh, we just got rid of TI's patching and now adding this one. I guess
it's necessary, but I'd like to know how long we need to keep this?

How many overlays would you need if everything is static (i.e.
removing all your fixup code)?

> Patching is disabled and will be enabled along with support for the new
> DT bindings in the DU driver.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v1:
>
> - Select OF_FLATTREE
> - Compile LVDS DT bindings patch code when DRM_RCAR_LVDS is selected
> - Update the SPDX headers to use GPL-2.0 instead of GPL-2.0-only
> - Turn __dtb_rcar_du_of_lvds_(begin|end) from u8 to char
> - Pass void begin and end pointers to rcar_du_of_get_overlay()
> - Use of_get_parent() instead of accessing the parent pointer directly
> - Find the LVDS endpoints nodes based on the LVDS node instead of the
>   root of the overlay
> - Update to the <soc>-lvds compatible string format
> ---
>  drivers/gpu/drm/rcar-du/Kconfig             |   2 +
>  drivers/gpu/drm/rcar-du/Makefile            |   3 +-
>  drivers/gpu/drm/rcar-du/rcar_du_of.c        | 451 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_of.h        |  16 +
>  drivers/gpu/drm/rcar-du/rcar_du_of_lvds.dts |  82 +++++
>  5 files changed, 553 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds.dts
>
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index 5d0b4b7119af..3f83352a7313 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -22,6 +22,8 @@ config DRM_RCAR_LVDS
>         bool "R-Car DU LVDS Encoder Support"
>         depends on DRM_RCAR_DU
>         select DRM_PANEL
> +       select OF_FLATTREE
> +       select OF_OVERLAY

OF_OVERLAY should probably select OF_FLATTREE. I guess in theory, we
could have an overlay from a non-FDT source...

>         help
>           Enable support for the R-Car Display Unit embedded LVDS encoders.
>
> diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
> index 0cf5c11030e8..8ed569a0f462 100644
> --- a/drivers/gpu/drm/rcar-du/Makefile
> +++ b/drivers/gpu/drm/rcar-du/Makefile
> @@ -5,10 +5,11 @@ rcar-du-drm-y := rcar_du_crtc.o \
>                  rcar_du_group.o \
>                  rcar_du_kms.o \
>                  rcar_du_lvdscon.o \
> +                rcar_du_of.o \
>                  rcar_du_plane.o
>
>  rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)    += rcar_du_lvdsenc.o
> -
> +rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)    += rcar_du_of_lvds.dtb.o
>  rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)     += rcar_du_vsp.o
>
>  obj-$(CONFIG_DRM_RCAR_DU)              += rcar-du-drm.o
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.c b/drivers/gpu/drm/rcar-du/rcar_du_of.c
> new file mode 100644
> index 000000000000..2bf91201fc93
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
> @@ -0,0 +1,451 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * rcar_du_of.c - Legacy DT bindings compatibility
> + *
> + * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + *
> + * Based on work from Jyri Sarha <jsarha@ti.com>
> + * Copyright (C) 2015 Texas Instruments
> + */
> +
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_fdt.h>
> +#include <linux/of_graph.h>
> +#include <linux/slab.h>
> +
> +#include "rcar_du_crtc.h"
> +#include "rcar_du_drv.h"
> +
> +#ifdef CONFIG_DRM_RCAR_LVDS

Why not make compiling this file conditional in the Makefile?

> +
> +struct rcar_du_of_overlay {
> +       struct device_node *np;
> +       void *data;
> +       void *mem;
> +};
> +
> +static void __init rcar_du_of_free_overlay(struct rcar_du_of_overlay *overlay)
> +{
> +       of_node_put(overlay->np);
> +       kfree(overlay->data);
> +       kfree(overlay->mem);
> +}
> +
> +static int __init rcar_du_of_get_overlay(struct rcar_du_of_overlay *overlay,
> +                                        void *begin, void *end)
> +{
> +       const size_t size = end - begin;
> +
> +       memset(overlay, 0, sizeof(*overlay));
> +
> +       if (!size)
> +               return -EINVAL;
> +
> +       overlay->data = kmemdup(begin, size, GFP_KERNEL);
> +       if (!overlay->data)
> +               return -ENOMEM;
> +
> +       overlay->mem = of_fdt_unflatten_tree(overlay->data, NULL, &overlay->np);
> +       if (!overlay->mem) {
> +               rcar_du_of_free_overlay(overlay);
> +               return -ENOMEM;
> +       }
> +
> +       return 0;
> +}
> +
> +static struct device_node __init *
> +rcar_du_of_find_node_by_path(struct device_node *parent, const char *path)
> +{

What's wrong with the core function to do this?

> +       parent = of_node_get(parent);
> +       if (!parent)
> +               return NULL;
> +
> +       while (parent && *path == '/') {
> +               struct device_node *child = NULL;
> +               struct device_node *node;
> +               const char *next;
> +               size_t len;
> +
> +               /* Skip the initial '/' delimiter and find the next one. */
> +               path++;
> +               next = strchrnul(path, '/');
> +               len = next - path;
> +               if (!len)
> +                       goto error;
> +
> +               for_each_child_of_node(parent, node) {
> +                       const char *name = kbasename(node->full_name);
> +
> +                       if (strncmp(path, name, len) == 0 &&
> +                           strlen(name) == len) {
> +                               child = node;
> +                               break;
> +                       }
> +               }
> +
> +               if (!child)
> +                       goto error;
> +
> +               of_node_put(parent);
> +               parent = child;
> +               path = next;
> +       }
> +
> +       return parent;
> +
> +error:
> +       of_node_put(parent);
> +       return NULL;
> +}
> +
> +static int __init rcar_du_of_add_property(struct device_node *np,
> +                                         const char *name, const void *value,
> +                                         size_t length)
> +{

This should be a core function. In fact, IIRC, Pantelis had a patch
adding functions like this. I believe there were only minor issues and
I said I would take it even without users, but he never followed up.

> +       struct property *prop;

We want to make struct property opaque, so I don't really want to see
more users...

> +
> +       prop = kzalloc(sizeof(*prop), GFP_KERNEL);
> +       if (!prop)
> +               return -ENOMEM;
> +
> +       prop->name = kstrdup(name, GFP_KERNEL);
> +       prop->value = kmemdup(value, length, GFP_KERNEL);
> +       prop->length = length;
> +
> +       if (!prop->name || !prop->value) {
> +               kfree(prop->name);
> +               kfree(prop->value);
> +               kfree(prop);
> +               return -ENOMEM;
> +       }
> +
> +       of_property_set_flag(prop, OF_DYNAMIC);
> +
> +       prop->next = np->properties;
> +       np->properties = prop;
> +
> +       return 0;
> +}
> +
> +/* Free properties allocated dynamically by rcar_du_of_add_property(). */
> +static void __init rcar_du_of_free_properties(struct device_node *np)
> +{
> +       while (np->properties) {
> +               struct property *prop = np->properties;
> +
> +               np->properties = prop->next;
> +
> +               if (OF_IS_DYNAMIC(prop)) {
> +                       kfree(prop->name);
> +                       kfree(prop->value);
> +                       kfree(prop);
> +               }
> +       }
> +}
> +
> +static int __init rcar_du_of_update_target_path(struct device_node *du,
> +                                               struct device_node *remote,
> +                                               struct device_node *np)
> +{
> +       struct device_node *target = NULL;
> +       struct property **prev;
> +       struct property *prop;
> +       char *path;
> +       int ret;
> +
> +       for (prop = np->properties, prev = &prop; prop != NULL;
> +            prev = &prop->next, prop = prop->next) {
> +               if (of_prop_cmp(prop->name, "target-path"))
> +                       continue;
> +
> +               if (!of_prop_cmp(prop->value, "soc")) {
> +                       target = of_get_parent(du);
> +                       break;
> +               }
> +               if (!of_prop_cmp(prop->value, "du")) {
> +                       target = of_node_get(du);
> +                       break;
> +               }
> +               if (!of_prop_cmp(prop->value, "lvds-sink")) {
> +                       target = of_graph_get_port_parent(remote);
> +                       break;
> +               }
> +
> +               return -EINVAL;
> +       }
> +
> +       if (!target)
> +               return -EINVAL;
> +
> +       path = kasprintf(GFP_KERNEL, "%pOF", target);
> +       of_node_put(target);
> +       if (!path)
> +               return -ENOMEM;
> +
> +       /*
> +        * Remove the existing target-path property that has not been
> +        * dynamically allocated and replace it with a new dynamic one to
> +        * ensure that the value will be properly freed.
> +        */
> +       *prev = prop->next;

You are leaking prev. prev should be moved the deleted property list.
But then you shouldn't be mucking with properties at this level in the
first place.

> +       ret = rcar_du_of_add_property(np, "target-path", path,
> +                                     strlen(path) + 1);
> +       if (ret < 0) {
> +               kfree(path);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +extern char __dtb_rcar_du_of_lvds_begin[];
> +extern char __dtb_rcar_du_of_lvds_end[];
> +
> +static void __init rcar_du_of_lvds_patch_one(struct device_node *du,
> +                                            unsigned int port_id,
> +                                            const struct resource *res,
> +                                            const __be32 *reg,
> +                                            const struct of_phandle_args *clkspec,
> +                                            struct device_node *local,
> +                                            struct device_node *remote)
> +{
> +       struct rcar_du_of_overlay overlay;
> +       struct device_node *du_port_fixup;
> +       struct device_node *du_port;
> +       struct device_node *lvds_endpoints[2];
> +       struct device_node *lvds;
> +       struct device_node *fragment;
> +       struct device_node *bus;
> +       struct property *prop;
> +       const char *compatible;
> +       const char *soc_suffix;
> +       unsigned int psize;
> +       unsigned int i;
> +       __be32 value[4];
> +       char name[23];
> +       int ovcs_id;
> +       int ret;
> +
> +       /* Skip if the LVDS node already exists. */
> +       sprintf(name, "lvds@%llx", (u64)res->start);

Fragile. unit-address and res->start are not necessarily the same thing.

> +       bus = of_get_parent(du);
> +       lvds = of_get_child_by_name(bus, name);
> +       of_node_put(bus);
> +       if (lvds) {
> +               of_node_put(lvds);
> +               return;
> +       }
> +
> +       /* Parse the overlay. */
> +       ret = rcar_du_of_get_overlay(&overlay, __dtb_rcar_du_of_lvds_begin,
> +                                    __dtb_rcar_du_of_lvds_end);
> +       if (ret < 0)
> +               return;
> +
> +       /*
> +        * Patch the LVDS and DU port nodes names and the associated fixup
> +        * entries.
> +        */
> +       lvds = rcar_du_of_find_node_by_path(overlay.np,
> +               "/fragment@0/__overlay__/lvds");
> +       lvds_endpoints[0] = rcar_du_of_find_node_by_path(lvds,
> +               "/ports/port@0/endpoint");
> +       lvds_endpoints[1] = rcar_du_of_find_node_by_path(lvds,
> +               "/ports/port@1/endpoint");
> +       du_port = rcar_du_of_find_node_by_path(overlay.np,
> +               "/fragment@1/__overlay__/ports/port@0");
> +       du_port_fixup = rcar_du_of_find_node_by_path(overlay.np,
> +               "/__local_fixups__/fragment@1/__overlay__/ports/port@0");
> +       if (!lvds || !lvds_endpoints[0] || !lvds_endpoints[1] ||
> +           !du_port || !du_port_fixup)
> +               goto out_put_nodes;
> +
> +       lvds->full_name = kstrdup(name, GFP_KERNEL);
> +
> +       sprintf(name, "port@%u", port_id);
> +       du_port->full_name = kstrdup(name, GFP_KERNEL);
> +       du_port_fixup->full_name = kstrdup(name, GFP_KERNEL);
> +
> +       if (!lvds->full_name || !du_port->full_name ||
> +           !du_port_fixup->full_name)
> +               goto out_free_names;
> +
> +       /* Patch the target paths in all fragments. */
> +       for_each_child_of_node(overlay.np, fragment) {
> +               if (strncmp("fragment@", of_node_full_name(fragment), 9))
> +                       continue;
> +
> +               ret = rcar_du_of_update_target_path(du, remote, fragment);
> +               if (ret < 0) {
> +                       of_node_put(fragment);
> +                       goto out_free_properties;
> +               }
> +       }
> +
> +       /*
> +        * Create a compatible string for the LVDS node using the SoC model
> +        * from the DU node.
> +        */
> +       ret = of_property_read_string(du, "compatible", &compatible);
> +       if (ret < 0)
> +               goto out_free_properties;
> +
> +       soc_suffix = strchr(compatible, '-');
> +       if (!soc_suffix || strlen(soc_suffix) > 10)
> +               goto out_free_properties;
> +
> +       psize = sprintf(name, "renesas,%s-lvds", soc_suffix + 1) + 1;
> +       ret = rcar_du_of_add_property(lvds, "compatible", name, psize);
> +       if (ret < 0)
> +               goto out_free_properties;
> +
> +       /* Copy the LVDS reg and clocks properties from the DU node. */
> +       psize = (of_n_addr_cells(du) + of_n_size_cells(du)) * 4;
> +       ret = rcar_du_of_add_property(lvds, "reg", reg, psize);
> +       if (ret < 0)
> +               goto out_free_properties;
> +
> +       if (clkspec->args_count >= ARRAY_SIZE(value) - 1)
> +               goto out_free_properties;
> +
> +       value[0] = cpu_to_be32(clkspec->np->phandle);
> +       for (i = 0; i < clkspec->args_count; ++i)
> +               value[i + 1] = cpu_to_be32(clkspec->args[i]);
> +
> +       psize = (clkspec->args_count + 1) * 4;
> +       ret = rcar_du_of_add_property(lvds, "clocks", value, psize);
> +       if (ret < 0)
> +               goto out_free_properties;
> +
> +       /*
> +        * Insert the node in the OF graph: patch the LVDS ports remote-endpoint
> +        * properties to point to the endpoints of the sibling nodes in the
> +        * graph.
> +        */
> +       prop = of_find_property(lvds_endpoints[0], "remote-endpoint", NULL);
> +       if (!prop)
> +               goto out_free_properties;
> +
> +       *(__be32 *)prop->value = cpu_to_be32(local->phandle);
> +
> +       prop = of_find_property(lvds_endpoints[1], "remote-endpoint", NULL);
> +       if (!prop)
> +               goto out_free_properties;
> +
> +       *(__be32 *)prop->value = cpu_to_be32(remote->phandle);
> +
> +       /* Apply the overlay, this will resolve phandles. */
> +       ovcs_id = 0;
> +       ret = of_overlay_apply(overlay.np, &ovcs_id);
> +
> +       /* We're done, free all allocated memory. */
> +out_free_properties:
> +       rcar_du_of_free_properties(lvds);
> +       rcar_du_of_free_properties(du_port);
> +       rcar_du_of_free_properties(du_port_fixup);
> +out_free_names:
> +       kfree(lvds->full_name);
> +       kfree(du_port->full_name);
> +       kfree(du_port_fixup->full_name);
> +out_put_nodes:
> +       of_node_put(lvds);
> +       of_node_put(lvds_endpoints[0]);
> +       of_node_put(lvds_endpoints[1]);
> +       of_node_put(du_port);
> +       of_node_put(du_port_fixup);
> +
> +       rcar_du_of_free_overlay(&overlay);
> +}
> +
> +static void __init rcar_du_of_lvds_patch(const struct of_device_id *of_ids)
> +{
> +       const struct rcar_du_device_info *info;
> +       const struct of_device_id *match;
> +       struct device_node *du;
> +       unsigned int i;
> +       int ret;
> +
> +       /* Get the DU node and exit if not present or disabled. */
> +       du = of_find_matching_node_and_match(NULL, of_ids, &match);
> +       if (!du || !of_device_is_available(du))
> +               goto done;
> +
> +       info = match->data;
> +
> +       /* Patch every LVDS encoder. */
> +       for (i = 0; i < info->num_lvds; ++i) {
> +               struct of_phandle_args clkspec;
> +               struct device_node *local, *remote;
> +               struct resource res;
> +               unsigned int port_id;
> +               const __be32 *reg;
> +               char name[7];
> +               int index;
> +
> +               /*
> +                * Retrieve the register specifier, the clock specifier and the
> +                * local and remote endpoints of the LVDS link.
> +                */
> +               sprintf(name, "lvds.%u", i);
> +               index = of_property_match_string(du, "reg-names", name);
> +               if (index < 0)
> +                       continue;
> +
> +               reg = of_get_address(du, index, NULL, NULL);
> +               if (!reg)
> +                       continue;
> +
> +               ret = of_address_to_resource(du, index, &res);
> +               if (ret < 0)
> +                       continue;
> +
> +               index = of_property_match_string(du, "clock-names", name);
> +               if (index < 0)
> +                       continue;
> +
> +               ret = of_parse_phandle_with_args(du, "clocks", "#clock-cells",
> +                                                index, &clkspec);
> +               if (ret < 0)
> +                       continue;
> +
> +               port_id = info->routes[RCAR_DU_OUTPUT_LVDS0 + i].port;
> +
> +               local = of_graph_get_endpoint_by_regs(du, port_id, 0);
> +               if (!local) {
> +                       of_node_put(clkspec.np);
> +                       continue;
> +               }
> +
> +               remote = of_graph_get_remote_endpoint(local);
> +               if (!remote) {
> +                       of_node_put(local);
> +                       of_node_put(clkspec.np);
> +                       continue;
> +               }
> +
> +               /* Patch the LVDS encoder. */
> +               rcar_du_of_lvds_patch_one(du, port_id, &res, reg, &clkspec,
> +                                         local, remote);
> +
> +               of_node_put(clkspec.np);
> +               of_node_put(remote);
> +               of_node_put(local);
> +       }
> +
> +done:
> +       of_node_put(du);
> +}
> +#else
> +static void __init rcar_du_of_lvds_patch(const struct of_device_id *of_ids)
> +{
> +}
> +#endif /* CONFIG_DRM_RCAR_LVDS */
> +
> +void __init rcar_du_of_init(const struct of_device_id *of_ids)
> +{
> +       rcar_du_of_lvds_patch(of_ids);
> +}
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.h b/drivers/gpu/drm/rcar-du/rcar_du_of.h
> new file mode 100644
> index 000000000000..7105eaef58c6
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.h
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0

The guidelines say headers should be C style. This is due to headers
getting included by assembly code.

> +/*
> + * rcar_du_of.h - Legacy DT bindings compatibility
> + *
> + * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + */
> +#ifndef __RCAR_DU_OF_H__
> +#define __RCAR_DU_OF_H__
> +
> +#include <linux/init.h>
> +
> +struct of_device_id;
> +
> +void __init rcar_du_of_init(const struct of_device_id *of_ids);
> +
> +#endif /* __RCAR_DU_OF_H__ */
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds.dts b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds.dts
> new file mode 100644
> index 000000000000..bc75c7a1c3bd
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds.dts
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * rcar_du_of_lvds.dts - Legacy LVDS DT bindings conversion
> + *
> + * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + *
> + * Based on work from Jyri Sarha <jsarha@ti.com>
> + * Copyright (C) 2015 Texas Instruments
> + */
> +
> +/*
> + * The target-paths, lvds node name, DU port number and LVDS remote endpoints
> + * will be patched dynamically at runtime.
> + */
> +
> +/dts-v1/;
> +/ {
> +       fragment@0 {
> +               target-path = "soc";

I don't really like this abuse of target-path that isn't really a
valid path. I don't debate the need, but we just need a standard way
to handle this.

Perhaps we need to allow target-path to be a string list. That gets
back to my question on how many static combinations you have. I'd
prefer duplication of overlays with simple applying code to coding a
bunch of matching and fixups.

> +               __overlay__ {
> +                       lvds {
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               lvds_input: endpoint {
> +                                                       remote-endpoint = <0>;
> +                                               };
> +                                       };
> +
> +                                       port@1 {
> +                                               reg = <1>;
> +                                               lvds_output: endpoint {
> +                                                       remote-endpoint = <0>;
> +                                               };
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +
> +       fragment@1 {
> +               target-path = "du";
> +               __overlay__ {
> +                       ports {
> +                               port@0 {
> +                                       endpoint {
> +                                               remote-endpoint = <&lvds_input>;
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +
> +       fragment@2 {
> +               target-path = "lvds-sink";
> +               __overlay__ {
> +                       remote-endpoint = <&lvds_output>;
> +               };
> +       };
> +
> +       __local_fixups__ {

dtc generates this now.

> +               fragment@1 {
> +                       __overlay__ {
> +                               ports {
> +                                       port@0 {
> +                                               endpoint {
> +                                                       remote-endpoint = <0>;
> +                                               };
> +                                       };
> +                               };
> +                       };
> +               };
> +               fragment@2 {
> +                       __overlay__ {
> +                               remote-endpoint = <0>;
> +                       };
> +               };
> +       };
> +};
> --
> Regards,
>
> Laurent Pinchart
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
