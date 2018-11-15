Return-Path: <SRS0=cp7r=N2=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181107182733.62155-1-chris.brandt@renesas.com>
 <20181107182733.62155-2-chris.brandt@renesas.com> <20181113195732.GB19257@w540>
 <OSAPR01MB155328061E423C6DD4504D828AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB155328061E423C6DD4504D828AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Nov 2018 08:34:00 +0100
Message-ID: <CAMuHMdVO9nh_zgxaBW9dmchfvxsVmLSEkm5_AcNrYE3Aw2EbRA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] pinctrl: Add RZ/A2 pin and gpio controller
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Thu, Nov 15, 2018 at 12:41 AM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> > > +   gpio_range.id = of_args.args[0];
> >
> > Do you think of_args need to be validated?
> > As I understand them, id and pin_base are fixed at 0, while the pin
> > number depends on the soc version/revision.
> >
> > Now I wonder if you would need a gpio-ranges property at all, but
> > that's fine, it doesn't hurt...
>
> My idea was that if another RZ/A2 with a different package size is
> created, or even a RZ/A3 with the same pin controller, nothing in the driver
> will have to change because the gpio-ranges is passed in and will tell
> you how many ports you have.
>
> As for validating the values, the only thing I can really check is that:
>   of_args.args[2] == RZA2_NPINS
>
> Of course, now that I say that, I realize that if/when it does come time
> to expand this driver beyond the 1 SOC that exists today, I will have
> to stop using that hard coded RZA2_NPINS value...but I'll deal with that
> when the time comes.

Not that there is an inherent danger in taking of_args.args[2] without
validation to support future SoCs without driver changes.
port_names[] is a fixed size array, so an SoC with more pins will
cause memory access beyond the end of the array. Possibly there are
other locations that need to be changed.

So IMHO it's better to have explicit support for different SoCs using
different compatible values, so you can store the number of pins in
of_device_id.data, and validate against that.

> > > +   ret = rza2_pinctrl_register(priv);
> > > +   if (ret)
> > > +           return ret;
> > > +
> > > +   pr_info("RZ/A2 pin controller registered\n");
> > nit: dev_info
>
> Actually, I changed it to this to anticipate the day when more than one
> SOC is supported:
>
>         dev_info(&pdev->dev, "Registered ports P0 - P%c\n",
>                  port_names[priv->desc.npins / RZA2_PINS_PER_PORT - 1]);

See, if npins becomes larger, you'll overflow port_names[].

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
