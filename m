From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/6] mfd: axp20x: Add support for AXP813 PMIC
Date: Mon, 17 Jul 2017 11:41:11 +0100
Message-ID: <20170717104111.jsg4edvptps76jnb@dell>
References: <20170622040833.15329-1-wens@csie.org>
 <20170622040833.15329-4-wens@csie.org>
Reply-To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBBSVIWLFQKGQEQKQISGQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170622040833.15329-4-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 22 Jun 2017, Chen-Yu Tsai wrote:

> The X-Powers AXP813 PMIC is normally used with Allwinner's A83T SoC.
> It has the same range of functions as other X-Powers PMICs, such as
> DC-DC buck converter and linear regulator outputs, AC-IN and VBUS
> power supplies, power button trigger, GPIOs, ADCs, and a battery
> charger.
>=20
> Note that the IRQ table given in the datasheet is incorrect: in IRQ
> enable/status registers 1, there are separate IRQs for ACIN and VBUS,
> instead of bits [7:5] being the same as bits [4:2]. So it shares the
> same IRQs as the AXP803, rather than the AXP288.
>=20
> This patch adds basic mfd support for it, with only the power button
> enabled.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  drivers/mfd/axp20x-rsb.c   |  1 +
>  drivers/mfd/axp20x.c       | 22 ++++++++++++++++++++++
>  include/linux/mfd/axp20x.h | 29 +++++++++++++++++++++++++++++
>  3 files changed, 52 insertions(+)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
 =20
> diff --git a/drivers/mfd/axp20x-rsb.c b/drivers/mfd/axp20x-rsb.c
> index fd5c7267b136..7ddbd9e8dd03 100644
> --- a/drivers/mfd/axp20x-rsb.c
> +++ b/drivers/mfd/axp20x-rsb.c
> @@ -64,6 +64,7 @@ static const struct of_device_id axp20x_rsb_of_match[] =
=3D {
>  	{ .compatible =3D "x-powers,axp803", .data =3D (void *)AXP803_ID },
>  	{ .compatible =3D "x-powers,axp806", .data =3D (void *)AXP806_ID },
>  	{ .compatible =3D "x-powers,axp809", .data =3D (void *)AXP809_ID },
> +	{ .compatible =3D "x-powers,axp813", .data =3D (void *)AXP813_ID },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, axp20x_rsb_of_match);
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 917b6ddc4f15..ec4271ca065c 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -44,6 +44,7 @@ static const char * const axp20x_model_names[] =3D {
>  	"AXP803",
>  	"AXP806",
>  	"AXP809",
> +	"AXP813",
>  };
> =20
>  static const struct regmap_range axp152_writeable_ranges[] =3D {
> @@ -870,6 +871,14 @@ static struct mfd_cell axp809_cells[] =3D {
>  	},
>  };
> =20
> +static struct mfd_cell axp813_cells[] =3D {
> +	{
> +		.name			=3D "axp20x-pek",
> +		.num_resources		=3D ARRAY_SIZE(axp803_pek_resources),
> +		.resources		=3D axp803_pek_resources,
> +	}
> +};
> +
>  static struct axp20x_dev *axp20x_pm_power_off;
>  static void axp20x_power_off(void)
>  {
> @@ -956,6 +965,19 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>  		axp20x->regmap_cfg =3D &axp22x_regmap_config;
>  		axp20x->regmap_irq_chip =3D &axp809_regmap_irq_chip;
>  		break;
> +	case AXP813_ID:
> +		axp20x->nr_cells =3D ARRAY_SIZE(axp813_cells);
> +		axp20x->cells =3D axp813_cells;
> +		axp20x->regmap_cfg =3D &axp288_regmap_config;
> +		/*
> +		 * The IRQ table given in the datasheet is incorrect.
> +		 * In IRQ enable/status registers 1, there are separate
> +		 * IRQs for ACIN and VBUS, instead of bits [7:5] being
> +		 * the same as bits [4:2]. So it shares the same IRQs
> +		 * as the AXP803, rather than the AXP288.
> +		 */
> +		axp20x->regmap_irq_chip =3D &axp803_regmap_irq_chip;
> +		break;
>  	default:
>  		dev_err(dev, "unsupported AXP20X ID %lu\n", axp20x->variant);
>  		return -EINVAL;
> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> index 965b027e31b3..e9c908c4fba8 100644
> --- a/include/linux/mfd/axp20x.h
> +++ b/include/linux/mfd/axp20x.h
> @@ -23,6 +23,7 @@ enum axp20x_variants {
>  	AXP803_ID,
>  	AXP806_ID,
>  	AXP809_ID,
> +	AXP813_ID,
>  	NR_AXP20X_VARIANTS,
>  };
> =20
> @@ -387,6 +388,34 @@ enum {
>  	AXP803_REG_ID_MAX,
>  };
> =20
> +enum {
> +	AXP813_DCDC1 =3D 0,
> +	AXP813_DCDC2,
> +	AXP813_DCDC3,
> +	AXP813_DCDC4,
> +	AXP813_DCDC5,
> +	AXP813_DCDC6,
> +	AXP813_DCDC7,
> +	AXP813_ALDO1,
> +	AXP813_ALDO2,
> +	AXP813_ALDO3,
> +	AXP813_DLDO1,
> +	AXP813_DLDO2,
> +	AXP813_DLDO3,
> +	AXP813_DLDO4,
> +	AXP813_ELDO1,
> +	AXP813_ELDO2,
> +	AXP813_ELDO3,
> +	AXP813_FLDO1,
> +	AXP813_FLDO2,
> +	AXP813_FLDO3,
> +	AXP813_RTC_LDO,
> +	AXP813_LDO_IO0,
> +	AXP813_LDO_IO1,
> +	AXP813_SW,
> +	AXP813_REG_ID_MAX,
> +};
> +
>  /* IRQs */
>  enum {
>  	AXP152_IRQ_LDO0IN_CONNECT =3D 1,

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
