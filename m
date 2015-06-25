From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: ax20x: Add axp152 support
Date: Thu, 25 Jun 2015 11:11:56 +0100
Message-ID: <20150625095031.GA15013@x1>
References: <1435088503-20776-1-git-send-email-hdegoede@redhat.com>
 <1435088503-20776-2-git-send-email-hdegoede@redhat.com>
Reply-To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBB4FHV6WAKGQEL2HDEPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1435088503-20776-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 23 Jun 2015, Hans de Goede wrote:

> From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> The axp152 is a stripped down version of the axp202 pmic with the battery
> charging function removed as it is intended for top-set boxes.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/axp20x.txt |  4 +-

This should be in a separate patch.

>  drivers/mfd/axp20x.c                             | 92 ++++++++++++++++++=
++++++
>  include/linux/mfd/axp20x.h                       | 61 +++++++++++++++-
>  3 files changed, 155 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documenta=
tion/devicetree/bindings/mfd/axp20x.txt
> index 753f14f..4181122 100644
> --- a/Documentation/devicetree/bindings/mfd/axp20x.txt
> +++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
> @@ -1,12 +1,14 @@
>  AXP family PMIC device tree bindings
> =20
>  The axp20x family current members :
> +axp152 (X-Powers)
>  axp202 (X-Powers)
>  axp209 (X-Powers)
>  axp221 (X-Powers)
> =20
>  Required properties:
> -- compatible: "x-powers,axp202", "x-powers,axp209", "x-powers,axp221"
> +- compatible: "x-powers,axp152", "x-powers,axp202", "x-powers,axp209",
> +	      "x-powers,axp221"
>  - reg: The I2C slave address for the AXP chip
>  - interrupt-parent: The parent interrupt controller
>  - interrupts: SoC NMI / GPIO interrupt connected to the PMIC's IRQ pin

For this patch, when it is separated out:
  Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index ca4a604..49bba28 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -30,12 +30,34 @@
>  #define AXP20X_OFF	0x80
> =20
>  static const char * const axp20x_model_names[] =3D {
> +	"AXP152",
>  	"AXP202",
>  	"AXP209",
>  	"AXP221",
>  	"AXP288",
>  };
> =20
> +static const struct regmap_range axp152_writeable_ranges[] =3D {
> +	regmap_reg_range(AXP152_LDO3456_DC1234_CTRL, AXP152_IRQ3_STATE),
> +	regmap_reg_range(AXP152_DCDC_MODE, AXP152_PWM1_DUTY_CYCLE),
> +};
> +
> +static const struct regmap_range axp152_volatile_ranges[] =3D {
> +	regmap_reg_range(AXP152_PWR_OP_MODE, AXP152_PWR_OP_MODE),
> +	regmap_reg_range(AXP152_IRQ1_EN, AXP152_IRQ3_STATE),
> +	regmap_reg_range(AXP152_GPIO_INPUT, AXP152_GPIO_INPUT),
> +};
> +
> +static const struct regmap_access_table axp152_writeable_table =3D {
> +	.yes_ranges	=3D axp152_writeable_ranges,
> +	.n_yes_ranges	=3D ARRAY_SIZE(axp152_writeable_ranges),
> +};
> +
> +static const struct regmap_access_table axp152_volatile_table =3D {
> +	.yes_ranges	=3D axp152_volatile_ranges,
> +	.n_yes_ranges	=3D ARRAY_SIZE(axp152_volatile_ranges),
> +};
> +
>  static const struct regmap_range axp20x_writeable_ranges[] =3D {
>  	regmap_reg_range(AXP20X_DATACACHE(0), AXP20X_IRQ5_STATE),
>  	regmap_reg_range(AXP20X_DCDC_MODE, AXP20X_FG_RES),
> @@ -99,6 +121,20 @@ static const struct regmap_access_table axp288_volati=
le_table =3D {
>  	.n_yes_ranges	=3D ARRAY_SIZE(axp288_volatile_ranges),
>  };
> =20
> +static struct resource axp152_pek_resources[] =3D {
> +	{
> +		.name	=3D "PEK_DBR",
> +		.start	=3D AXP152_IRQ_PEK_RIS_EDGE,
> +		.end	=3D AXP152_IRQ_PEK_RIS_EDGE,
> +		.flags	=3D IORESOURCE_IRQ,
> +	}, {
> +		.name	=3D "PEK_DBF",
> +		.start	=3D AXP152_IRQ_PEK_FAL_EDGE,
> +		.end	=3D AXP152_IRQ_PEK_FAL_EDGE,
> +		.flags	=3D IORESOURCE_IRQ,
> +	},
> +};

DEFINE_RES_*()

After you've fixed this up, please add my:

 Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

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
