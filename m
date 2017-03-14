From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v2 08/11] iio: adc: sun4i-gpadc-iio: add
 support for A33 thermal sensor
Date: Tue, 14 Mar 2017 13:18:37 +0800
Message-ID: <1061031489468717@web20o.yandex.ru>
References: <20170310103921.19469-1-quentin.schulz@free-electrons.com>
	 <20170310103921.19469-9-quentin.schulz@free-electrons.com> <c70640c7-7dd9-dc7c-b751-430b2ad59245@kernel.org>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBMP2TXDAKGQEYKCO4LQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <c70640c7-7dd9-dc7c-b751-430b2ad59245-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "wens-jdAy2FN1RRM@public.gmane.org" <wens-jdAy2FN1RRM@public.gmane.org>, "lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org" <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "knaack.h-Mmb7MZpHnFY@public.gmane.org" <knaack.h-Mmb7MZpHnFY@public.gmane.org>, "lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org" <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org" <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, "stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



14.03.2017, 05:08, "Jonathan Cameron" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> On 10/03/17 10:39, Quentin Schulz wrote:
>> =C2=A0This adds support for the Allwinner A33 thermal sensor.
>>
>> =C2=A0Unlike the A10, A13 and A31, the Allwinner A33 only has one channe=
l
>> =C2=A0which is dedicated to the thermal sensor. Moreover, its thermal se=
nsor
>> =C2=A0does not generate interruptions, thus we only need to directly rea=
d the
>> =C2=A0register storing the temperature value.
>>
>> =C2=A0The MFD used by the A10, A13 and A31, was created to avoid breakin=
g the
>> =C2=A0DT binding, but since the nodes for the ADC weren't there for the =
A33,
>> =C2=A0it is not needed.
>>
>> =C2=A0Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>
> Talk me through why it makes sense to do this rather than simply spin out
> a really simple thermal driver for the A33?

According to him the A33 thermal sensor is a simplified version of the GPAD=
C.

I have already did a simple thermal driver ~8 months ago, but is rejected f=
or
this reason.

>
> I'm not against what you have here, but don't feel it has been fully argu=
ed.
>
> Jonathan
>> =C2=A0---
>>
>> =C2=A0v2:
>> =C2=A0=C2=A0=C2=A0- removed added comments in Kconfig,
>> =C2=A0=C2=A0=C2=A0- simplified Kconfig depends on condition,
>> =C2=A0=C2=A0=C2=A0- removed THERMAL_OF requirement for sun8i,
>> =C2=A0=C2=A0=C2=A0- renamed sun8i_gpadc_channels to sun8i_a33_gpadc_chan=
nels,
>> =C2=A0=C2=A0=C2=A0- renamed use_dt boolean in no_irq as it reflects bett=
er why we need it,
>> =C2=A0=C2=A0=C2=A0- removed spurious/unneeded modifications done in v1,
>>
>> =C2=A0=C2=A0drivers/iio/adc/Kconfig | 2 +-
>> =C2=A0=C2=A0drivers/iio/adc/sun4i-gpadc-iio.c | 100 ++++++++++++++++++++=
++++++++++++++++--
>> =C2=A0=C2=A0include/linux/mfd/sun4i-gpadc.h | 4 ++
>> =C2=A0=C2=A03 files changed, 102 insertions(+), 4 deletions(-)
>>
>> =C2=A0diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
>> =C2=A0index 9f8b4b1..8c8ead6 100644
>> =C2=A0--- a/drivers/iio/adc/Kconfig
>> =C2=A0+++ b/drivers/iio/adc/Kconfig
>> =C2=A0@@ -562,7 +562,7 @@ config STX104
>> =C2=A0=C2=A0config SUN4I_GPADC
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tristate "Su=
pport for the Allwinner SoCs GPADC"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on I=
IO
>> =C2=A0- depends on MFD_SUN4I_GPADC
>> =C2=A0+ depends on MFD_SUN4I_GPADC || MACH_SUN8I
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
Say yes here to build support for Allwinner (A10, A13 and A31) SoCs
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
GPADC. This ADC provides 4 channels which can be used as an ADC or as
>> =C2=A0diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/s=
un4i-gpadc-iio.c
>> =C2=A0index 7cb997a..70684cd 100644
>> =C2=A0--- a/drivers/iio/adc/sun4i-gpadc-iio.c
>> =C2=A0+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
>> =C2=A0@@ -85,6 +85,12 @@ static const struct gpadc_data sun6i_gpadc_data=
 =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.adc_chan_ma=
