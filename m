Return-Path: <SRS0=znRT=TH=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-2-chris.brandt@renesas.com> <CAMuHMdV3yW44Y1D2Vn1mNJK8pNF3db20An9Sde8=18r8y7m9LQ@mail.gmail.com>
 <TY1PR01MB15621F21D3A3F1F550D85CD68A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB15621F21D3A3F1F550D85CD68A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 May 2019 18:32:44 +0200
Message-ID: <CAMuHMdWBR-069LJZ12pe1azystGp7egzYjKYFVkuRwMoukvzrQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] phy: renesas: rcar-gen3-usb2: Add uses_usb_x1 option
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Tue, May 7, 2019 at 5:43 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Tue, May 07, 2019, Geert Uytterhoeven wrote:
> > > +       if (of_property_read_bool(dev->of_node, "renesas,uses_usb_x1"))
> > > +               channel->uses_usb_x1 = true;
> > > +
> >
> > Perhaps this can be checked some other way (e.g. by checking for a non-
> > zero
> > clock rate of the USB_X1 clock referenced from DT), thus removing the need
> > for
> > adding a custom property?
>
> Currently, there is no USB_X1 in DT like there is for RZ/A1.
>
> For RZ/A2, those are dedicated pins that belong to the USB HW block
> itself. They do not feed into the system CPG or any dividers, so I
> never included it in the .dtsi.

Like pcie_bus_clk on R-Car?
We do have that in DT, with a "clock" link to it from the PCIe device node.
After all, it is provided by an external clock crystal, and consumed by the
PCIe device.

> So with that said, does a uses-usb-x1 property make more sense?

No ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
