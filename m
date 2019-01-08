Return-Path: <SRS0=XTvd=PQ=bootlin.com=thomas.petazzoni@kernel.org>
Date: Tue, 8 Jan 2019 15:04:55 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 3/4] gpio: add core support for pull-up/pull-down
 configuration
Message-ID: <20190108150455.60b03b02@windsurf>
In-Reply-To: <d0e6a519-fb38-4aa0-81d0-b1781129055d@cesnet.cz>
References: <20190103164102.31437-1-thomas.petazzoni@bootlin.com>
	<20190103164102.31437-4-thomas.petazzoni@bootlin.com>
	<d0e6a519-fb38-4aa0-81d0-b1781129055d@cesnet.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Jan =?UTF-8?B?S3VuZHLDoXQ=?= <jan.kundrat@cesnet.cz>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Hello Jan,

Thanks for your feedback.

On Tue, 08 Jan 2019 15:00:22 +0100, Jan Kundr=C3=A1t wrote:
> > diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> > index 7f1260c78270..6518dc8c7c4c 100644
> > --- a/drivers/gpio/gpiolib-of.c
> > +++ b/drivers/gpio/gpiolib-of.c
> > @@ -323,6 +323,11 @@ struct gpio_desc *of_find_gpio(struct=20
> > device *dev, const char *con_id,
> >  	if (of_flags & OF_GPIO_TRANSITORY)
> >  		*flags |=3D GPIO_TRANSITORY;
> > =20
> > +	if (of_flags & OF_GPIO_PULL_UP)
> > +		*flags |=3D GPIO_PULL_UP;
> > +	else if (of_flags & OF_GPIO_PULL_DOWN)
> > +		*flags |=3D GPIO_PULL_DOWN;
> > +
> >  	return desc;
> >  }
> >   =20
>=20
> Hi Thomas,
> my recommendation is to add an explicit "error handling" code here to war=
n=20
> when the DT specifies both pull-up and pull-down bits. It's outside of an=
y=20
> hot path, and it will help identify mistakes instead of silently preferin=
g=20
> a random bit choice.

Sure.

> > +/* Bit 4 express pull up */
> > +#define GPIO_PULL_UP 16
> > +
> > +/* Bit 5 express pull down */
> > +#define GPIO_PULL_DOWN 32
> > + =20
>=20
> > +	GPIO_PULL_UP =3D (1 << 4),
> > +	GPIO_PULL_DOWN =3D (1 << 5), =20
>=20
> > +	OF_GPIO_PULL_UP =3D 0x10,
> > +	OF_GPIO_PULL_DOWN =3D 0x20, =20
>=20
> I understand that it's already there, but I wonder if this duplication ca=
n=20
> be removed. Am I missing something, perhaps a reason why=20
> include/linux/of_gpio.h and include/dt-bindings/gpio/gpio.h are separate=
=20
> files?

I also wondered why there was such duplication when writing the
patches. I've assumed it was done so that
include/dt-bindings/gpio/gpio.h is "clean" enough to be included in DT,
while include/linux/of_gpio.h some more elaborate definitions. But
indeed <linux/of_gpio.h> could include <dt-bindings/gpio/gpio.h>.
Perhaps there's a good reason for this duplication? Let's see the
feedback of GPIO maintainers about this.

Best regards,

Thomas
--=20
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
