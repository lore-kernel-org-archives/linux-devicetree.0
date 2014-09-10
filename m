From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: adc: rockchip_saradc: add support for rk3066-tsadc
 variant
Date: Wed, 10 Sep 2014 20:05:53 +0100
Message-ID: <5410A111.6040007@kernel.org>
References: <1999284.oRCTeZRSv1@diego> <540642CA.9080007@gmx.de> <38104193.mr2XbIjNkb@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <38104193.mr2XbIjNkb@diego>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?windows-1252?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/09/14 11:13, Heiko St=FCbner wrote:
> Am Mittwoch, 3. September 2014, 00:20:58 schrieb Hartmut Knaack:
>> Heiko St=FCbner schrieb:
>>> Older Rockchip SoCs, at least the rk3066, used a slightly modified =
saradc
>>> for temperature measurements. This so called tsadc does not contain=
 any
>>> active parts like temperature interrupts and only supports polling =
the
>>> current temperature. The returned voltage can then be converted by =
a
>>> suitable thermal driver to and actual temperature and used for ther=
mal
>>> handling.
>>>
>>> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>>> ---
>>
>> Looks mostly good to me, just some minor style issues inline.
>>
>>> This is a different IP than the rk3288-tsadc Ceasar provided a driv=
er for.
>>> As the commit messages states, the one used on the rk3066 is just a
>>> saradc,
>>> while the new tsadc in the rk3288 contains active components for th=
ermal
>>> handling.
>>>
>>> A working example using the pending iio-thermal driver can found on
>>> https://github.com/mmind/linux-rockchip/commit/c07e02f069d9677d489f=
2541766
>>> 19fae36f2aad0>=20
>>>  .../bindings/iio/adc/rockchip-saradc.txt           |  2 +-
>>>  drivers/iio/adc/rockchip_saradc.c                  | 62
>>>  +++++++++++++++++----- 2 files changed, 50 insertions(+), 14
>>>  deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-sar=
adc.txt
>>> b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt ind=
ex
>>> 5d3ec1d..a9a5fe1 100644
>>> --- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt
>>> +++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt
>>> @@ -1,7 +1,7 @@
>>>
>>>  Rockchip Successive Approximation Register (SAR) A/D Converter bin=
dings
>>>
>>>  Required properties:
>>> -- compatible: Should be "rockchip,saradc"
>>> +- compatible: Should be "rockchip,saradc" or "rockchip,rk3066-tsad=
c"
>>>
>>>  - reg: physical base address of the controller and length of memor=
y
>>>  mapped
>>> =20
>>>         region.
>>> =20
>>>  - interrupts: The interrupt number to the cpu. The interrupt speci=
fier
>>>  format>=20
>>> diff --git a/drivers/iio/adc/rockchip_saradc.c
>>> b/drivers/iio/adc/rockchip_saradc.c index e074a0b..7effada 100644
>>> --- a/drivers/iio/adc/rockchip_saradc.c
>>> +++ b/drivers/iio/adc/rockchip_saradc.c
>>> @@ -18,13 +18,13 @@
>>>
>>>  #include <linux/interrupt.h>
>>>  #include <linux/io.h>
>>>  #include <linux/of.h>
>>>
>>> +#include <linux/of_device.h>
>>>
>>>  #include <linux/clk.h>
>>>  #include <linux/completion.h>
>>>  #include <linux/regulator/consumer.h>
>>>  #include <linux/iio/iio.h>
>>> =20
>>>  #define SARADC_DATA			0x00
>>>
>>> -#define SARADC_DATA_MASK		0x3ff
>>>
>>>  #define SARADC_STAS			0x04
>>>  #define SARADC_STAS_BUSY		BIT(0)
>>>
>>> @@ -38,15 +38,22 @@
>>>
>>>  #define SARADC_DLY_PU_SOC		0x0c
>>>  #define SARADC_DLY_PU_SOC_MASK		0x3f
>>>
>>> -#define SARADC_BITS			10
>>>
>>>  #define SARADC_TIMEOUT			msecs_to_jiffies(100)
>>>
>>> +struct rockchip_saradc_data {
>>> +	int				num_bits;
>>> +	const struct iio_chan_spec	*channels;
>>> +	int				num_channels;
>>> +	unsigned long			clk_rate;
>>> +};
>>> +
>>>
>>>  struct rockchip_saradc {
>>> =20
>>>  	void __iomem		*regs;
>>>  	struct clk		*pclk;
>>>  	struct clk		*clk;
>>>  	struct completion	completion;
>>>  	struct regulator	*vref;
>>>
>>> +	const struct rockchip_saradc_data *data;
>>>
>>>  	u16			last_val;
>>> =20
>>>  };
>>
>> The alignment of the whole block should be adjusted to fit with the =
new
>> element.
>=20
> Hmm, I'm not sure if this should be in this patch, as changing the in=
dentation=20
> is more or less an unrelated change which makes recognizing the actua=
l change=20
> of adding the data field harder to see.=20
>=20
> It could be a second patch on top to adapt the formating, but this al=
so sounds=20
> a bit like overkill.
>=20
> In any case I guess I'll wait for Jonathan to decide how he likes thi=
s to be=20
> approached.
>=20
Personally I hate this sort of careful block alignment for structures p=
recisely because
it generates churn.  I just don't hate it enough to moan about it in re=
views :)

