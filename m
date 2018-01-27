From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH 10/16] iio: adc: sun4i-gpadc-iio: add
 support for A83T thermal sensor
Date: Sat, 27 Jan 2018 05:30:36 +0100
Message-ID: <d00581c9-9e4f-8f01-cb8e-95e7ef17811e@gmail.com>
References: <20180126151941.12183-1-embed3d@gmail.com>
 <20180126151941.12183-11-embed3d@gmail.com>
 <20180126174602.qolcswhqblgmlad7@core.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180126174602.qolcswhqblgmlad7-9v8tmBix7cb9zxVx7UNMDg@public.gmane.org>
Content-Language: en-US
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <x@xff.cz>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, edu.molinas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, singhalsimran0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 26.01.2018 18:46, Ondřej Jirman wrote:
> Hi,
> 
> On Fri, Jan 26, 2018 at 04:19:35PM +0100, Philipp Rossak wrote:
>> This patch adds support for the A83T ths sensor.
>>
>> The A83T does not support interrupts. This seems to be broken.
> 
> Though, you use support_irq = true below. And in my tests, IRQ for THS works on
> A83T.
> 
> regards,
>    o.

Oh I totally forgot to update this commit message, after I fixed the 
devicetree and got it running.
I will fix that in the next version of this patch series.

>> The calibration data is writen at the begin of the init process.
>>
>> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   drivers/iio/adc/sun4i-gpadc-iio.c | 38 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
>> index f2e0ec65c53e..b8693afcdbea 100644
>> --- a/drivers/iio/adc/sun4i-gpadc-iio.c
>> +++ b/drivers/iio/adc/sun4i-gpadc-iio.c
>> @@ -170,6 +170,40 @@ static const struct gpadc_data sun8i_h3_ths_data = {
>>   		SUNXI_THS_TEMP_PERIOD(0x7),
>>   };
>>   
>> +static const struct gpadc_data sun8i_a83t_ths_data = {
>> +	.temp_offset = -2724,
>> +	.temp_scale = -70,
>> +	.temp_data = {SUNXI_THS_TDATA0,
>> +		SUNXI_THS_TDATA1,
>> +		SUNXI_THS_TDATA2,
>> +		0},
>> +	.sample_start = sunxi_ths_sample_start,
>> +	.sample_end = sunxi_ths_sample_end,
>> +	.sensor_count = 3,
>> +	.supports_nvmem = false,
>> +	.support_irq = true,
>> +	.ctrl0_map = SUNXI_THS_ACQ0(0x1f3),
>> +	.ctrl2_map = SUNXI_THS_ACQ1(0x1f3),
>> +	.sensor_en_map = SUNXI_THS_TEMP_SENSE_EN0 |
>> +		SUNXI_THS_TEMP_SENSE_EN1 |
>> +		SUNXI_THS_TEMP_SENSE_EN2,
>> +	.filter_map = SUNXI_THS_FILTER_EN |
>> +		SUNXI_THS_FILTER_TYPE(0x2),
>> +	.irq_clear_map = SUNXI_THS_INTS_ALARM_INT_0 |
>> +		SUNXI_THS_INTS_ALARM_INT_1 |
>> +		SUNXI_THS_INTS_ALARM_INT_2 |
>> +		SUNXI_THS_INTS_SHUT_INT_0  |
>> +		SUNXI_THS_INTS_SHUT_INT_1  |
>> +		SUNXI_THS_INTS_SHUT_INT_2  |
>> +		SUNXI_THS_INTS_TDATA_IRQ_0 |
>> +		SUNXI_THS_INTS_TDATA_IRQ_1 |
>> +		SUNXI_THS_INTS_TDATA_IRQ_2,
>> +	.irq_control_map = SUNXI_THS_INTC_TDATA_IRQ_EN0 |
>> +		SUNXI_THS_INTC_TDATA_IRQ_EN1 |
>> +		SUNXI_THS_INTC_TDATA_IRQ_EN2 |
>> +		SUNXI_THS_TEMP_PERIOD(0x257),
>> +};
>> +
>>   struct sun4i_gpadc_iio {
>>   	struct iio_dev			*indio_dev;
>>   	struct completion		completion;
>> @@ -672,6 +706,10 @@ static const struct of_device_id sun4i_gpadc_of_id[] = {
>>   		.compatible = "allwinner,sun8i-h3-ths",
>>   		.data = &sun8i_h3_ths_data,
>>   	},
>> +	{
>> +		.compatible = "allwinner,sun8i-a83t-ths",
>> +		.data = &sun8i_a83t_ths_data,
>> +	},
>>   	{ /* sentinel */ }
>>   };
>>   
>> -- 
>> 2.11.0
>>
>> -- 
>> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
>> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>> For more options, visit https://groups.google.com/d/optout.

Thanks,
Philipp
