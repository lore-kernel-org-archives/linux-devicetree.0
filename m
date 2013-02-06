From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: Update iio_channel_get API to use consumer device
 pointer as argument
Date: Wed, 06 Feb 2013 19:30:17 +0000
Message-ID: <5112AF49.6090100@kernel.org>
References: <1360009566-26347-1-git-send-email-linux@roeck-us.net> <1360009566-26347-2-git-send-email-linux@roeck-us.net> <51104AE7.2020909@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51104AE7.2020909-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/04/2013 11:57 PM, Chanwoo Choi wrote:
> On 02/05/2013 05:26 AM, Guenter Roeck wrote:
>> For iio_channel_get to work with OF based configurations, it needs the
>> consumer device pointer instead of the consumer device name as argument.
>>
>> Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Applied to togreg branch of iio.git.

Thanks all.

I'll hold off on taking the actual device tree patch (2 of this series)
for a day or two to give more time for comments on that.
>> ---
>>   drivers/extcon/extcon-adc-jack.c    |    3 +--
>>   drivers/iio/inkern.c                |   11 ++++++++++-
>>   drivers/power/generic-adc-battery.c |    4 ++--
>>   drivers/power/lp8788-charger.c      |    8 ++++----
>>   include/linux/iio/consumer.h        |    5 +++--
>>   5 files changed, 20 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/extcon/extcon-adc-jack.c b/drivers/extcon/extcon-adc-jack.c
>> index eda2a1a..d0233cd 100644
>> --- a/drivers/extcon/extcon-adc-jack.c
>> +++ b/drivers/extcon/extcon-adc-jack.c
>> @@ -135,8 +135,7 @@ static int adc_jack_probe(struct platform_device *pdev)
>>           ;
>>       data->num_conditions = i;
>>   -    data->chan = iio_channel_get(dev_name(&pdev->dev),
>> -            pdata->consumer_channel);
>> +    data->chan = iio_channel_get(&pdev->dev, pdata->consumer_channel);
>>       if (IS_ERR(data->chan)) {
>>           err = PTR_ERR(data->chan);
>>           goto out;
>> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
>> index c42aba6..b289915 100644
>> --- a/drivers/iio/inkern.c
>> +++ b/drivers/iio/inkern.c
>> @@ -93,7 +93,8 @@ static const struct iio_chan_spec
> Ack for drivers/extcon .
> 
> Acked-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> Thanks,
> Chanwoo Choi
> 
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
