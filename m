Return-Path: <SRS0=C5ln=FY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:53129 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1164680AbeCBNBW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 2 Mar 2018 08:01:22 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v7 3/4 - variant 1] drm: rcar-du: Fix legacy DT to create LVDS encoder nodes
Date: Fri, 02 Mar 2018 15:02:11 +0200
Message-ID: <6735188.e3VZxtEsOL@avalon>
In-Reply-To: <20180302004218.GC12470@bigcity.dyn.berto.se>
References: <20180301220540.11959-1-laurent.pinchart+renesas@ideasonboard.com> <20180301220540.11959-4-laurent.pinchart+renesas@ideasonboard.com> <20180302004218.GC12470@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: devicetree-owner@vger.kernel.org
To: Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Niklas,

On Friday, 2 March 2018 02:42:18 EET Niklas S=F6derlund wrote:
> Hi Laurent,
>=20
> Thanks for your patch,
>=20
> All comments in this mail also applies to variant 2 of this patch as the
> difference between them are so small.
>=20
> First I got a question about your usage of __init  thru out this driver.
> What would happen if a system is booted without a DU node and then a
> overlay is added using the old DU bindings will things work as expected,
> the old style overlay load but DU/LVDS will be in a none functioning
> state or will it explode? I don't feel this is a concern that you need
> to address as it feels a bit extreme use-case but since this is such a
> new approach (to me at least) to solve backward compatibility problems I
> just had to ask :-)

So, in a nutshell, you want to boot a system with a recent kernel (with thi=
s=20
series merged) with a device tree that doesn't describe the hardware fully,=
=20
add display support through an overlay using old-style bindings (which are=
=20
deprecated by this series) using an overlay API that currently doesn't exis=
t=20
upstream (and thus require out-of-tree modules compiled for the new kernel)=
,=20
and expect it to work ? :-)

> I also trust you that all of the register values in the dts files are
> correct.
>=20
> On 2018-03-02 00:05:38 +0200, Laurent Pinchart wrote:
> > The internal LVDS encoders now have their own DT bindings. Before
> > switching the driver infrastructure to those new bindings, implement
> > backward-compatibility through live DT patching.
> >=20
> > Patching is disabled and will be enabled along with support for the new
> > DT bindings in the DU driver.
> >=20
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > Changes since v6:
> >=20
> > - Don't free data used by the applied overlay
> >=20
> > Changes since v5:
> >=20
> > - Use a private copy of rcar_du_of_changeset_add_property()
> >=20
> > Changes since v3:
> >=20
> > - Use the OF changeset API
> > - Use of_graph_get_endpoint_by_regs()
> > - Replace hardcoded constants by sizeof()
> >=20
> > Changes since v2:
> >=20
> > - Update the SPDX headers to use C-style comments in header files
> > - Removed the manually created __local_fixups__ node
> > - Perform manual fixups on live DT instead of overlay
> >=20
> > Changes since v1:
> >=20
> > - Select OF_FLATTREE
> > - Compile LVDS DT bindings patch code when DRM_RCAR_LVDS is selected
> > - Update the SPDX headers to use GPL-2.0 instead of GPL-2.0-only
> > - Turn __dtb_rcar_du_of_lvds_(begin|end) from u8 to char
> > - Pass void begin and end pointers to rcar_du_of_get_overlay()
> > - Use of_get_parent() instead of accessing the parent pointer directly
> > - Find the LVDS endpoints nodes based on the LVDS node instead of the
> >   root of the overlay
> > - Update to the <soc>-lvds compatible string format
> > ---
> >=20
> >  drivers/gpu/drm/rcar-du/Kconfig                    |   2 +
> >  drivers/gpu/drm/rcar-du/Makefile                   |   7 +-
> >  drivers/gpu/drm/rcar-du/rcar_du_of.c               | 334 +++++++++++++=
+++
> >  drivers/gpu/drm/rcar-du/rcar_du_of.h               |  20 ++
> >  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts    |  79 +++++
> >  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts    |  53 ++++
> >  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts    |  53 ++++
> >  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts    |  53 ++++
> >  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts    |  53 ++++
> >  9 files changed, 653 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.c
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.h
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts

[snip]

> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_of.c new file mode 100644
> > index 000000000000..067278b91caa
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
> > @@ -0,0 +1,334 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * rcar_du_of.c - Legacy DT bindings compatibility
> > + *
> > + * Copyright (C) 2018 Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com>
> > + *
> > + * Based on work from Jyri Sarha <jsarha@ti.com>
> > + * Copyright (C) 2015 Texas Instruments
> > + */
> > +
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_fdt.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/slab.h>
> > +
> > +#include "rcar_du_crtc.h"
> > +#include "rcar_du_drv.h"
> > +
> > +/* -------------------------------------------------------------------=
=2D--
> > + * Generic Overlay Handling
> > + */
> > +
> > +struct rcar_du_of_overlay {
> > +	const char *compatible;
> > +	void *begin;
> > +	void *end;
> > +};
> > +
> > +#define RCAR_DU_OF_DTB(type, soc)					\
> > +	extern char __dtb_rcar_du_of_##type##_##soc##_begin[];		\
> > +	extern char __dtb_rcar_du_of_##type##_##soc##_end[]
>=20
> I think I understand this but just to be sure the names are derived from
> the object files of the DTBs right? Would a comment on where these
> external blobs come from make it easier to understand or is it just my
> lack of experience that is showing?

I didn't find this particularly unclear when I wrote the code so I didn't=20
think a comment was needed, but I can add one.

