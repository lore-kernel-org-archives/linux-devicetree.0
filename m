Return-Path: <SRS0=BlMk=GS=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1522161443-54428-2-git-send-email-biju.das@bp.renesas.com>
References: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com> <1522161443-54428-2-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Mar 2018 09:51:53 +0200
Message-ID: <CAMuHMdWgGNp7iUBDrqdzRdpL=wQrBq=quaze+fxqdGk+zgQtsQ@mail.gmail.com>
Subject: Re: [PATCH 01/12] soc: renesas: rcar-sysc: Add r8a77470 support
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Tue, Mar 27, 2018 at 4:37 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> Add support for RZ/G1C (R8A77470) SoC power areas to the R-Car SYSC
> driver.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for your patch!

>  drivers/soc/renesas/r8a7747x-sysc.c                | 29 ++++++++++++++++++++++

While using "x" in drivers doesn't hurt, as it can be changed at any
time later...

>  include/dt-bindings/power/r8a7747x-sysc.h          | 22 ++++++++++++++++

... this is not true for DT bindings.

I know you do this to anticipate the use of this header file for r8a77471,
which is also called RZ/G1C, and identical to r8a77470, modulo a few on-SoC
devices. But using wildcards in DT bindings is a bad idea, as you cannot
predict what e.g. r8a77477 will be ;-)

So I'd settle for r8a77470-sysc.h. The actual defines in the file use
R8A77470_PD_* anyway.

BTW, I'm considering dropping all R8A*_PD_* definitions, as we can easily
use the numbers directly, cfr. module clock and interrupt numbers. That
would be one step closer to more .dtsi sharing.
The only thing that is keeping me back is that the value "32" (for the
always-on area) is not defined in the datasheet.

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