Definitely doesn't want to be in this patch, but feel free to submit an=
other
either tidying up or dropping it in favour of not bothering to align it=
=2E


>=20
>>> @@ -90,7 +97,7 @@ static int rockchip_saradc_read_raw(struct iio_de=
v
>>> *indio_dev,>=20
>>>  		}
>>>  	=09
>>>  		*val =3D ret / 1000;
>>>
>>> -		*val2 =3D SARADC_BITS;
>>> +		*val2 =3D info->data->num_bits;
>>>
>>>  		return IIO_VAL_FRACTIONAL_LOG2;
>>>  =09
>>>  	default:
>>>  		return -EINVAL;
>>>
>>> @@ -103,7 +110,7 @@ static irqreturn_t rockchip_saradc_isr(int irq,=
 void
>>> *dev_id)>=20
>>>  	/* Read value */
>>>  	info->last_val =3D readl_relaxed(info->regs + SARADC_DATA);
>>>
>>> -	info->last_val &=3D SARADC_DATA_MASK;
>>> +	info->last_val &=3D BIT(info->data->num_bits) - 1;
>>
>> I think using GENMASK would reflect the intention better, that you w=
ant to
>> mask out your data.
>=20
> I didn't know GENMASK before, so thanks for the pointer .. this looks=
 quite=20
