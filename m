From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 2/5] MFD: RK808: Add new mfd driver for RK808
Date: Mon, 1 Sep 2014 11:09:22 +0100
Message-ID: <20140901100922.GL7374@lee--X1>
References: <1409562468-16586-1-git-send-email-zyw@rock-chips.com>
 <1409564384-18380-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1409564384-18380-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 01 Sep 2014, Chris Zhong wrote:

> The RK808 chip is a power management IC for multimedia and handheld
> devices. It contains the following components:
>=20
> - Regulators
> - RTC
> - Clkout
>=20
> The RK808 core driver is registered as a platform driver and provides
> communication through I2C with the host device for the different
> components.
>=20
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Couple of nits.  Once fixed you can apply my:

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

[...]

> +/*
> + * MFD core driver for Rockchip RK808
> + *
> + * Copyright (c) 2014, Fuzhou Rockchip Electronics Co., Ltd

Author?

> + * This program is free software; you can redistribute it and/or mod=
ify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WI=
THOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILIT=
Y or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Lic=
ense for
> + * more details.
> + */

[...]

> +static int rk808_probe(struct i2c_client *client,
> +		       const struct i2c_device_id *id)
> +{
> +	int i;
> +	int ret;
> +	int pm_off =3D 0;
> +	struct rk808 *rk808;
> +	struct device_node *np =3D client->dev.of_node;

Reverse these declarations please, structs at the top etc.

[...]

> +	rk808->i2c =3D client;
> +	i2c_set_clientdata(client, rk808);

'\n' here.

> +	ret =3D mfd_add_devices(&client->dev, -1,
> +			      rk808s, ARRAY_SIZE(rk808s),
> +			      NULL, 0, regmap_irq_get_domain(rk808->irq_data));
> +	if (ret) {
> +		dev_err(&client->dev, "failed to add MFD devices %d\n", ret);
> +		goto err_irq;
> +	}
> +
> +	if (np) {

There has to be an 'np'.  The driver depends on OF.

> +		pm_off =3D of_property_read_bool(np,
> +					"rockchip,system-power-controller");
> +		if (pm_off && !pm_power_off) {
> +			rk808_i2c_client =3D client;
> +			pm_power_off =3D rk808_device_shutdown;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_irq:
> +	regmap_del_irq_chip(client->irq, rk808->irq_data);
> +	return ret;
> +}

[...]

> +static struct i2c_driver rk808_i2c_driver =3D {
> +	.driver =3D {
> +		.name =3D "rk808",
> +		.of_match_table =3D of_match_ptr(rk808_of_match),

No need to use of_match_ptr() now that you depend on OF.

> +	},
> +	.probe    =3D rk808_probe,
> +	.remove   =3D rk808_remove,
> +	.id_table =3D rk808_ids,
> +};
> +
> +module_i2c_driver(rk808_i2c_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
> +MODULE_AUTHOR("Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
> +MODULE_DESCRIPTION("RK808 PMIC driver");

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
