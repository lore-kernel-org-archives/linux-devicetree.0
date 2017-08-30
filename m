Return-Path: <SRS0=Af7A=AA=gmail.com=s.abhisit@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170822150330.00007eeb@huawei.com>
References: <1503383171-15515-1-git-send-email-s.abhisit@gmail.com> <20170822150330.00007eeb@huawei.com>
From: Abhisit Sangjan <s.abhisit@gmail.com>
Date: Wed, 30 Aug 2017 14:23:08 +0700
Message-ID: <CAMV_pUaJaYBdFXxffO-B+D0RXTg+wXebHPrzW46hMBJgz9=SDA@mail.gmail.com>
Subject: Re: [PATCH] mfd: Add support for TI LMP92001
Content-Type: multipart/alternative; boundary="94eb2c1a1a425139640557f3668d"
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Lee Jones <lee.jones@linaro.org>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, jmondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, knaack.h@gmx.de, lars@metafoo.de, fabrice.gasnier@st.com, robh@kernel.org, Akinobu Mita <akinobu.mita@gmail.com>, marek.vasut+renesas@gmail.com, jacopo+renesas@jmondi.org, mike.looijmans@topic.nl, peda@axentia.se, =?UTF-8?Q?Jean=2DFran=C3=A7ois_Dagenais?= <jeff.dagenais@gmail.com>, linux-iio@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--94eb2c1a1a425139640557f3668d
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 22, 2017 at 9:03 PM, Jonathan Cameron <
Jonathan.Cameron@huawei.com> wrote:

> On Tue, 22 Aug 2017 13:26:11 +0700
> <s.abhisit@gmail.com> wrote:
>
> > From: Abhisit Sangjan <s.abhisit@gmail.com>
> >
> > TI LMP92001 Analog System Monitor and Controller
> ...
> > +
> > +What:           /sys/bus/iio/devices/iio:deviceX/outx
> > +Date:                August 2016
> > +KernelVersion:  4.1.15
> > +Contact:        Abhisit Sangjan <s.abhisit@gmail.com>
> > +Description:
> > +             The pin output mode for DAC.
> > +                Can be either:
> > +                - "hiz" = High impedance state.
> > +                - "dac" = DAC output.
> > +             - "0" = Drive it to low.
> > +             - "1" = Drive it to high.
> Look at the existing ABI for powerdown modes.  Covers this.
>

Could you point to where is powerdown modes?


>
> > +
> > +What:           /sys/bus/iio/devices/iio:deviceX/vref
> > +Date:                August 2016
> > +KernelVersion:  4.1.15
> > +Contact:        Abhisit Sangjan <s.abhisit@gmail.com>
> > +Description:
> > +             This is voltage referance source for DACs.
> > +                Can be either:
> > +                - "external"
> > +                - "internal"
>
> Normal assumption is that if an external reference is provided by
> the hardware (specified in DT of similar) then we want to use it,
> if not fall back to internal.
>
> i.e. I don't think we have ever exposed this to userspace.
>

The real purpose is for debug on run-time, such as cat to know what is
running mode now.


>
> > +
> > +What:           /sys/devices/socX/soc/XXXXXXX
> .aips-bus/XXXXXXX.i2c/i2c-X/X-00XX/lmp92001-adc.X.auto/iio:deviceX/en
>
> Why the insanely long path rather than
> /sys/bus/iio/device/iio:deviceX/en ?
>
> > +Date:                August 2016
> > +KernelVersion:  4.1.15
> > +Contact:        Abhisit Sangjan <s.abhisit@gmail.com>
> > +Description:
> > +             This is ADC Conversion Enable for each channel.
> > +                Can be either:
> > +                - "enable"
> > +                - "disable"
>
> Current form isn't per channel. Should be covered by buffered mode
> scan_elements or the driver should be able to figure it out based
> on what channel is being read.  Would not expect to see individual
> channel enables for an ADC.
>

I am agree with you and I have read buffered mode and do not understand. I
thinks, I should omit first.


>
>
> > +
> > +What:           /sys/devices/socX/soc/XXXXXXX
> .aips-bus/XXXXXXX.i2c/i2c-X/X-00XX/lmp92001-adc.X.auto/iio:deviceX/mode
>
> Again, short path please.
>
> > +Date:                August 2016
> > +KernelVersion:  4.1.15
> > +Contact:        Abhisit Sangjan <s.abhisit@gmail.com>
> > +Description:
> > +             This is conversion mode for all of ADCs.
> > +                Can be either:
> > +                - "continuous" = Continuously conversion all the time.
> > +                - "single-shot" = Once time conversion and stop.
>
> Which of these makes sense is usually possible to figure out from the way
> the
> driver is being used.  This isn't something we want userspace to have to
> specify.
>

I am agree with you. Choose from device tree and giving to userspace for
debug purpose (On time changing is optional), like cat to see what is
running mode now.


> > +
> > +What:           /sys/devices/socX/soc/XXXXXXX
> .aips-bus/XXXXXXX.i2c/i2c-X/X-00XX/lmp92001-adc.X.auto/iio:deviceX/vref
> > +Date:                August 2016
> > +KernelVersion:  4.1.15
> > +Contact:        Abhisit Sangjan <s.abhisit@gmail.com>
> > +Description:
> > +             This is voltage referance source for ADCs.
> > +                Can be either:
> > +                - "external"
> > +                - "internal"
>
> Again, tends to be a hardware platform defined thing rather than
> something it makes sense to expose to userspace.
>

The real purpose is for debug on run-time, such as cat to know what is
running mode now.


> > + - ti,lmp92001-dac-outx:
> > +        Cy = 0, 1 = will force associated OUTx outputs to VDD
> > +        Cy = 0, 0 = will force associated OUTx outputs to GND
> > + - ti,lmp92001-dac-gang: What group of Cy is governed to.
> > +        -----------------------------------------
> > +        |  Cy   | CDAC:GANG = 0 | CDAC:GANG = 1 |
> > +        -----------------------------------------
> > +        |  C1   |   OUT[1:4]    |    OUT[1:3]   |
> > +        -----------------------------------------
> > +        |  C2   |   OUT[5:6]    |    OUT[4:6]   |
> > +        -----------------------------------------
> > +        |  C3   |   OUT[7:8]    |    OUT[7:9]   |
> > +        -----------------------------------------
> > +        |  C4   |   OUT[9:12]   |    OUT[10:12] |
> > +        -----------------------------------------
>
> If this is here, then why are we exposing it to userspace?
> Either this is a feature of the hardware or it's not...
>

