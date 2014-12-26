From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] iio: mxs-lradc: check ranges of ts properties
Date: Fri, 26 Dec 2014 09:22:32 +0000
Message-ID: <549D28D8.8080505@kernel.org>
References: <1419250476-2393-1-git-send-email-stefan.wahren@i2se.com> <201412231437.22809.marex@denx.de> <1197201553.616296.1419374759245.JavaMail.open-xchange@oxbaltgw02.schlund.de> <201412240135.21244.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201412240135.21244.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: kristina.martsenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 24/12/14 00:35, Marek Vasut wrote:
> On Tuesday, December 23, 2014 at 11:45:59 PM, Stefan Wahren wrote:
>> Hi Marek,
> 
> Hi!
> 
>>> Marek Vasut <marex-ynQEQJNshbs@public.gmane.org> hat am 23. Dezember 2014 um 14:37
>>> geschrieben:
>>>
>>>
>>> On Monday, December 22, 2014 at 01:14:36 PM, Stefan Wahren wrote:
>>> [...]
>>>
>>> Very minor coding style flub in this comment above. Multi-line comments
>>> should start with /* and a newline after that ;-)
>>
>> Thanks for your advice.
> 
> Sure, it's really a minor thing.
> 
>>>> + * from the datasheet:
>>>> + * "The DELAY fields in HW_LRADC_DELAY0, HW_LRADC_DELAY1,
>>>> + * HW_LRADC_DELAY2, and HW_LRADC_DELAY3 must be non-zero; otherwise,
>>>> + * the LRADC will not trigger the delay group."
>>>> + */
>>>> mxs_lradc_reg_wrt(lradc, LRADC_DELAY_TRIGGER(1 << ch) |
>>>> LRADC_DELAY_TRIGGER_DELAYS(0) |
>>>> LRADC_DELAY_LOOP(lradc->over_sample_cnt - 1) |
>>>> @@ -1495,20 +1501,38 @@ static int mxs_lradc_probe_touchscreen(struct
>>>> mxs_lradc *lradc, return -EINVAL;
>>>> }
>>>>
>>>> - lradc->over_sample_cnt = 4;
>>>> - ret = of_property_read_u32(lradc_node, "fsl,ave-ctrl", &adapt);
>>>> - if (ret == 0)
>>>> + if (of_property_read_u32(lradc_node, "fsl,ave-ctrl", &adapt)) {
>>>> + lradc->over_sample_cnt = 4;
>>>> + } else {
>>>> + if (adapt < 1 || adapt > 32) {
>>>
>>> This is just an idea, but do we not have some kind of a
>>> "of_property_read_u32_range()" thingie, which would include this kind of
>>> range checking ? Would it be worth implementing such thing ? What do you
>>> think please ?
>>
>> I never heard of such a function. I think it's not the best idea of mixing
>> dt parsing and range checking in a general function.
> 
> It was just an idea, since it would trim down the code duplication a bit.
It's an interesting thought certainly as this must be a fairly common case...

> 
>> But this code does nearly the same thing 3 times. How about defining an
>> array of property range structures:
>>
>> static const struct property_value_range mxs_lradc_properties[] = {
>> 	{
>> 		.name = "fsl,ave-ctrl",
>> 		.min_value = 1,
>> 		.max_value = 32,
>> 		.default_value = 4,
>> 	},
>> 	{
>> 		.name = "fsl,ave-delay",
>> 		.min_value = 2,
>> 		.max_value = LRADC_DELAY_DELAY_MASK+1,
>> 		.default_value = 2,
>> 	},
>> 	{
>> 		.name = "fsl,settling",
>> 		.min_value = 1,
>> 		.max_value = LRADC_DELAY_DELAY_MASK,
>> 		.default_value = 10,
>> 	},
>> };
>>
>> and a local validate function for these optional parameters.
> 
> That's becoming a bit too complex for such a simple task. I cannot tell right 
> now, so I'd prefer of others chimed in.
I'd leave as it is.  If there were a few more cases it might be worth the
function, but probably not for these 3.

A shorter option might be to just use a function with the constants passed
in as parameters for each call.
> 
> Have a nice holiday!
> 