sk =3D SUN6I_GPADC_CTRL1_ADC_CHAN_MASK,
>> =C2=A0=C2=A0};
>>
>> =C2=A0+static const struct gpadc_data sun8i_a33_gpadc_data =3D {
>> =C2=A0+ .temp_offset =3D -1662,
>> =C2=A0+ .temp_scale =3D 162,
>> =C2=A0+ .tp_mode_en =3D SUN8I_GPADC_CTRL1_CHOP_TEMP_EN,
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0=C2=A0struct sun4i_gpadc_iio {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_d=
ev *indio_dev;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct compl=
etion completion;
>> =C2=A0@@ -96,6 +102,7 @@ struct sun4i_gpadc_iio {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int=
 temp_data_irq;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0atomic_t ign=
ore_temp_data_irq;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct=
 gpadc_data *data;
>> =C2=A0+ bool no_irq;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* prevents =
concurrent reads of temperature and ADC */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct mutex=
 mutex;
>> =C2=A0=C2=A0};
>> =C2=A0@@ -138,6 +145,23 @@ static const struct iio_chan_spec sun4i_gpadc=
_channels_no_temp[] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SUN4I_GPADC_=
ADC_CHANNEL(3, "adc_chan3"),
>> =C2=A0=C2=A0};
>>
>> =C2=A0+static const struct iio_chan_spec sun8i_a33_gpadc_channels[] =3D =
{
>> =C2=A0+ {
>> =C2=A0+ .type =3D IIO_TEMP,
>> =C2=A0+ .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
>> =C2=A0+ BIT(IIO_CHAN_INFO_SCALE) |
>> =C2=A0+ BIT(IIO_CHAN_INFO_OFFSET),
>> =C2=A0+ .datasheet_name =3D "temp_adc",
>> =C2=A0+ },
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+static const struct regmap_config sun4i_gpadc_regmap_config =3D {
>> =C2=A0+ .reg_bits =3D 32,
>> =C2=A0+ .val_bits =3D 32,
>> =C2=A0+ .reg_stride =3D 4,
>> =C2=A0+ .fast_io =3D true,
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0=C2=A0static int sun4i_prepare_for_irq(struct iio_dev *indio_dev, =
int channel,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int=
 irq)
>> =C2=A0=C2=A0{
>> =C2=A0@@ -247,6 +271,17 @@ static int sun4i_gpadc_temp_read(struct iio_d=
ev *indio_dev, int *val)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sun4i=
_gpadc_iio *info =3D iio_priv(indio_dev);
>>
>> =C2=A0+ if (info->no_irq) {
>> =C2=A0+ pm_runtime_get_sync(indio_dev->dev.parent);
>> =C2=A0+
>> =C2=A0+ regmap_read(info->regmap, SUN4I_GPADC_TEMP_DATA, val);
>> =C2=A0+
>> =C2=A0+ pm_runtime_mark_last_busy(indio_dev->dev.parent);
>> =C2=A0+ pm_runtime_put_autosuspend(indio_dev->dev.parent);
>> =C2=A0+
>> =C2=A0+ return 0;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return sun4i=
_gpadc_read(indio_dev, 0, val, info->temp_data_irq);
>> =C2=A0=C2=A0}
>>
>> =C2=A0@@ -454,6 +489,58 @@ static int sun4i_irq_init(struct platform_dev=
ice *pdev, const char *name,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
>> =C2=A0=C2=A0}
>>
>> =C2=A0+static const struct of_device_id sun4i_gpadc_of_id[] =3D {
>> =C2=A0+ {
>> =C2=A0+ .compatible =3D "allwinner,sun8i-a33-gpadc-iio",
>> =C2=A0+ .data =3D &sun8i_a33_gpadc_data,
>> =C2=A0+ },
>> =C2=A0+ { /* sentinel */ }
>> =C2=A0+};
>> =C2=A0+
>> =C2=A0+static int sun4i_gpadc_probe_dt(struct platform_device *pdev,
>> =C2=A0+ struct iio_dev *indio_dev)
>> =C2=A0+{
>> =C2=A0+ struct sun4i_gpadc_iio *info =3D iio_priv(indio_dev);
>> =C2=A0+ const struct of_device_id *of_dev;
>> =C2=A0+ struct thermal_zone_device *tzd;
>> =C2=A0+ struct resource *mem;
>> =C2=A0+ void __iomem *base;
>> =C2=A0+ int ret;
>> =C2=A0+
>> =C2=A0+ of_dev =3D of_match_device(sun4i_gpadc_of_id, &pdev->dev);
>> =C2=A0+ if (!of_dev)
>> =C2=A0+ return -ENODEV;
>> =C2=A0+
>> =C2=A0+ info->no_irq =3D true;
>> =C2=A0+ info->data =3D (struct gpadc_data *)of_dev->data;
>> =C2=A0+ indio_dev->num_channels =3D ARRAY_SIZE(sun8i_a33_gpadc_channels)=
;
>> =C2=A0+ indio_dev->channels =3D sun8i_a33_gpadc_channels;
>> =C2=A0+
>> =C2=A0+ mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> =C2=A0+ base =3D devm_ioremap_resource(&pdev->dev, mem);
>> =C2=A0+ if (IS_ERR(base))
>> =C2=A0+ return PTR_ERR(base);
>> =C2=A0+
>> =C2=A0+ info->regmap =3D devm_regmap_init_mmio(&pdev->dev, base,
>> =C2=A0+ &sun4i_gpadc_regmap_config);
>> =C2=A0+ if (IS_ERR(info->regmap)) {
>> =C2=A0+ ret =3D PTR_ERR(info->regmap);
>> =C2=A0+ dev_err(&pdev->dev, "failed to init regmap: %d\n", ret);
>> =C2=A0+ return ret;
>> =C2=A0+ }
>> =C2=A0+
>> =C2=A0+ if (!IS_ENABLED(THERMAL_OF))
>> =C2=A0+ return 0;
>> =C2=A0+
>> =C2=A0+ tzd =3D devm_thermal_zone_of_sensor_register(&pdev->dev, 0, info=
,
>> =C2=A0+ &sun4i_ts_tz_ops);
>> =C2=A0+ if (IS_ERR(tzd))
>> =C2=A0+ dev_err(&pdev->dev, "could not register thermal sensor: %ld\n",
>> =C2=A0+ PTR_ERR(tzd));
>> =C2=A0+
>> =C2=A0+ return PTR_ERR_OR_ZERO(tzd);
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0=C2=A0static int sun4i_gpadc_probe_mfd(struct platform_device *pde=
v,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_d=
ev *indio_dev)
>> =C2=A0=C2=A0{
>> =C2=A0@@ -462,6 +549,7 @@ static int sun4i_gpadc_probe_mfd(struct platfo=
rm_device *pdev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_get_drvdata(pdev->dev.parent);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
>>
>> =C2=A0+ info->no_irq =3D false;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0info->regmap=
 =3D sun4i_gpadc_dev->regmap;
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0indio_dev->n=
um_channels =3D ARRAY_SIZE(sun4i_gpadc_channels);
>> =C2=A0@@ -561,7 +649,11 @@ static int sun4i_gpadc_probe(struct platform_=
device *pdev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0indio_dev->i=
nfo =3D &sun4i_gpadc_iio_info;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0indio_dev->m=
odes =3D INDIO_DIRECT_MODE;
>>
>> =C2=A0- ret =3D sun4i_gpadc_probe_mfd(pdev, indio_dev);
>> =C2=A0+ if (pdev->dev.of_node)
>> =C2=A0+ ret =3D sun4i_gpadc_probe_dt(pdev, indio_dev);
>> =C2=A0+ else
>> =C2=A0+ ret =3D sun4i_gpadc_probe_mfd(pdev, indio_dev);
>> =C2=A0+
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
>>
>> =C2=A0@@ -580,7 +672,7 @@ static int sun4i_gpadc_probe(struct platform_d=
evice *pdev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
>>
>> =C2=A0=C2=A0err_map:
>> =C2=A0- if (IS_ENABLED(CONFIG_THERMAL_OF))
>> =C2=A0+ if (!info->no_irq && IS_ENABLED(CONFIG_THERMAL_OF))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0iio_map_array_unregister(indio_dev);
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pm_runtime_p=
ut(&pdev->dev);
>> =C2=A0@@ -592,10 +684,11 @@ static int sun4i_gpadc_probe(struct platform=
_device *pdev)
>> =C2=A0=C2=A0static int sun4i_gpadc_remove(struct platform_device *pdev)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_d=
ev *indio_dev =3D platform_get_drvdata(pdev);
>> =C2=A0+ struct sun4i_gpadc_iio *info =3D iio_priv(indio_dev);
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pm_runtime_p=
ut(&pdev->dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pm_runtime_d=
isable(&pdev->dev);
>> =C2=A0- if (IS_ENABLED(CONFIG_THERMAL_OF))
>> =C2=A0+ if (!info->no_irq && IS_ENABLED(CONFIG_THERMAL_OF))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0iio_map_array_unregister(indio_dev);
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
>> =C2=A0@@ -611,6 +704,7 @@ static const struct platform_device_id sun4i_g=
padc_id[] =3D {
>> =C2=A0=C2=A0static struct platform_driver sun4i_gpadc_driver =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.driver =3D =
{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.name =3D "sun4i-gpadc-iio",
>> =C2=A0+ .of_match_table =3D sun4i_gpadc_of_id,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.pm =3D &sun4i_gpadc_pm_ops,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.id_table =
=3D sun4i_gpadc_id,
>> =C2=A0diff --git a/include/linux/mfd/sun4i-gpadc.h b/include/linux/mfd/s=
un4i-gpadc.h
>> =C2=A0index 509e736..139872c 100644
>> =C2=A0--- a/include/linux/mfd/sun4i-gpadc.h
>> =C2=A0+++ b/include/linux/mfd/sun4i-gpadc.h
>> =C2=A0@@ -38,6 +38,10 @@
>> =C2=A0=C2=A0#define SUN6I_GPADC_CTRL1_ADC_CHAN_SELECT(x) (GENMASK(3, 0) =
& BIT(x))
>> =C2=A0=C2=A0#define SUN6I_GPADC_CTRL1_ADC_CHAN_MASK GENMASK(3, 0)
>>
>> =C2=A0+/* TP_CTRL1 bits for sun8i SoCs */
>> =C2=A0+#define SUN8I_GPADC_CTRL1_CHOP_TEMP_EN BIT(8)
>> =C2=A0+#define SUN8I_GPADC_CTRL1_GPADC_CALI_EN BIT(7)
>> =C2=A0+
>> =C2=A0=C2=A0#define SUN4I_GPADC_CTRL2 0x08
>>
>> =C2=A0=C2=A0#define SUN4I_GPADC_CTRL2_TP_SENSITIVE_ADJUST(x) ((GENMASK(3=
, 0) & (x)) << 28)
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
