From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 5/5] pinctrl: lochnagar: Add support for the Cirrus
 Logic Lochnagar
Date: Tue, 30 Oct 2018 13:59:48 +0000
Message-ID: <20181030135948.GJ16508@imbe.wolfsonmicro.main>
References: <20181019095003.26046-1-ckeepax@opensource.cirrus.com>
 <20181019095003.26046-5-ckeepax@opensource.cirrus.com>
 <CACRpkdbYtphSk+9E5Wzz4kZvQiT=RANDg_hYqRac7pb0M02oAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbYtphSk+9E5Wzz4kZvQiT=RANDg_hYqRac7pb0M02oAA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, linux-clk <linux-clk@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 30, 2018 at 02:04:20PM +0100, Linus Walleij wrote:
> On Fri, Oct 19, 2018 at 11:50 AM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> 
> > Lochnagar is an evaluation and development board for Cirrus
> > Logic Smart CODEC and Amp devices. It allows the connection of
> > most Cirrus Logic devices on mini-cards, as well as allowing
> > connection of various application processor systems to provide a
> > full evaluation platform. This driver supports the board
> > controller chip on the Lochnagar board.
> >
> > Lochnagar provides many pins which can generally be used for an
> > audio function such as an AIF or a PDM interface, but also as
> > GPIOs.
> >
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> > +static void lochnagar_gpio_set(struct gpio_chip *chip,
> > +                              unsigned int offset, int value)
> > +{
> > +       struct lochnagar_pin_priv *priv = gpiochip_get_data(chip);
> > +       struct lochnagar *lochnagar = priv->lochnagar;
> > +       const struct lochnagar_pin *pin = priv->pins[offset].drv_data;
> > +       int ret;
> > +
> > +       value = !!value;
> 
> value = value ? BIT(pin->shift) : 0;
> 

I think this will end up more complex because...

> > +       dev_dbg(priv->dev, "Set GPIO %s to %s\n",
> > +               pin->name, value ? "high" : "low");
> > +
> > +       switch (pin->type) {
> > +       case LN_PTYPE_MUX:
> > +               value |= LN2_OP_GPIO;

I want the value to be in the lowest bit for this path.

> > +
> > +               ret = lochnagar_pin_set_mux(priv, pin, value);
> > +               break;
> > +       case LN_PTYPE_GPIO:
> > +               if (pin->invert)
> > +                       value = !value;

And then I need to invert the value here.

> > +
> > +               ret = regmap_update_bits(lochnagar->regmap, pin->reg,
> > +                                        0x1 << pin->shift,
> 
> BIT(pin->shift)
> 
> > +                                        value << pin->shift);
> 
> Just value provided you used the construction above
> to construct it.
> 

All the other comments look good will fixup for the next spin.

Thanks,
Charles
