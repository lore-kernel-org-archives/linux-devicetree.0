Return-Path: <SRS0=siEA=VJ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1562321720-18735-1-git-send-email-biju.das@bp.renesas.com>
 <1562321720-18735-2-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdU79JQfEH5hY=wjyknE+sLpS6i3GeXYZ5Z=uzWkWDC-DA@mail.gmail.com> <TYAPR01MB2111E5F445AC1CEA0C720BD9B8F20@TYAPR01MB2111.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB2111E5F445AC1CEA0C720BD9B8F20@TYAPR01MB2111.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2019 15:43:33 +0200
Message-ID: <CAMuHMdWZqQWB+49=FXzKLDOW=phtLSrbvvH1zatdmgf0u8qirA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: hihope-common: Add PCA9654 I/O expander
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Fri, Jul 12, 2019 at 3:22 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 1/3] arm64: dts: renesas: hihope-common: Add PCA9654 I/O expander
> > On Fri, Jul 5, 2019 at 12:20 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > > Enable PCA9654 GPIO expander, so that we can configure its GPIOs later.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> >
> > > --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > > @@ -162,6 +162,13 @@
> > >         clock-frequency = <400000>;
> > >         status = "okay";
> > >
> > > +       gpio_expander: gpio@20 {
> > > +               compatible = "onnn,pca9654";
> > > +               reg = <0x20>;
> > > +               gpio-controller;
> > > +               #gpio-cells = <2>;
> >
> > You may want to describe that the interrupt output is tied to GP5_25?
>
> BT_REG_ON and WLAN_REG_ON are output pins. That is the reason, I haven't described the interrupt output.
> If needed, I can add this. Please let me know.

OK, it's fine for me (for now).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
