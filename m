Return-Path: <SRS0=znRT=TH=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-2-chris.brandt@renesas.com> <CAMuHMdV3yW44Y1D2Vn1mNJK8pNF3db20An9Sde8=18r8y7m9LQ@mail.gmail.com>
 <TY1PR01MB1562D08E4F5A6C635024BE718A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562D08E4F5A6C635024BE718A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 May 2019 13:26:44 +0200
Message-ID: <CAMuHMdX0KyLcftYp9bP=SBr1KRncUAh1Ua=OmvpFjaTFy=gbOw@mail.gmail.com>
Subject: Re: [PATCH 01/10] phy: renesas: rcar-gen3-usb2: Add uses_usb_x1 option
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Tue, May 7, 2019 at 1:00 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
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
> Good point. I've done that for other drivers before and it worked well.
>
> I'll take this out...one less property to set :)
>
> Question: Since the driver depends on this, should I mention this in the
> dt-bindings documentation ?

Yes, this should be described in the section about the clocks property.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
