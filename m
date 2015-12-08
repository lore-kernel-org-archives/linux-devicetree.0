From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/3] usb: misc: generic_onboard_hub: add generic onboard USB HUB driver
Date: Mon, 7 Dec 2015 20:59:19 -0600
Message-ID: <87poyhmyrc.fsf@saruman.tx.rr.com>
References: <1449538670-7954-1-git-send-email-peter.chen@freescale.com> <1449538670-7954-2-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg=pgp-sha1;
	protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449538670-7954-2-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> writes:
> diff --git a/drivers/usb/misc/Makefile b/drivers/usb/misc/Makefile
> index 45fd4ac..da52e9a 100644
> --- a/drivers/usb/misc/Makefile
> +++ b/drivers/usb/misc/Makefile
> @@ -29,3 +29,4 @@ obj-$(CONFIG_USB_CHAOSKEY)		+=3D chaoskey.o
>=20=20
>  obj-$(CONFIG_USB_SISUSBVGA)		+=3D sisusbvga/
>  obj-$(CONFIG_USB_LINK_LAYER_TEST)	+=3D lvstest.o
> +obj-$(CONFIG_USB_ONBOARD_HUB)		+=3D generic_onboard_hub.o
> diff --git a/drivers/usb/misc/generic_onboard_hub.c b/drivers/usb/misc/ge=
neric_onboard_hub.c
> new file mode 100644
> index 0000000..df722a0
> --- /dev/null
> +++ b/drivers/usb/misc/generic_onboard_hub.c
> @@ -0,0 +1,162 @@
> +/*
> + * usb_hub_generic.c	The generic onboard USB HUB driver
> + *
> + * Copyright (C) 2015 Freescale Semiconductor, Inc.
> + * Author: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2  of
> + * the License as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +/*
> + * This driver is only for the USB HUB devices which need to control
> + * their external pins(clock, reset, etc), and these USB HUB devices
> + * are soldered at the board.
> + */
> +
> +#define DEBUG

nope

> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_gpio.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +#include <linux/usb/generic_onboard_hub.h>

<linux/platform_data/generic_onboard_hub.h> ?

