Return-Path: <SRS0=B2fE=PQ=cesnet.cz=jan.kundrat@kernel.org>
From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Subject: Re: [PATCH 3/4] gpio: add core support for pull-up/pull-down =?iso-8859-1?Q?configuration?=
Date: Tue, 08 Jan 2019 15:00:22 +0100
MIME-Version: 1.0
Message-ID: <d0e6a519-fb38-4aa0-81d0-b1781129055d@cesnet.cz>
In-Reply-To: <20190103164102.31437-4-thomas.petazzoni@bootlin.com>
References: <20190103164102.31437-1-thomas.petazzoni@bootlin.com>
 <20190103164102.31437-4-thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>
List-ID: <devicetree@vger.kernel.org>

> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 7f1260c78270..6518dc8c7c4c 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -323,6 +323,11 @@ struct gpio_desc *of_find_gpio(struct=20
> device *dev, const char *con_id,
>  =09if (of_flags & OF_GPIO_TRANSITORY)
>  =09=09*flags |=3D GPIO_TRANSITORY;
> =20
> +=09if (of_flags & OF_GPIO_PULL_UP)
> +=09=09*flags |=3D GPIO_PULL_UP;
> +=09else if (of_flags & OF_GPIO_PULL_DOWN)
> +=09=09*flags |=3D GPIO_PULL_DOWN;
> +
>  =09return desc;
>  }
> =20

Hi Thomas,
my recommendation is to add an explicit "error handling" code here to warn=20=

when the DT specifies both pull-up and pull-down bits. It's outside of any=20=

hot path, and it will help identify mistakes instead of silently prefering=20=

a random bit choice.

> +/* Bit 4 express pull up */
> +#define GPIO_PULL_UP 16
> +
> +/* Bit 5 express pull down */
> +#define GPIO_PULL_DOWN 32
> +

> +=09GPIO_PULL_UP =3D (1 << 4),
> +=09GPIO_PULL_DOWN =3D (1 << 5),

> +=09OF_GPIO_PULL_UP =3D 0x10,
> +=09OF_GPIO_PULL_DOWN =3D 0x20,

I understand that it's already there, but I wonder if this duplication can=20=

be removed. Am I missing something, perhaps a reason why=20
include/linux/of_gpio.h and include/dt-bindings/gpio/gpio.h are separate=20
files?

With kind regards,
Jan
