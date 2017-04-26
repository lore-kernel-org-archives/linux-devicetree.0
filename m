From: jmondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/9] pinctrl: Renesas RZ/A1 pin and gpio controller
Date: Wed, 26 Apr 2017 16:28:07 +0200
Message-ID: <20170426142757.GJ11761@w540>
References: <1491401247-7030-1-git-send-email-jacopo+renesas@jmondi.org>
 <1491401247-7030-3-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdUy3wo9x=nkpdSVSt34q5yaARc4+kFDC592V2LF7Cxzrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUy3wo9x=nkpdSVSt34q5yaARc4+kFDC592V2LF7Cxzrg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Wed, Apr 26, 2017 at 02:21:34PM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Wed, Apr 5, 2017 at 4:07 PM, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:
> > Add combined gpio and pin controller driver for Renesas RZ/A1
> > r7s72100 SoC.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
>
> > --- /dev/null
> > +++ b/drivers/pinctrl/pinctrl-rza1.c
>
> > +/*
> > + * Keep this up-to-date with pinconf-generic.h: it performs packing of
> > + * pin conf flags and argument during pinconf_generic_parse_dt_config();
> > + * we simply discard pinconf argument here
> > + */
> > +#define PIN_CONF_UNPACK(pinconf)       ((pinconf) & 0xffUL)
>
> Perhaps this should be moved to pinconf-generic.h, to make sure it stays
> up-to-date?
>

Not sure, I'm discarding the argument of the configuration flag with
this macro...

I would keep this internal to this driver, or make two of them, one to
retrieve the flag, and one to retrieve argument..


> > +static inline int rza1_get_bit(struct rza1_port *port, unsigned int reg,
>
> I'd use "unsigned int" as the return type.
> It doesn't matter much as register values are 16-bit, but people might copy
> from this driver when writing their own.
>
> > +                              unsigned int bit)
> > +{
> > +       void __iomem *mem = RZA1_ADDR(port->base, reg, port->id);
> > +
> > +       return ioread16(mem) & BIT(bit);
> > +}
>
> > +static inline int rza1_pin_get_direction(struct rza1_port *port,
> > +                                        unsigned int pin)
> > +{
> > +       unsigned long irqflags;
> > +       int input;
> > +
> > +       spin_lock_irqsave(&port->lock, irqflags);
> > +       input = rza1_get_bit(port, RZA1_PM_REG, pin);
> > +       spin_unlock_irqrestore(&port->lock, irqflags);
> > +
> > +       return input;
>
> return !!input;
>
> gpio_chip.get_direction() should return 0, 1, or a negative error value.
>
> > +}
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
