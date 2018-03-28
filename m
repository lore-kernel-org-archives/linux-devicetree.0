From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 08/12] ARM: dts: r8a77470: Initial SoC device tree
Date: Wed, 28 Mar 2018 13:16:06 +0000
Message-ID: <OSBPR01MB210391B03FC3FE0A8552547BB8A30@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
 <1522161443-54428-9-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVdRKpRXhd=0W3hVRt9MD0NVwBpoYa7dsZ+DAEn=sHD-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdVdRKpRXhd=0W3hVRt9MD0NVwBpoYa7dsZ+DAEn=sHD-A@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

Thanks for the feedback.

> On Tue, Mar 27, 2018 at 4:37 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> > The initial R8A77470 SoC device tree including CPU0, GIC, timer, SYSC,
> > RST, CPG, and the required clock descriptions.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/r8a77470.dtsi
> > @@ -0,0 +1,156 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Device Tree Source for the r8a77470 SoC
> > + *
> > + * Copyright (C) 2018 Renesas Electronics Corp.
> > + */
> > +
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/clock/r8a7747x-cpg-mssr.h>
> > +#include <dt-bindings/power/r8a7747x-sysc.h>
>
> It is better to use numerical values for the initial submission, as the dt-bindings
> headers and the DTS files go upstream through different maintainer paths.
>
> > +/ {
> > +       compatible = "renesas,r8a77470";
>
> > +       soc {
>
> > +               icram2: sram@e6300000 {
> > +                       compatible = "mmio-sram";
> > +                       reg = <0 0xe6300000 0 0x40000>;
>
> Size should be 0x20000 (half of other members in the RZ/G1 family)?

Yes, you are correct. Will be fixed in V2.

> With the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-
> m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But when
> I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
