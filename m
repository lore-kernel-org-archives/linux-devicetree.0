From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] mfd: twl6040: Optional clk32k clock handling
Date: Thu, 24 Apr 2014 12:15:33 +0300
Message-ID: <5358D635.7010809@ti.com>
References: <1396522482-32036-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396522482-32036-1-git-send-email-peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Lee,

On 04/03/2014 01:54 PM, Peter Ujfalusi wrote:
> In certain boards the source for the clk32k clock can be gated. In th=
ese
> boards the clk32k clock can be provided to the driver and it is going=
 to be
> enabled/disabled when it is needed.
> If the clk32k clock is not provided the driver will assume that it is=
 always
> running.

Do you want me to resend this patch, it seams to be missing from next s=
till.

Thanks,
P=E9ter

>=20
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/twl6040.txt |  2 ++
>  drivers/mfd/twl6040.c                             | 10 ++++++++++
>  include/linux/mfd/twl6040.h                       |  2 ++
>  3 files changed, 14 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/twl6040.txt b/Docu=
mentation/devicetree/bindings/mfd/twl6040.txt
> index 0f5dd709d752..a41157b5d930 100644
> --- a/Documentation/devicetree/bindings/mfd/twl6040.txt
> +++ b/Documentation/devicetree/bindings/mfd/twl6040.txt
> @@ -19,6 +19,8 @@ Required properties:
> =20
>  Optional properties, nodes:
>  - enable-active-high: To power on the twl6040 during boot.
> +- clocks: phandle to the clk32k clock provider
> +- clock-names: Must be "clk32k"
> =20
>  Vibra functionality
>  Required properties:
> diff --git a/drivers/mfd/twl6040.c b/drivers/mfd/twl6040.c
> index 2e6504a8e1e3..12b314ea48dc 100644
> --- a/drivers/mfd/twl6040.c
> +++ b/drivers/mfd/twl6040.c
> @@ -291,6 +291,8 @@ int twl6040_power(struct twl6040 *twl6040, int on=
)
>  		if (twl6040->power_count++)
>  			goto out;
> =20
> +		clk_prepare_enable(twl6040->clk32k);
> +
>  		/* Allow writes to the chip */
>  		regcache_cache_only(twl6040->regmap, false);
> =20
> @@ -346,6 +348,8 @@ int twl6040_power(struct twl6040 *twl6040, int on=
)
> =20
>  		twl6040->sysclk =3D 0;
>  		twl6040->mclk =3D 0;
> +
> +		clk_disable_unprepare(twl6040->clk32k);
>  	}
> =20
>  out:
> @@ -644,6 +648,12 @@ static int twl6040_probe(struct i2c_client *clie=
nt,
> =20
>  	i2c_set_clientdata(client, twl6040);
> =20
> +	twl6040->clk32k =3D devm_clk_get(&client->dev, "clk32k");
> +	if (IS_ERR(twl6040->clk32k)) {
> +		dev_info(&client->dev, "clk32k is not handled\n");
> +		twl6040->clk32k =3D NULL;
> +	}
> +
>  	twl6040->supplies[0].supply =3D "vio";
>  	twl6040->supplies[1].supply =3D "v2v1";
>  	ret =3D devm_regulator_bulk_get(&client->dev, TWL6040_NUM_SUPPLIES,
> diff --git a/include/linux/mfd/twl6040.h b/include/linux/mfd/twl6040.=
h
> index a69d16b30c18..8f9fc3d26e6d 100644
> --- a/include/linux/mfd/twl6040.h
> +++ b/include/linux/mfd/twl6040.h
> @@ -28,6 +28,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/mfd/core.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/clk.h>
> =20
>  #define TWL6040_REG_ASICID		0x01
>  #define TWL6040_REG_ASICREV		0x02
> @@ -223,6 +224,7 @@ struct twl6040 {
>  	struct regmap *regmap;
>  	struct regmap_irq_chip_data *irq_data;
>  	struct regulator_bulk_data supplies[2]; /* supplies for vio, v2v1 *=
/
> +	struct clk *clk32k;
>  	struct mutex mutex;
>  	struct mutex irq_mutex;
>  	struct mfd_cell cells[TWL6040_CELLS];
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
