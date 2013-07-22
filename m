From: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
Subject: Re: [PATCH v2 5/5] iio: mxs-lradc: add write_raw function to modify
 scale
Date: Mon, 22 Jul 2013 10:01:36 +0200
Message-ID: <51ECE6E0.1030509@digi.com>
References: <1374225208-28940-1-git-send-email-hector.palacios@digi.com> <1374225208-28940-6-git-send-email-hector.palacios@digi.com> <201307191639.01240.marex@denx.de> <51E95BEC.5080703@digi.com> <51E9A240.3000108@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51E9A240.3000108-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org" <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jonathan,

On 07/19/2013 10:32 PM, Jonathan Cameron wrote:
>>>> @@ -323,6 +326,54 @@ static int mxs_lradc_read_raw(struct iio_dev *iio_dev,
>>>>        return ret;
>>>>    }
>>>>
>>>> +static int mxs_lradc_write_raw(struct iio_dev *iio_dev,
>>>> +                   const struct iio_chan_spec *chan,
>>>> +                   int val, int val2, long m)
>>>> +{
>>>> +    struct mxs_lradc *lradc = iio_priv(iio_dev);
>>>> +    int ret;
>>>> +
>>>> +    ret = mutex_trylock(&lradc->lock);
>>>> +    if (!ret)
>>>> +        return -EBUSY;
>>>> +
>>>> +    switch (m) {
>>>> +    case IIO_CHAN_INFO_SCALE:
>>>> +        ret = -EINVAL;
>>>> +        if (val == lradc->scale_avail[chan->channel][0][0] &&
>>>> +            val2 == lradc->scale_avail[chan->channel][0][1]) {
>>>> +            /* [0] -> divider by two disabled */
>>>
>>> This comment is confusing, you use [0] in different dimensions of the array. So
>>> is the stuff below.
>>>
>>> Still, how does this even work, can you show me and example how to set the
>>> divider from userland ? Sorry, I'm a bit confused with this 3D-business here,
>>> even if the comment in previous patch made it a bit clearer. Actually you can
>>> use some #define to specify if you're accessing div/2 or div/1 portion of the
>>> array to make it more readable.
>>>
>>> Like ... scale_avail[chan->channel][LRADC_DIV_BY_2][LRADC_DECIMAL_PART] ...
>>> would by nice.
>>
>> Agreed.
> Could even make the int + nano part a structure then you could have
> scale_avail[chan->channel][LRADC_DIV_BY_2].integer / .nano
>
> might not be worth the hassel though for the slight gain in readability.
>
> I'm happy either way.

I prefer the struct approach, it removes one dimension to the array and I find it cleaner.

Best regards,
--
Hector Palacios
