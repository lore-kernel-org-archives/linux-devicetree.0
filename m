From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/2] iio: adc: Add TI ADS8688
Date: Sun, 25 Oct 2015 13:37:00 +0000
Message-ID: <562CDAFC.8040603@kernel.org>
References: <1444119156-8316-1-git-send-email-sean.nyekjaer@prevas.dk>
 <561A77F4.3000508@kernel.org> <561CD2EE.3020604@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561CD2EE.3020604-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13/10/15 10:46, Sean Nyekj=C3=A6r wrote:
> Hi
>=20
> I'm having a problems with the ads8688_write_raw_get_fmt function.
>=20
> Firstly the OFFSET and the SCALE its switched around. Ill fix that :-=
)
> Secondly the i'm not allowed to return IIO_VAL_INT, this results in t=
he
> iio_write_channel_info() is returning -EINVAL. The iio_write_channel_=
info() only checks if the write_raw_get_fmt is existing...
> Do I need to convert the OFFSET to a IIO_VAL_INT_PLUS_NANO aswell or =
?
Nope. The core needs extending to actually support IIO_VAL_INT.  Though=
 cynically
setting it to IIO_VAL_INT_PLUS_MICRO and checking the val2 is 0 would w=
ork
as well if you want a quick solution.

Adding IIO_VAL_INT support should be fairly straightforward, though I'd
bypass the string to fixedpoint convertor in this case and do it with a=
n
scanf. =20


>=20
> /Sean
>=20
> On 2015-10-11 16:53, Jonathan Cameron wrote:
>> On 06/10/15 09:12, Sean Nyekjaer wrote:
>>> This patch adds support for the Texas Intruments ADS8688 ADC.
>>>
>>> Signed-off-by: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
>>> Reviewed-by: Martin Hundeb=C3=B8ll <martin.hundeboll-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
>> only one issue that I can see.  You do need locking to protect
>> your local buffers.  A local lock in the same structure would be
>> appropriate for this.
>>
>> Neither sysfs nor IIO provide any serialization guarantees
>> so multiple concurrent reads are more than possible and may
>> cause you data corruption as it stands.
>>
>> Other than that, it's looking very nice.
>>
>> Thanks,
>>
>> Jonathan
>>> ---
>>> Changes since v3:
>>> - fixed multiline comments
>>> - write_raw_get_fmt _SCALE is nano, _OFFSET is int
>>>
>>> Changes since v2:
>>> - Removed unused variables
>>> - Removed unnecessary mutex lock
>>> - Range array is a enum
>>> - Made the read and write functions less complex and easier to read
>>> - Added inline comments
>>> - Added callback to write_raw_get_fmt
>>>
>>> Changes since v1:
>>> - Now possible to read and write the actual offset and scale values
>>> - Removed unused includes
>>> - Removed unused buffer references
>>>   drivers/iio/adc/Kconfig      |  10 +
>>>   drivers/iio/adc/Makefile     |   1 +
>>>   drivers/iio/adc/ti-ads8688.c | 472 ++++++++++++++++++++++++++++++=
+++++++++++++
>>>   3 files changed, 483 insertions(+)
>>>   create mode 100644 drivers/iio/adc/ti-ads8688.c
>>>
>>> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
>>> index 7868c74..4135d17 100644
>>> --- a/drivers/iio/adc/Kconfig
>>> +++ b/drivers/iio/adc/Kconfig
>>> @@ -333,6 +333,16 @@ config TI_ADC128S052
>>>         This driver can also be built as a module. If so, the modul=
e will be
>>>         called ti-adc128s052.
>>>   +config TI_ADS8688
>>> +    tristate "Texas Instruments ADS8688"
>>> +    depends on SPI && OF
>>> +    help
>>> +      If you say yes here you get support for Texas Instruments AD=
S8684 and
>>> +      and ADS8688 ADC chips
>>> +
>>> +      This driver can also be built as a module. If so, the module=
 will be
