Return-Path: <SRS0=FVw4=TK=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-4-chris.brandt@renesas.com> <OSBPR01MB3174905587AC3953FD2063EBD80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB3174905587AC3953FD2063EBD80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 May 2019 08:56:43 +0200
Message-ID: <CAMuHMdVvVG64YRg-vWAGDNjuU+_FE_0cC4L38baWVXov1ewoMg@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] phy: renesas: rcar-gen3-usb2: detect usb_x1 clock
Content-Type: text/plain; charset="UTF-8"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Brandt <Chris.Brandt@renesas.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Simoda-san, Chris,

On Fri, May 10, 2019 at 6:17 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Chris Brandt, Sent: Friday, May 10, 2019 5:12 AM
> >
> > The RZ/A2 has an optional dedicated 48MHz clock input for the PLL.
> > If a clock node named 'usb_x1' exists and set to non-zero, then we can
> > assume we want it use it.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > ---
> > v2:
> >  * use 'usb_x1' clock node instead of 'renesas,uses_usb_x1' property
> > ---
> >  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 14 ++++++++++++++

> > @@ -630,6 +637,13 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
> >               }
> >       }
> >
> > +     usb_x1_clk = of_find_node_by_name(NULL, "usb_x1");
> > +     if (usb_x1_clk) {
> > +             of_property_read_u32(usb_x1_clk, "clock-frequency", &freq_usb);
> > +             if (freq_usb)
> > +                     channel->uses_usb_x1 = true;
> > +     }
> > +
>
> We need to call of_node_put(usb_x1_clk); here.
>
> By the way, we can also use devm_clk_get() for it like the following driver:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/renesas/rcar-usb2-clock-sel.c#n135

+1

devm_clk_get() and clk_get_rate() is the way to go.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
