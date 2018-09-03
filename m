From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 05/30] iio: adc: move SUN4I_GPADC_CHANNEL
 define to header file
Date: Mon, 3 Sep 2018 16:24:32 +0200
Message-ID: <882cb5f9-867b-d120-5ef5-80a8bee2d628@gmail.com>
References: <20180830154518.29507-1-embed3d@gmail.com>
 <20180830154518.29507-6-embed3d@gmail.com>
 <20180902210109.7bd4a567@archlinux>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <linux-sunxi+bncBD257DPK24NRBI4IWXOAKGQEUS3XNIY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180902210109.7bd4a567@archlinux>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02.09.2018 22:01, Jonathan Cameron wrote:
> On Thu, 30 Aug 2018 17:44:53 +0200
> Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>> We are moving the SUN4I_GPADC_CHANNEL define to the header file.
> Maxime has raised this point in other patches...
> 
> Why?  Obvious what but I have no idea why you are doing this.
> 
> Thanks,
> 
> Jonathan
There are two reasons:
1. Personal taste: I like to have the #define stuff in the header file.
2. When I started the rework I had to get some better overview, so I 
moved it...

Since those two reasons are no good reasons to submit a patch I will 
drop it and keep it in the *.c file.

Philipp

>>
>> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   drivers/iio/adc/sun4i-gpadc-iio.c | 9 ---------
>>   include/linux/mfd/sun4i-gpadc.h   | 9 +++++++++
>>   2 files changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
>> index d95dd0fde2a6..666329940e1e 100644
>> --- a/drivers/iio/adc/sun4i-gpadc-iio.c
>> +++ b/drivers/iio/adc/sun4i-gpadc-iio.c
>> @@ -109,15 +109,6 @@ struct sun4i_gpadc_iio {
>>   	struct device			*sensor_device;
>>   };
>>   
>> -#define SUN4I_GPADC_ADC_CHANNEL(_channel, _name) {		\
>> -	.type = IIO_VOLTAGE,					\
>> -	.indexed = 1,						\
>> -	.channel = _channel,					\
>> -	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
>> -	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
>> -	.datasheet_name = _name,				\
>> -}
>> -
>>   static struct iio_map sun4i_gpadc_hwmon_maps[] = {
>>   	{
>>   		.adc_channel_label = "temp_adc",
>> diff --git a/include/linux/mfd/sun4i-gpadc.h b/include/linux/mfd/sun4i-gpadc.h
>> index 139872c2e0fe..54c7c9375c1b 100644
>> --- a/include/linux/mfd/sun4i-gpadc.h
>> +++ b/include/linux/mfd/sun4i-gpadc.h
>> @@ -90,6 +90,15 @@
>>   /* 10s delay before suspending the IP */
>>   #define SUN4I_GPADC_AUTOSUSPEND_DELAY			10000
>>   
>> +#define SUN4I_GPADC_ADC_CHANNEL(_channel, _name) {		\
>> +	.type = IIO_VOLTAGE,					\
>> +	.indexed = 1,						\
>> +	.channel = _channel,					\
>> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
>> +	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
>> +	.datasheet_name = _name,				\
>> +}
>> +
>>   struct sun4i_gpadc_dev {
>>   	struct device			*dev;
>>   	struct regmap			*regmap;
> 