>>> +      called ti-ads8688.
>>> +
>>>   config TI_AM335X_ADC
>>>       tristate "TI's AM335X ADC driver"
>>>       depends on MFD_TI_AM335X_TSCADC
>>> diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
>>> index 99b37a9..04ab2c8 100644
>>> --- a/drivers/iio/adc/Makefile
>>> +++ b/drivers/iio/adc/Makefile
>>> @@ -32,6 +32,7 @@ obj-$(CONFIG_QCOM_SPMI_VADC) +=3D qcom-spmi-vadc.=
o
>>>   obj-$(CONFIG_ROCKCHIP_SARADC) +=3D rockchip_saradc.o
>>>   obj-$(CONFIG_TI_ADC081C) +=3D ti-adc081c.o
>>>   obj-$(CONFIG_TI_ADC128S052) +=3D ti-adc128s052.o
>>> +obj-$(CONFIG_TI_ADS8688) +=3D ti-ads8688.o
>>>   obj-$(CONFIG_TI_AM335X_ADC) +=3D ti_am335x_adc.o
>>>   obj-$(CONFIG_TWL4030_MADC) +=3D twl4030-madc.o
>>>   obj-$(CONFIG_TWL6030_GPADC) +=3D twl6030-gpadc.o
>>> diff --git a/drivers/iio/adc/ti-ads8688.c b/drivers/iio/adc/ti-ads8=
688.c
>>> new file mode 100644
>>> index 0000000..537bb0a
>>> --- /dev/null
>>> +++ b/drivers/iio/adc/ti-ads8688.c
>>> @@ -0,0 +1,472 @@
>>> +/*
>>> + * Copyright (C) 2015 Prevas A/S
>>> + *
>>> + * This program is free software; you can redistribute it and/or m=
odify
>>> + * it under the terms of the GNU General Public License version 2 =
as
>>> + * published by the Free Software Foundation.
>>> + */
>>> +
>>> +#include <linux/device.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/sysfs.h>
>>> +#include <linux/spi/spi.h>
>>> +#include <linux/regulator/consumer.h>
>>> +#include <linux/err.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +
>>> +#include <linux/iio/iio.h>
>>> +#include <linux/iio/sysfs.h>
>>> +
>>> +#define ADS8688_CMD_REG(x)        (x << 8)
>>> +#define ADS8688_CMD_REG_NOOP        0x00
>>> +#define ADS8688_CMD_REG_RST        0x85
>>> +#define ADS8688_CMD_REG_MAN_CH(chan)    (0xC0 | (4 * chan))
>>> +#define ADS8688_CMD_DONT_CARE_BITS    16
>>> +
>>> +#define ADS8688_PROG_REG(x)        (x << 9)
>>> +#define ADS8688_PROG_REG_RANGE_CH(chan)    (0x05 + chan)
>>> +#define ADS8688_PROG_WR_BIT        BIT(8)
>>> +#define ADS8688_PROG_DONT_CARE_BITS    8
>>> +
>>> +#define ADS8688_REG_PLUSMINUS25VREF    0
>>> +#define ADS8688_REG_PLUSMINUS125VREF    1
>>> +#define ADS8688_REG_PLUSMINUS0625VREF    2
>>> +#define ADS8688_REG_PLUS25VREF        5
>>> +#define ADS8688_REG_PLUS125VREF        6
>>> +
>>> +#define ADS8688_VREF_MV            4096
>>> +#define ADS8688_REALBITS        16
>>> +
>>> +/*
>>> + * enum ads8688_range - ADS8688 reference voltage range
>>> + * @ADS8688_PLUSMINUS25VREF: Device is configured for input range =
=C2=B12.5 * VREF
>>> + * @ADS8688_PLUSMINUS125VREF: Device is configured for input range=
 =C2=B11.25 * VREF
>>> + * @ADS8688_PLUSMINUS0625VREF: Device is configured for input rang=
e =C2=B10.625 * VREF
>>> + * @ADS8688_PLUS25VREF: Device is configured for input range 0 - 2=
=2E5 * VREF
>>> + * @ADS8688_PLUS125VREF: Device is configured for input range 0 - =
1.25 * VREF
>>> + */
>>> +enum ads8688_range {
>>> +    ADS8688_PLUSMINUS25VREF,
>>> +    ADS8688_PLUSMINUS125VREF,
>>> +    ADS8688_PLUSMINUS0625VREF,
>>> +    ADS8688_PLUS25VREF,
>>> +    ADS8688_PLUS125VREF,
>>> +};
>>> +
>>> +struct ads8688_chip_info {
>>> +    const struct iio_chan_spec *channels;
>>> +    unsigned int num_channels;
>>> +};
>>> +
>>> +struct ads8688_state {
>>> +    const struct ads8688_chip_info    *chip_info;
>>> +    struct spi_device        *spi;
>>> +    struct regulator        *reg;
>>> +    unsigned int            vref_mv;
>>> +    enum ads8688_range        range[8];
>> Oops, missed this before.  You need to have locking around
>> your databuffer.  There is nothing in sysfs or the IIO
>> core to prevent multiple concurrent reads..
>>
>> I note you mention removing an unecessary lock. I think that
>> was a missunderstanding.  Locking is necessary, just not
>> using the IIO mutex that exists to protect against state
>> change issues (enabling buffers for example).
>>
>> So there should be a local lock to protect this next element.
>>
>>> +    union {
>>> +        __be32 d32;
>>> +        u8 d8[4];
>>> +    } data[2] ____cacheline_aligned;
>>> +};
>>> +
>>> +enum ads8688_id {
>>> +    ID_ADS8684,
>>> +    ID_ADS8688,
>>> +};
>>> +
>>> +struct ads8688_ranges {
>>> +    enum ads8688_range range;
>>> +    unsigned int scale;
>>> +    int offset;
>>> +    u8 reg;
>>> +};
>>> +
>>> +static const struct ads8688_ranges ads8688_range_def[5] =3D {
>>> +    {
>>> +        .range =3D ADS8688_PLUSMINUS25VREF,
>>> +        .scale =3D 76295,
>>> +        .offset =3D -(1 << (ADS8688_REALBITS - 1)),
>>> +        .reg =3D ADS8688_REG_PLUSMINUS25VREF,
>>> +    }, {
>>> +        .range =3D ADS8688_PLUSMINUS125VREF,
>>> +        .scale =3D 38148,
>>> +        .offset =3D -(1 << (ADS8688_REALBITS - 1)),
>>> +        .reg =3D ADS8688_REG_PLUSMINUS125VREF,
>>> +    }, {
>>> +        .range =3D ADS8688_PLUSMINUS0625VREF,
>>> +        .scale =3D 19074,
>>> +        .offset =3D -(1 << (ADS8688_REALBITS - 1)),
>>> +        .reg =3D ADS8688_REG_PLUSMINUS0625VREF,
>>> +    }, {
>>> +        .range =3D ADS8688_PLUS25VREF,
>>> +        .scale =3D 38148,
>>> +        .offset =3D 0,
>>> +        .reg =3D ADS8688_REG_PLUS25VREF,
>>> +    }, {
>>> +        .range =3D ADS8688_PLUS125VREF,
>>> +        .scale =3D 19074,
>>> +        .offset =3D 0,
>>> +        .reg =3D ADS8688_REG_PLUS125VREF,
>>> +    }
>>> +};
>>> +
>>> +static ssize_t ads8688_show_scales(struct device *dev,
>>> +                   struct device_attribute *attr, char *buf)
>>> +{
>>> +    struct ads8688_state *st =3D iio_priv(dev_to_iio_dev(dev));
>>> +
>>> +    return sprintf(buf, "0.%09u 0.%09u 0.%09u\n",
>>> +               ads8688_range_def[0].scale * st->vref_mv,
>>> +               ads8688_range_def[1].scale * st->vref_mv,
>>> +               ads8688_range_def[2].scale * st->vref_mv);
>>> +}
>>> +
>>> +static ssize_t ads8688_show_offsets(struct device *dev,
>>> +                    struct device_attribute *attr, char *buf)
>>> +{
>>> +    return sprintf(buf, "%d %d\n", ads8688_range_def[0].offset,
>>> +               ads8688_range_def[3].offset);
>>> +}
>>> +
>>> +static IIO_DEVICE_ATTR(in_voltage_scale_available, S_IRUGO,
>>> +               ads8688_show_scales, NULL, 0);
>>> +static IIO_DEVICE_ATTR(in_voltage_offset_available, S_IRUGO,
>>> +               ads8688_show_offsets, NULL, 0);
>>> +
>>> +static struct attribute *ads8688_attributes[] =3D {
>>> +    &iio_dev_attr_in_voltage_scale_available.dev_attr.attr,
>>> +    &iio_dev_attr_in_voltage_offset_available.dev_attr.attr,
>>> +    NULL,
>>> +};
>>> +
>>> +static const struct attribute_group ads8688_attribute_group =3D {
>>> +    .attrs =3D ads8688_attributes,
>>> +};
>>> +
>>> +#define ADS8688_CHAN(index)                    \
>>> +{                                \
>>> +    .type =3D IIO_VOLTAGE,                    \
>>> +    .indexed =3D 1,                        \
>>> +    .channel =3D index,                    \
>>> +    .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW)        \
>>> +                  | BIT(IIO_CHAN_INFO_SCALE)    \
>>> +                  | BIT(IIO_CHAN_INFO_OFFSET),    \
>>> +}
>>> +
>>> +static const struct iio_chan_spec ads8684_channels[] =3D {
>>> +    ADS8688_CHAN(0),
>>> +    ADS8688_CHAN(1),
>>> +    ADS8688_CHAN(2),
>>> +    ADS8688_CHAN(3),
>>> +};
>>> +
>>> +static const struct iio_chan_spec ads8688_channels[] =3D {
>>> +    ADS8688_CHAN(0),
>>> +    ADS8688_CHAN(1),
>>> +    ADS8688_CHAN(2),
>>> +    ADS8688_CHAN(3),
>>> +    ADS8688_CHAN(4),
>>> +    ADS8688_CHAN(5),
>>> +    ADS8688_CHAN(6),
>>> +    ADS8688_CHAN(7),
>>> +};
>>> +
>>> +static int ads8688_prog_write(struct iio_dev *indio_dev, unsigned =
int addr,
>>> +                  unsigned int val)
>>> +{
>>> +    struct ads8688_state *st =3D iio_priv(indio_dev);
>>> +    u32 tmp;
>>> +
>>> +    tmp =3D ADS8688_PROG_REG(addr) | ADS8688_PROG_WR_BIT | val;
>>> +    tmp <<=3D ADS8688_PROG_DONT_CARE_BITS;
>>> +    st->data[0].d32 =3D cpu_to_be32(tmp);
>>> +
>>> +    return spi_write(st->spi, &st->data[0].d8[1], 3);
>>> +}
>>> +
>>> +static int ads8688_reset(struct iio_dev *indio_dev)
>>> +{
>>> +    struct ads8688_state *st =3D iio_priv(indio_dev);
>>> +    u32 tmp;
>>> +
>>> +    tmp =3D ADS8688_CMD_REG(ADS8688_CMD_REG_RST);
>>> +    tmp <<=3D ADS8688_CMD_DONT_CARE_BITS;
>>> +    st->data[0].d32 =3D cpu_to_be32(tmp);
>>> +
>>> +    return spi_write(st->spi, &st->data[0].d8[0], 4);
>>> +}
>>> +
>>> +static int ads8688_read(struct iio_dev *indio_dev, unsigned int ch=
an)
>>> +{
>>> +    struct ads8688_state *st =3D iio_priv(indio_dev);
>>> +    int ret;
>>> +    u32 tmp;
>>> +    struct spi_transfer t[] =3D {
>>> +        {
>>> +            .tx_buf =3D &st->data[0].d8[0],
>>> +            .len =3D 4,
>>> +            .cs_change =3D 1,
>>> +        }, {
>>> +            .tx_buf =3D &st->data[1].d8[0],
>>> +            .rx_buf =3D &st->data[1].d8[0],
>>> +            .len =3D 4,
>>> +        },
>>> +    };
>>> +
>>> +    tmp =3D ADS8688_CMD_REG(ADS8688_CMD_REG_MAN_CH(chan));
>>> +    tmp <<=3D ADS8688_CMD_DONT_CARE_BITS;
>>> +    st->data[0].d32 =3D cpu_to_be32(tmp);
>>> +
>>> +    tmp =3D ADS8688_CMD_REG(ADS8688_CMD_REG_NOOP);
>>> +    tmp <<=3D ADS8688_CMD_DONT_CARE_BITS;
>>> +    st->data[1].d32 =3D cpu_to_be32(tmp);
>>> +
>>> +    ret =3D spi_sync_transfer(st->spi, t, ARRAY_SIZE(t));
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    return be32_to_cpu(st->data[1].d32) & 0xffff;
>>> +}
>>> +
>>> +static int ads8688_read_raw(struct iio_dev *indio_dev,
>>> +                struct iio_chan_spec const *chan,
>>> +                int *val, int *val2, long m)
>>> +{
>>> +    int ret, offset;
>>> +    unsigned long scale_mv;
>>> +
>>> +    struct ads8688_state *st =3D iio_priv(indio_dev);
>>> +
>>> +    switch (m) {
>>> +    case IIO_CHAN_INFO_RAW:
>>> +        ret =3D ads8688_read(indio_dev, chan->channel);
>>> +        if (ret < 0)
>>> +            return ret;
>>> +        *val =3D ret;
>>> +        return IIO_VAL_INT;
>>> +    case IIO_CHAN_INFO_SCALE:
>>> +        scale_mv =3D st->vref_mv;
>>> +        scale_mv *=3D ads8688_range_def[st->range[chan->channel]].=
scale;
>>> +        *val =3D 0;
>>> +        *val2 =3D scale_mv;
>>> +        return IIO_VAL_INT_PLUS_NANO;
>>> +    case IIO_CHAN_INFO_OFFSET:
>>> +        offset =3D ads8688_range_def[st->range[chan->channel]].off=
set;
>>> +        *val =3D offset;
>>> +        return IIO_VAL_INT;
>>> +    }
>>> +
>>> +    return -EINVAL;
>>> +}
>>> +
>>> +static int ads8688_write_reg_range(struct iio_dev *indio_dev,
>>> +                   struct iio_chan_spec const *chan,
>>> +                   enum ads8688_range range)
>>> +{
>>> +    unsigned int tmp;
>>> +    int ret;
>>> +
>>> +    tmp =3D ADS8688_PROG_REG_RANGE_CH(chan->channel);
>>> +    ret =3D ads8688_prog_write(indio_dev, tmp, range);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int ads8688_write_raw(struct iio_dev *indio_dev,
>>> +                 struct iio_chan_spec const *chan,
>>> +                 int val, int val2, long mask)
>>> +{
>>> +    struct ads8688_state *st =3D iio_priv(indio_dev);
>>> +    unsigned int scale =3D 0;
>>> +    int ret =3D -EINVAL, i, offset =3D 0;
>>> +
>>> +    switch (mask) {
>>> +    case IIO_CHAN_INFO_SCALE:
>>> +        /* If the offset is 0 the =C2=B12.5 * VREF mode is not ava=
ilable */
>>> +        offset =3D ads8688_range_def[st->range[chan->channel]].off=
set;
>>> +        if (offset =3D=3D 0 && val2 =3D=3D ads8688_range_def[0].sc=
ale * st->vref_mv)
>>> +            return -EINVAL;
>>> +
>>> +        /* Lookup new mode */
>>> +        for (i =3D 0; i < ARRAY_SIZE(ads8688_range_def); i++)
>>> +            if (val2 =3D=3D ads8688_range_def[i].scale * st->vref_=
mv &&
>>> +                offset =3D=3D ads8688_range_def[i].offset) {
>>> +                ret =3D ads8688_write_reg_range(indio_dev, chan,
>>> +                    ads8688_range_def[i].reg);
>>> +                break;
>>> +            }
>>> +        break;
>>> +    case IIO_CHAN_INFO_OFFSET:
>>> +        /*
>>> +         * There are only two available offsets:
>>> +         * 0 and -(1 << (ADS8688_REALBITS - 1))
>>> +         */
>>> +        if (!(ads8688_range_def[0].offset =3D=3D val ||
>>> +            ads8688_range_def[3].offset =3D=3D val))
>>> +            return -EINVAL;
>>> +
>>> +        /*
>>> +         * If the device are in =C2=B12.5 * VREF mode, it's not al=
lowed to
>>> +         * switch to a mode where the offset is 0
>>> +         */
>>> +        if (0 =3D=3D val &&
>>> +            st->range[chan->channel] =3D=3D ADS8688_PLUSMINUS25VRE=
=46)
>>> +            return -EINVAL;
>>> +
>>> +        scale =3D ads8688_range_def[st->range[chan->channel]].scal=
e;
>>> +
>>> +        /* Lookup new mode */
>>> +        for (i =3D 0; i < ARRAY_SIZE(ads8688_range_def); i++)
>>> +            if (val =3D=3D ads8688_range_def[i].offset &&
>>> +                scale =3D=3D ads8688_range_def[i].scale) {
>>> +                ret =3D ads8688_write_reg_range(indio_dev, chan,
>>> +                    ads8688_range_def[i].reg);
>>> +                break;
>>> +            }
>>> +        break;
>>> +    }
>>> +
>>> +    if (!ret)
>>> +        st->range[chan->channel] =3D ads8688_range_def[i].range;
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int ads8688_write_raw_get_fmt(struct iio_dev *indio_dev,
>>> +                     struct iio_chan_spec const *chan,
>>> +                     long mask)
>>> +{
>>> +    switch (mask) {
>>> +    case IIO_CHAN_INFO_SCALE:
>>> +        return IIO_VAL_INT;
>>> +    case IIO_CHAN_INFO_OFFSET:
>>> +        return IIO_VAL_INT_PLUS_NANO;
>>> +    }
>>> +
>>> +    return -EINVAL;
>>> +}
>>> +
>>> +static const struct iio_info ads8688_info =3D {
>>> +    .read_raw =3D &ads8688_read_raw,
>>> +    .write_raw =3D &ads8688_write_raw,
>>> +    .write_raw_get_fmt =3D &ads8688_write_raw_get_fmt,
>>> +    .attrs =3D &ads8688_attribute_group,
>>> +    .driver_module =3D THIS_MODULE,
>>> +};
>>> +
>>> +static const struct ads8688_chip_info ads8688_chip_info_tbl[] =3D =
{
>>> +    [ID_ADS8684] =3D {
>>> +        .channels =3D ads8684_channels,
>>> +        .num_channels =3D ARRAY_SIZE(ads8684_channels),
>>> +    },
>>> +    [ID_ADS8688] =3D {
>>> +        .channels =3D ads8688_channels,
>>> +        .num_channels =3D ARRAY_SIZE(ads8688_channels),
>>> +    },
>>> +};
>>> +
>>> +static int ads8688_probe(struct spi_device *spi)
>>> +{
>>> +    struct ads8688_state *st;
>>> +    struct iio_dev *indio_dev;
>>> +    int ret;
>>> +
>>> +    indio_dev =3D devm_iio_device_alloc(&spi->dev, sizeof(*st));
>>> +    if (indio_dev =3D=3D NULL)
>>> +        return -ENOMEM;
>>> +
>>> +    st =3D iio_priv(indio_dev);
>>> +
>>> +    if (spi->dev.of_node && of_property_read_bool(spi->dev.of_node=
,
>>> +        "vref-supply")) {
>>> +        st->reg =3D devm_regulator_get(&spi->dev, "vref");
>>> +        if (!IS_ERR(st->reg)) {
>>> +            ret =3D regulator_enable(st->reg);
>>> +            if (ret)
>>> +                return ret;
>>> +
>>> +            ret =3D regulator_get_voltage(st->reg);
>>> +            if (ret < 0)
>>> +                goto error_out;
>>> +
>>> +            st->vref_mv =3D ret / 1000;
>>> +        }
>>> +    } else {
>>> +        /* Use internal reference */
>>> +        st->vref_mv =3D ADS8688_VREF_MV;
>>> +    }
>>> +
>>> +    st->chip_info =3D    &ads8688_chip_info_tbl[spi_get_device_id(=
spi)->driver_data];
>>> +
>>> +    spi->mode =3D SPI_MODE_1;
>>> +
>>> +    spi_set_drvdata(spi, indio_dev);
>>> +
>>> +    st->spi =3D spi;
>>> +
>>> +    indio_dev->name =3D spi_get_device_id(spi)->name;
>>> +    indio_dev->dev.parent =3D &spi->dev;
>>> +    indio_dev->modes =3D INDIO_DIRECT_MODE;
>>> +    indio_dev->channels =3D st->chip_info->channels;
>>> +    indio_dev->num_channels =3D st->chip_info->num_channels;
>>> +    indio_dev->info =3D &ads8688_info;
>>> +
>>> +    ads8688_reset(indio_dev);
>>> +
>>> +    ret =3D iio_device_register(indio_dev);
>>> +    if (ret)
>>> +        goto error_out;
>>> +
>>> +    return 0;
>>> +
>>> +error_out:
>>> +    if (!IS_ERR_OR_NULL(st->reg))
>>> +        regulator_disable(st->reg);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int ads8688_remove(struct spi_device *spi)
>>> +{
>>> +    struct iio_dev *indio_dev =3D spi_get_drvdata(spi);
>>> +    struct ads8688_state *st =3D iio_priv(indio_dev);
>>> +
>>> +    iio_device_unregister(indio_dev);
>>> +
>>> +    if (!IS_ERR_OR_NULL(st->reg))
>>> +        regulator_disable(st->reg);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct spi_device_id ads8688_id[] =3D {
>>> +    {"ads8684", ID_ADS8684},
>>> +    {"ads8688", ID_ADS8688},
>>> +    {}
>>> +};
>>> +MODULE_DEVICE_TABLE(spi, ads8688_id);
>>> +
>>> +static const struct of_device_id ads8688_of_match[] =3D {
>>> +    { .compatible =3D "ti,ads8684" },
>>> +    { .compatible =3D "ti,ads8688" },
>>> +    { }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, ads8688_of_match);
>>> +
>>> +static struct spi_driver ads8688_driver =3D {
>>> +    .driver =3D {
>>> +        .name    =3D "ads8688",
>>> +        .owner    =3D THIS_MODULE,
>>> +    },
>>> +    .probe        =3D ads8688_probe,
>>> +    .remove        =3D ads8688_remove,
>>> +    .id_table    =3D ads8688_id,
>>> +};
>>> +module_spi_driver(ads8688_driver);
>>> +
>>> +MODULE_AUTHOR("Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>");
>>> +MODULE_DESCRIPTION("Texas Instruments ADS8688 driver");
>>> +MODULE_LICENSE("GPL v2");
>>>
> --=20
> To unsubscribe from this list: send the line "unsubscribe linux-iio" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
