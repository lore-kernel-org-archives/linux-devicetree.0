From: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH 1/3] iio: mxs-lradc: Add regulators for current sources
Date: Fri, 22 Apr 2016 21:23:11 +0200
Message-ID: <f4c00c5c2242f6a951f1f8d8eca56357@ccbib.org>
References: <1461333147-11873-1-git-send-email-harald@ccbib.org>
 <1461333147-11873-2-git-send-email-harald@ccbib.org>
 <571A4831.2020604@denx.de>
 <CAL7P5jKYp0JrF2MHdLkLTBvgYb0KSDwPEMuNPGxcctcxCRnazg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL7P5jKYp0JrF2MHdLkLTBvgYb0KSDwPEMuNPGxcctcxCRnazg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Ksenija_Stanojevi=C4=87?= <ksenija.stanojevic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

[CCing Mark and Liam again]

On 22.04.2016 19:00, Ksenija Stanojevi=C4=87 wrote:
> On Fri, Apr 22, 2016 at 5:50 PM, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org> wrote:
>> On 04/22/2016 03:52 PM, Harald Geyer wrote:
>>> The hardware has two current sources ISRC0 and ISRC1 to allow=20
>>> measuring
>>> resistors without additional circuitry. This commit makes them=20
>>> available
>>> as regulators.
>>>
>>> Tested on an imx233-olinuxino board.
>>>
>>> Signed-off-by: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>
>>> ---
>>> The current regulator API doesn't fit this type of device very=20
>>> well: Typically
>>> consumers will want to set a defined current, ie. min_uA =3D=3D max=
_uA,=20
>>> but they
>>> can't without help from configuration data, because the valid=20
>>> values aren't
>>> reported by the API for current regulators. I have been thinking=20
>>> about
>>> extending the API, but currently AFAIK no such consumers exist and=20
>>> most
>>> users, like myself, will force the regulator to a defined value in
>>> devicetree anyway.
>>
>> I am tempted to block this patch and ask you to properly split the
>> mxs-lradc driver into MFD with touchscreen and IIO part and only=20
>> then
>> add the regulator bits. The lradc is becoming a katamari of ad-hoc
>> misplaced functionality.

I know. However I'm afraid working this into a proper MFD is above my=20
skills
and I don't feel responsible for the status quo either.

> I almost finished, I already split the driver into MFD, sorry for the=
=20
> delay.

Wow, looks like I have a lot of luck today.

> Can this wait a little bit?

Sure. I now have a working kernel for my purposes, so no hurry on my=20
part.
CC my when you submit your code or maybe even pick my patch into your=20
series,
if you feel like it.

Thanks,
Harald

