Return-Path: <SRS0=6wVR=TI=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-2-chris.brandt@renesas.com> <CAMuHMdV3yW44Y1D2Vn1mNJK8pNF3db20An9Sde8=18r8y7m9LQ@mail.gmail.com>
 <TY1PR01MB15621F21D3A3F1F550D85CD68A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdWBR-069LJZ12pe1azystGp7egzYjKYFVkuRwMoukvzrQ@mail.gmail.com> <TY1PR01MB1562A5D204AD0104862D09FE8A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562A5D204AD0104862D09FE8A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 May 2019 08:59:33 +0200
Message-ID: <CAMuHMdXyuXOGxa=xVwEFWRWB_yHLGG4kLs-ECesSnoD2ctEVRQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] phy: renesas: rcar-gen3-usb2: Add uses_usb_x1 option
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Tue, May 7, 2019 at 10:27 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Tue, May 07, 2019 1, Geert Uytterhoeven wrote:
> > > So with that said, does a uses-usb-x1 property make more sense?
> >
> > No ;-)
>
> So....
>
> I guess the first patch in the series needs to add this to the .dtsi:
>
>         usb_x1_clk: usb_x1 {
>                 #clock-cells = <0>;
>                 compatible = "fixed-clock";
>                 /* If clk present, value must be set by board */
>                 clock-frequency = <0>;
>         };
>
> Then I can reference "usb_x1" in the driver and see if it is set to
> non-zero.
>
> What do you think?

Exactly!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
