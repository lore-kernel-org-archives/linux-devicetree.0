Return-Path: <SRS0=qqZh=OJ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181129130559.66732-1-chris.brandt@renesas.com>
 <20181129130559.66732-3-chris.brandt@renesas.com> <20181130115713.blmkvpa2vsdnqdt6@verge.net.au>
 <OSAPR01MB155353707920BFFEB7C4280E8AD30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <CAMuHMdU6u8_qhe976afyY6Ydhu3byGZcBP=ipsvNowG3Ci=vGA@mail.gmail.com> <OSAPR01MB1553FA10324223CBF4B774DC8AD30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB1553FA10324223CBF4B774DC8AD30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Nov 2018 17:16:09 +0100
Message-ID: <CAMuHMdVwL6HQAjQvuoGZJ=aDbD9wCnViMdnCOEqdr8Jh4TT7YQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Fri, Nov 30, 2018 at 5:10 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Friday, November 30, 2018 1, Geert wrote:
> > > So in our RZ/A BSP that I release to customers I would use this dual
> > > license. You can see the exact same license in a number of dts files in
> > > mainline.
> >
> > Note that your file includes
> >
> >     #include <dt-bindings/gpio/gpio.h>
> >     #include <dt-bindings/pinctrl/r7s9210-pinctrl.h>
> >
> > both of which are
> >
> >    include/dt-bindings/gpio/gpio.h:/* SPDX-License-Identifier: GPL-2.0 */
> >    include/dt-bindings/pinctrl/r7s9210-pinctrl.h:/*
> > SPDX-License-Identifier: GPL-2.0 */
>
> After I wrote that, I realized that we'll always have:
>         #include "r7s9210.dtsi"
> Which I have as GPL-2.0....so the dual license idea in pointless.
>
> So to make things easy, I'll just drop the dual license thing and just
> use SPDX GPL-2.0

That's one solution.

Another solution would be to relicense all DT binding definitions and DTS files.
Cfr. e.g. commit d061864b89c3234b ("ARM: dt: relicense two DT binding IRQ
headers").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
