From: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
Subject: Re: [PATCH v2 3/5] iio: mxs-lradc: add scale attribute to channels
Date: Mon, 22 Jul 2013 09:46:22 +0200
Message-ID: <51ECE34E.7050904@digi.com>
References: <1374225208-28940-1-git-send-email-hector.palacios@digi.com> <201307191814.15491.marex@denx.de> <51ECDD9F.4080506@digi.com> <201307220942.08990.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201307220942.08990.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org" <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Marek,

On 07/22/2013 09:42 AM, Marek Vasut wrote:
> Dear Hector Palacios,
>
>> Hi Marek,
>>
>> On 07/19/2013 06:14 PM, Marek Vasut wrote:
>>> Dear Hector Palacios,
>>>
>>>> Dear Marek,
>>>>
>>>> On 07/19/2013 04:30 PM, Marek Vasut wrote:
>>>>>> @@ -228,39 +230,12 @@ struct mxs_lradc {
>>>>>>
>>>>>>     #define LRADC_RESOLUTION			12
>>>>>>     #define LRADC_SINGLE_SAMPLE_MASK		((1 << LRADC_RESOLUTION)
> - 1)
>>>>>>
>>>>>> -/*
>>>>>> - * Raw I/O operations
>>>>>> - */
>>>>>> -static int mxs_lradc_read_raw(struct iio_dev *iio_dev,
>>>>>> +static int mxs_lradc_read_single(struct iio_dev *iio_dev,
>>>>>>
>>>>>>     			const struct iio_chan_spec *chan,
>>>>>>     			int *val, int *val2, long m)
>>>>>>
>>>>>>     {
>>>>>>
>>>>>>     	struct mxs_lradc *lradc = iio_priv(iio_dev);
>>>>>>     	int ret;
>>>>>>
>>>>>> -	unsigned long mask;
>>>>>> -
>>>>>> -	if (m != IIO_CHAN_INFO_RAW)
>>>>>> -		return -EINVAL;
>>>>>> -
>>>>>> -	/* Check for invalid channel */
>>>>>> -	if (chan->channel > LRADC_MAX_TOTAL_CHANS)
>>>>>> -		return -EINVAL;
>>>>>
>>>>> This was already resolved, so this patch won't apply I'm afraid.
>>>>
>>>> You mean the 'unsigned long mask', right?  Yeah, I think I had resolved
>>>> that one before submitting, but looks like I didn't.
>>>> The other check is not resolved afaik. We agreed to remove it, but on a
>>>> different patch.
>>>
>>> I mean the other check, yeah. A patch removing that should be applied
>>> already.
>>
>> Where exactly? It's not fixed in Jonathan's fixes-togreg branch, at least.
>> Did you fixed it?
>
> I use linux-next [1], should be it.
>
> http://git.kernel.org/cgit/linux/kernel/git/next/linux-
> next.git/log/drivers/staging/iio/adc/mxs-lradc.c

That is removing the unsigned long mask, but not the check for invalid channel.
I'm taking care of the unsigned long mask but an additional patch is needed to remove 
the check for invalid channel.

Best regards,
--
Hector Palacios
