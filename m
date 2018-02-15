From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 03/12] drm: rcar-du: Fix legacy DT to create LVDS
 encoder nodes
Date: Thu, 15 Feb 2018 12:32:39 +0100
Message-ID: <CAMuHMdUH=0AsL6dPB_J+0zop_Gq319iD31wsJqX8X6R4UVCjfg@mail.gmail.com>
References: <20180215000415.19077-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180215000415.19077-4-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdVdCrUVDCmEvyOwhGxZ-VG+u4G+C2_rZMR1cN8-v5s2ew@mail.gmail.com> <3075173.XelUTNRH3C@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <3075173.XelUTNRH3C@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Thu, Feb 15, 2018 at 12:03 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thursday, 15 February 2018 11:18:25 EET Geert Uytterhoeven wrote:
>> On Thu, Feb 15, 2018 at 1:04 AM, Laurent Pinchart wrote:
>> > The internal LVDS encoders now have their own DT bindings. Before
>> > switching the driver infrastructure to those new bindings, implement
>> > backward-compatibility through live DT patching.
>> >
>> > Patching is disabled and will be enabled along with support for the new
>> > DT bindings in the DU driver.
>> >
>> > Signed-off-by: Laurent Pinchart
>> > <laurent.pinchart+renesas@ideasonboard.com>
>>
>> Thanks for your patch!
>>
>> > --- /dev/null
>> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
>> > @@ -0,0 +1,81 @@
>> > +// SPDX-License-Identifier: GPL-2.0
>> > +/*
>> > + * rcar_du_of_lvds_r8a7790.dts - Legacy LVDS DT bindings conversion for
>> > R8A7790 + *
>> > + * Copyright (C) 2018 Laurent Pinchart
>> > <laurent.pinchart@ideasonboard.com>
>> > + *
>> > + * Based on work from Jyri Sarha <jsarha@ti.com>
>> > + * Copyright (C) 2015 Texas Instruments
>> > + */
>> > +
>> > +#include <dt-bindings/clock/renesas-cpg-mssr.h>
>> > +
>> > +/dts-v1/;
>> > +/plugin/;
>> > +/ {

>> > +       fragment@1 {
>> > +               target-path = "/display@feb00000/ports";
>>
>> Does this work now there can be an "soc" subnode, too?
>>
>> Your code obtains the right parent:
>>
>>     soc_node = of_get_parent(du_node);
>>
>> but the overlay is applied without considering that, if I'm not mistaken.
>
> Correct, and as I can't modify the target-path in the overlay dynamically
> anymore, I can't take this into account. I could duplicate the r8a7790 and
> r8a7791 overlays in two versions to handle this, but as the soc subnode isn't
> in mainline yet, I'd rather get this patch series merged with the current
> implementation in v4.17 to not have to handle this issue :-)

That's of course an option.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
