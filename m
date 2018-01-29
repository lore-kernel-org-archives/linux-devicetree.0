From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 10/16] iio: adc: sun4i-gpadc-iio: add
 support for A83T thermal sensor
Date: Mon, 29 Jan 2018 12:53:48 +0100
Message-ID: <94bc070d-8675-95fe-2857-188f7cc66071@gmail.com>
References: <20180128232919.12639-1-embed3d@gmail.com>
 <20180128232919.12639-11-embed3d@gmail.com>
 <20180129094803.uiojqkmaeuihbe4p@flea.lan>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <linux-sunxi+bncBD257DPK24NRBUMWXTJQKGQES3YJHFY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180129094803.uiojqkmaeuihbe4p-ZC1Zs529Oq4@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, edu.molinas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, singhalsimran0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 29.01.2018 10:48, Maxime Ripard wrote:
> On Mon, Jan 29, 2018 at 12:29:13AM +0100, Philipp Rossak wrote:
>> This patch adds support for the A83T ths sensor.
>>
>> The A83T supports interrupts. The interrupt is configured to update the
>> the sensor values every second.
>>
>> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   drivers/iio/adc/sun4i-gpadc-iio.c | 38 ++++++++++++++++++++++++++++++++++++++
>>   include/linux/mfd/sun4i-gpadc.h   | 18 ++++++++++++++++++
>>   2 files changed, 56 insertions(+)
>>
>> diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
>> index 8196203d65fe..9f7895ba1966 100644
>> --- a/drivers/iio/adc/sun4i-gpadc-iio.c
>> +++ b/drivers/iio/adc/sun4i-gpadc-iio.c
>> @@ -170,6 +170,40 @@ static const struct gpadc_data sun8i_h3_ths_data = {
>>   		SUN8I_H3_THS_TEMP_PERIOD(0x7),
>>   };
>>   
>> +static const struct gpadc_data sun8i_a83t_ths_data = {
>> +	.temp_offset = -2724,
>> +	.temp_scale = -70,
>> +	.temp_data = {SUN8I_H3_THS_TDATA0,
>> +		SUN8I_A83T_THS_TDATA1,
>> +		SUN8I_A83T_THS_TDATA2,
>> +		0},
>> +	.sample_start = sunxi_ths_sample_start,
>> +	.sample_end = sunxi_ths_sample_end,
>> +	.sensor_count = 3,
>> +	.supports_nvmem = false,
>> +	.support_irq = true,
>> +	.ctrl0_map = SUN4I_GPADC_CTRL0_T_ACQ(0x1f3),
>> +	.ctrl2_map = SUN8I_H3_THS_ACQ1(0x1f3),
> 
> Where are these values coming from?
> 

These values are calculated with the formulas from the datasheet and 
also tested on hardware. These settings seem ok.

>> +	.sensor_en_map = SUN8I_H3_THS_TEMP_SENSE_EN0 |
>> +		SUN8I_A83T_THS_TEMP_SENSE_EN1 |
>> +		SUN8I_A83T_THS_TEMP_SENSE_EN2,
>> +	.filter_map = SUN4I_GPADC_CTRL3_FILTER_EN |
>> +		SUN4I_GPADC_CTRL3_FILTER_TYPE(0x2),
>> +	.irq_clear_map = SUN8I_H3_THS_INTS_ALARM_INT_0 |
>> +		SUN8I_A83T_THS_INTS_ALARM_INT_1 |
>> +		SUN8I_A83T_THS_INTS_ALARM_INT_2 |
>> +		SUN8I_H3_THS_INTS_SHUT_INT_0  |
>> +		SUN8I_A83T_THS_INTS_SHUT_INT_1  |
>> +		SUN8I_A83T_THS_INTS_SHUT_INT_2  |
>> +		SUN8I_H3_THS_INTS_TDATA_IRQ_0 |
>> +		SUN8I_A83T_THS_INTS_TDATA_IRQ_1 |
>> +		SUN8I_A83T_THS_INTS_TDATA_IRQ_2,
> 
> Do you reall need to clear all these interrupts if you're using only
> one?
> 

No, I don't think so, I will remove them in the next version.

> Maxime
> 

Philipp
