From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [PATCH 2/4] iio: dpot-dac: DAC driver based on a digital
 potentiometer
Date: Thu, 20 Oct 2016 16:51:23 +0200
Message-ID: <430867e6-478d-420a-f2ae-5474a4ebfa0d@axentia.se>
References: <1476955562-13673-1-git-send-email-peda@axentia.se>
 <1476955562-13673-3-git-send-email-peda@axentia.se>
 <alpine.DEB.2.02.1610201254370.19919@pmeerw.net>
 <22d07498-860d-29f8-07ef-ae2f5df6ab25@axentia.se>
 <alpine.DEB.2.02.1610201604280.22512@pmeerw.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1610201604280.22512-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-10-20 16:08, Peter Meerwald-Stadler wrote:
>>>> +	u32 max_ohms;
>>>> +};
>>>> +
>>>> +static const struct iio_chan_spec dpot_dac_iio_channel = {
>>>> +	.type = IIO_VOLTAGE,
>>>> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW)
>>>> +			    | BIT(IIO_CHAN_INFO_SCALE),
>>>> +	.output = 1,
>>>> +};
>>>> +
>>>> +static int dpot_dac_read_raw(struct iio_dev *indio_dev,
>>>> +			     struct iio_chan_spec const *chan,
>>>> +			     int *val, int *val2, long mask)
>>>> +{
>>>> +	struct dpot_dac *dac = iio_priv(indio_dev);
>>>> +	int ret;
>>>> +	unsigned long long tmp;
>>>
>>> s64 (which is used to cast below)
>>
>> I assume that what you really want is to get rid of the cast, and
>> that you aren't really bothered if tmp is ull or s32, right? Given
>> that assumption, I'm just dropping the cast instead. The LL specifier
>> on the constant should promote *val anyway.
> 
> what I meant to pick upon was mixing
> s64 with unsigned long long with LL in the code that follows
> 
> anything simpler and more consistent would be good

Right, I should however note that I copied the pattern from the
industrialio-core.c:iio_format_value function. So, in my defense
I was consistent with that...

Cheers,
Peter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
