From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 1/5] mfd: sec-core: Add support for S2MPS13 device
Date: Tue, 25 Nov 2014 15:50:45 +0000
Message-ID: <20141125155045.GK4241@x1>
References: <1416301183-10478-1-git-send-email-cw00.choi@samsung.com>
 <1416301183-10478-2-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416301183-10478-2-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, geunsik.lim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 18 Nov 2014, Chanwoo Choi wrote:

> This patch adds the support for Samsung S2MPS13 PMIC device to the se=
c-core MFD
> driver. The S2MPS13 is very similar with existing S2MPS14 and include=
s PMIC/
> RTC/CLOCK devices.
>=20
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mfd/sec-core.c           | 16 ++++++++++++++++
>  drivers/mfd/sec-irq.c            | 23 +++++++++++++++++------
>  include/linux/mfd/samsung/core.h |  1 +
>  3 files changed, 34 insertions(+), 6 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index 5993608..868f03d 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -73,6 +73,15 @@ static const struct mfd_cell s2mps11_devs[] =3D {
>  	}
>  };
> =20
> +static const struct mfd_cell s2mps13_devs[] =3D {
> +	{ .name =3D "s2mps13-pmic", },
> +	{ .name =3D "s2mps13-rtc", },
> +	{
> +		.name =3D "s2mps13-clk",
> +		.of_compatible =3D "samsung,s2mps13-clk",
> +	},
> +};
> +
>  static const struct mfd_cell s2mps14_devs[] =3D {
>  	{
>  		.name =3D "s2mps14-pmic",
> @@ -107,6 +116,9 @@ static const struct of_device_id sec_dt_match[] =3D=
 {
>  		.compatible =3D "samsung,s2mps11-pmic",
>  		.data =3D (void *)S2MPS11X,
>  	}, {
> +		.compatible =3D "samsung,s2mps13-pmic",
> +		.data =3D (void *)S2MPS13X,
> +	}, {
>  		.compatible =3D "samsung,s2mps14-pmic",
>  		.data =3D (void *)S2MPS14X,
>  	}, {
> @@ -377,6 +389,10 @@ static int sec_pmic_probe(struct i2c_client *i2c=
,
>  		sec_devs =3D s2mps11_devs;
>  		num_sec_devs =3D ARRAY_SIZE(s2mps11_devs);
>  		break;
> +	case S2MPS13X:
> +		sec_devs =3D s2mps13_devs;
> +		num_sec_devs =3D ARRAY_SIZE(s2mps13_devs);
> +		break;
>  	case S2MPS14X:
>  		sec_devs =3D s2mps14_devs;
>  		num_sec_devs =3D ARRAY_SIZE(s2mps14_devs);
> diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> index f9a5786..ba86a91 100644
> --- a/drivers/mfd/sec-irq.c
> +++ b/drivers/mfd/sec-irq.c
> @@ -389,14 +389,22 @@ static const struct regmap_irq_chip s2mps11_irq=
_chip =3D {
>  	.ack_base =3D S2MPS11_REG_INT1,
>  };
> =20
> +#define S2MPS1X_IRQ_CHIP_COMMON_DATA		\
> +	.irqs =3D s2mps14_irqs,			\
> +	.num_irqs =3D ARRAY_SIZE(s2mps14_irqs),	\
> +	.num_regs =3D 3,				\
> +	.status_base =3D S2MPS14_REG_INT1,	\
> +	.mask_base =3D S2MPS14_REG_INT1M,		\
> +	.ack_base =3D S2MPS14_REG_INT1		\
> +
> +static const struct regmap_irq_chip s2mps13_irq_chip =3D {
> +	.name =3D "s2mps13",
> +	S2MPS1X_IRQ_CHIP_COMMON_DATA,
> +};
> +
>  static const struct regmap_irq_chip s2mps14_irq_chip =3D {
>  	.name =3D "s2mps14",
> -	.irqs =3D s2mps14_irqs,
> -	.num_irqs =3D ARRAY_SIZE(s2mps14_irqs),
> -	.num_regs =3D 3,
> -	.status_base =3D S2MPS14_REG_INT1,
> -	.mask_base =3D S2MPS14_REG_INT1M,
> -	.ack_base =3D S2MPS14_REG_INT1,
> +	S2MPS1X_IRQ_CHIP_COMMON_DATA,
>  };
> =20
>  static const struct regmap_irq_chip s2mpu02_irq_chip =3D {
> @@ -452,6 +460,9 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
>  	case S2MPS11X:
>  		sec_irq_chip =3D &s2mps11_irq_chip;
>  		break;
> +	case S2MPS13X:
> +		sec_irq_chip =3D &s2mps13_irq_chip;
> +		break;
>  	case S2MPS14X:
>  		sec_irq_chip =3D &s2mps14_irq_chip;
>  		break;
> diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/sam=
sung/core.h
> index 1825eda..0c0343e 100644
> --- a/include/linux/mfd/samsung/core.h
> +++ b/include/linux/mfd/samsung/core.h
> @@ -41,6 +41,7 @@ enum sec_device_type {
>  	S5M8767X,
>  	S2MPA01,
>  	S2MPS11X,
> +	S2MPS13X,
>  	S2MPS14X,
>  	S2MPU02,
>  };

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
