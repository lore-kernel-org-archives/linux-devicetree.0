From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] iio: adc: rockchip_saradc: add support for rk3066-tsadc variant
Date: Sat, 30 Aug 2014 22:38:35 +0200
Message-ID: <1990899.K4RIhRycbf@diego>
References: <1999284.oRCTeZRSv1@diego> <540230F9.2010004@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <540230F9.2010004-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Samstag, 30. August 2014, 21:15:53 schrieb Jonathan Cameron:
> On 30/08/14 14:07, Heiko St=FCbner wrote:
> > Older Rockchip SoCs, at least the rk3066, used a slightly modified =
saradc
> > for temperature measurements. This so called tsadc does not contain=
 any
> > active parts like temperature interrupts and only supports polling =
the
> > current temperature. The returned voltage can then be converted by =
a
> > suitable thermal driver to and actual temperature and used for ther=
mal
> > handling.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>=20
> Looks, good to me, but will let this sit for a few days for other com=
ments
> on it.=20

ok, cool


> Long shot, but are the docs for the vairous rockchip parts
> publically available somewhere?

Not publically, at this point ... maybe somewhere in the future [hope :=
-) ]


Heiko

>=20
> > ---
> > This is a different IP than the rk3288-tsadc Ceasar provided a driv=
er for.
> > As the commit messages states, the one used on the rk3066 is just a
> > saradc,
> > while the new tsadc in the rk3288 contains active components for th=
ermal
> > handling.
> >=20
> > A working example using the pending iio-thermal driver can found on
> > https://github.com/mmind/linux-rockchip/commit/c07e02f069d9677d489f=
2541766
> > 19fae36f2aad0>=20
> >  .../bindings/iio/adc/rockchip-saradc.txt           |  2 +-
> >  drivers/iio/adc/rockchip_saradc.c                  | 62
> >  +++++++++++++++++----- 2 files changed, 50 insertions(+), 14
> >  deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-sar=
adc.txt
> > b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt ind=
ex
> > 5d3ec1d..a9a5fe1 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt
> > +++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt
> > @@ -1,7 +1,7 @@
> >=20
> >  Rockchip Successive Approximation Register (SAR) A/D Converter bin=
dings
> >=20
> >  Required properties:
> > -- compatible: Should be "rockchip,saradc"
> > +- compatible: Should be "rockchip,saradc" or "rockchip,rk3066-tsad=
c"
> >=20
> >  - reg: physical base address of the controller and length of memor=
y
> >  mapped
> > =20
> >         region.
> > =20
> >  - interrupts: The interrupt number to the cpu. The interrupt speci=
fier
> >  format>=20
> > diff --git a/drivers/iio/adc/rockchip_saradc.c
> > b/drivers/iio/adc/rockchip_saradc.c index e074a0b..7effada 100644
> > --- a/drivers/iio/adc/rockchip_saradc.c
> > +++ b/drivers/iio/adc/rockchip_saradc.c
> > @@ -18,13 +18,13 @@
> >=20
> >  #include <linux/interrupt.h>
> >  #include <linux/io.h>
> >  #include <linux/of.h>
> >=20
> > +#include <linux/of_device.h>
> >=20
> >  #include <linux/clk.h>
> >  #include <linux/completion.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/iio/iio.h>
> > =20
> >  #define SARADC_DATA			0x00
> >=20
> > -#define SARADC_DATA_MASK		0x3ff
> >=20
> >  #define SARADC_STAS			0x04
> >  #define SARADC_STAS_BUSY		BIT(0)
> >=20
> > @@ -38,15 +38,22 @@
> >=20
> >  #define SARADC_DLY_PU_SOC		0x0c
> >  #define SARADC_DLY_PU_SOC_MASK		0x3f
> >=20
> > -#define SARADC_BITS			10
> >=20
> >  #define SARADC_TIMEOUT			msecs_to_jiffies(100)
> >=20
> > +struct rockchip_saradc_data {
> > +	int				num_bits;
> > +	const struct iio_chan_spec	*channels;
> > +	int				num_channels;
> > +	unsigned long			clk_rate;
> > +};
> > +
> >=20
> >  struct rockchip_saradc {
> > =20
> >  	void __iomem		*regs;
> >  	struct clk		*pclk;
> >  	struct clk		*clk;
> >  	struct completion	completion;
> >  	struct regulator	*vref;
> >=20
> > +	const struct rockchip_saradc_data *data;
> >=20
> >  	u16			last_val;
> > =20
> >  };
> >=20
> > @@ -90,7 +97,7 @@ static int rockchip_saradc_read_raw(struct iio_de=
v
> > *indio_dev,>=20
> >  		}
> >  	=09
> >  		*val =3D ret / 1000;
> >=20
> > -		*val2 =3D SARADC_BITS;
> > +		*val2 =3D info->data->num_bits;
> >=20
> >  		return IIO_VAL_FRACTIONAL_LOG2;
> >  =09
> >  	default:
> >  		return -EINVAL;
> >=20
> > @@ -103,7 +110,7 @@ static irqreturn_t rockchip_saradc_isr(int irq,=
 void
> > *dev_id)>=20
> >  	/* Read value */
> >  	info->last_val =3D readl_relaxed(info->regs + SARADC_DATA);
> >=20
> > -	info->last_val &=3D SARADC_DATA_MASK;
> > +	info->last_val &=3D BIT(info->data->num_bits) - 1;
> >=20
> >  	/* Clear irq & power down adc */
> >  	writel_relaxed(0, info->regs + SARADC_CTRL);
> >=20
> > @@ -133,12 +140,44 @@ static const struct iio_chan_spec
> > rockchip_saradc_iio_channels[] =3D {>=20
> >  	ADC_CHANNEL(2, "adc2"),
> > =20
> >  };
> >=20
> > +static const struct rockchip_saradc_data saradc_data =3D {
> > +	.num_bits =3D 10,
> > +	.channels =3D rockchip_saradc_iio_channels,
> > +	.num_channels =3D ARRAY_SIZE(rockchip_saradc_iio_channels),
> > +	.clk_rate =3D 1000000,
> > +};
> > +
> > +static const struct iio_chan_spec rockchip_rk3066_tsadc_iio_channe=
ls[] =3D
> > {
> > +	ADC_CHANNEL(0, "adc0"),
> > +	ADC_CHANNEL(1, "adc1"),
> > +};
> > +
> > +static const struct rockchip_saradc_data rk3066_tsadc_data =3D {
> > +	.num_bits =3D 12,
> > +	.channels =3D rockchip_rk3066_tsadc_iio_channels,
> > +	.num_channels =3D ARRAY_SIZE(rockchip_rk3066_tsadc_iio_channels),
> > +	.clk_rate =3D 50000,
> > +};
> > +
> > +static const struct of_device_id rockchip_saradc_match[] =3D {
> > +	{
> > +		.compatible =3D "rockchip,saradc",
> > +		.data =3D &saradc_data,
> > +	}, {
> > +		.compatible =3D "rockchip,rk3066-tsadc",
> > +		.data =3D &rk3066_tsadc_data,
> > +	},
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, rockchip_saradc_match);
> > +
> >=20
> >  static int rockchip_saradc_probe(struct platform_device *pdev)
> >  {
> > =20
> >  	struct rockchip_saradc *info =3D NULL;
> >  	struct device_node *np =3D pdev->dev.of_node;
> >  	struct iio_dev *indio_dev =3D NULL;
> >  	struct resource	*mem;
> >=20
> > +	const struct of_device_id *match;
> >=20
> >  	int ret;
> >  	int irq;
> >=20
> > @@ -152,6 +191,9 @@ static int rockchip_saradc_probe(struct
> > platform_device *pdev)>=20
> >  	}
> >  	info =3D iio_priv(indio_dev);
> >=20
> > +	match =3D of_match_device(rockchip_saradc_match, &pdev->dev);
> > +	info->data =3D match->data;
> > +
> >=20
> >  	mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >  	info->regs =3D devm_ioremap_resource(&pdev->dev, mem);
> >  	if (IS_ERR(info->regs))
> >=20
> > @@ -195,7 +237,7 @@ static int rockchip_saradc_probe(struct
> > platform_device *pdev)>=20
> >  	 * Use a default of 1MHz for the converter clock.
> >  	 * This may become user-configurable in the future.
> >  	 */
> >=20
> > -	ret =3D clk_set_rate(info->clk, 1000000);
> > +	ret =3D clk_set_rate(info->clk, info->data->clk_rate);
> >=20
> >  	if (ret < 0) {
> >  =09
> >  		dev_err(&pdev->dev, "failed to set adc clk rate, %d\n", ret);
> >  		return ret;
> >=20
> > @@ -227,8 +269,8 @@ static int rockchip_saradc_probe(struct
> > platform_device *pdev)>=20
> >  	indio_dev->info =3D &rockchip_saradc_iio_info;
> >  	indio_dev->modes =3D INDIO_DIRECT_MODE;
> >=20
> > -	indio_dev->channels =3D rockchip_saradc_iio_channels;
> > -	indio_dev->num_channels =3D ARRAY_SIZE(rockchip_saradc_iio_channe=
ls);
> > +	indio_dev->channels =3D info->data->channels;
> > +	indio_dev->num_channels =3D info->data->num_channels;
> >=20
> >  	ret =3D iio_device_register(indio_dev);
> >  	if (ret)
> >=20
> > @@ -296,12 +338,6 @@ static int rockchip_saradc_resume(struct devic=
e *dev)
> >=20
> >  static SIMPLE_DEV_PM_OPS(rockchip_saradc_pm_ops,
> > =20
> >  			 rockchip_saradc_suspend, rockchip_saradc_resume);
> >=20
> > -static const struct of_device_id rockchip_saradc_match[] =3D {
> > -	{ .compatible =3D "rockchip,saradc" },
> > -	{},
> > -};
> > -MODULE_DEVICE_TABLE(of, rockchip_saradc_match);
> > -
> >=20
> >  static struct platform_driver rockchip_saradc_driver =3D {
> > =20
> >  	.probe		=3D rockchip_saradc_probe,
> >  	.remove		=3D rockchip_saradc_remove,