> > +
> > +#define RCAR_DU_OF_OVERLAY(type, soc)					\
> > +	{								\
> > +		.compatible =3D "renesas,du-" #soc,			\
> > +		.begin =3D __dtb_rcar_du_of_##type##_##soc##_begin,	\
> > +		.end =3D __dtb_rcar_du_of_##type##_##soc##_end,		\
> > +	}
> > +
> > +static int __init rcar_du_of_apply_overlay(const struct
> > rcar_du_of_overlay *dtbs, +					   const char *compatible)
> > +{
> > +	const struct rcar_du_of_overlay *dtb =3D NULL;
> > +	struct device_node *node;
> > +	unsigned int i;
> > +	int ovcs_id;
> > +	void *data;
> > +	void *mem;
> > +
> > +	for (i =3D 0; dtbs[i].compatible; ++i) {
> > +		if (!strcmp(dtbs[i].compatible, compatible)) {
> > +			dtb =3D &dtbs[i];
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (!dtb)
> > +		return -ENODEV;
> > +
> > +	data =3D kmemdup(dtb->begin, dtb->end - dtb->begin, GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	mem =3D of_fdt_unflatten_tree(data, NULL, &node);
> > +	if (!mem) {
> > +		kfree(data);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	ovcs_id =3D 0;
> > +	return of_overlay_apply(node, &ovcs_id);
> > +}
> > +
> > +static int __init rcar_du_of_add_property(struct of_changeset *ocs,
> > +					  struct device_node *np,
> > +					  const char *name, const void *value,
> > +					  int length)
> > +{
> > +	struct property *prop;
> > +	int ret =3D -ENOMEM;
> > +
> > +	prop =3D kzalloc(sizeof(*prop), GFP_KERNEL);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +
> > +	prop->name =3D kstrdup(name, GFP_KERNEL);
> > +	if (!prop->name)
> > +		goto out_err;
> > +
> > +	prop->value =3D kmemdup(value, length, GFP_KERNEL);
> > +	if (!prop->value)
> > +		goto out_err;
> > +
> > +	of_property_set_flag(prop, OF_DYNAMIC);
> > +
> > +	prop->length =3D length;
> > +
> > +	ret =3D of_changeset_add_property(ocs, np, prop);
> > +	if (!ret)
> > +		return 0;
> > +
> > +out_err:
> > +	kfree(prop->value);
> > +	kfree(prop->name);
> > +	kfree(prop);
> > +	return ret;
> > +}
> > +
> > +/* -------------------------------------------------------------------=
=2D--
> > + * LVDS Overlays
> > + */
> > +
> > +RCAR_DU_OF_DTB(lvds, r8a7790);
> > +RCAR_DU_OF_DTB(lvds, r8a7791);
> > +RCAR_DU_OF_DTB(lvds, r8a7793);
> > +RCAR_DU_OF_DTB(lvds, r8a7795);
> > +RCAR_DU_OF_DTB(lvds, r8a7796);
> > +
> > +static const struct rcar_du_of_overlay rcar_du_lvds_overlays[]
> > __initconst =3D {
> > +	RCAR_DU_OF_OVERLAY(lvds, r8a7790),
> > +	RCAR_DU_OF_OVERLAY(lvds, r8a7791),
> > +	RCAR_DU_OF_OVERLAY(lvds, r8a7793),
> > +	RCAR_DU_OF_OVERLAY(lvds, r8a7795),
> > +	RCAR_DU_OF_OVERLAY(lvds, r8a7796),
> > +	{ /* Sentinel */ },
> > +};
> > +
> > +static struct of_changeset rcar_du_lvds_changeset;
> > +
> > +static void __init rcar_du_of_lvds_patch_one(struct device_node *lvds,
> > +					     const struct of_phandle_args *clk,
> > +					     struct device_node *local,
> > +					     struct device_node *remote)
> > +{
> > +	unsigned int psize;
> > +	unsigned int i;
> > +	__be32 value[4];
> > +	int ret;
> > +
> > +	/*
> > +	 * Set the LVDS clocks property. This can't be performed by the overl=
ay
> > +	 * as the structure of the clock specifier has changed over time, and
> > we
> > +	 * don't know at compile time which binding version the system we will
> > +	 * run on uses.
> > +	 */
> > +	if (clk->args_count >=3D ARRAY_SIZE(value) - 1)
> > +		return;
> > +
> > +	of_changeset_init(&rcar_du_lvds_changeset);
> > +
> > +	value[0] =3D cpu_to_be32(clk->np->phandle);
> > +	for (i =3D 0; i < clk->args_count; ++i)
> > +		value[i + 1] =3D cpu_to_be32(clk->args[i]);
> > +
> > +	psize =3D (clk->args_count + 1) * 4;
> > +	ret =3D rcar_du_of_add_property(&rcar_du_lvds_changeset, lvds,
> > +				      "clocks", value, psize);
> > +	if (ret < 0)
> > +		goto done;
> > +
> > +	/*
> > +	 * Insert the node in the OF graph: patch the LVDS ports remote-
> > endpoint
> > +	 * properties to point to the endpoints of the sibling nodes in the
> > +	 * graph. This can't be performed by the overlay: on the input side t=
he
> > +	 * overlay would contain a phandle for the DU LVDS output port that
> > +	 * would clash with the system DT, and on the output side the
> > connection
> > +	 * is board-specific.
> > +	 */
> > +	value[0] =3D cpu_to_be32(local->phandle);
> > +	value[1] =3D cpu_to_be32(remote->phandle);
> > +
> > +	for (i =3D 0; i < 2; ++i) {
> > +		struct device_node *endpoint;
> > +
> > +		endpoint =3D of_graph_get_endpoint_by_regs(lvds, i, 0);
> > +		if (!endpoint) {
> > +			ret =3D -EINVAL;
> > +			goto done;
> > +		}
> > +
> > +		ret =3D rcar_du_of_add_property(&rcar_du_lvds_changeset,
> > +					      endpoint, "remote-endpoint",
> > +					      &value[i], sizeof(value[i]));
> > +		of_node_put(endpoint);
> > +		if (ret < 0)
> > +			goto done;
> > +	}
> > +
> > +	ret =3D of_changeset_apply(&rcar_du_lvds_changeset);
> > +
> > +done:
> > +	if (ret < 0)
> > +		of_changeset_destroy(&rcar_du_lvds_changeset);
> > +}
> > +
> > +struct lvds_of_data {
> > +	struct resource res;
> > +	struct of_phandle_args clkspec;
> > +	struct device_node *local;
> > +	struct device_node *remote;
> > +};
> > +
> > +static void __init rcar_du_of_lvds_patch(const struct of_device_id
> > *of_ids)
> > +{
> > +	const struct rcar_du_device_info *info;
> > +	const struct of_device_id *match;
> > +	struct lvds_of_data lvds_data[2] =3D { };
> > +	struct device_node *lvds_node;
> > +	struct device_node *soc_node;
> > +	struct device_node *du_node;
> > +	char compatible[21];
>=20
> Do this need to be 22 bytes long to not create problems on boards where
> the model name is one character longer then on the earlier boards in
> Gen3? For example V3M would be "renesas,r8a77970-lvds\n".

V3M will only be supported using the new-style bindings, the compat code wi=
ll=20
only run for older SoCs that use 4 digits. I'll however make the array 22=20
characters long just in case, as the compiler will pad it to 24 anyway.

> Whit these small questions/issues addressed feel free to add to which
> ever variant of this patch gets picked:
>=20
> Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

Thank you.

> > +	const char *soc_name;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	/* Get the DU node and exit if not present or disabled. */
> > +	du_node =3D of_find_matching_node_and_match(NULL, of_ids, &match);
> > +	if (!du_node || !of_device_is_available(du_node)) {
> > +		of_node_put(du_node);
> > +		return;
> > +	}
> > +
> > +	info =3D match->data;
> > +	soc_node =3D of_get_parent(du_node);
> > +
> > +	if (WARN_ON(info->num_lvds > ARRAY_SIZE(lvds_data)))
> > +		goto done;
> > +
> > +	/*
> > +	 * Skip if the LVDS nodes already exists.
> > +	 *
> > +	 * The nodes are searched based on the compatible string, which we
> > +	 * construct from the SoC name found in the DU compatible string. As a
> > +	 * match has been found we know the compatible string matches the
> > +	 * expected format and can thus skip some of the string manipulation
> > +	 * normal safety checks.
> > +	 */
> > +	soc_name =3D strchr(match->compatible, '-') + 1;
> > +	sprintf(compatible, "renesas,%s-lvds", soc_name);
> > +	lvds_node =3D of_find_compatible_node(NULL, NULL, compatible);
> > +	if (lvds_node) {
> > +		of_node_put(lvds_node);
> > +		return;
> > +	}
> > +
> > +	/*
> > +	 * Parse the DU node and store the register specifier, the clock
> > +	 * specifier and the local and remote endpoint of the LVDS link for
> > +	 * later use.
> > +	 */
> > +	for (i =3D 0; i < info->num_lvds; ++i) {
> > +		struct lvds_of_data *lvds =3D &lvds_data[i];
> > +		unsigned int port;
> > +		char name[7];
> > +		int index;
> > +
> > +		sprintf(name, "lvds.%u", i);
> > +		index =3D of_property_match_string(du_node, "clock-names", name);
> > +		if (index < 0)
> > +			continue;
> > +
> > +		ret =3D of_parse_phandle_with_args(du_node, "clocks",
> > +						 "#clock-cells", index,
> > +						 &lvds->clkspec);
> > +		if (ret < 0)
> > +			continue;
> > +
> > +		port =3D info->routes[RCAR_DU_OUTPUT_LVDS0 + i].port;
> > +
> > +		lvds->local =3D of_graph_get_endpoint_by_regs(du_node, port, 0);
> > +		if (!lvds->local)
> > +			continue;
> > +
> > +		lvds->remote =3D of_graph_get_remote_endpoint(lvds->local);
> > +		if (!lvds->remote)
> > +			continue;
> > +
> > +		index =3D of_property_match_string(du_node, "reg-names", name);
> > +		if (index < 0)
> > +			continue;
> > +
> > +		of_address_to_resource(du_node, index, &lvds->res);
> > +	}
> > +
> > +	/* Parse and apply the overlay. This will resolve phandles. */
> > +	ret =3D rcar_du_of_apply_overlay(rcar_du_lvds_overlays,
> > +				       match->compatible);
> > +	if (ret < 0)
> > +		goto done;
> > +
> > +	/* Patch the newly created LVDS encoder nodes. */
> > +	for_each_child_of_node(soc_node, lvds_node) {
> > +		struct resource res;
> > +
> > +		if (!of_device_is_compatible(lvds_node, compatible))
> > +			continue;
> > +
> > +		/* Locate the lvds_data entry based on the resource start. */
> > +		ret =3D of_address_to_resource(lvds_node, 0, &res);
> > +		if (ret < 0)
> > +			continue;
> > +
> > +		for (i =3D 0; i < ARRAY_SIZE(lvds_data); ++i) {
> > +			if (lvds_data[i].res.start =3D=3D res.start)
> > +				break;
> > +		}
> > +
> > +		if (i =3D=3D ARRAY_SIZE(lvds_data))
> > +			continue;
> > +
> > +		/* Patch the LVDS encoder. */
> > +		rcar_du_of_lvds_patch_one(lvds_node, &lvds_data[i].clkspec,
> > +					  lvds_data[i].local,
> > +					  lvds_data[i].remote);
> > +	}
> > +
> > +done:
> > +	for (i =3D 0; i < info->num_lvds; ++i) {
> > +		of_node_put(lvds_data[i].clkspec.np);
> > +		of_node_put(lvds_data[i].local);
> > +		of_node_put(lvds_data[i].remote);
> > +	}
> > +
> > +	of_node_put(soc_node);
> > +	of_node_put(du_node);
> > +}
> > +
> > +void __init rcar_du_of_init(const struct of_device_id *of_ids)
> > +{
> > +	rcar_du_of_lvds_patch(of_ids);
> > +}

[snip]

=2D-=20
Regards,

Laurent Pinchart

