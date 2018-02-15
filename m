From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v3 03/12] drm: rcar-du: Fix legacy DT to create LVDS
 encoder nodes
Date: Thu, 15 Feb 2018 10:18:25 +0100
Message-ID: <CAMuHMdVdCrUVDCmEvyOwhGxZ-VG+u4G+C2_rZMR1cN8-v5s2ew@mail.gmail.com>
References: <20180215000415.19077-1-laurent.pinchart+renesas@ideasonboard.com> <20180215000415.19077-4-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180215000415.19077-4-laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Thu, Feb 15, 2018 at 1:04 AM, Laurent Pinchart
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

> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * rcar_du_of_lvds_r8a7790.dts - Legacy LVDS DT bindings conversion for R8A7790
> + *
> + * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> + *
> + * Based on work from Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
> + * Copyright (C) 2015 Texas Instruments
> + */
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/dts-v1/;
> +/plugin/;
> +/ {
> +       fragment@0 {
> +               target-path = "/";
> +               __overlay__ {
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +
> +                       lvds@feb90000 {
> +                               compatible = "renesas,r8a7790-lvds";
> +                               reg = <0 0xfeb90000 0 0x1c>;
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               lvds0_input: endpoint {
> +                                               };
> +                                       };
> +                                       port@1 {
> +                                               reg = <1>;
> +                                               lvds0_out: endpoint {
> +                                               };
> +                                       };
> +                               };
> +                       };
> +
> +                       lvds@feb94000 {
> +                               compatible = "renesas,r8a7790-lvds";
> +                               reg = <0 0xfeb94000 0 0x1c>;
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               lvds1_input: endpoint {
> +                                               };
> +                                       };
> +                                       port@1 {
> +                                               reg = <1>;
> +                                               lvds1_out: endpoint {
> +                                               };
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +
> +       fragment@1 {
> +               target-path = "/display@feb00000/ports";

Does this work now there can be an "soc" subnode, too?

Your code obtains the right parent:

    soc_node = of_get_parent(du_node);

but the overlay is applied without considering that, if I'm not mistaken.

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
