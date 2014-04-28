From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: twl6040: Optional clk32k clock handling
Date: Mon, 28 Apr 2014 11:36:29 +0100
Message-ID: <20140428103629.GI21279@lee--X1>
References: <1396522482-32036-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1396522482-32036-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: sameo@linux.intel.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> In certain boards the source for the clk32k clock can be gated. In th=
ese
> boards the clk32k clock can be provided to the driver and it is going=
 to be
> enabled/disabled when it is needed.
> If the clk32k clock is not provided the driver will assume that it is=
 always
> running.
>=20
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
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

So what happens if you pass a NULL clk reference to clk_prepare_enable(=
)?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