> cool :-)
>=20
>=20
>>>  	/* Clear irq & power down adc */
>>>  	writel_relaxed(0, info->regs + SARADC_CTRL);
>>>
>>> @@ -133,12 +140,44 @@ static const struct iio_chan_spec
>>> rockchip_saradc_iio_channels[] =3D {>=20
>>>  	ADC_CHANNEL(2, "adc2"),
>>> =20
>>>  };
>>>
>>> +static const struct rockchip_saradc_data saradc_data =3D {
>>> +	.num_bits =3D 10,
>>> +	.channels =3D rockchip_saradc_iio_channels,
>>> +	.num_channels =3D ARRAY_SIZE(rockchip_saradc_iio_channels),
>>> +	.clk_rate =3D 1000000,
>>> +};
>>> +
>>> +static const struct iio_chan_spec rockchip_rk3066_tsadc_iio_channe=
ls[] =3D
>>> {
>>> +	ADC_CHANNEL(0, "adc0"),
>>> +	ADC_CHANNEL(1, "adc1"),
>>> +};
>>> +
>>> +static const struct rockchip_saradc_data rk3066_tsadc_data =3D {
>>> +	.num_bits =3D 12,
>>> +	.channels =3D rockchip_rk3066_tsadc_iio_channels,
>>> +	.num_channels =3D ARRAY_SIZE(rockchip_rk3066_tsadc_iio_channels),
>>> +	.clk_rate =3D 50000,
>>> +};
>>> +
>>> +static const struct of_device_id rockchip_saradc_match[] =3D {
>>> +	{
>>> +		.compatible =3D "rockchip,saradc",
>>> +		.data =3D &saradc_data,
>>> +	}, {
>>> +		.compatible =3D "rockchip,rk3066-tsadc",
>>> +		.data =3D &rk3066_tsadc_data,
>>> +	},
>>> +	{},
>>> +};
>>> +MODULE_DEVICE_TABLE(of, rockchip_saradc_match);
>>> +
>>>
>>>  static int rockchip_saradc_probe(struct platform_device *pdev)
>>>  {
>>> =20
>>>  	struct rockchip_saradc *info =3D NULL;
>>>  	struct device_node *np =3D pdev->dev.of_node;
>>>  	struct iio_dev *indio_dev =3D NULL;
>>>  	struct resource	*mem;
>>>
>>> +	const struct of_device_id *match;
>>>
>>>  	int ret;
>>>  	int irq;
>>>
>>> @@ -152,6 +191,9 @@ static int rockchip_saradc_probe(struct
>>> platform_device *pdev)>=20
>>>  	}
>>>  	info =3D iio_priv(indio_dev);
>>>
>>> +	match =3D of_match_device(rockchip_saradc_match, &pdev->dev);
>>> +	info->data =3D match->data;
>>> +
>>>
>>>  	mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>  	info->regs =3D devm_ioremap_resource(&pdev->dev, mem);
>>>  	if (IS_ERR(info->regs))
>>>
>>> @@ -195,7 +237,7 @@ static int rockchip_saradc_probe(struct
>>> platform_device *pdev)>=20
>>>  	 * Use a default of 1MHz for the converter clock.
>>>  	 * This may become user-configurable in the future.
>>>  	 */
>>>
>>> -	ret =3D clk_set_rate(info->clk, 1000000);
>>> +	ret =3D clk_set_rate(info->clk, info->data->clk_rate);
>>>
>>>  	if (ret < 0) {
>>>  =09
>>>  		dev_err(&pdev->dev, "failed to set adc clk rate, %d\n", ret);
>>>  		return ret;
>>>
>>> @@ -227,8 +269,8 @@ static int rockchip_saradc_probe(struct
>>> platform_device *pdev)>=20
>>>  	indio_dev->info =3D &rockchip_saradc_iio_info;
>>>  	indio_dev->modes =3D INDIO_DIRECT_MODE;
>>>
>>> -	indio_dev->channels =3D rockchip_saradc_iio_channels;
>>> -	indio_dev->num_channels =3D ARRAY_SIZE(rockchip_saradc_iio_channe=
ls);
>>> +	indio_dev->channels =3D info->data->channels;
>>> +	indio_dev->num_channels =3D info->data->num_channels;
>>>
>>>  	ret =3D iio_device_register(indio_dev);
>>>  	if (ret)
>>>
>>> @@ -296,12 +338,6 @@ static int rockchip_saradc_resume(struct devic=
e *dev)
>>>
>>>  static SIMPLE_DEV_PM_OPS(rockchip_saradc_pm_ops,
>>> =20
>>>  			 rockchip_saradc_suspend, rockchip_saradc_resume);
>>>
>>> -static const struct of_device_id rockchip_saradc_match[] =3D {
>>> -	{ .compatible =3D "rockchip,saradc" },
>>> -	{},
>>> -};
>>> -MODULE_DEVICE_TABLE(of, rockchip_saradc_match);
>>> -
>>>
>>>  static struct platform_driver rockchip_saradc_driver =3D {
>>> =20
>>>  	.probe		=3D rockchip_saradc_probe,
>>>  	.remove		=3D rockchip_saradc_remove,
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
