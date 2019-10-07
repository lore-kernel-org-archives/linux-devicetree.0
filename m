From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 3/5] regulator: da9062: add voltage selection gpio support
Date: Mon, 7 Oct 2019 10:59:14 +0200
Message-ID: <20191007085914.jwp6jehllmbiilye@pengutronix.de>
References: <20190917124246.11732-1-m.felsch@pengutronix.de>
 <20190917124246.11732-4-m.felsch@pengutronix.de>
 <CACRpkdYAjj+EuF+iu4fKjt2Cviu8V+U66HnQThawwU58UGRUzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYAjj+EuF+iu4fKjt2Cviu8V+U66HnQThawwU58UGRUzQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Support Opensource <support.opensource@diasemi.com>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, stwiss.opensource@diasemi.com, Sascha Hauer <kernel@pengutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 19-10-04 21:41, Linus Walleij wrote:
> On Tue, Sep 17, 2019 at 2:43 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> 
> > +       /*
> > +        * We only must ensure that the gpio device is probed before the
> > +        * regulator driver so no need to store the reference global. Luckily
> > +        * devm_* releases the gpio upon a unbound action.
> > +        */
> > +       gpi = devm_gpiod_get_from_of_node(cfg->dev, np, prop, 0, GPIOD_IN |
> > +                                         GPIOD_FLAGS_BIT_NONEXCLUSIVE, label);
> 
> Do you really need the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag here?
> I don't think so, but describe what usecase you have that warrants this
> being claimed twice. Normally that is just needed when you let the
> regulator core handle enablement of a regulator over GPIO, i.e.
> ena_gpiod in struct regulator_config.

This pin can be assigned to all regulators so it is shared across them
also it can be used as voltage-selection gpio by regulator and as
enable signal by an other regulator. I mentioned that within the
dt-bindings and also mentioned that the config has to be the same.

> > +       /* We need the local number */
> > +       nr = da9062_gpio_get_hwgpio(gpi);
> 
> If you really need this we should add a public API to gpiolib and not
> create custom APIs.
> 
> Just make a patch adding
> 
> int gpiod_to_offset(struct gpio_desc *d);
> 
> to the public gpiolib API in include/linux/gpio/consumer.h
> 
> and add the code in gpiolib.c to do this trick.

Okay, I will add it.

Thanks for the review.

Regards,
  Marco

> Yours,
> Linus Walleij
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
