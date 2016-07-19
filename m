From: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iio: adc: add ADC12130/ADC12132/ADC12138 ADC driver
Date: Wed, 20 Jul 2016 01:24:33 +0900
Message-ID: <CAC5umyjV0cUG3ovfqDy8nyDZYz_yYTwxnp7ti1T_xvz=FjWSNQ@mail.gmail.com>
References: <1468854029-22153-1-git-send-email-akinobu.mita@gmail.com> <alpine.DEB.2.02.1607182348340.25263@pmeerw.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1607182348340.25263-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2016-07-19 7:02 GMT+09:00 Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>:
>
>> This adds Texas Instruments' ADC12130/ADC12132/ADC12138 12-bit plus
>> sign ADC driver.  I have tested with the ADC12138.  The ADC12130 and
>> ADC12132 are not tested but these are similar to ADC12138 except tha=
t
>> the mode programming instruction is a bit different.
>
> minor comments below
>
>> Signed-off-by: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
>> Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
>> Cc: Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
>> ---
>>  .../devicetree/bindings/iio/adc/ti-adc12138.txt    |  32 ++
>>  drivers/iio/adc/Kconfig                            |  12 +
>>  drivers/iio/adc/Makefile                           |   1 +
>>  drivers/iio/adc/ti-adc12138.c                      | 541 ++++++++++=
+++++++++++
>>  4 files changed, 586 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-adc=
12138.txt
>>  create mode 100644 drivers/iio/adc/ti-adc12138.c
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/ti-adc12138.t=
xt b/Documentation/devicetree/bindings/iio/adc/ti-adc12138.txt
>> new file mode 100644
>> index 0000000..3a11d2a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/ti-adc12138.txt
>> @@ -0,0 +1,32 @@
>> +* Texas Instruments' ADC12130/ADC12132/ADC12138
>> +
>> +Required properties:
>> + - compatible: Should be one of
>> +     * "ti,adc12130"
>> +     * "ti,adc12132"
>> +     * "ti,adc12138"
>> + - reg: SPI chip select number for the device
>> + - interrupts: Should contain interrupt for EOC (end of conversion)
>> + - clocks: phandle to conversion clock input
>> + - spi-max-frequency: Definision as per
>> +     Documentation/devicetree/bindings/spi/spi-bus.txt
>> + - vref-p-supply: The regulator supply for positive analog voltage =
reference
>> +
>> +Optional properties:
>> + - vref-n-supply: The regulator supply for negative analog voltage =
reference
>> +     If not specified, this is assumed to be analog ground.
>> + - acquisition-time: The number of conversion clock periods for the=
 S/H's
>> +     acquisition time.  Should be one of 6, 10, 18, 34.  If not spe=
cified,
>> +     default value of 10 is used.
>> +
>> +Example:
>> +adc@0 {
>> +     compatible =3D "ti,adc12138";
>> +     reg =3D <0>;
>> +     interrupts =3D <28 IRQ_TYPE_EDGE_RISING>;
>> +     interrupt-parent =3D <&gpio1>;
>> +     clocks =3D <&cclk>;
>> +     vref-p-supply =3D <&ldo4_reg>;
>> +     spi-max-frequency =3D <5000000>;
>> +     acquisition-time =3D <6>;
>> +};
>> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
>> index fa0ff29..0783291 100644
>> --- a/drivers/iio/adc/Kconfig
>> +++ b/drivers/iio/adc/Kconfig
>> @@ -414,6 +414,18 @@ config TI_ADC0832
>>         This driver can also be built as a module. If so, the module=
 will be
>>         called ti-adc0832.
>>
>> +config TI_ADC12138
>> +     tristate "Texas Instruments ADC12130/ADC12132/ADC12138"
>> +     depends on SPI
>> +     select IIO_BUFFER
>> +     select IIO_TRIGGERED_BUFFER
>> +     help
>> +       If you say yes here you get support for Texas Instruments AD=
C12130,
>> +       ADC12132and ADC12138 chips.
>
> space before 'and' missing

Ugh.

>> +
>> +       This driver can also be built as a module. If so, the module=
 will be
