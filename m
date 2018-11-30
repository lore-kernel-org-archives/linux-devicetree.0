Return-Path: <SRS0=qqZh=OJ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181129130559.66732-1-chris.brandt@renesas.com>
 <20181129130559.66732-3-chris.brandt@renesas.com> <20181130115713.blmkvpa2vsdnqdt6@verge.net.au>
 <OSAPR01MB155353707920BFFEB7C4280E8AD30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB155353707920BFFEB7C4280E8AD30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Nov 2018 16:59:26 +0100
Message-ID: <CAMuHMdU6u8_qhe976afyY6Ydhu3byGZcBP=ipsvNowG3Ci=vGA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Fri, Nov 30, 2018 at 1:20 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Friday, November 30, 2018, Simon Horman wrote:
> > I am wondering about the motivation for dual-licensing this file.
> > It does not seem to be something Renesas has done before with
> > upstream DT.
> >
> > I am also wondering if the dual licence, if it remains, can be
> > described using SPDX.
>
> A while back, I was reading/hearing about how board DT file do not have
> to be GPL and the user should not have to be forced to make this GPL.
> (Maybe at some ELC conference or on LWN or something)

Indeed. Recently there have been some attempts to fix this.

> So in our RZ/A BSP that I release to customers I would use this dual
> license. You can see the exact same license in a number of dts files in
> mainline.

Note that your file includes

    #include <dt-bindings/gpio/gpio.h>
    #include <dt-bindings/pinctrl/r7s9210-pinctrl.h>

both of which are

   include/dt-bindings/gpio/gpio.h:/* SPDX-License-Identifier: GPL-2.0 */
   include/dt-bindings/pinctrl/r7s9210-pinctrl.h:/*
SPDX-License-Identifier: GPL-2.0 */

> Since there is no SPDX for this, I figure Rob might have some opinion on
> the matter.
> And, if I have to make it GLP for the mainline version, then I will just
> replace the license when I release the customer BSP (since I wrote it,
> I can do that). But, I would be nice to keep the BSP version as close to
> mainline as I can.

Documentation/process/license-rules.rst does have SPDX identifiers for
dual-licensed files.  Perhaps they match the license of your file?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