> +struct usb_hub_generic_data {
> +	struct clk *clk;

seriously ? Is this really all ? What about that reset line below ?

In fact, that reset line should be using a generic reset-gpio.c instead
of a raw gpio.

> +static int usb_hub_generic_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct usb_hub_generic_platform_data *pdata =3D dev->platform_data;
> +	struct usb_hub_generic_data *hub_data;
> +	int reset_pol =3D 0, duration_us =3D 50, ret =3D 0;
> +	struct gpio_desc *gpiod_reset =3D NULL;
> +
> +	hub_data =3D devm_kzalloc(dev, sizeof(*hub_data), GFP_KERNEL);
> +	if (!hub_data)
> +		return -ENOMEM;
> +
> +	if (dev->of_node) {
> +		struct device_node *node =3D dev->of_node;
> +
> +		hub_data->clk =3D devm_clk_get(dev, "external_clk");
> +		if (IS_ERR(hub_data->clk)) {
> +			dev_dbg(dev, "Can't get external clock: %ld\n",
> +					PTR_ERR(hub_data->clk));

how about setting clock to NULL to here ? then you don't need IS_ERR()
checks anywhere else.

> +		}

braces shouldn't be used here, if you add NULL trick above,
however... then you can keep them.

> +		/*
> +		 * Try to get the information for HUB reset, the
> +		 * default setting like below:
> +		 *
> +		 * - Reset state is low
> +		 * - The duration is 50us
> +		 */
> +		if (of_find_property(node, "hub-reset-active-high", NULL))
> +			reset_pol =3D 1;

you see, this is definitely *not* generic. You should write a generic
reset-gpio.c reset controller and describe the polarity on the gpio
binding. This driver *always* uses reset_assert(); reset_deassert(); and
reset-gpio implements though by gpiod_set_value() correctly.

Polarity _must_ be described elsewhere in DT.

> +		of_property_read_u32(node, "hub-reset-duration-us",
> +			&duration_us);

likewise, this should be described as a debounce time for the GPIO.

> +		gpiod_reset =3D devm_gpiod_get_optional(dev, "hub-reset",
> +			reset_pol ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW);
> +		ret =3D PTR_ERR_OR_ZERO(gpiod_reset);
> +		if (ret) {
> +			dev_err(dev, "Failed to get reset gpio, err =3D %d\n",
> +				ret);
> +			return ret;
> +		}
> +	} else if (pdata) {
> +		hub_data->clk =3D pdata->ext_clk;
> +		duration_us =3D pdata->gpio_reset_duration_us;
> +		reset_pol =3D pdata->gpio_reset_polarity;
> +
> +		if (gpio_is_valid(pdata->gpio_reset)) {
> +			ret =3D devm_gpio_request_one(
> +				dev, pdata->gpio_reset, reset_pol
> +				? GPIOF_OUT_INIT_HIGH : GPIOF_OUT_INIT_LOW,
> +				dev_name(dev));
> +			if (!ret)
> +				gpiod_reset =3D gpio_to_desc(pdata->gpio_reset);
> +		}
> +	}
> +
> +	if (!IS_ERR(hub_data->clk)) {
> +		ret =3D clk_prepare_enable(hub_data->clk);
> +		if (ret) {
> +			dev_err(dev,
> +				"Can't enable external clock: %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
> +	if (gpiod_reset) {
> +		/* Sanity check */
> +		if (duration_us > 1000000)
> +			duration_us =3D 50;

this check makes no sense whatsoever. What I *really* need over 1s of
debounce ?

> +		usleep_range(duration_us, duration_us + 100);
> +		gpiod_set_value(gpiod_reset, reset_pol ? 0 : 1);

wrong. You should _not_ have polarity checks here. You should have
already initialized the gpio as ACTIVE_HIGH or ACTIVE_LOW and gpiolib
will handle the polarity for you.

> +	}
> +
> +	dev_set_drvdata(dev, hub_data);
> +	return ret;
> +}
> +
> +static int usb_hub_generic_remove(struct platform_device *pdev)
> +{
> +	struct usb_hub_generic_data *hub_data =3D platform_get_drvdata(pdev);
> +
> +	if (!IS_ERR(hub_data->clk))
> +		clk_disable_unprepare(hub_data->clk);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id usb_hub_generic_dt_ids[] =3D {
> +	{.compatible =3D "generic-onboard-hub"},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, usb_hub_generic_dt_ids);
> +#endif
> +
> +static struct platform_driver usb_hub_generic_driver =3D {
> +	.probe =3D usb_hub_generic_probe,
> +	.remove =3D usb_hub_generic_remove,
> +	.driver =3D {
> +		.name =3D "usb_hub_generic_onboard",
> +		.of_match_table =3D usb_hub_generic_dt_ids,
> +	 },
> +};
> +
> +static int __init usb_hub_generic_init(void)
> +{
> +	return platform_driver_register(&usb_hub_generic_driver);
> +}
> +subsys_initcall(usb_hub_generic_init);
> +
> +static void __exit usb_hub_generic_exit(void)
> +{
> +	platform_driver_unregister(&usb_hub_generic_driver);
> +}
> +module_exit(usb_hub_generic_exit);

module_platform_driver();

> +MODULE_AUTHOR("Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>");
> +MODULE_DESCRIPTION("Generic Onboard USB HUB driver");
> +MODULE_LICENSE("GPL");

comment header says GPL v2 only, this is GPL v2+. Which is correct ?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWZkeIAAoJEIaOsuA1yqRE1OgQAJ8frsjLFASsTN+SnpHXyv9T
9ozBlHDc6E34aCUQw6KQV2PnJBjELnwsJEF7NwBbFZJlEU2HTwrXbKssp3KEMjcL
shVlGHbsHyg1wu/sJGOcoX2sKuxP7vOTX7jNNVG+XRPY5a2dnb9m+OADlWItH4s0
Li4fHYwH835/B/XlDadW9Ub22GSMxTxNV4mJwnf5T466w4Ds/Ds4JR9vzcF8jakq
9YPgaGoUbtvmJrBSyaUEzCzl7wshTWwp/yeaZbgXQ3EIppAPvlYJ6BOHnh48nb3K
5jH9NFSd41jVTzA5zQSJj10GVwER/q/ehfEtm9j+z96CoJY0BuD5+YKx2ymnW+Qn
bEs2jNzu4wZHNALanH/xSdQWqqlOW8EGCdIzL2iw7etymXeZcheF81NWfoCWWvw4
JWgY72BGvNq4tmQK13phTeJITQyMUdADWcBzijN31RNEzn/a1s2Xs/HmJbYZnQrR
kEQDDnbE9btHKwywxUBCG5UgDrWYe3ePJXoNMd/Z4EwSUx8FWMcOmTfn+BKvO0R+
JLYCVANLb3eVoUQ4Wg2vdeTtij9kOy+mURnQMsX03L9/6vUzUiWglZ2EfKWfTK4Z
jbGIZdXlaZUN/1oWernrJTHvGUu0E39G2kLab1FeDJbMnn1gHTzvR4/Yb5rgd7ZE
hh3JE6JY60yv5LKuej6m
=ojyi
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