>> +       called ti-adc12138.
>> +
>>  config TI_ADC128S052
>>       tristate "Texas Instruments ADC128S052/ADC122S021/ADC124S021"
>>       depends on SPI
>> diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
>> index 599714b..3ae4ae3 100644
>> --- a/drivers/iio/adc/Makefile
>> +++ b/drivers/iio/adc/Makefile
>> @@ -40,6 +40,7 @@ obj-$(CONFIG_QCOM_SPMI_VADC) +=3D qcom-spmi-vadc.o
>>  obj-$(CONFIG_ROCKCHIP_SARADC) +=3D rockchip_saradc.o
>>  obj-$(CONFIG_TI_ADC081C) +=3D ti-adc081c.o
>>  obj-$(CONFIG_TI_ADC0832) +=3D ti-adc0832.o
>> +obj-$(CONFIG_TI_ADC12138) +=3D ti-adc12138.o
>>  obj-$(CONFIG_TI_ADC128S052) +=3D ti-adc128s052.o
>>  obj-$(CONFIG_TI_ADS1015) +=3D ti-ads1015.o
>>  obj-$(CONFIG_TI_ADS8688) +=3D ti-ads8688.o
>> diff --git a/drivers/iio/adc/ti-adc12138.c b/drivers/iio/adc/ti-adc1=
2138.c
>> new file mode 100644
>> index 0000000..e7bd986
>> --- /dev/null
>> +++ b/drivers/iio/adc/ti-adc12138.c
>> @@ -0,0 +1,541 @@
>> +/*
>> + * ADC12130/ADC12132/ADC12138 12-bit plus sign ADC driver
>> + *
>> + * Copyright (c) 2016 Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> + *
>> + * This file is subject to the terms and conditions of version 2 of
>> + * the GNU General Public License.  See the file COPYING in the mai=
n
>> + * directory of this archive for more details.
>> + *
>> + * Datasheet: http://www.ti.com/lit/ds/symlink/adc12138.pdf
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/completion.h>
>> +#include <linux/clk.h>
>> +#include <linux/spi/spi.h>
>> +#include <linux/iio/iio.h>
>> +#include <linux/iio/buffer.h>
>> +#include <linux/iio/trigger.h>
>> +#include <linux/iio/triggered_buffer.h>
>> +#include <linux/iio/trigger_consumer.h>
>> +#include <linux/regulator/consumer.h>
>> +
>> +#define ADC12138_MODE_AUTO_CAL                       0x08
>> +#define ADC12138_MODE_READ_STATUS            0x0c
>> +#define ADC12138_MODE_ACQUISITION_TIME_6     0x0e
>> +#define ADC12138_MODE_ACQUISITION_TIME_10    0x4e
>> +#define ADC12138_MODE_ACQUISITION_TIME_18    0x8e
>> +#define ADC12138_MODE_ACQUISITION_TIME_34    0xce
>> +
>> +#define ADC12138_STATUS_CAL                  BIT(6)
>> +
>> +enum {
>> +     adc12130,
>> +     adc12132,
>> +     adc12138,
>> +};
>> +
>> +struct adc12138 {
>> +     struct spi_device *spi;
>> +     unsigned int id;
>> +     /* conversion clock */
>> +     struct clk *cclk;
>> +     /* positive analog voltage reference */
>> +     struct regulator *vref_p;
>> +     /* negative analog voltage reference */
>> +     struct regulator *vref_n;
>> +     struct mutex lock;
>> +     struct completion complete;
>> +     unsigned int acquisition_time;
>
> unit? ms? =C2=B5s?

This is specified by the number of conversion clock (cclk) periods.
I'll add a comment about it.

>> +
>> +     u8 tx_buf[2] ____cacheline_aligned;
>> +     u8 rx_buf[2];
>> +};
>> +
>> +#define ADC12138_VOLTAGE_CHANNEL(chan)                             =
          \
>> +     {                                                             =
  \
>> +             .type =3D IIO_VOLTAGE,                                =
    \
>> +             .indexed =3D 1,                                       =
    \
>> +             .channel =3D chan,                                    =
    \
>> +             .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),       =
    \
>> +             .info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE)=
    \
>> +                                     | BIT(IIO_CHAN_INFO_OFFSET),  =
  \
>> +             .scan_index =3D chan,                                 =
    \
>> +             .scan_type =3D {                                      =
    \
>> +                     .sign =3D 's',                                =
    \
>> +                     .realbits =3D 13,                             =
    \
>> +                     .storagebits =3D 16,                          =
    \
>> +                     .shift =3D 3,                                 =
    \
>> +                     .endianness =3D IIO_BE,                       =
    \
>> +             },                                                    =
  \
>> +     }
>> +
>> +#define ADC12138_VOLTAGE_CHANNEL_DIFF(chan1, chan2, si_offset)     =
          \
