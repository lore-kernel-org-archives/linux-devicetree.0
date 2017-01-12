From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2][UPDATE] of: base: add support to get the number of
 cache levels
Date: Thu, 12 Jan 2017 15:28:20 +0000
Message-ID: <14f13c99-2fa4-b195-59f8-ddd9ec5b4037@arm.com>
References: <1484048479-19767-1-git-send-email-sudeep.holla@arm.com>
 <1484049616-22388-1-git-send-email-sudeep.holla@arm.com>
 <CAL_Jsq+wawaXeFPnmYw++YMiMzMm+9nSn498Dj7KsGzkfndfog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+wawaXeFPnmYw++YMiMzMm+9nSn498Dj7KsGzkfndfog-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tan Xiaojun <tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 12/01/17 13:24, Rob Herring wrote:
> On Tue, Jan 10, 2017 at 6:00 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>> It is useful to have helper function just to get the number of cache
>> levels for a given logical cpu. This patch adds the support for the
>> same.
>>
>> It will be used on ARM64 platform where the device tree provides the
>> information for the additional non-architected/transparent/external
>> last level caches that are not integrated with the processors.
>>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>> ---
>>  drivers/of/base.c  | 23 +++++++++++++++++++++++
>>  include/linux/of.h |  1 +
>>  2 files changed, 24 insertions(+)
>>

[...]

>> +int of_count_cache_levels(unsigned int cpu)
>> +{
>> +       int level = 0;
>> +       struct device_node *np = of_cpu_device_node_get(cpu);
>> +
>> +       while (np) {
>> +               level++;
> 
> This will return 1 if you have a cpu node and no cache nodes. Are you
> assuming the cpu has a cache?
> 

Ah right, that's completely wrong assumption.

> Perhaps you should just find the last level cache node and then just
> read "cache-level".
> 

Yes, sounds better. I will update accordingly. Thanks for the suggestion.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
