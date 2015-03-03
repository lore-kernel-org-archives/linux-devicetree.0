From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND PATCH 1/6] mfd: arizona: Add support for WM8280/WM8281
Date: Tue, 3 Mar 2015 16:46:28 +0000
Message-ID: <20150303164628.GD32624@x1>
References: <1425399576-26428-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425399576-26428-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com, linus.walleij@linaro.org, gnurou@gmail.com, sameo@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org, rf@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 03 Mar 2015, Charles Keepax wrote:

> From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
>=20
> This adds support for the Wolfson Microelectronics WM8280 and WM8281
> codecs.
>=20
> Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> [ Minor fixup to remove potentially uninitialised variable. ]
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  drivers/mfd/Kconfig              |    5 +++--
>  drivers/mfd/arizona-core.c       |   15 +++++++++++++--
>  drivers/mfd/arizona-i2c.c        |    2 ++
>  drivers/mfd/arizona-irq.c        |    1 +
>  drivers/mfd/arizona-spi.c        |    2 ++
>  include/linux/mfd/arizona/core.h |    1 +
>  6 files changed, 22 insertions(+), 4 deletions(-)

Applied, thanks.

Will send out pull-request once this has had time to soak in -next.=20

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 0ad88c7..b5fb03c 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1290,10 +1290,11 @@ config MFD_WM5102
>  	  Support for Wolfson Microelectronics WM5102 low power audio SoC
> =20
>  config MFD_WM5110
> -	bool "Wolfson Microelectronics WM5110"
> +	bool "Wolfson Microelectronics WM5110 and WM8280/WM8281"
>  	depends on MFD_ARIZONA
>  	help
> -	  Support for Wolfson Microelectronics WM5110 low power audio SoC
> +	  Support for Wolfson Microelectronics WM5110 and WM8280/WM8281
> +	  low power audio SoC
> =20
>  config MFD_WM8997
>  	bool "Wolfson Microelectronics WM8997"
> diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
> index 09ba8f1..9f81998 100644
> --- a/drivers/mfd/arizona-core.c
> +++ b/drivers/mfd/arizona-core.c
> @@ -567,6 +567,7 @@ static int arizona_of_get_core_pdata(struct arizo=
na *arizona)
>  const struct of_device_id arizona_of_match[] =3D {
>  	{ .compatible =3D "wlf,wm5102", .data =3D (void *)WM5102 },
>  	{ .compatible =3D "wlf,wm5110", .data =3D (void *)WM5110 },
> +	{ .compatible =3D "wlf,wm8280", .data =3D (void *)WM8280 },
>  	{ .compatible =3D "wlf,wm8997", .data =3D (void *)WM8997 },
>  	{},
>  };
> @@ -671,6 +672,7 @@ int arizona_dev_init(struct arizona *arizona)
>  	switch (arizona->type) {
>  	case WM5102:
>  	case WM5110:
> +	case WM8280:
>  	case WM8997:
>  		for (i =3D 0; i < ARRAY_SIZE(wm5102_core_supplies); i++)
>  			arizona->core_supplies[i].supply
> @@ -834,11 +836,19 @@ int arizona_dev_init(struct arizona *arizona)
>  #endif
>  #ifdef CONFIG_MFD_WM5110
>  	case 0x5110:
> -		type_name =3D "WM5110";
> -		if (arizona->type !=3D WM5110) {
> +		switch (arizona->type) {
> +		case WM5110:
> +			type_name =3D "WM5110";
> +			break;
> +		case WM8280:
> +			type_name =3D "WM8280";
> +			break;
> +		default:
> +			type_name =3D "WM5110";
>  			dev_err(arizona->dev, "WM5110 registered as %d\n",
>  				arizona->type);
>  			arizona->type =3D WM5110;
> +			break;
>  		}
>  		apply_patch =3D wm5110_patch;
>  		break;
> @@ -1010,6 +1020,7 @@ int arizona_dev_init(struct arizona *arizona)
>  				      ARRAY_SIZE(wm5102_devs), NULL, 0, NULL);
>  		break;
>  	case WM5110:
> +	case WM8280:
>  		ret =3D mfd_add_devices(arizona->dev, -1, wm5110_devs,
>  				      ARRAY_SIZE(wm5110_devs), NULL, 0, NULL);
>  		break;
> diff --git a/drivers/mfd/arizona-i2c.c b/drivers/mfd/arizona-i2c.c
> index 9d4156f..ff782a5d 100644
> --- a/drivers/mfd/arizona-i2c.c
> +++ b/drivers/mfd/arizona-i2c.c
> @@ -44,6 +44,7 @@ static int arizona_i2c_probe(struct i2c_client *i2c=
,
>  #endif
>  #ifdef CONFIG_MFD_WM5110
>  	case WM5110:
> +	case WM8280:
>  		regmap_config =3D &wm5110_i2c_regmap;
>  		break;
>  #endif
> @@ -87,6 +88,7 @@ static int arizona_i2c_remove(struct i2c_client *i2=
c)
>  static const struct i2c_device_id arizona_i2c_id[] =3D {
>  	{ "wm5102", WM5102 },
>  	{ "wm5110", WM5110 },
> +	{ "wm8280", WM8280 },
>  	{ "wm8997", WM8997 },
>  	{ }
>  };
> diff --git a/drivers/mfd/arizona-irq.c b/drivers/mfd/arizona-irq.c
> index 3a3fe7c..d063b94 100644
> --- a/drivers/mfd/arizona-irq.c
> +++ b/drivers/mfd/arizona-irq.c
> @@ -211,6 +211,7 @@ int arizona_irq_init(struct arizona *arizona)
>  #endif
>  #ifdef CONFIG_MFD_WM5110
>  	case WM5110:
> +	case WM8280:
>  		aod =3D &wm5110_aod;
> =20
>  		switch (arizona->rev) {
> diff --git a/drivers/mfd/arizona-spi.c b/drivers/mfd/arizona-spi.c
> index 8ef58bc..1e845f6 100644
> --- a/drivers/mfd/arizona-spi.c
> +++ b/drivers/mfd/arizona-spi.c
> @@ -44,6 +44,7 @@ static int arizona_spi_probe(struct spi_device *spi=
)
>  #endif
>  #ifdef CONFIG_MFD_WM5110
>  	case WM5110:
> +	case WM8280:
>  		regmap_config =3D &wm5110_spi_regmap;
>  		break;
>  #endif
> @@ -84,6 +85,7 @@ static int arizona_spi_remove(struct spi_device *sp=
i)
>  static const struct spi_device_id arizona_spi_ids[] =3D {
>  	{ "wm5102", WM5102 },
>  	{ "wm5110", WM5110 },
> +	{ "wm8280", WM8280 },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(spi, arizona_spi_ids);
> diff --git a/include/linux/mfd/arizona/core.h b/include/linux/mfd/ari=
zona/core.h
> index 910e3aa..f970105 100644
> --- a/include/linux/mfd/arizona/core.h
> +++ b/include/linux/mfd/arizona/core.h
> @@ -24,6 +24,7 @@ enum arizona_type {
>  	WM5102 =3D 1,
>  	WM5110 =3D 2,
>  	WM8997 =3D 3,
> +	WM8280 =3D 4,
>  };
> =20
>  #define ARIZONA_IRQ_GP1                    0

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