This feature is hardware related for the pin.


> > +
> > +     return 0;
> > +}
> > +
> > +static struct platform_driver lmp92001_gpio_driver = {
> > +     .driver.name    = "lmp92001-gpio",
> > +     .probe          = lmp92001_gpio_probe,
> > +     .remove         = lmp92001_gpio_remove,
> > +};
> > +
> > +static int __init lmp92001_gpio_init(void)
> > +{
> > +     return platform_driver_register(&lmp92001_gpio_driver);
> > +}
> > +subsys_initcall(lmp92001_gpio_init);
>
> Do we actually need to do this as a subsys_initcall rather than
> relying on deferred probing?
>

I am referenced to exiting mfd gpio driver. Could you help me what is the
right way.


>
> > +{
> > +     struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
> > +     unsigned int code, cgen, sgen, try;
> > +     int ret;
> > +
> > +     mutex_lock(&lmp92001->adc_lock);
> > +
> > +     ret = regmap_read(lmp92001->regmap, LMP92001_CGEN, &cgen);
> > +     if (ret < 0)
> > +             goto exit;
> > +
> > +     /*
> > +      * Is not continuous conversion?
> > +      * Lock the HW registers (if needed).
> > +      * Triggering single-short conversion.
> > +      * Waiting for conversion successfully.
> > +      */
> > +     if (!(cgen & CGEN_STRT)) {
> > +             if (!(cgen & CGEN_LCK)) {
> > +                     ret = regmap_update_bits(lmp92001->regmap,
> > +                                     LMP92001_CGEN, CGEN_LCK, CGEN_LCK);
> > +                     if (ret < 0)
> > +                             goto exit;
> > +             }
> > +
> > +             /* Writing any value to triggered Single-Shot conversion.
> */
> > +             ret = regmap_write(lmp92001->regmap, LMP92001_CTRIG, 1);
> > +             if (ret < 0)
> > +                     goto exit;
> > +
> > +             /* In case of conversion is in-progress, repeat for 10
> times. */
> > +             try = 10;
> > +             do {
> > +                     ret = regmap_read(lmp92001->regmap,
> > +                                             LMP92001_SGEN, &sgen);
> > +                     if (ret < 0)
> > +                             goto exit;
> > +             } while ((sgen & CGEN_RST) && (--try > 0));
> > +
> > +             if (!try) {
> > +                     ret = -ETIME;
> > +                     goto exit;
> > +             }
> > +     }
> Move this whole block to be single shot only.  Keep continuous for
> triggered buffer usage.
>
> Does this device have a dataready interrupt? Otherwise you'll probably
> want to
> do buffers with out the trigger and use a thread to monitor this complete
> signal at 2x the expected frequency (so we don't miss any samples).
>

I have no idea what is buffered mode. I have read and do not understand.


>
> > +static int lmp92001_adc_probe(struct platform_device *pdev)
> > +{
> > +     struct lmp92001 *lmp92001 = *dev_get_drvdata(pdev->dev.parent);*
> > +     struct iio_dev *indio_dev;
> > +     struct device_node *np = pdev->dev.of_node;
> > +     const char *conversion;
> > +     unsigned int cgen = 0, cad1, cad2, cad3;
> > +     u32 mask;
> > +     int ret;
> > +
> > +     indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*lmp92001));
> > +     if (!indio_dev)
> > +             return -ENOMEM;
> > +
> > +     mutex_init(&lmp92001->adc_lock);
> > +
> > +     iio_device_set_drvdata(indio_dev, lmp92001);
>
> Why?  You can always get the lmp92001 from iio_priv(indio_dev)
>

I would like to take it from parent driver data that has been
allocated (*highlight
in blue*). Now I am allocate the size for zero.


>
> > +
> > +     indio_dev->name = pdev->name;
> > +     indio_dev->dev.parent = &pdev->dev;
> > +     indio_dev->modes = INDIO_DIRECT_MODE;
> > +     indio_dev->info = &lmp92001_info;
> > +     indio_dev->channels = lmp92001_adc_channels;
> > +     indio_dev->num_channels = ARRAY_SIZE(lmp92001_adc_channels);
> > +
> > +     ret = regmap_update_bits(lmp92001->regmap, LMP92001_CGEN,
> > +                                     CGEN_RST, CGEN_RST);
> > +     if (ret < 0) {
> > +             dev_err(&pdev->dev, "failed to self reset all
> registers\n");
> > +             return ret;
> > +     }
> > +
> > +     /*
> > +      * Turn on all of them, if you are pretty sure they are must be
> > +      * real-time update or specify which channel is needed to be used
> to
> > +      * save conversion time for a cycle.
> > +      */
> > +     ret = of_property_read_u32(np, "ti,lmp92001-adc-mask", &mask);
> > +     if (ret < 0) {
> > +             cad1 = cad2 = cad3 = 0xFF;
> > +             dev_info(&pdev->dev, "turn on all of channels by
> default\n");
> > +     } else {
> > +             cad1 = mask & 0xFF;
> > +             cad2 = (mask >> 8) & 0xFF;
> > +             cad3 = (mask >> 16) & 0xFF;
> > +     }
>
> If you need these efficiencies, use the buffered mode interface of IIO and
> switch into continuous mode with just the right channels.  For single reads
> use oneshot.
>
> This will then all be handled in the update_scan_mask callback.
>

I do not understand buffered mode. I could not implement it, sorry.


>
> > +
> > +     return 0;
> > +}
> > +
> > +static struct platform_driver lmp92001_adc_driver = {
> > +     .driver.name    = "lmp92001-adc",
> > +     .probe          = lmp92001_adc_probe,
> > +     .remove         = lmp92001_adc_remove,
> > +};
> > +
> > +static int __init lmp92001_adc_init(void)
> > +{
> > +     return platform_driver_register(&lmp92001_adc_driver);
> > +}
> > +subsys_initcall(lmp92001_adc_init);
> Why?
>
> +
> > +static void __exit lmp92001_adc_exit(void)
> > +{
> > +     platform_driver_unregister(&lmp92001_adc_driver);
> > +}
> > +module_exit(lmp92001_adc_exit);
>
> use the magic platform macros to drop this boiler plate unless
> you have a good reason for the subsys_initcall.
>

I am follow up the exiting mfd gpio driver.


> Lots of comments would be about the ABI but we've already covered that
> above.
>

Thank you, I will do.


>
> > +
> > +#include <linux/iio/iio.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <linux/mfd/lmp92001/core.h>
> > +
> > +#define CREF_DEXT    (1 << 0) /* 1 - DAC external reference.
> > +                               * 0 - DAC internal reference.
> > +                               */
> > +#define CDAC_OFF     (1 << 0) /* 1 - Forces all outputs to high
> impedance. */
> > +#define CDAC_OLVL    (1 << 1) /* 1 - Cy=0 will force associated OUTx
> outputs
> > +                               *     to VDD.
> > +                               * 0 - Cy=0 will force associated OUTx
> outputs
> > +                               *     to GND.
> > +                               */
> > +#define CDAC_GANG    (1 << 2) /* Controls the association of analog
> output
> > +                               * channels OUTx with asynchronous control
> > +                               * inputs Cy.
> > +                               *
> > +                               *         Cy to OUTx Assignment
> > +                               * --------------------------------------
> > +                               * | Cy | CDAC:GANG = 0 | CDAC:GANG = 1 |
> > +                               * --------------------------------------
> > +                               * | C1 | OUT[1:4]      | OUT[1:3]      |
> > +                               * --------------------------------------
> > +                               * | C2 | OUT[5:6]      | OUT[4:6]      |
> > +                               * --------------------------------------
> > +                               * | C3 | OUT[7:8]      | OUT[7:9]      |
> > +                               * --------------------------------------
> > +                               * | C4 | OUT[9:12]     | OUT[10:12]    |
> > +                               * --------------------------------------
> > +                               */
>
 ...

> > +int lmp92001_write_raw(struct iio_dev *indio_dev,
> > +     struct iio_chan_spec const *channel,
> > +     int val, int val2,
> > +     long mask)
> > +{
> > +     struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
> > +     int ret;
> > +
> > +     mutex_lock(&lmp92001->dac_lock);
> > +
> > +     if (val < 0 || val > 4095) {
> > +             ret = -EINVAL;
> > +             goto exit;
> > +     }
> > +
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_RAW:
> > +             switch (channel->type) {
> > +             case IIO_VOLTAGE:
> Move lock in here... Will simplify code flow by allowing direct returns.
>

Thank you.


> > +                     ret = regmap_write(lmp92001->regmap,
> > +                                     0x7F + channel->channel, val);
> > +                     if (ret < 0)
> > +                             goto exit;
>
 ...

> > +static int lmp92001_dac_probe(struct platform_device *pdev)
> > +{
> > +     struct lmp92001 *lmp92001 = *dev_get_drvdata(pdev->dev.parent);*
> > +     struct iio_dev *indio_dev;
> > +     struct device_node *np = pdev->dev.of_node;
> > +     u8 gang = 0, outx = 0, hiz = 0;
> > +     unsigned int cdac = 0;
> > +     int ret;
> > +
> > +     indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*lmp92001));
> > +     if (!indio_dev)
> > +             return -ENOMEM;
> > +
> > +     mutex_init(&lmp92001->dac_lock);
> > +
> > +     iio_device_set_drvdata(indio_dev, lmp92001);
> again, why? Use iio_priv(indio_dev) where ever you have been using
> drvdata.
>

I would like to take it from parent driver data that has been
allocated (*highlight
in blue*).


> > +
> > +     indio_dev->name = pdev->name;
> > +     indio_dev->modes = INDIO_DIRECT_MODE;
> > +     indio_dev->info = &lmp92001_info;
> > +     indio_dev->channels = lmp92001_dac_channels;
> > +     indio_dev->num_channels = ARRAY_SIZE(lmp92001_dac_channels);
> > +
> > +     of_property_read_u8(np, "ti,lmp92001-dac-hiz", &hiz);
> > +     cdac |= hiz;
> cdac = hiz and drop the = 0 above.  Also handle errors.
>

Thank you.


> > +
> > +     of_property_read_u8(np, "ti,lmp92001-dac-outx", &outx);
> > +     cdac |= outx << 1;
> > +
> > +     of_property_read_u8(np, "ti,lmp92001-dac-gang", &gang);
> > +     cdac |= gang << 2;
> > +
> > +     ret = regmap_update_bits(lmp92001->regmap, LMP92001_CDAC,
> > +                                     CDAC_GANG | CDAC_OLVL | CDAC_OFF,
> cdac);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     platform_set_drvdata(pdev, indio_dev);
> > +
> > +     return devm_iio_device_register(&pdev->dev, indio_dev);
> > +}
> > +
> > +static int lmp92001_dac_remove(struct platform_device *pdev)
> > +{
> > +     struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> > +
> > +     devm_iio_device_unregister(&pdev->dev, indio_dev);
> Same as for the ADC.
> > +
> > +     return 0;
> > +}
> > +
> > +static struct platform_driver lmp92001_dac_driver = {
> > +     .driver.name    = "lmp92001-dac",
> > +     .probe          = lmp92001_dac_probe,
> > +     .remove         = lmp92001_dac_remove,
> > +};
> > +
> > +static int __init lmp92001_dac_init(void)
> > +{
> > +     return platform_driver_register(&lmp92001_dac_driver);
> > +}
> > +subsys_initcall(lmp92001_dac_init);
> Why subsys_initcall?


I am follow the exiting mfd dac driver. What is should be function for this?


> > +/* TODO: To read/write block access, it may need to re-ordering
> endianness! */
> > +static int lmp92001_reg_read(void *context, unsigned int reg, unsigned
> int *val)
> > +{
> > +     struct device *dev = context;
> > +     struct i2c_client *i2c = to_i2c_client(dev);
> > +     int ret;
> > +
> > +     if (reg > 0xff)
> > +             return -EINVAL;
> > +
> > +     switch (reg) {
> > +     case LMP92001_ID ... LMP92001_CTRIG:
> > +     case LMP92001_CREF:
> > +             ret = i2c_smbus_read_byte_data(i2c, reg);
> > +             break;
> > +     case LMP92001_ADC1 ... LMP92001_LIL11:
> > +     case LMP92001_DAC1 ... LMP92001_DALL:
> > +             ret = i2c_smbus_read_word_swapped(i2c, reg);
> > +             break;
> > +     case LMP92001_BLK0 ... LMP92001_BLK5:
> > +             ret = i2c_smbus_read_block_data(i2c, reg,
> > +                                             (u8 *)((uintptr_t)*val));
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (reg <= LMP92001_DALL)
> > +             *val = ret;
> Cleaner to push this up into the case statements perhaps? Or at least
> return ret for the BLK one up there.
>

Thank you.


>
> Ran out of time towards the end of this so review was rather less detailed!
>
> Will take a look at the next version after you've broken this up.
>
> Jonathan
>
>
>
Thank you so much Jonathan for your review. I will send new version by
today.

Abhisit.

--94eb2c1a1a425139640557f3668d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><fon=
t face=3D"monospace, monospace">On Tue, Aug 22, 2017 at 9:03 PM, Jonathan C=
ameron <span dir=3D"ltr">&lt;<a href=3D"mailto:Jonathan.Cameron@huawei.com"=
 target=3D"_blank">Jonathan.Cameron@huawei.com</a>&gt;</span> wrote:<br></f=
ont><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><font face=3D"monospa=
ce, monospace"><span class=3D"gmail-m_8235173971185898766m_4336325641353630=
549m_-4261309298585166157gmail-m_-3967545249650152308gmail-">On Tue, 22 Aug=
 2017 13:26:11 +0700<br>
&lt;<a href=3D"mailto:s.abhisit@gmail.com" target=3D"_blank">s.abhisit@gmai=
l.com</a>&gt; wrote:<br>
<br>
&gt; From: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.com" targe=
t=3D"_blank">s.abhisit@gmail.com</a>&gt;<br>
&gt;<br>
&gt; TI LMP92001 Analog System Monitor and Controller<br></span></font><div=
><div class=3D"gmail-m_8235173971185898766m_4336325641353630549m_-426130929=
8585166157gmail-m_-3967545249650152308gmail-h5"><font face=3D"monospace, mo=
nospace">...<br></font><span style=3D"font-family:monospace,monospace">&gt;=
 +</span><font face=3D"monospace, monospace"><br></font></div></div><font f=
ace=3D"monospace, monospace"><span class=3D"gmail-m_8235173971185898766m_43=
36325641353630549m_-4261309298585166157gmail-m_-3967545249650152308gmail-">
&gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/bus/iio/devices/ii=
o:devi<wbr>ceX/outx<br>
&gt; +Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 August 2=
016<br>
&gt; +KernelVersion:=C2=A0 4.1.15<br>
&gt; +Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Abhisit Sangjan &lt;<a href=3D"ma=
ilto:s.abhisit@gmail.com" target=3D"_blank">s.abhisit@gmail.com</a>&gt;<br>
&gt; +Description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The pin output mode f=
or DAC.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Can be either=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;hiz&q=
uot; =3D High impedance state.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;dac&q=
uot; =3D DAC output.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- &quot;0&quot; =3D D=
rive it to low.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- &quot;1&quot; =3D D=
rive it to high.<br>
</span>Look at the existing ABI for powerdown modes.=C2=A0 Covers this.<br>=
</font></blockquote><div><font face=3D"monospace, monospace"><br></font></d=
iv><div><font face=3D"monospace, monospace">Could you point to where is pow=
erdown modes?</font></div><div><font face=3D"monospace, monospace">=C2=A0</=
font></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<font face=3D"monospace, monospace"><span class=3D"gmail-m_8235173971185898=
766m_4336325641353630549m_-4261309298585166157gmail-m_-3967545249650152308g=
mail-"><br>
&gt; +<br>
&gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/bus/iio/devices/ii=
o:devi<wbr>ceX/vref<br>
&gt; +Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 August 2=
016<br>
&gt; +KernelVersion:=C2=A0 4.1.15<br>
&gt; +Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Abhisit Sangjan &lt;<a href=3D"ma=
ilto:s.abhisit@gmail.com" target=3D"_blank">s.abhisit@gmail.com</a>&gt;<br>
&gt; +Description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is voltage refer=
ance source for DACs.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Can be either=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;exter=
nal&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;inter=
nal&quot;<br>
<br>
</span>Normal assumption is that if an external reference is provided by<br=
>
the hardware (specified in DT of similar) then we want to use it,<br>
if not fall back to internal.<br>
<br>
i.e. I don&#39;t think we have ever exposed this to userspace.<br></font></=
blockquote><div><font face=3D"monospace, monospace"><br></font></div><div><=
font face=3D"monospace, monospace">The real purpose is for debug on run-tim=
e, such as cat to know what is running mode now.</font></div><div><font fac=
e=3D"monospace, monospace">=C2=A0</font></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<font face=3D"monospace, monospace"><br>
&gt; +<br>
&gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/socX/soc/X=
XXXXXX<wbr>.aips-bus/XXXXXXX.i2c/i2c-X/X-<wbr>00XX/lmp92001-adc.X.auto/iio:=
d<wbr>eviceX/en<br>
<br>
Why the insanely long path rather than<br>
/sys/bus/iio/device/iio:device<wbr>X/en ?<br>
<span class=3D"gmail-m_8235173971185898766m_4336325641353630549m_-426130929=
8585166157gmail-m_-3967545249650152308gmail-"><br>
&gt; +Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 August 2=
016<br>
&gt; +KernelVersion:=C2=A0 4.1.15<br>
&gt; +Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Abhisit Sangjan &lt;<a href=3D"ma=
ilto:s.abhisit@gmail.com" target=3D"_blank">s.abhisit@gmail.com</a>&gt;<br>
&gt; +Description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is ADC Conversio=
n Enable for each channel.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Can be either=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;enabl=
e&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;disab=
le&quot;<br>
<br>
</span>Current form isn&#39;t per channel. Should be covered by buffered mo=
de<br>
scan_elements or the driver should be able to figure it out based<br>
on what channel is being read.=C2=A0 Would not expect to see individual<br>
channel enables for an ADC.<br></font></blockquote><div><font face=3D"monos=
pace, monospace"><br></font></div><div><font face=3D"monospace, monospace">=
I am agree with you and I have read buffered mode and do not understand. I =
thinks, I should omit first.<br></font></div><div><font face=3D"monospace, =
monospace">=C2=A0</font></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<font face=3D"monospace, monospace"><br>
<br>
&gt; +<br>
&gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/socX/soc/X=
XXXXXX<wbr>.aips-bus/XXXXXXX.i2c/i2c-X/X-<wbr>00XX/lmp92001-adc.X.auto/iio:=
d<wbr>eviceX/mode<br>
<br>
Again, short path please.<br>
<span class=3D"gmail-m_8235173971185898766m_4336325641353630549m_-426130929=
8585166157gmail-m_-3967545249650152308gmail-"><br>
&gt; +Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 August 2=
016<br>
&gt; +KernelVersion:=C2=A0 4.1.15<br>
&gt; +Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Abhisit Sangjan &lt;<a href=3D"ma=
ilto:s.abhisit@gmail.com" target=3D"_blank">s.abhisit@gmail.com</a>&gt;<br>
&gt; +Description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is conversion mo=
de for all of ADCs.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Can be either=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;conti=
nuous&quot; =3D Continuously conversion all the time.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;singl=
e-shot&quot; =3D Once time conversion and stop.<br>
<br>
</span>Which of these makes sense is usually possible to figure out from th=
e way the<br>
driver is being used.=C2=A0 This isn&#39;t something we want userspace to h=
ave to<br>
specify.<br></font></blockquote><div><font face=3D"monospace, monospace"><b=
r></font></div><div><font face=3D"monospace, monospace">I am agree with you=
.=C2=A0Choose from device tree and giving to userspace for debug purpose (O=
n time changing is optional), like cat to see what is running mode now.</fo=
nt></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<font face=3D"monospace, monospace"><span class=3D"gmail-m_8235173971185898=
766m_4336325641353630549m_-4261309298585166157gmail-m_-3967545249650152308g=
mail-"><br>
&gt; +<br>
&gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/socX/soc/X=
XXXXXX<wbr>.aips-bus/XXXXXXX.i2c/i2c-X/X-<wbr>00XX/lmp92001-adc.X.auto/iio:=
d<wbr>eviceX/vref<br>
&gt; +Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 August 2=
016<br>
&gt; +KernelVersion:=C2=A0 4.1.15<br>
&gt; +Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Abhisit Sangjan &lt;<a href=3D"ma=
ilto:s.abhisit@gmail.com" target=3D"_blank">s.abhisit@gmail.com</a>&gt;<br>
&gt; +Description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is voltage refer=
ance source for ADCs.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Can be either=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;exter=
nal&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;inter=
nal&quot;<br>
<br>
</span>Again, tends to be a hardware platform defined thing rather than<br>
something it makes sense to expose to userspace.<br></font></blockquote><di=
v><font face=3D"monospace, monospace"><br></font></div><div><font face=3D"m=
onospace, monospace">The real purpose is for debug on run-time, such as cat=
 to know what is running mode now.<br></font></div><div><font face=3D"monos=
pace, monospace"><br></font></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div><div class=3D"gmail-m_8235173971185898766m_4336325641353630=
549m_-4261309298585166157gmail-m_-3967545249650152308gmail-h5"><br></div></=
div><font face=3D"monospace, monospace"><span class=3D"gmail-m_823517397118=
5898766m_4336325641353630549m_-4261309298585166157gmail-m_-3967545249650152=
308gmail-">
&gt; + - ti,lmp92001-dac-outx:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Cy =3D 0, 1 =3D will force associated OUT=
x outputs to VDD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Cy =3D 0, 0 =3D will force associated OUT=
x outputs to GND<br>
&gt; + - ti,lmp92001-dac-gang: What group of Cy is governed to.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------=
-----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 Cy=C2=A0 =C2=A0| CDAC:GANG =3D 0 =
| CDAC:GANG =3D 1 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------=
-----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 C1=C2=A0 =C2=A0|=C2=A0 =C2=A0OUT[=
1:4]=C2=A0 =C2=A0 |=C2=A0 =C2=A0 OUT[1:3]=C2=A0 =C2=A0|<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------=
-----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 C2=C2=A0 =C2=A0|=C2=A0 =C2=A0OUT[=
5:6]=C2=A0 =C2=A0 |=C2=A0 =C2=A0 OUT[4:6]=C2=A0 =C2=A0|<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------=
-----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 C3=C2=A0 =C2=A0|=C2=A0 =C2=A0OUT[=
7:8]=C2=A0 =C2=A0 |=C2=A0 =C2=A0 OUT[7:9]=C2=A0 =C2=A0|<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------=
-----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 C4=C2=A0 =C2=A0|=C2=A0 =C2=A0OUT[=
9:12]=C2=A0 =C2=A0|=C2=A0 =C2=A0 OUT[10:12] |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------=
-----<br>
<br>
</span>If this is here, then why are we exposing it to userspace?<br>
Either this is a feature of the hardware or it&#39;s not...<br></font></blo=
ckquote><div><font face=3D"monospace, monospace"><br></font></div><div><fon=
t face=3D"monospace, monospace">This feature is hardware related for the pi=
n.</font></div><div><font face=3D"monospace, monospace"><br></font></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><font face=3D"monospace, mo=
nospace">
<span class=3D"gmail-m_8235173971185898766m_4336325641353630549m_-426130929=
8585166157gmail-m_-3967545249650152308gmail-"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct platform_driver lmp92001_gpio_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.<a href=3D"http://driver.name" rel=3D"noreferrer=
" target=3D"_blank">driver.name</a>=C2=A0 =C2=A0 =3D &quot;lmp92001-gpio&qu=
ot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D lmp9=
2001_gpio_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D lmp9=
2001_gpio_remove,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int __init lmp92001_gpio_init(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return platform_driver_register(&amp;lmp9<wbr>200=
1_gpio_driver);<br>
&gt; +}<br>
&gt; +subsys_initcall(lmp92001_gpio<wbr>_init);<br>
<br>
</span>Do we actually need to do this as a subsys_initcall rather than<br>
relying on deferred probing?<br></font></blockquote><div><font face=3D"mono=
space, monospace"><br></font></div><div><font face=3D"monospace, monospace"=
>I am referenced to exiting mfd gpio driver. Could you help me what is the =
right way.</font></div><div><font face=3D"monospace, monospace">=C2=A0</fon=
t></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div class=
=3D"gmail-m_8235173971185898766m_4336325641353630549m_-4261309298585166157g=
mail-m_-3967545249650152308gmail-h5"><font face=3D"monospace, monospace"><b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_drvd=
ata(indio_d<wbr>ev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int code, cgen, sgen, try;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;lmp92001-&gt;adc_loc<wbr>k);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP92001=
_CGEN, &amp;cgen);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Is not continuous conversion?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Lock the HW registers (if needed).<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Triggering single-short conversion.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Waiting for conversion successfully.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!(cgen &amp; CGEN_STRT)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(cgen &amp; CGEN=
_LCK)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;r<wbr>egmap,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CGE=
N, CGEN_LCK, CGEN_LCK);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Writing any value =
to triggered Single-Shot conversion. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_write(=
lmp92001-&gt;regmap, LMP92001_CTRIG, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto exit;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* In case of convers=
ion is in-progress, repeat for 10 times. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try =3D 10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0LMP92001_SGEN, &amp;sgen);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} while ((sgen &amp; =
CGEN_RST) &amp;&amp; (--try &gt; 0));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!try) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D -ETIME;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
</font></div></div><font face=3D"monospace, monospace">Move this whole bloc=
k to be single shot only.=C2=A0 Keep continuous for<br>
triggered buffer usage.<br>
<br>
Does this device have a dataready interrupt? Otherwise you&#39;ll probably =
want to<br>
do buffers with out the trigger and use a thread to monitor this complete<b=
r>
signal at 2x the expected frequency (so we don&#39;t miss any samples).<br>=
</font></blockquote><div><font face=3D"monospace, monospace"><br></font></d=
iv><div><font face=3D"monospace, monospace">I have no idea what is buffered=
 mode. I have read and do not understand.</font></div><div><font face=3D"mo=
nospace, monospace">=C2=A0</font></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div><div class=3D"gmail-m_8235173971185898766m_4336325641353=
630549m_-4261309298585166157gmail-m_-3967545249650152308gmail-h5"><font fac=
e=3D"monospace, monospace"><br>
&gt; +static int lmp92001_adc_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D <font color=3D"#000=
0ff"><i>dev_get_drvdata(pdev-&gt;dev.pare<wbr>nt);</i></font><br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct iio_dev *indio_dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device_node *np =3D pdev-&gt;dev.of_node;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *conversion;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int cgen =3D 0, cad1, cad2, cad3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 mask;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev =3D devm_iio_device_alloc(&amp;pdev-&gt=
;d<wbr>ev, sizeof(*lmp92001));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!indio_dev)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_init(&amp;lmp92001-&gt;adc_loc<wbr>k);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iio_device_set_drvdata(indio_<wbr>dev, lmp92001);=
<br>
<br>
</font></div></div><font face=3D"monospace, monospace">Why?=C2=A0 You can a=
lways get the lmp92001 from iio_priv(indio_dev)<br></font></blockquote><div=
><br></div><div>I would like to take it from parent driver data that has be=
en allocated (<i><font color=3D"#0000ff">highlight in blue</font></i>). Now=
 I am allocate the size for zero.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><font face=3D"monospace, monospace">
