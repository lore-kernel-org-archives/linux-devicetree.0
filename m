From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv1 1/2] rx51_battery: convert to iio consumer
Date: Sat, 01 Mar 2014 11:22:53 +0000
Message-ID: <5311C30D.4070808@kernel.org>
References: <1393375569-21751-1-git-send-email-sre@debian.org> <1393375569-21751-2-git-send-email-sre@debian.org> <5311C1C8.3090809@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5311C1C8.3090809-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?ISO-8859-1?Q?Pali_Roh=E1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/03/14 11:17, Jonathan Cameron wrote:
> On 26/02/14 00:46, Sebastian Reichel wrote:
>> Update rx51-battery driver to use the new IIO API of
>> twl4030-madc and add DT support.
>>
>> Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> The error handling needs tidying up.
> Otherwise this looks fine to me.  Note that you (really me)
> may get some grief over the DT bindings.  Theoretically we have
> been planning to rewrite those entirely for some time...

It's a longer term point, but it does rather feel like it ought
to be possible to write a generic battery driver sometime down
the line where any conversion characteristics would be in the device
tree.  Definitely a question for the future though!

>> ---
>>   drivers/power/rx51_battery.c | 68 +++++++++++++++++++++++++++++---------------
>>   1 file changed, 45 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/power/rx51_battery.c b/drivers/power/rx51_battery.c
>> index 1bc5857..f7cb58e 100644
>> --- a/drivers/power/rx51_battery.c
>> +++ b/drivers/power/rx51_battery.c
>> @@ -24,34 +24,27 @@
>>   #include <linux/power_supply.h>
>>   #include <linux/slab.h>
>>   #include <linux/i2c/twl4030-madc.h>
>> -
>> -/* RX51 specific channels */
>> -#define TWL4030_MADC_BTEMP_RX51    TWL4030_MADC_ADCIN0
>> -#define TWL4030_MADC_BCI_RX51    TWL4030_MADC_ADCIN4
>> +#include <linux/iio/consumer.h>
>> +#include <linux/of.h>
>>
>>   struct rx51_device_info {
>>       struct device *dev;
>>       struct power_supply bat;
>> +    struct iio_channel *channel_temp;
>> +    struct iio_channel *channel_bsi;
>> +    struct iio_channel *channel_vbat;
>>   };
>>
>>   /*
>>    * Read ADCIN channel value, code copied from maemo kernel
>>    */
>> -static int rx51_battery_read_adc(int channel)
>> +static int rx51_battery_read_adc(struct iio_channel *channel)
>>   {
>> -    struct twl4030_madc_request req;
>> -
>> -    req.channels = channel;
>> -    req.do_avg = 1;
>> -    req.method = TWL4030_MADC_SW1;
>> -    req.func_cb = NULL;
>> -    req.type = TWL4030_MADC_WAIT;
>> -    req.raw = true;
>> -
>> -    if (twl4030_madc_conversion(&req) <= 0)
>> -        return -ENODATA;
>> -
>> -    return req.rbuf[ffs(channel) - 1];
>> +    int val, err;
>> +    err = iio_read_channel_average_raw(channel, &val);
>> +    if (err < 0)
>> +        return err;
>> +    return val;
>>   }
>>
>>   /*
>> @@ -60,10 +53,12 @@ static int rx51_battery_read_adc(int channel)
>>    */
>>   static int rx51_battery_read_voltage(struct rx51_device_info *di)
>>   {
>> -    int voltage = rx51_battery_read_adc(TWL4030_MADC_VBAT);
>> +    int voltage = rx51_battery_read_adc(di->channel_vbat);
>>
>> -    if (voltage < 0)
>> +    if (voltage < 0) {
>> +        dev_err(di->dev, "Could not read ADC: %d\n", voltage);
>>           return voltage;
>> +    }
>>
>>       return 1000 * (10000 * voltage / 1705);
>>   }
>> @@ -112,7 +107,10 @@ static int rx51_battery_read_temperature(struct rx51_device_info *di)
>>   {
>>       int min = 0;
>>       int max = ARRAY_SIZE(rx51_temp_table2) - 1;
>> -    int raw = rx51_battery_read_adc(TWL4030_MADC_BTEMP_RX51);
>> +    int raw = rx51_battery_read_adc(di->channel_temp);
>> +
>> +    if (raw < 0)
>> +        dev_err(di->dev, "Could not read ADC: %d\n", raw);
>>
>>       /* Zero and negative values are undefined */
>>       if (raw <= 0)
>> @@ -146,10 +144,12 @@ static int rx51_battery_read_temperature(struct rx51_device_info *di)
>>    */
>>   static int rx51_battery_read_capacity(struct rx51_device_info *di)
>>   {
>> -    int capacity = rx51_battery_read_adc(TWL4030_MADC_BCI_RX51);
>> +    int capacity = rx51_battery_read_adc(di->channel_bsi);
>>
>> -    if (capacity < 0)
>> +    if (capacity < 0) {
>> +        dev_err(di->dev, "Could not read ADC: %d\n", capacity);
>>           return capacity;
>> +    }
>>
>>       return 1280 * (1200 * capacity)/(1024 - capacity);
>>   }
>> @@ -213,12 +213,25 @@ static int rx51_battery_probe(struct platform_device *pdev)
>>
>>       platform_set_drvdata(pdev, di);
>>
>> +    di->dev = &pdev->dev;
>>       di->bat.name = dev_name(&pdev->dev);
>>       di->bat.type = POWER_SUPPLY_TYPE_BATTERY;
>>       di->bat.properties = rx51_battery_props;
>>       di->bat.num_properties = ARRAY_SIZE(rx51_battery_props);
>>       di->bat.get_property = rx51_battery_get_property;
>>
>> +    di->channel_temp = iio_channel_get(di->dev, "temp");
>> +    if (IS_ERR(di->channel_temp))
>> +        return PTR_ERR(di->channel_temp);
>> +
>> +    di->channel_bsi  = iio_channel_get(di->dev, "bsi");
>> +    if (IS_ERR(di->channel_bsi))
>> +        return PTR_ERR(di->channel_bsi);
> You need to unwind the iio_channel_get that did succeed if we get here.
> Otherwise references to the iio driver will still be held despite
> this driver failing to probe.
>
>> +
>> +    di->channel_vbat = iio_channel_get(di->dev, "vbat");
>> +    if (IS_ERR(di->channel_vbat))
>> +        return PTR_ERR(di->channel_vbat);
>> +
>>       ret = power_supply_register(di->dev, &di->bat);
>>       if (ret)
>>           return ret;
>> @@ -235,12 +248,21 @@ static int rx51_battery_remove(struct platform_device *pdev)
>>       return 0;
>>   }
>>
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id n900_battery_of_match[] = {
>> +    {.compatible = "nokia,n900-battery", },
>> +    { },
>> +};
>> +MODULE_DEVICE_TABLE(of, n900_battery_of_match);
>> +#endif
>> +
>>   static struct platform_driver rx51_battery_driver = {
>>       .probe = rx51_battery_probe,
>>       .remove = rx51_battery_remove,
>>       .driver = {
>>           .name = "rx51-battery",
>>           .owner = THIS_MODULE,
>> +        .of_match_table = of_match_ptr(n900_battery_of_match),
>>       },
>>   };
>>   module_platform_driver(rx51_battery_driver);
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
