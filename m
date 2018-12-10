Return-Path: <SRS0=+yaY=OT=verge.net.au=horms@kernel.org>
Date: Mon, 10 Dec 2018 14:01:50 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: r8a7743: Remove generic compatible string from
 iic3
Message-ID: <20181210130149.bgvw2a64g2sgm7qz@verge.net.au>
References: <1544443077-49827-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdWN37sVO+4QxsrP+_6FGbvMnC39W=t1cYsT0RG_rjFx5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWN37sVO+4QxsrP+_6FGbvMnC39W=t1cYsT0RG_rjFx5Q@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Dec 10, 2018 at 01:13:53PM +0100, Geert Uytterhoeven wrote:
> Hi Biju,
> 
> On Mon, Dec 10, 2018 at 1:06 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > The iic3 block on RZ/G1M does not support automatic transmission, unlike
> > other R-Car SoC's. So dropping the compatibility with the generic version.
> >
> > Fixes: f523405f2a22cc0c307 ("ARM: dts: r8a7743: Add IIC cores to dtsi")
> 
> Thanks for going through the other affected SoCs!
> 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.22.

> > --- a/arch/arm/boot/dts/r8a7743.dtsi
> > +++ b/arch/arm/boot/dts/r8a7743.dtsi
> > @@ -564,9 +564,7 @@
> >                         /* doesn't need pinmux */
> >                         #address-cells = <1>;
> >                         #size-cells = <0>;
> > -                       compatible = "renesas,iic-r8a7743",
> > -                                    "renesas,rcar-gen2-iic",
> > -                                    "renesas,rmobile-iic";
> > +                       compatible = "renesas,iic-r8a7743";
> >                         reg = <0 0xe60b0000 0 0x425>;
> >                         interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> >                         clocks = <&cpg CPG_MOD 926>;
> 
> Note that this is still a bit odd, as there are other iic nodes that do declare
> compatibility with the generic version, as they do support automatic
> transmission.  But at least we'll have an easier job to support this in the
> driver[*], if ever needed.
> 
> [*] The code handling r8a7743 (and r8a7744) can call of_device_is_compatible()
>     to find out if the instance is compatible with the generic version.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
