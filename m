From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 03/12] drm: rcar-du: Fix legacy DT to create LVDS
 encoder nodes
Date: Sun, 21 Jan 2018 12:35:46 +0300
Message-ID: <ba19a36b-5d6d-441d-6f38-a645b731ca9e@cogentembedded.com>
References: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112231430.26943-4-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180112231430.26943-4-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello!

On 1/13/2018 2:14 AM, Laurent Pinchart wrote:

    Here's my (superficial) comments...

> The internal LVDS encoders now have their own DT bindings. Before
> switching the driver infrastructure to those new bindings, implement
> backward-compatibility through live DT patching.
> 
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
>    root of the overlay
> - Update to the <soc>-lvds compatible string format
> ---
>   drivers/gpu/drm/rcar-du/Kconfig             |   2 +
>   drivers/gpu/drm/rcar-du/Makefile            |   3 +-
>   drivers/gpu/drm/rcar-du/rcar_du_of.c        | 451 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/rcar-du/rcar_du_of.h        |  16 +
>   drivers/gpu/drm/rcar-du/rcar_du_of_lvds.dts |  82 +++++
>   5 files changed, 553 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.c
>   create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.h
>   create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds.dts
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index 5d0b4b7119af..3f83352a7313 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -22,6 +22,8 @@ config DRM_RCAR_LVDS
>   	bool "R-Car DU LVDS Encoder Support"
>   	depends on DRM_RCAR_DU
>   	select DRM_PANEL
> +	select OF_FLATTREE
> +	select OF_OVERLAY
>   	help
>   	  Enable support for the R-Car Display Unit embedded LVDS encoders.
>   
> diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
> index 0cf5c11030e8..8ed569a0f462 100644
> --- a/drivers/gpu/drm/rcar-du/Makefile
> +++ b/drivers/gpu/drm/rcar-du/Makefile
> @@ -5,10 +5,11 @@ rcar-du-drm-y := rcar_du_crtc.o \
>   		 rcar_du_group.o \
>   		 rcar_du_kms.o \
>   		 rcar_du_lvdscon.o \
> +		 rcar_du_of.o \
>   		 rcar_du_plane.o
>   
>   rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_lvdsenc.o
> -
> +rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of_lvds.dtb.o
>   rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
>   
>   obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.c b/drivers/gpu/drm/rcar-du/rcar_du_of.c
> new file mode 100644
> index 000000000000..2bf91201fc93
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
> @@ -0,0 +1,451 @@
[...]
> +static struct device_node __init *
> +static int __init rcar_du_of_add_property(struct device_node *np,
> +					  const char *name, const void *value,
> +					  size_t length)
> +{
> +	struct property *prop;
> +
> +	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	prop->name = kstrdup(name, GFP_KERNEL);
> +	prop->value = kmemdup(value, length, GFP_KERNEL);
> +	prop->length = length;
> +
> +	if (!prop->name || !prop->value) {
> +		kfree(prop->name);
> +		kfree(prop->value);
> +		kfree(prop);
> +		return -ENOMEM;
> +	}
> +
> +	of_property_set_flag(prop, OF_DYNAMIC);
> +
> +	prop->next = np->properties;
> +	np->properties = prop;
> +
> +	return 0;
> +}
> +
> +/* Free properties allocated dynamically by rcar_du_of_add_property(). */
> +static void __init rcar_du_of_free_properties(struct device_node *np)
> +{
> +	while (np->properties) {
> +		struct property *prop = np->properties;
> +
> +		np->properties = prop->next;
> +
> +		if (OF_IS_DYNAMIC(prop)) {
> +			kfree(prop->name);
> +			kfree(prop->value);
> +			kfree(prop);

    Perhaps these kfree() worth factoring out?

> +		}
> +	}
> +}
> +
[...]
> +extern char __dtb_rcar_du_of_lvds_begin[];
> +extern char __dtb_rcar_du_of_lvds_end[];
> +
> +static void __init rcar_du_of_lvds_patch_one(struct device_node *du,
> +					     unsigned int port_id,
> +					     const struct resource *res,
> +					     const __be32 *reg,
> +					     const struct of_phandle_args *clkspec,
> +					     struct device_node *local,
> +					     struct device_node *remote)
> +{
[...]
> +	/* Apply the overlay, this will resolve phandles. */
> +	ovcs_id = 0;
> +	ret = of_overlay_apply(overlay.np, &ovcs_id);

    You don't use 'ret' afterwards...

> +
> +	/* We're done, free all allocated memory. */
> +out_free_properties:
> +	rcar_du_of_free_properties(lvds);
> +	rcar_du_of_free_properties(du_port);
> +	rcar_du_of_free_properties(du_port_fixup);
> +out_free_names:
> +	kfree(lvds->full_name);
> +	kfree(du_port->full_name);
> +	kfree(du_port_fixup->full_name);
> +out_put_nodes:
> +	of_node_put(lvds);
> +	of_node_put(lvds_endpoints[0]);
> +	of_node_put(lvds_endpoints[1]);
> +	of_node_put(du_port);
> +	of_node_put(du_port_fixup);
> +
> +	rcar_du_of_free_overlay(&overlay);
> +}
> +
> +static void __init rcar_du_of_lvds_patch(const struct of_device_id *of_ids)
> +{
> +	const struct rcar_du_device_info *info;
> +	const struct of_device_id *match;
> +	struct device_node *du;
> +	unsigned int i;
> +	int ret;
> +
> +	/* Get the DU node and exit if not present or disabled. */
> +	du = of_find_matching_node_and_match(NULL, of_ids, &match);
> +	if (!du || !of_device_is_available(du))
> +		goto done;
> +
> +	info = match->data;
> +
> +	/* Patch every LVDS encoder. */
> +	for (i = 0; i < info->num_lvds; ++i) {
> +		struct of_phandle_args clkspec;
> +		struct device_node *local, *remote;
> +		struct resource res;
> +		unsigned int port_id;
> +		const __be32 *reg;
> +		char name[7];
> +		int index;
> +
> +		/*
> +		 * Retrieve the register specifier, the clock specifier and the
> +		 * local and remote endpoints of the LVDS link.
> +		 */
> +		sprintf(name, "lvds.%u", i);
> +		index = of_property_match_string(du, "reg-names", name);
> +		if (index < 0)
> +			continue;
> +
> +		reg = of_get_address(du, index, NULL, NULL);
> +		if (!reg)
> +			continue;
> +
> +		ret = of_address_to_resource(du, index, &res);
> +		if (ret < 0)
> +			continue;
> +
> +		index = of_property_match_string(du, "clock-names", name);
> +		if (index < 0)
> +			continue;
> +
> +		ret = of_parse_phandle_with_args(du, "clocks", "#clock-cells",
> +						 index, &clkspec);
> +		if (ret < 0)
> +			continue;
> +
> +		port_id = info->routes[RCAR_DU_OUTPUT_LVDS0 + i].port;
> +
> +		local = of_graph_get_endpoint_by_regs(du, port_id, 0);
> +		if (!local) {
> +			of_node_put(clkspec.np);
> +			continue;
> +		}
> +
> +		remote = of_graph_get_remote_endpoint(local);
> +		if (!remote) {
> +			of_node_put(local);
> +			of_node_put(clkspec.np);
> +			continue;
> +		}
> +
> +		/* Patch the LVDS encoder. */
> +		rcar_du_of_lvds_patch_one(du, port_id, &res, reg, &clkspec,
> +					  local, remote);
> +
> +		of_node_put(clkspec.np);
> +		of_node_put(remote);
> +		of_node_put(local);

    Worth using labels here to avoid the dupication?

> +	}
> +
> +done:
> +	of_node_put(du);
> +}
[...]
