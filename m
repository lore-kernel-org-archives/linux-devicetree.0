From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 03/12] drm: rcar-du: Fix legacy DT to create LVDS encoder nodes
Date: Thu, 15 Feb 2018 13:03:22 +0200
Message-ID: <3075173.XelUTNRH3C@avalon>
References: <20180215000415.19077-1-laurent.pinchart+renesas@ideasonboard.com> <20180215000415.19077-4-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdVdCrUVDCmEvyOwhGxZ-VG+u4G+C2_rZMR1cN8-v5s2ew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVdCrUVDCmEvyOwhGxZ-VG+u4G+C2_rZMR1cN8-v5s2ew@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Thursday, 15 February 2018 11:18:25 EET Geert Uytterhoeven wrote:
> On Thu, Feb 15, 2018 at 1:04 AM, Laurent Pinchart wrote:
> > The internal LVDS encoders now have their own DT bindings. Before
> > switching the driver infrastructure to those new bindings, implement
> > backward-compatibility through live DT patching.
> > 
> > Patching is disabled and will be enabled along with support for the new
> > DT bindings in the DU driver.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
> > @@ -0,0 +1,81 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * rcar_du_of_lvds_r8a7790.dts - Legacy LVDS DT bindings conversion for
> > R8A7790 + *
> > + * Copyright (C) 2018 Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com>
> > + *
> > + * Based on work from Jyri Sarha <jsarha@ti.com>
> > + * Copyright (C) 2015 Texas Instruments
> > + */
> > +
> > +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +/ {
> > +       fragment@0 {
> > +               target-path = "/";
> > +               __overlay__ {
> > +                       #address-cells = <2>;
> > +                       #size-cells = <2>;
> > +
> > +                       lvds@feb90000 {
> > +                               compatible = "renesas,r8a7790-lvds";
> > +                               reg = <0 0xfeb90000 0 0x1c>;
> > +
> > +                               ports {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +
> > +                                       port@0 {
> > +                                               reg = <0>;
> > +                                               lvds0_input: endpoint {
> > +                                               };
> > +                                       };
> > +                                       port@1 {
> > +                                               reg = <1>;
> > +                                               lvds0_out: endpoint {
> > +                                               };
> > +                                       };
> > +                               };
> > +                       };
> > +
> > +                       lvds@feb94000 {
> > +                               compatible = "renesas,r8a7790-lvds";
> > +                               reg = <0 0xfeb94000 0 0x1c>;
> > +
> > +                               ports {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +
> > +                                       port@0 {
> > +                                               reg = <0>;
> > +                                               lvds1_input: endpoint {
> > +                                               };
> > +                                       };
> > +                                       port@1 {
> > +                                               reg = <1>;
> > +                                               lvds1_out: endpoint {
> > +                                               };
> > +                                       };
> > +                               };
> > +                       };
> > +               };
> > +       };
> > +
> > +       fragment@1 {
> > +               target-path = "/display@feb00000/ports";
> 
> Does this work now there can be an "soc" subnode, too?
> 
> Your code obtains the right parent:
> 
>     soc_node = of_get_parent(du_node);
> 
> but the overlay is applied without considering that, if I'm not mistaken.

Correct, and as I can't modify the target-path in the overlay dynamically 
anymore, I can't take this into account. I could duplicate the r8a7790 and 
r8a7791 overlays in two versions to handle this, but as the soc subnode isn't 
in mainline yet, I'd rather get this patch series merged with the current 
implementation in v4.17 to not have to handle this issue :-)

-- 
Regards,

Laurent Pinchart