> Thanks,
> Ksenija
>
>>>  .../bindings/staging/iio/adc/mxs-lradc.txt         |  29 ++++
>>>  drivers/iio/adc/Kconfig                            |   1 +
>>>  drivers/iio/adc/mxs-lradc.c                        | 152=20
>>> +++++++++++++++++++++
>>>  3 files changed, 182 insertions(+)
>>>
>>> diff --git=20
>>> a/Documentation/devicetree/bindings/staging/iio/adc/mxs-lradc.txt=20
>>> b/Documentation/devicetree/bindings/staging/iio/adc/mxs-lradc.txt
>>> index 555fb11..983952c 100644
>>> ---=20
>>> a/Documentation/devicetree/bindings/staging/iio/adc/mxs-lradc.txt
>>> +++=20
>>> b/Documentation/devicetree/bindings/staging/iio/adc/mxs-lradc.txt
>>> @@ -19,6 +19,15 @@ Optional properties:
>>>  - fsl,settling: delay between plate switch to next sample. Allowed=
=20
>>> value is
>>>                  1 ... 2047. It counts at 2 kHz and its default is
>>>                  10 (=3D 5 ms)
>>> +- ISRC0: A node describing the regulator of internal current=20
>>> source 0
>>> +- ISRC1: A node describing the regulator of internal current=20
>>> source 1
>>> +
>>> +Required properties for the ISRCx sub-nodes:
>>> +- regulator-max-microamp: See standard regulator binding=20
>>> documentation.
>>> +                          Valid values are from 0 to 300 in steps=20
>>> of 20.
>>> +
>>> +Optional properties for the ISRCx sub-nodes:
>>> +Any standard regulator properties that apply to current=20
>>> regulators.
>>>
>>>  Example for i.MX23 SoC:
>>>
>>> @@ -31,6 +40,16 @@ Example for i.MX23 SoC:
>>>               fsl,ave-ctrl =3D <4>;
>>>               fsl,ave-delay =3D <2>;
>>>               fsl,settling =3D <10>;
>>> +
>>> +             isrc_lradc0: ISRC0 {
>>> +                     regulator-max-microamp =3D <300>;
>>> +             };
>>> +
>>> +             isrc_lradc1: ISRC1 {
>>> +                     regulator-max-microamp =3D <120>;
>>> +                     regulator-min-microamp =3D <120>;
>>> +                     regulator-always-on;
>>> +             };
>>>       };
>>>
>>>  Example for i.MX28 SoC:
>>> @@ -44,4 +63,14 @@ Example for i.MX28 SoC:
>>>               fsl,ave-ctrl =3D <4>;
>>>               fsl,ave-delay =3D <2>;
>>>               fsl,settling =3D <10>;
>>> +
>>> +             isrc_lradc0: ISRC0 {
>>> +                     regulator-max-microamp =3D <300>;
>>> +             };
>>> +
>>> +             isrc_lradc6: ISRC1 {
>>> +                     regulator-max-microamp =3D <120>;
>>> +                     regulator-min-microamp =3D <120>;
>>> +                     regulator-always-on;
>>> +             };
>>>       };
>>> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
>>> index 5937030..1968d1c 100644
>>> --- a/drivers/iio/adc/Kconfig
>>> +++ b/drivers/iio/adc/Kconfig
>>> @@ -319,6 +319,7 @@ config MXS_LRADC
>>>          tristate "Freescale i.MX23/i.MX28 LRADC"
>>>          depends on (ARCH_MXS || COMPILE_TEST) && HAS_IOMEM
>>>          depends on INPUT
>>> +        depends on REGULATOR
>>>          select STMP_DEVICE
>>>          select IIO_BUFFER
>>>          select IIO_TRIGGERED_BUFFER
>>> diff --git a/drivers/iio/adc/mxs-lradc.c=20
>>> b/drivers/iio/adc/mxs-lradc.c
>>> index 33051b8..f22f339 100644
>>> --- a/drivers/iio/adc/mxs-lradc.c
>>> +++ b/drivers/iio/adc/mxs-lradc.c
>>> @@ -40,6 +40,10 @@
>>>  #include <linux/iio/triggered_buffer.h>
>>>  #include <linux/iio/sysfs.h>
>>>
>>> +#include <linux/regulator/driver.h>
>>> +#include <linux/regulator/machine.h>
>>> +#include <linux/regulator/of_regulator.h>
>>> +
>>>  #define DRIVER_NAME          "mxs-lradc"
>>>
>>>  #define LRADC_MAX_DELAY_CHANS        4
>>> @@ -261,6 +265,9 @@ struct mxs_lradc {
>>>       unsigned                over_sample_delay;
>>>       /* time in clocks to wait after the plates where switched */
>>>       unsigned                settling_delay;
>>> +
>>> +     struct regulator_desc isrc0;
>>> +     struct regulator_desc isrc1;
>>>  };
>>>
>>>  #define      LRADC_CTRL0                             0x00
>>> @@ -305,6 +312,11 @@ struct mxs_lradc {
>>>  #define      LRADC_CTRL2                             0x20
>>>  #define      LRADC_CTRL2_DIVIDE_BY_TWO_OFFSET        24
>>>  #define      LRADC_CTRL2_TEMPSENSE_PWD               BIT(15)
>>> +#define      LRADC_CTRL2_TEMP_SENSOR_IENABLE1        BIT(9)
>>> +#define      LRADC_CTRL2_TEMP_SENSOR_IENABLE0        BIT(8)
>>> +#define      LRADC_CTRL2_TEMP_ISRC1_OFFSET           4
>>> +#define      LRADC_CTRL2_TEMP_ISRC0_OFFSET           0
>>> +#define      LRADC_CTRL2_TEMP_ISRC_MASK              0x0f
>>>
>>>  #define      LRADC_STATUS                            0x40
>>>  #define      LRADC_STATUS_TOUCH_DETECT_RAW           BIT(0)
>>> @@ -1383,6 +1395,109 @@ static const struct iio_buffer_setup_ops=20
>>> mxs_lradc_buffer_ops =3D {
>>>       .validate_scan_mask =3D &mxs_lradc_validate_scan_mask,
>>>  };
>>>
>>> +static int mxs_lradc_regulator_is_enabled(struct regulator_dev=20
>>> *dev)
>>> +{
>>> +     struct mxs_lradc *lradc =3D rdev_get_drvdata(dev);
>>> +     int reg =3D readl(lradc->base + LRADC_CTRL2);
>>> +
>>> +     if (dev->desc =3D=3D &lradc->isrc0)
>>> +             return reg & LRADC_CTRL2_TEMP_SENSOR_IENABLE0;
>>> +     else if (dev->desc =3D=3D &lradc->isrc1)
>>> +             return reg & LRADC_CTRL2_TEMP_SENSOR_IENABLE1;
>>> +
>>> +     /* This should never happen */
>>> +     return -ENODEV;
>>> +}
>>> +
>>> +#define LRADC_REGVALUE2uA(regval, offset) \
>>> +     (20 * ((regval >> offset) & LRADC_CTRL2_TEMP_ISRC_MASK))
>>> +
>>> +static int mxs_lradc_regulator_get_current_limit(struct=20
>>> regulator_dev *dev)
>>> +{
>>> +     struct mxs_lradc *lradc =3D rdev_get_drvdata(dev);
>>> +     int reg =3D readl(lradc->base + LRADC_CTRL2);
>>> +
>>> +     if (dev->desc =3D=3D &lradc->isrc0)
>>> +             return LRADC_REGVALUE2uA(reg,=20
>>> LRADC_CTRL2_TEMP_ISRC0_OFFSET);
>>> +     else if (dev->desc =3D=3D &lradc->isrc1)
>>> +             return LRADC_REGVALUE2uA(reg,=20
>>> LRADC_CTRL2_TEMP_ISRC1_OFFSET);
>>> +
>>> +     /* This should never happen */
>>> +     return -ENODEV;
>>> +}
>>> +
>>> +static int mxs_lradc_regulator_enable(struct regulator_dev *dev)
>>> +{
>>> +     struct mxs_lradc *lradc =3D rdev_get_drvdata(dev);
>>> +
>>> +     if (dev->desc =3D=3D &lradc->isrc0)
>>> +             mxs_lradc_reg_set(lradc,=20
>>> LRADC_CTRL2_TEMP_SENSOR_IENABLE0,
>>> +                               LRADC_CTRL2);
>>> +     else if (dev->desc =3D=3D &lradc->isrc1)
>>> +             mxs_lradc_reg_set(lradc,=20
>>> LRADC_CTRL2_TEMP_SENSOR_IENABLE1,
>>> +                               LRADC_CTRL2);
>>> +     else
>>> +             /* This should never happen */
>>> +             return -ENODEV;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int mxs_lradc_regulator_disable(struct regulator_dev *dev)
>>> +{
>>> +     struct mxs_lradc *lradc =3D rdev_get_drvdata(dev);
>>> +
>>> +     if (dev->desc =3D=3D &lradc->isrc0)
>>> +             mxs_lradc_reg_clear(lradc,=20
>>> LRADC_CTRL2_TEMP_SENSOR_IENABLE0,
>>> +                                 LRADC_CTRL2);
>>> +     else if (dev->desc =3D=3D &lradc->isrc1)
>>> +             mxs_lradc_reg_clear(lradc,=20
>>> LRADC_CTRL2_TEMP_SENSOR_IENABLE1,
>>> +                                 LRADC_CTRL2);
>>> +     else
>>> +             /* This should never happen */
>>> +             return -ENODEV;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int mxs_lradc_regulator_set_current_limit(struct=20
>>> regulator_dev *dev,
>>> +                                              int min_uA, int=20
>>> max_uA)
>>> +{
>>> +     struct mxs_lradc *lradc =3D rdev_get_drvdata(dev);
>>> +     int offset, value;
>>> +
>>> +     if (dev->desc =3D=3D &lradc->isrc0)
>>> +             offset =3D LRADC_CTRL2_TEMP_ISRC0_OFFSET;
>>> +     else if (dev->desc =3D=3D &lradc->isrc1)
>>> +             offset =3D LRADC_CTRL2_TEMP_ISRC1_OFFSET;
>>> +     else
>>> +             /* This should never happen */
>>> +             return -ENODEV;
>>> +
>>> +     value =3D min_uA / 20;
>>> +     if (min_uA % 20)
>>> +             value++;
>>> +     if (value * 20 > max_uA)
>>> +             return -EINVAL;
>>> +     if (value & ~LRADC_CTRL2_TEMP_ISRC_MASK)
>>> +             /* This should never happen */
>>> +             return -EPERM;
>>> +
>>> +     mxs_lradc_reg_clear(lradc, LRADC_CTRL2_TEMP_ISRC_MASK <<=20
>>> offset,
>>> +                         LRADC_CTRL2);
>>> +     mxs_lradc_reg_set(lradc, value << offset, LRADC_CTRL2);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static struct regulator_ops mxs_lradc_regulator_current_ops =3D {
>>> +     .enable =3D mxs_lradc_regulator_enable,
>>> +     .is_enabled =3D mxs_lradc_regulator_is_enabled,
>>> +     .disable =3D mxs_lradc_regulator_disable,
>>> +     .get_current_limit =3D mxs_lradc_regulator_get_current_limit,
>>> +     .set_current_limit =3D mxs_lradc_regulator_set_current_limit,
>>> +};
>>> +
>>>  /*
>>>   * Driver initialization
>>>   */
>>> @@ -1519,6 +1634,10 @@ static void mxs_lradc_hw_stop(struct=20
>>> mxs_lradc *lradc)
>>>
>>>       for (i =3D 0; i < LRADC_MAX_DELAY_CHANS; i++)
>>>               mxs_lradc_reg_wrt(lradc, 0, LRADC_DELAY(i));
>>> +
>>> +     mxs_lradc_reg_clear(lradc, LRADC_CTRL2_TEMP_SENSOR_IENABLE0 |
>>> +                                    =20
>>> LRADC_CTRL2_TEMP_SENSOR_IENABLE1,
>>> +                         LRADC_CTRL2);
>>>  }
>>>
>>>  static const struct of_device_id mxs_lradc_dt_ids[] =3D {
>>> @@ -1592,6 +1711,32 @@ static int=20
>>> mxs_lradc_probe_touchscreen(struct mxs_lradc *lradc,
>>>       return 0;
>>>  }
>>>
>>> +static void mxs_lradc_reg_helper(struct device_node *np, const=20
>>> char *name,
>>> +                              struct regulator_config *conf,
>>> +                              struct regulator_desc *desc)
>>> +{
>>> +     struct regulator_dev *ret;
>>> +
>>> +     conf->of_node =3D of_get_child_by_name(np, name);
>>> +     if (!conf->of_node)
>>> +             return;
>>> +
>>> +     desc->name =3D name;
>>> +     desc->owner =3D THIS_MODULE;
>>> +     desc->type =3D REGULATOR_CURRENT;
>>> +     desc->ops =3D &mxs_lradc_regulator_current_ops;
>>> +
>>> +     conf->init_data =3D of_get_regulator_init_data(conf->dev,=20
>>> conf->of_node,
>>> +                                                  desc);
>>> +     ret =3D devm_regulator_register(conf->dev, desc, conf);
>>> +     if (IS_ERR(ret))
>>> +             /* Just pretend the regulator isn't there */
>>> +             dev_err(conf->dev, "Failed to register regulator %s:=20
>>> %ld\n",
>>> +                     desc->name, PTR_ERR(ret));
>>> +
>>> +     of_node_put(conf->of_node);
>>> +}
>>> +
>>>  static int mxs_lradc_probe(struct platform_device *pdev)
>>>  {
>>>       const struct of_device_id *of_id =3D
>>> @@ -1603,6 +1748,7 @@ static int mxs_lradc_probe(struct=20
>>> platform_device *pdev)
>>>       struct mxs_lradc *lradc;
>>>       struct iio_dev *iio;
>>>       struct resource *iores;
>>> +     struct regulator_config regconf;
>>>       int ret =3D 0, touch_ret;
>>>       int i, s;
>>>       u64 scale_uv;
>>> @@ -1727,6 +1873,12 @@ static int mxs_lradc_probe(struct=20
>>> platform_device *pdev)
>>>               goto err_ts;
>>>       }
>>>
>>> +     /* Setup regulator devices for current source. */
>>> +     regconf.dev =3D dev;
>>> +     regconf.driver_data =3D lradc;
>>> +     mxs_lradc_reg_helper(node, "ISRC0", &regconf, &lradc->isrc0);
>>> +     mxs_lradc_reg_helper(node, "ISRC1", &regconf, &lradc->isrc1);
>>> +
>>>       return 0;
>>>
>>>  err_ts:
>>>
>>
>>
>> --
>> Best regards,
>> Marek Vasut
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-iio"=
=20
>> in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
If you want to support my work:
see http://friends.ccbib.org/harald/supporting/
or donate via peercoin to P98LRdhit3gZbHDBe7ta5jtXrMJUms4p7w
or bitcoin 1FUtd8T9jRN1rFz63vZz7s2fDtB6d6A7aS
