From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 03/10] drm: rcar-du: Fix legacy DT to create LVDS encoder nodes
Date: Fri, 12 Jan 2018 11:09:45 +0100
Message-ID: <CAMuHMdW5wDj5gyTnh+Xa3J10b_6For0MdhcTFgdU_+sgx=BYmA@mail.gmail.com>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com> <20180112005858.26472-4-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180112005858.26472-4-laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Fri, Jan 12, 2018 at 1:58 AM, Laurent Pinchart
<laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:
> The internal LVDS encoders now have their own DT bindings. Before
> switching the driver infrastructure to those new bindings, implement
> backward-compatibility through live DT patching.
>
> Patching is disabled and will be enabled along with support for the new
> DT bindings in the DU driver.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

Thanks for your patch!

> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -22,6 +22,7 @@ config DRM_RCAR_LVDS
>         bool "R-Car DU LVDS Encoder Support"
>         depends on DRM_RCAR_DU
>         select DRM_PANEL
> +       select OF_OVERLAY

select OF_FLATTREE for of_fdt_unflatten_tree()

(you can probably check with sparc all*config)

> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
> @@ -0,0 +1,440 @@
> +// SPDX-License-Identifier: GPL-2.0-only

-ENOENT in Documentation/process/license-rules.rst ;-)

> +extern u8 __dtb_rcar_du_of_lvds_begin[];
> +extern u8 __dtb_rcar_du_of_lvds_end[];

Typically sections are declared using char, not u8.

> +static int __init rcar_du_of_get_overlay(struct rcar_du_of_overlay *overlay,
> +                                        u8 *begin, u8 *end)

"void *begin, void *end" sounds more natural to me.

> +static void __init rcar_du_of_lvds_patch_one(struct device_node *du,
> +                                            unsigned int port_id,
> +                                            const struct resource *res,
> +                                            const __be32 *reg,
> +                                            const struct of_phandle_args *clkspec,
> +                                            struct device_node *local,
> +                                            struct device_node *remote)
> +{

> +
> +       /* Skip if the LVDS node already exists. */
> +       sprintf(name, "lvds@%llx", (u64)res->start);

I guess you cannot use %pa because you don't want a 0x prefix?

> +       /*
> +        * Patch the LVDS and DU port nodes names and the associated fixup
> +        * entries.
> +        */
> +       lvds = rcar_du_of_find_node_by_path(overlay.np,
> +               "/fragment@0/__overlay__/lvds");
> +       lvds_endpoints[0] = rcar_du_of_find_node_by_path(overlay.np,
> +               "/fragment@0/__overlay__/lvds/ports/port@0/endpoint");
> +       lvds_endpoints[1] = rcar_du_of_find_node_by_path(overlay.np,
> +               "/fragment@0/__overlay__/lvds/ports/port@1/endpoint");
> +       du_port = rcar_du_of_find_node_by_path(overlay.np,
> +               "/fragment@1/__overlay__/ports/port@0");
> +       du_port_fixup = rcar_du_of_find_node_by_path(overlay.np,
> +               "/__local_fixups__/fragment@1/__overlay__/ports/port@0");

Many strings with similar prefixes or substrings?
Would it make sense to e.g. locate "/fragment@0/__overlay__/lvds/ports"
first, and continue from there?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