</font><div><div class=3D"gmail-m_8235173971185898766m_4336325641353630549m=
_-4261309298585166157gmail-m_-3967545249650152308gmail-h5"><font face=3D"mo=
nospace, monospace"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;name =3D pdev-&gt;name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;dev.parent =3D &amp;pdev-&gt;dev;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;modes =3D INDIO_DIRECT_MODE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;info =3D &amp;lmp92001_info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;channels =3D lmp92001_adc_channels;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;num_channels =3D ARRAY_SIZE(lmp9200=
1_adc_channe<wbr>ls);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;r<wbr>egm=
ap, LMP92001_CGEN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CGEN_RST, CG=
EN_RST);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;failed to self reset all registers\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Turn on all of them, if you are pretty sure th=
ey are must be<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * real-time update or specify which channel is n=
eeded to be used to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * save conversion time for a cycle.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32(np, &quot;ti,lmp9200=
1-adc-mask&quot;, &amp;mask);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cad1 =3D cad2 =3D cad=
3 =3D 0xFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(&amp;pdev-&g=
t;dev, &quot;turn on all of channels by default\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cad1 =3D mask &amp; 0=
xFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cad2 =3D (mask &gt;&g=
t; 8) &amp; 0xFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cad3 =3D (mask &gt;&g=
t; 16) &amp; 0xFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
</font></div></div><font face=3D"monospace, monospace">If you need these ef=
ficiencies, use the buffered mode interface of IIO and<br>
switch into continuous mode with just the right channels.=C2=A0 For single =
reads<br>
use oneshot.<br>
<br>
This will then all be handled in the update_scan_mask callback.<br></font><=
/blockquote><div><br></div><div>I do not understand buffered mode. I could =
not implement it, sorry.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><font face=3D"monospace, monospace">
</font><div><div class=3D"gmail-m_8235173971185898766m_4336325641353630549m=
_-4261309298585166157gmail-m_-3967545249650152308gmail-h5"><br></div></div>=
<font face=3D"monospace, monospace"><span class=3D"gmail-m_8235173971185898=
766m_4336325641353630549m_-4261309298585166157gmail-m_-3967545249650152308g=
mail-">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct platform_driver lmp92001_adc_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.<a href=3D"http://driver.name" rel=3D"noreferrer=
" target=3D"_blank">driver.name</a>=C2=A0 =C2=A0 =3D &quot;lmp92001-adc&quo=
t;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D lmp9=
2001_adc_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D lmp9=
2001_adc_remove,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int __init lmp92001_adc_init(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return platform_driver_register(&amp;lmp9<wbr>200=
1_adc_driver);<br>
&gt; +}<br>
&gt; +subsys_initcall(lmp92001_adc_<wbr>init);<br>
</span>Why?<br></font></blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><font face=3D"monospace, monospace"><span class=3D"gmail-m_82351=
73971185898766m_4336325641353630549m_-4261309298585166157gmail-m_-396754524=
9650152308gmail-">&gt; +<br>
&gt; +static void __exit lmp92001_adc_exit(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_driver_unregister(&amp;l<wbr>mp92001_adc=
_driver);<br>
&gt; +}<br>
&gt; +module_exit(lmp92001_adc_exit<wbr>);<br>
<br>
</span>use the magic platform macros to drop this boiler plate unless<br>
you have a good reason for the subsys_initcall.<br></font></blockquote><div=
><font face=3D"monospace, monospace"><br></font></div><div><font face=3D"mo=
nospace, monospace">I am follow up the exiting mfd gpio driver.<br></font><=
/div><div><font face=3D"monospace, monospace">=C2=A0</font></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<div><div class=3D"gmail-m_8235173971185898766m_4336325641353630549m_-42613=
09298585166157gmail-m_-3967545249650152308gmail-h5"><span style=3D"font-fam=
ily:monospace,monospace">Lots of comments would be about the ABI but we&#39=
;ve already covered that above.</span><br></div></div></blockquote><div><br=
></div><div>Thank you, I will do.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><font face=3D"monospace, monospace">
</font><div><div class=3D"gmail-m_8235173971185898766m_4336325641353630549m=
_-4261309298585166157gmail-m_-3967545249650152308gmail-h5"><font face=3D"mo=
nospace, monospace"><br>
&gt; +<br>
&gt; +#include &lt;linux/iio/iio.h&gt;<br>
&gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; +#include &lt;linux/mfd/core.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;linux/mfd/lmp92001/core.h&gt;<br>
&gt; +<br>
&gt; +#define CREF_DEXT=C2=A0 =C2=A0 (1 &lt;&lt; 0) /* 1 - DAC external ref=
erence.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 0 - DAC internal reference.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +#define CDAC_OFF=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0) /* 1 - Forces all =
outputs to high impedance. */<br>
&gt; +#define CDAC_OLVL=C2=A0 =C2=A0 (1 &lt;&lt; 1) /* 1 - Cy=3D0 will forc=
e associated OUTx outputs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0to VDD.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 0 - Cy=3D0 will force associate=
d OUTx outputs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0to GND.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +#define CDAC_GANG=C2=A0 =C2=A0 (1 &lt;&lt; 2) /* Controls the associa=
tion of analog output<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* channels OUTx with asynchronous=
 control<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* inputs Cy.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Cy to OUTx Assignment<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ------------------------------<=
wbr>--------<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* | Cy | CDAC:GANG =3D 0 | CDAC:G=
ANG =3D 1 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ------------------------------<=
wbr>--------<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* | C1 | OUT[1:4]=C2=A0 =C2=A0 =
=C2=A0 | OUT[1:3]=C2=A0 =C2=A0 =C2=A0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ------------------------------<=
wbr>--------<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* | C2 | OUT[5:6]=C2=A0 =C2=A0 =
=C2=A0 | OUT[4:6]=C2=A0 =C2=A0 =C2=A0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ------------------------------<=
wbr>--------<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* | C3 | OUT[7:8]=C2=A0 =C2=A0 =
=C2=A0 | OUT[7:9]=C2=A0 =C2=A0 =C2=A0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ------------------------------<=
wbr>--------<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* | C4 | OUT[9:12]=C2=A0 =C2=A0 =
=C2=A0| OUT[10:12]=C2=A0 =C2=A0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ------------------------------<=
wbr>--------<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br></font></div></div></blockq=
uote><div>=C2=A0...</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div><div class=3D"gmail-m_8235173971185898766m_4336325641353630549m_-42613=
09298585166157gmail-m_-3967545249650152308gmail-h5"><font face=3D"monospace=
, monospace"></font></div></div><div><div class=3D"gmail-m_8235173971185898=
766m_4336325641353630549m_-4261309298585166157gmail-m_-3967545249650152308g=
mail-h5"><font face=3D"monospace, monospace">
&gt; +int lmp92001_write_raw(struct iio_dev *indio_dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct iio_chan_spec const *channel,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int val, int val2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0long mask)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_drvd=
ata(indio_d<wbr>ev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;lmp92001-&gt;dac_loc<wbr>k);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (val &lt; 0 || val &gt; 4095) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (mask) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case IIO_CHAN_INFO_RAW:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (channel-&gt;t=
ype) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case IIO_VOLTAGE:<br>
</font></div></div><font face=3D"monospace, monospace">Move lock in here...=
 Will simplify code flow by allowing direct returns.<br></font></blockquote=
><div><br></div><div>Thank you.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><font face=3D"monospace, monospace">
</font><div><div class=3D"gmail-m_8235173971185898766m_4336325641353630549m=
_-4261309298585166157gmail-m_-3967545249650152308gmail-h5"><font face=3D"mo=
nospace, monospace">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_write(lmp92001-&gt;regmap,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x7F + chann=
el-&gt;channel, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br></font></div></div></block=
quote><div>=C2=A0...</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div><div class=3D"gmail-m_8235173971185898766m_4336325641353630549m_-4261=
309298585166157gmail-m_-3967545249650152308gmail-h5"><font face=3D"monospac=
e, monospace">
&gt; +static int lmp92001_dac_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D <i><font color=3D"#=
0000ff">dev_get_drvdata(pdev-&gt;dev.pare<wbr>nt);</font></i><br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct iio_dev *indio_dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device_node *np =3D pdev-&gt;dev.of_node;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 gang =3D 0, outx =3D 0, hiz =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int cdac =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev =3D devm_iio_device_alloc(&amp;pdev-&gt=
;d<wbr>ev, sizeof(*lmp92001));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!indio_dev)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_init(&amp;lmp92001-&gt;dac_loc<wbr>k);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iio_device_set_drvdata(indio_<wbr>dev, lmp92001);=
<br>
</font></div></div><font face=3D"monospace, monospace">again, why? Use iio_=
priv(indio_dev) where ever you have been using<br>
drvdata.<br></font></blockquote><div><br></div><div>I would like to take it=
 from parent driver data that has been allocated (<i><font color=3D"#0000ff=
">highlight in blue</font></i>).<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><font face=3D"monospace, monospace">
<span class=3D"gmail-m_8235173971185898766m_4336325641353630549m_-426130929=
8585166157gmail-m_-3967545249650152308gmail-">&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;name =3D pdev-&gt;name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;modes =3D INDIO_DIRECT_MODE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;info =3D &amp;lmp92001_info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;channels =3D lmp92001_dac_channels;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;num_channels =3D ARRAY_SIZE(lmp9200=
1_dac_channe<wbr>ls);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0of_property_read_u8(np, &quot;ti,lmp92001-dac-hiz=
&quot;, &amp;hiz);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cdac |=3D hiz;<br>
</span>cdac =3D hiz and drop the =3D 0 above.=C2=A0 Also handle errors.<br>=
</font></blockquote><div><br></div><div>Thank you.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><font face=3D"monospace, mo=
nospace">
<span class=3D"gmail-m_8235173971185898766m_4336325641353630549m_-426130929=
8585166157gmail-m_-3967545249650152308gmail-">&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0of_property_read_u8(np, &quot;ti,lmp92001-dac-out=
x&quot;, &amp;outx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cdac |=3D outx &lt;&lt; 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0of_property_read_u8(np, &quot;ti,lmp92001-dac-gan=
g&quot;, &amp;gang);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cdac |=3D gang &lt;&lt; 2;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;r<wbr>egm=
ap, LMP92001_CDAC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CDAC_GANG | =
CDAC_OLVL | CDAC_OFF, cdac);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, indio_dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return devm_iio_device_register(&amp;pdev<wbr>-&g=
t;dev, indio_dev);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int lmp92001_dac_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct iio_dev *indio_dev =3D platform_get_drvdat=
a(pdev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0devm_iio_device_unregister(&amp;p<wbr>dev-&gt;dev=
, indio_dev);<br>
</span>Same as for the ADC.<br>
<span class=3D"gmail-m_8235173971185898766m_4336325641353630549m_-426130929=
8585166157gmail-m_-3967545249650152308gmail-">&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct platform_driver lmp92001_dac_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.<a href=3D"http://driver.name" rel=3D"noreferrer=
" target=3D"_blank">driver.name</a>=C2=A0 =C2=A0 =3D &quot;lmp92001-dac&quo=
t;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D lmp9=
2001_dac_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D lmp9=
2001_dac_remove,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int __init lmp92001_dac_init(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return platform_driver_register(&amp;lmp9<wbr>200=
1_dac_driver);<br>
&gt; +}<br>
&gt; +subsys_initcall(lmp92001_dac_<wbr>init);<br>
</span>Why subsys_initcall?</font></blockquote><div><br></div><div>I am fol=
low the exiting mfd dac driver. What is should be function for this?</div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div c=
lass=3D"gmail-m_8235173971185898766m_4336325641353630549m_-4261309298585166=
157gmail-m_-3967545249650152308gmail-h5"><br></div></div><div><div class=3D=
"gmail-m_8235173971185898766m_4336325641353630549m_-4261309298585166157gmai=
l-m_-3967545249650152308gmail-h5"><font face=3D"monospace, monospace">
&gt; +/* TODO: To read/write block access, it may need to re-ordering endia=
nness! */<br>
&gt; +static int lmp92001_reg_read(void *context, unsigned int reg, unsigne=
d int *val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D context;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_client *i2c =3D to_i2c_client(dev);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (reg &gt; 0xff)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (reg) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ID ... LMP92001_CTRIG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CREF:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_rea=
d_byte_data(i2c, reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC1 ... LMP92001_LIL11:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC1 ... LMP92001_DALL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_rea=
d_word_swapped(i2<wbr>c, reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK0 ... LMP92001_BLK5:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_rea=
d_block_data(i2c, reg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(u8 *)((uintptr_t)*val));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (reg &lt;=3D LMP92001_DALL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D ret;<br>
</font></div></div><font face=3D"monospace, monospace">Cleaner to push this=
 up into the case statements perhaps? Or at least<br>
return ret for the BLK one up there.<br></font></blockquote><div><br></div>=
<div>Thank you.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><font face=3D"monospace, monospace">
</font><div><div class=3D"gmail-m_8235173971185898766m_4336325641353630549m=
_-4261309298585166157gmail-m_-3967545249650152308gmail-h5"><font face=3D"mo=
nospace, monospace"><br>
</font></div></div><font face=3D"monospace, monospace">Ran out of time towa=
rds the end of this so review was rather less detailed!<br>
<br>
Will take a look at the next version after you&#39;ve broken this up.<br>
<span class=3D"gmail-m_8235173971185898766m_4336325641353630549m_-426130929=
8585166157gmail-m_-3967545249650152308gmail-HOEnZb"><font color=3D"#888888"=
><br>
Jonathan<br>
<br>
<br>
</font></span></font></blockquote></div></div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Thank you so much Jonathan for your revi=
ew. I will send new version by today.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Abhisit.<br></div></div>

--94eb2c1a1a425139640557f3668d--
