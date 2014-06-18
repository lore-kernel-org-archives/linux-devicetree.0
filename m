From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv6 1/3] mfd: sec-core: Add support for S2MPU02 device
Date: Wed, 18 Jun 2014 10:13:33 +0100
Message-ID: <20140618091333.GC23945@lee--X1>
References: <1402964830-24890-1-git-send-email-cw00.choi@samsung.com>
 <1402964830-24890-2-git-send-email-cw00.choi@samsung.com>
 <20140618091132.GB23945@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140618091132.GB23945@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 18 Jun 2014, Lee Jones wrote:

> > Add support for Samsung S2MPU02 PMIC device to the MFD sec-core dri=
ver.
> > The S2MPU02 device includes PMIC/RTC/Clock devices.
> >=20
> > Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  drivers/mfd/sec-core.c           |  46 +++++++++++-----
> >  drivers/mfd/sec-irq.c            | 110 +++++++++++++++++++++++++++=
++++++------
> >  include/linux/mfd/samsung/core.h |   1 +
> >  include/linux/mfd/samsung/irq.h  |  24 +++++++++
> >  4 files changed, 151 insertions(+), 30 deletions(-)
>=20
> Looks good now:
>   Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>=20
> Can I just apply this on its own?

Ignore this - you answered it on the previous version.

I'm going to apply this patch.

> > diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> > index be06d0a..15ba847 100644
> > --- a/drivers/mfd/sec-core.c
> > +++ b/drivers/mfd/sec-core.c
> > @@ -89,6 +89,15 @@ static const struct mfd_cell s2mpa01_devs[] =3D =
{
> >  	},
> >  };
> > =20
> > +static const struct mfd_cell s2mpu02_devs[] =3D {
> > +	{ .name =3D "s2mpu02-pmic", },
> > +	{ .name =3D "s2mpu02-rtc", },
> > +	{
> > +		.name =3D "s2mpu02-clk",
> > +		.of_compatible =3D "samsung,s2mpu02-clk",
> > +	}
> > +};
> > +
> >  #ifdef CONFIG_OF
> >  static const struct of_device_id sec_dt_match[] =3D {
> >  	{	.compatible =3D "samsung,s5m8767-pmic",
> > @@ -103,6 +112,9 @@ static const struct of_device_id sec_dt_match[]=
 =3D {
> >  		.compatible =3D "samsung,s2mpa01-pmic",
> >  		.data =3D (void *)S2MPA01,
> >  	}, {
> > +		.compatible =3D "samsung,s2mpu02-pmic",
> > +		.data =3D (void *)S2MPU02,
> > +	}, {
> >  		/* Sentinel */
> >  	},
> >  };
> > @@ -250,9 +262,10 @@ static int sec_pmic_probe(struct i2c_client *i=
2c,
> >  {
> >  	struct sec_platform_data *pdata =3D dev_get_platdata(&i2c->dev);
> >  	const struct regmap_config *regmap;
> > +	const struct mfd_cell *sec_devs;
> >  	struct sec_pmic_dev *sec_pmic;
> >  	unsigned long device_type;
> > -	int ret;
> > +	int ret, num_sec_devs;
> > =20
> >  	sec_pmic =3D devm_kzalloc(&i2c->dev, sizeof(struct sec_pmic_dev),
> >  				GFP_KERNEL);
> > @@ -319,34 +332,39 @@ static int sec_pmic_probe(struct i2c_client *=
i2c,
> > =20
> >  	switch (sec_pmic->device_type) {
> >  	case S5M8751X:
> > -		ret =3D mfd_add_devices(sec_pmic->dev, -1, s5m8751_devs,
> > -				      ARRAY_SIZE(s5m8751_devs), NULL, 0, NULL);
> > +		sec_devs =3D s5m8751_devs;
> > +		num_sec_devs =3D ARRAY_SIZE(s5m8751_devs);
> >  		break;
> >  	case S5M8763X:
> > -		ret =3D mfd_add_devices(sec_pmic->dev, -1, s5m8763_devs,
> > -				      ARRAY_SIZE(s5m8763_devs), NULL, 0, NULL);
> > +		sec_devs =3D s5m8763_devs;
> > +		num_sec_devs =3D ARRAY_SIZE(s5m8763_devs);
> >  		break;
> >  	case S5M8767X:
> > -		ret =3D mfd_add_devices(sec_pmic->dev, -1, s5m8767_devs,
> > -				      ARRAY_SIZE(s5m8767_devs), NULL, 0, NULL);
> > +		sec_devs =3D s5m8767_devs;
> > +		num_sec_devs =3D ARRAY_SIZE(s5m8767_devs);
> >  		break;
> >  	case S2MPA01:
> > -		ret =3D mfd_add_devices(sec_pmic->dev, -1, s2mpa01_devs,
> > -				      ARRAY_SIZE(s2mpa01_devs), NULL, 0, NULL);
> > +		sec_devs =3D s2mpa01_devs;
> > +		num_sec_devs =3D ARRAY_SIZE(s2mpa01_devs);
> >  		break;
> >  	case S2MPS11X:
> > -		ret =3D mfd_add_devices(sec_pmic->dev, -1, s2mps11_devs,
> > -				      ARRAY_SIZE(s2mps11_devs), NULL, 0, NULL);
> > +		sec_devs =3D s2mps11_devs;
> > +		num_sec_devs =3D ARRAY_SIZE(s2mps11_devs);
> >  		break;
> >  	case S2MPS14X:
> > -		ret =3D mfd_add_devices(sec_pmic->dev, -1, s2mps14_devs,
> > -				      ARRAY_SIZE(s2mps14_devs), NULL, 0, NULL);
> > +		sec_devs =3D s2mps14_devs;
> > +		num_sec_devs =3D ARRAY_SIZE(s2mps14_devs);
> > +		break;
> > +	case S2MPU02:
> > +		sec_devs =3D s2mpu02_devs;
> > +		num_sec_devs =3D ARRAY_SIZE(s2mpu02_devs);
> >  		break;
> >  	default:
> >  		/* If this happens the probe function is problem */
> >  		BUG();
> >  	}
> > -
> > +	ret =3D mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs=
, NULL,
> > +			      0, NULL);
> >  	if (ret)
> >  		goto err_mfd;
> > =20
> > diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> > index 654e2c1..f9a5786 100644
> > --- a/drivers/mfd/sec-irq.c
> > +++ b/drivers/mfd/sec-irq.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/mfd/samsung/irq.h>
> >  #include <linux/mfd/samsung/s2mps11.h>
> >  #include <linux/mfd/samsung/s2mps14.h>
> > +#include <linux/mfd/samsung/s2mpu02.h>
> >  #include <linux/mfd/samsung/s5m8763.h>
> >  #include <linux/mfd/samsung/s5m8767.h>
> > =20
> > @@ -161,6 +162,77 @@ static const struct regmap_irq s2mps14_irqs[] =
=3D {
> >  	},
> >  };
> > =20
> > +static const struct regmap_irq s2mpu02_irqs[] =3D {
> > +	[S2MPU02_IRQ_PWRONF] =3D {
> > +		.reg_offset =3D 0,
> > +		.mask =3D S2MPS11_IRQ_PWRONF_MASK,
> > +	},
> > +	[S2MPU02_IRQ_PWRONR] =3D {
> > +		.reg_offset =3D 0,
> > +		.mask =3D S2MPS11_IRQ_PWRONR_MASK,
> > +	},
> > +	[S2MPU02_IRQ_JIGONBF] =3D {
> > +		.reg_offset =3D 0,
> > +		.mask =3D S2MPS11_IRQ_JIGONBF_MASK,
> > +	},
> > +	[S2MPU02_IRQ_JIGONBR] =3D {
> > +		.reg_offset =3D 0,
> > +		.mask =3D S2MPS11_IRQ_JIGONBR_MASK,
> > +	},
> > +	[S2MPU02_IRQ_ACOKBF] =3D {
> > +		.reg_offset =3D 0,
> > +		.mask =3D S2MPS11_IRQ_ACOKBF_MASK,
> > +	},
> > +	[S2MPU02_IRQ_ACOKBR] =3D {
> > +		.reg_offset =3D 0,
> > +		.mask =3D S2MPS11_IRQ_ACOKBR_MASK,
> > +	},
> > +	[S2MPU02_IRQ_PWRON1S] =3D {
> > +		.reg_offset =3D 0,
> > +		.mask =3D S2MPS11_IRQ_PWRON1S_MASK,
> > +	},
> > +	[S2MPU02_IRQ_MRB] =3D {
> > +		.reg_offset =3D 0,
> > +		.mask =3D S2MPS11_IRQ_MRB_MASK,
> > +	},
> > +	[S2MPU02_IRQ_RTC60S] =3D {
> > +		.reg_offset =3D 1,
> > +		.mask =3D S2MPS11_IRQ_RTC60S_MASK,
> > +	},
> > +	[S2MPU02_IRQ_RTCA1] =3D {
> > +		.reg_offset =3D 1,
> > +		.mask =3D S2MPS11_IRQ_RTCA1_MASK,
> > +	},
> > +	[S2MPU02_IRQ_RTCA0] =3D {
> > +		.reg_offset =3D 1,
> > +		.mask =3D S2MPS11_IRQ_RTCA0_MASK,
> > +	},
> > +	[S2MPU02_IRQ_SMPL] =3D {
> > +		.reg_offset =3D 1,
> > +		.mask =3D S2MPS11_IRQ_SMPL_MASK,
> > +	},
> > +	[S2MPU02_IRQ_RTC1S] =3D {
> > +		.reg_offset =3D 1,
> > +		.mask =3D S2MPS11_IRQ_RTC1S_MASK,
> > +	},
> > +	[S2MPU02_IRQ_WTSR] =3D {
> > +		.reg_offset =3D 1,
> > +		.mask =3D S2MPS11_IRQ_WTSR_MASK,
> > +	},
> > +	[S2MPU02_IRQ_INT120C] =3D {
> > +		.reg_offset =3D 2,
> > +		.mask =3D S2MPS11_IRQ_INT120C_MASK,
> > +	},
> > +	[S2MPU02_IRQ_INT140C] =3D {
> > +		.reg_offset =3D 2,
> > +		.mask =3D S2MPS11_IRQ_INT140C_MASK,
> > +	},
> > +	[S2MPU02_IRQ_TSD] =3D {
> > +		.reg_offset =3D 2,
> > +		.mask =3D S2MPS14_IRQ_TSD_MASK,
> > +	},
> > +};
> > +
> >  static const struct regmap_irq s5m8767_irqs[] =3D {
> >  	[S5M8767_IRQ_PWRR] =3D {
> >  		.reg_offset =3D 0,
> > @@ -327,6 +399,16 @@ static const struct regmap_irq_chip s2mps14_ir=
q_chip =3D {
> >  	.ack_base =3D S2MPS14_REG_INT1,
> >  };
> > =20
> > +static const struct regmap_irq_chip s2mpu02_irq_chip =3D {
> > +	.name =3D "s2mpu02",
> > +	.irqs =3D s2mpu02_irqs,
> > +	.num_irqs =3D ARRAY_SIZE(s2mpu02_irqs),
> > +	.num_regs =3D 3,
> > +	.status_base =3D S2MPU02_REG_INT1,
> > +	.mask_base =3D S2MPU02_REG_INT1M,
> > +	.ack_base =3D S2MPU02_REG_INT1,
> > +};
> > +
> >  static const struct regmap_irq_chip s5m8767_irq_chip =3D {
> >  	.name =3D "s5m8767",
> >  	.irqs =3D s5m8767_irqs,
> > @@ -351,6 +433,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
> >  {
> >  	int ret =3D 0;
> >  	int type =3D sec_pmic->device_type;
> > +	const struct regmap_irq_chip *sec_irq_chip;
> > =20
> >  	if (!sec_pmic->irq) {
> >  		dev_warn(sec_pmic->dev,
> > @@ -361,28 +444,19 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmi=
c)
> > =20
> >  	switch (type) {
> >  	case S5M8763X:
> > -		ret =3D regmap_add_irq_chip(sec_pmic->regmap_pmic, sec_pmic->irq=
,
> > -				  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> > -				  sec_pmic->irq_base, &s5m8763_irq_chip,
> > -				  &sec_pmic->irq_data);
> > +		sec_irq_chip =3D &s5m8763_irq_chip;
> >  		break;
> >  	case S5M8767X:
> > -		ret =3D regmap_add_irq_chip(sec_pmic->regmap_pmic, sec_pmic->irq=
,
> > -				  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> > -				  sec_pmic->irq_base, &s5m8767_irq_chip,
> > -				  &sec_pmic->irq_data);
> > +		sec_irq_chip =3D &s5m8767_irq_chip;
> >  		break;
> >  	case S2MPS11X:
> > -		ret =3D regmap_add_irq_chip(sec_pmic->regmap_pmic, sec_pmic->irq=
,
> > -				  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> > -				  sec_pmic->irq_base, &s2mps11_irq_chip,
> > -				  &sec_pmic->irq_data);
> > +		sec_irq_chip =3D &s2mps11_irq_chip;
> >  		break;
> >  	case S2MPS14X:
> > -		ret =3D regmap_add_irq_chip(sec_pmic->regmap_pmic, sec_pmic->irq=
,
> > -				  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> > -				  sec_pmic->irq_base, &s2mps14_irq_chip,
> > -				  &sec_pmic->irq_data);
> > +		sec_irq_chip =3D &s2mps14_irq_chip;
> > +		break;
> > +	case S2MPU02:
> > +		sec_irq_chip =3D &s2mpu02_irq_chip;
> >  		break;
> >  	default:
> >  		dev_err(sec_pmic->dev, "Unknown device type %lu\n",
> > @@ -390,6 +464,10 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic=
)
> >  		return -EINVAL;
> >  	}
> > =20
> > +	ret =3D regmap_add_irq_chip(sec_pmic->regmap_pmic, sec_pmic->irq,
> > +			  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> > +			  sec_pmic->irq_base, sec_irq_chip,
> > +			  &sec_pmic->irq_data);
> >  	if (ret !=3D 0) {
> >  		dev_err(sec_pmic->dev, "Failed to register IRQ chip: %d\n", ret)=
;
> >  		return ret;
> > diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/s=
amsung/core.h
> > index 47d8424..b5f73de 100644
> > --- a/include/linux/mfd/samsung/core.h
> > +++ b/include/linux/mfd/samsung/core.h
> > @@ -21,6 +21,7 @@ enum sec_device_type {
> >  	S2MPA01,
> >  	S2MPS11X,
> >  	S2MPS14X,
> > +	S2MPU02,
> >  };
> > =20
> >  /**
> > diff --git a/include/linux/mfd/samsung/irq.h b/include/linux/mfd/sa=
msung/irq.h
> > index 1224f44..f35af73 100644
> > --- a/include/linux/mfd/samsung/irq.h
> > +++ b/include/linux/mfd/samsung/irq.h
> > @@ -129,6 +129,30 @@ enum s2mps14_irq {
> >  	S2MPS14_IRQ_NR,
> >  };
> > =20
> > +enum s2mpu02_irq {
> > +	S2MPU02_IRQ_PWRONF,
> > +	S2MPU02_IRQ_PWRONR,
> > +	S2MPU02_IRQ_JIGONBF,
> > +	S2MPU02_IRQ_JIGONBR,
> > +	S2MPU02_IRQ_ACOKBF,
> > +	S2MPU02_IRQ_ACOKBR,
> > +	S2MPU02_IRQ_PWRON1S,
> > +	S2MPU02_IRQ_MRB,
> > +
> > +	S2MPU02_IRQ_RTC60S,
> > +	S2MPU02_IRQ_RTCA1,
> > +	S2MPU02_IRQ_RTCA0,
> > +	S2MPU02_IRQ_SMPL,
> > +	S2MPU02_IRQ_RTC1S,
> > +	S2MPU02_IRQ_WTSR,
> > +
> > +	S2MPU02_IRQ_INT120C,
> > +	S2MPU02_IRQ_INT140C,
> > +	S2MPU02_IRQ_TSD,
> > +
> > +	S2MPU02_IRQ_NR,
> > +};
> > +
> >  /* Masks for interrupts are the same as in s2mps11 */
> >  #define S2MPS14_IRQ_TSD_MASK		(1 << 2)
> > =20
>=20

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