>> +     {                                                             =
  \
>> +             .type =3D IIO_VOLTAGE,                                =
    \
>> +             .indexed =3D 1,                                       =
    \
>> +             .channel =3D (chan1),                                 =
    \
>> +             .channel2 =3D (chan2),                                =
    \
>> +             .differential =3D 1,                                  =
    \
>> +             .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),       =
    \
>> +             .info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE)=
    \
>> +                                     | BIT(IIO_CHAN_INFO_OFFSET),  =
  \
>> +             .scan_index =3D (chan1) + (si_offset),                =
    \
>> +             .scan_type =3D {                                      =
    \
>> +                     .sign =3D 's',                                =
    \
>> +                     .realbits =3D 13,                             =
    \
>> +                     .storagebits =3D 16,                          =
    \
>> +                     .shift =3D 3,                                 =
    \
>> +                     .endianness =3D IIO_BE,                       =
    \
>> +             },                                                    =
  \
>> +     }
>> +
>> +static const struct iio_chan_spec adc12132_channels[] =3D {
>> +     ADC12138_VOLTAGE_CHANNEL(0),
>> +     ADC12138_VOLTAGE_CHANNEL(1),
>> +     ADC12138_VOLTAGE_CHANNEL_DIFF(0, 1, 2),
>> +     ADC12138_VOLTAGE_CHANNEL_DIFF(1, 0, 2),
>> +     IIO_CHAN_SOFT_TIMESTAMP(4),
>> +};
>> +
>> +static const struct iio_chan_spec adc12138_channels[] =3D {
>> +     ADC12138_VOLTAGE_CHANNEL(0),
>> +     ADC12138_VOLTAGE_CHANNEL(1),
>> +     ADC12138_VOLTAGE_CHANNEL(2),
>> +     ADC12138_VOLTAGE_CHANNEL(3),
>> +     ADC12138_VOLTAGE_CHANNEL(4),
>> +     ADC12138_VOLTAGE_CHANNEL(5),
>> +     ADC12138_VOLTAGE_CHANNEL(6),
>> +     ADC12138_VOLTAGE_CHANNEL(7),
>> +     ADC12138_VOLTAGE_CHANNEL_DIFF(0, 1, 8),
>> +     ADC12138_VOLTAGE_CHANNEL_DIFF(1, 0, 8),
>> +     ADC12138_VOLTAGE_CHANNEL_DIFF(2, 3, 8),
>> +     ADC12138_VOLTAGE_CHANNEL_DIFF(3, 2, 8),
>> +     ADC12138_VOLTAGE_CHANNEL_DIFF(4, 5, 8),
>> +     ADC12138_VOLTAGE_CHANNEL_DIFF(5, 4, 8),
>> +     ADC12138_VOLTAGE_CHANNEL_DIFF(6, 7, 8),
>> +     ADC12138_VOLTAGE_CHANNEL_DIFF(7, 6, 8),
>> +     IIO_CHAN_SOFT_TIMESTAMP(16),
>> +};
>> +
>> +static int adc12138_mode_programming(struct adc12138 *adc, u8 mode,
>> +                                  void *rx_buf, int len)
>> +{
>> +     struct spi_transfer xfer =3D {
>> +             .tx_buf =3D adc->tx_buf,
>> +             .rx_buf =3D adc->rx_buf,
>> +             .len =3D len,
>> +     };
>> +     int ret;
>> +
>> +     /* Skip disused bits for ADC12130 and ADC12132 */
>
> probably 'unused' instead of 'disused'

OK.

>> +     if (adc->id !=3D adc12138)
>> +             mode =3D (mode & 0xc0) | ((mode & 0x0f) << 2);
>> +
>> +     adc->tx_buf[0] =3D mode;
>> +
>> +     ret =3D spi_sync_transfer(adc->spi, &xfer, 1);
>> +     if (ret)
>> +             return ret;
>> +
>> +     memcpy(rx_buf, adc->rx_buf, len);
>> +
>> +     return 0;
>> +}
>> +
>> +static int adc12138_read_status(struct adc12138 *adc)
>> +{
>> +     u8 rx_buf[2];
>> +     int ret;
>> +
>> +     ret =3D adc12138_mode_programming(adc, ADC12138_MODE_READ_STAT=
US,
>> +                                     rx_buf, 2);
>> +     if (ret)
>> +             return ret;
>> +
>> +     return (rx_buf[0] << 1) | (rx_buf[1] >> 7);
>> +}
>> +
>> +static int __adc12138_start_conv(struct adc12138 *adc,
>> +                              struct iio_chan_spec const *channel,
>> +                              void *data, int len)
>> +
>> +{
>> +     const u8 ch_to_mux[] =3D { 0, 4, 1, 5, 2, 6, 3, 7 };
>> +     u8 mode =3D (ch_to_mux[channel->channel] << 4) |
>> +               (channel->differential ? 0 : 0x80);
>> +
>> +     return adc12138_mode_programming(adc, mode, data, len);
>> +}
>> +
>> +static int adc12138_start_conv(struct adc12138 *adc,
>> +                            struct iio_chan_spec const *channel)
>> +{
>> +     u8 trash;
>> +
>> +     return __adc12138_start_conv(adc, channel, &trash, 1);
>> +}
>> +
>> +static int adc12138_start_and_read_conv(struct adc12138 *adc,
>> +                                     struct iio_chan_spec const *ch=
annel,
>> +                                     __be16 *data)
>> +{
>> +     return __adc12138_start_conv(adc, channel, data, 2);
>> +}
>> +
>> +static int adc12138_read_conv_data(struct adc12138 *adc, __be16 *va=
lue)
>> +{
>> +     /* Issue a read status instruction and read previous conversio=
n data */
>> +     return adc12138_mode_programming(adc, ADC12138_MODE_READ_STATU=
S,
>> +                                      value, sizeof(*value));
>> +}
>> +
>> +static int adc12138_wait_eoc(struct adc12138 *adc, unsigned long ti=
meout)
>> +{
>> +     if (!wait_for_completion_timeout(&adc->complete, timeout))
>> +             return -ETIMEDOUT;
>> +
>> +     return 0;
>> +}
>> +
>> +static int adc12138_adc_conversion(struct adc12138 *adc,
>> +                                struct iio_chan_spec const *channel=
,
>> +                                __be16 *value)
>> +{
>> +     int ret;
>> +
>> +     reinit_completion(&adc->complete);
>> +
>> +     ret =3D adc12138_start_conv(adc, channel);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret =3D adc12138_wait_eoc(adc, msecs_to_jiffies(100));
>> +     if (ret)
>> +             return ret;
>> +
>> +     return adc12138_read_conv_data(adc, value);
>> +}
>> +
>> +static int adc12138_read_raw(struct iio_dev *iio,
>> +                          struct iio_chan_spec const *channel, int =
*value,
>> +                          int *shift, long mask)
>> +{
>> +     struct adc12138 *adc =3D iio_priv(iio);
>> +     int ret;
>> +     __be16 data;
>> +
>> +     switch (mask) {
>> +     case IIO_CHAN_INFO_RAW:
>
> what if buffered reads have been set up? probably use
> iio_device_claim_direct_mode()

Maybe it is safe because the ADC data is always requested and retrieved
while holding adc12138.lock from adc12138_read_raw() and
adc12138_trigger_handler().  Is it better to restrict direct mode and
return -EBUSY while buffer mode is enabled?

(BTW, I realized that I can use iio_dev->mlock instead of adc12138.lock=
)

>> +             mutex_lock(&adc->lock);
>> +             ret =3D adc12138_adc_conversion(adc, channel, &data);
>> +             mutex_unlock(&adc->lock);
>> +             if (ret)
>> +                     return ret;
>> +
>> +             *value =3D sign_extend32(be16_to_cpu(data) >> 3, 12);
>> +
>> +             return IIO_VAL_INT;
>> +     case IIO_CHAN_INFO_SCALE:
>> +             ret =3D regulator_get_voltage(adc->vref_p);
>> +             if (ret < 0)
>> +                     return ret;
>> +             *value =3D ret;
>> +
>> +             if (!IS_ERR(adc->vref_n)) {
>> +                     ret =3D regulator_get_voltage(adc->vref_n);
>> +                     if (ret < 0)
>> +                             return ret;
>> +                     *value -=3D ret;
>> +             }
>> +
>> +             /* convert regulator output voltage to mV */
>> +             *value /=3D 1000;
>> +             *shift =3D channel->scan_type.realbits - 1;
>> +
>> +             return IIO_VAL_FRACTIONAL_LOG2;
>> +     case IIO_CHAN_INFO_OFFSET:
>> +             if (!IS_ERR(adc->vref_n)) {
>> +                     *value =3D regulator_get_voltage(adc->vref_n);
>> +                     if (*value < 0)
>> +                             return *value;
>> +             } else {
>> +                     *value =3D 0;
>> +             }
>> +
>> +             /* convert regulator output voltage to mV */
>> +             *value /=3D 1000;
>> +
>> +             return IIO_VAL_INT;
>> +     }
>> +
>> +     return -EINVAL;
>> +}
>> +
>> +static const struct iio_info adc12138_info =3D {
>> +     .read_raw =3D adc12138_read_raw,
>> +     .driver_module =3D THIS_MODULE,
>> +};
>> +
>> +static int adc12138_init(struct adc12138 *adc)
>> +{
>> +     int ret;
>> +     int status;
>> +     u8 mode;
>> +     u8 trash;
>> +
>> +     reinit_completion(&adc->complete);
>> +
>> +     ret =3D adc12138_mode_programming(adc, ADC12138_MODE_AUTO_CAL,=
 &trash, 1);
>> +     if (ret)
>> +             return ret;
>> +
>> +     /* data output at this time has no significance */
>> +     status =3D adc12138_read_status(adc);
>> +     if (status < 0)
>> +             return status;
>> +
>> +     adc12138_wait_eoc(adc, msecs_to_jiffies(100));
>> +
>> +     status =3D adc12138_read_status(adc);
>> +     if (status & ADC12138_STATUS_CAL) {
>> +             dev_warn(&adc->spi->dev,
>> +                     "Auto Cal sequence is still in progress: %#x\n=
",
>> +                     status);
>> +             return -EIO;
>> +     }
>> +
>> +     switch (adc->acquisition_time) {
>> +     case 6:
>> +             mode =3D ADC12138_MODE_ACQUISITION_TIME_6;
>> +             break;
>> +     case 10:
>> +             mode =3D ADC12138_MODE_ACQUISITION_TIME_10;
>> +             break;
>> +     case 18:
>> +             mode =3D ADC12138_MODE_ACQUISITION_TIME_18;
>> +             break;
>> +     case 34:
>> +             mode =3D ADC12138_MODE_ACQUISITION_TIME_34;
>> +             break;
>> +     default:
>> +             return -EINVAL;
>> +     }
>> +
>> +     return adc12138_mode_programming(adc, mode, &trash, 1);
>> +}
>> +
>> +static irqreturn_t adc12138_trigger_handler(int irq, void *p)
>> +{
>> +     struct iio_poll_func *pf =3D p;
>> +     struct iio_dev *indio_dev =3D pf->indio_dev;
>> +     struct adc12138 *adc =3D iio_priv(indio_dev);
>> +     __be16 data[20] =3D { };
>
> why { } here?

To initialize with zero and avoids exposing kernel stack to userspace
through padding entries.  I could use memset here.

> why 20?

When all scan elements are enabled, the sample data requires 40 bytes
(2 bytes ADC data * 16 channels + 8 bytes timestamp).

I'll add comments about these.

>> +     __be16 trash;
>> +     int ret;
>> +     int scan_index;
>> +     int i =3D 0;
>> +
>> +     mutex_lock(&adc->lock);
>> +
>> +     for_each_set_bit(scan_index, indio_dev->active_scan_mask,
>> +                      indio_dev->masklength) {
>> +             const struct iio_chan_spec *scan_chan =3D
>> +                             &indio_dev->channels[scan_index];
>> +
>> +             reinit_completion(&adc->complete);
>> +
>> +             ret =3D adc12138_start_and_read_conv(adc, scan_chan,
>> +                                                i ? &data[i - 1] : =
&trash);
>> +             if (ret) {
>> +                     dev_warn(&adc->spi->dev,
>> +                              "failed to start conversion\n");
>> +                     goto out;
>> +             }
>> +
>> +             ret =3D adc12138_wait_eoc(adc, msecs_to_jiffies(100));
>> +             if (ret) {
>> +                     dev_warn(&adc->spi->dev, "wait eoc timeout\n")=
;
>> +                     goto out;
>> +             }
>> +
>> +             i++;
>> +     }
>> +
>> +     if (i) {
>> +             ret =3D adc12138_read_conv_data(adc, &data[i - 1]);
>> +             if (ret) {
>> +                     dev_warn(&adc->spi->dev,
>> +                              "failed to get conversion data\n");
>> +                     goto out;
>> +             }
>> +     }
>> +
>> +     iio_push_to_buffers_with_timestamp(indio_dev, data, iio_get_ti=
me_ns());
>> +out:
>> +     mutex_unlock(&adc->lock);
>> +
>> +     iio_trigger_notify_done(indio_dev->trig);
>> +
>> +     return IRQ_HANDLED;
>> +}
