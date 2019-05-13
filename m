Return-Path: <SRS0=C6wT=TN=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-5-chris.brandt@renesas.com> <OSBPR01MB3174A8008FF1E216893398E8D80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
 <CAMuHMdVVoYak4FGEOYK_dGLCLEQ7avVCv5AcY43BPkDnt7OZ4w@mail.gmail.com> <TY1PR01MB15620F606FDE4AF0C446213E8A0F0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB15620F606FDE4AF0C446213E8A0F0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 May 2019 23:12:09 +0200
Message-ID: <CAMuHMdU5UaOXXkVVr88fCG2xO702RuYbbGeyNOPLFb01G6RU-w@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] dt-bindings: rcar-gen3-phy-usb2: Document use of usb_x1
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Mon, May 13, 2019 at 11:07 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Fri, May 10, 2019, Geert Uytterhoeven wrote:
> > > I think we can reuse it like below:
> > >
> > > - clock-names: Name of the clocks. This property is model-dependent.
> > >   - R-Car Gen3 SoCs use a single functional clock. The clock doesn't
> > need to be
> > >     named.
> > >   - RZ/A2 uses a single functional clock as a separate dedicated 48MHz
> >
> > and a separate?
> >
> > >     USB_X1 input. So, the functional clock must be named "???" and
> > >     the USB_X1 input must be named as "usb_x1".
> > >
> > > What do you think? I'm not sure how to be named the functional clock so
> > that
> > > the sample is named as "???".
> >
> > We typically use "fclk" for the functional clock's name.
>
>
> Just to make sure I'm following this, here is what you are asking for:
>
> [r7s9210.dtsi]
>
>         usb2_phy1: usb-phy@e821a200 {
>                 compatible = "renesas,usb2-phy-r7s9210", "renesas,rcar-gen3-usb2-phy";
>                 reg = <0xe821a200 0x10>;
>                 interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&cpg CPG_MOD 60>, <&usb_x1_clk>;
> +               clock-names = "fclk", "usb_x1";
>                 power-domains = <&cpg>;
>                 #phy-cells = <0>;
>                 status = "disabled";
>
>
> [phy-rcar-gen3-usb2.c]
>         usb_x1_clk = devm_clk_get(dev, "usb_x1");
>         if (!IS_ERR(usb_x1_clk)))
>                 if (clk_get_rate(usb_x1_clk))

if (!IS_ERR(usb_x1_clk) && clk_get_rate(usb_x1_clk))

>                         channel->uses_usb_x1 = true;
>
>
> And then document this in the bindings, saying that clock-names is
> option if there is only 1 clock (to be backward compatible with existing

optional

> Device Trees.
>
> Is this correct?

Exactly!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
