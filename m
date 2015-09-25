From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/5] mfd: tps65912: Add driver for the TPS65912 PMIC
Date: Fri, 25 Sep 2015 17:50:59 +0100
Message-ID: <20150925165059.GI27197@x1>
References: <1443106374-4126-1-git-send-email-afd@ti.com>
 <1443106374-4126-4-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443106374-4126-4-git-send-email-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 24 Sep 2015, Andrew F. Davis wrote:

> This patch adds support for TPS65912 mfd device. It provides
> communication through the I2C and SPI interfaces. It contains
> the following components:
>=20
>  - Regulators
>  - GPIO controller
>=20
> Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
> ---
>  drivers/mfd/Kconfig          |  24 +++
>  drivers/mfd/Makefile         |   3 +
>  drivers/mfd/tps65912-core.c  | 114 +++++++++++++
>  drivers/mfd/tps65912-i2c.c   |  86 ++++++++++
>  drivers/mfd/tps65912-spi.c   |  85 ++++++++++
>  include/linux/mfd/tps65912.h | 393 +++++++++++++++++++++++++++++++++=
++++++++++
>  6 files changed, 705 insertions(+)
>  create mode 100644 drivers/mfd/tps65912-core.c
>  create mode 100644 drivers/mfd/tps65912-i2c.c
>  create mode 100644 drivers/mfd/tps65912-spi.c
>  create mode 100644 include/linux/mfd/tps65912.h

[...]

> +#define TPS65912_IRQ(_name, _reg, _offset)			\
> +	[TPS65912_IRQ_ ## _name] =3D {				\
> +		.mask =3D TPS65912_ ## _reg ## _ ## _name,	\
> +		.reg_offset =3D _offset,				\
> +	}

I told you about this already.

If you want this set to be merged for v4.3 then you'll need commit
b4fe8ba ("regmap: Add generic macro to define regmap_irq") from my
tree.

[...]

> +static struct i2c_driver tps65912_i2c_driver =3D {
> +	.driver		=3D {
> +		.name	=3D "tps65912",
> +		.of_match_table =3D tps65912_i2c_of_match_table,

of_match_ptr()

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
