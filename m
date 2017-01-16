From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] of: base: add support to find the level of the
 last cache
Date: Mon, 16 Jan 2017 10:32:36 +0000
Message-ID: <36db95aa-4d96-bc45-9d38-28af7b17b42e@arm.com>
References: <1484245772-31511-1-git-send-email-sudeep.holla@arm.com>
 <CAL_JsqLi3fxpSPH1q+edNeDXEVfcypQK085FrZytBQrfJPh_3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLi3fxpSPH1q+edNeDXEVfcypQK085FrZytBQrfJPh_3g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tan Xiaojun <tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 14/01/17 02:45, Rob Herring wrote:
> On Thu, Jan 12, 2017 at 12:29 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>> It is useful to have helper function just to get the number of cache
>> levels for a given logical cpu. We can obtain the same by just checking
>> the level at which the last cache is present. This patch adds support
>> to find the level of the last cache for a given cpu.
>>
>> It will be used on ARM64 platform where the device tree provides the
>> information for the additional non-architected/transparent/external
>> last level caches that are not integrated with the processors.
>>
>> Suggested-by: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>> ---
>>  drivers/of/base.c  | 27 +++++++++++++++++++++++++++
>>  include/linux/of.h |  1 +
>>  2 files changed, 28 insertions(+)
>>
>> v1->v2:
>>         - Moved to using "cache-level" in the last level cache instead
>>           of counting through all the nodes as suggested by Rob
>>
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index d4bea3c797d6..c1128a077aea 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -25,6 +25,7 @@
>>  #include <linux/cpu.h>
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>> +#include <linux/of_device.h>
>>  #include <linux/of_graph.h>
>>  #include <linux/spinlock.h>
>>  #include <linux/slab.h>
>> @@ -2268,6 +2269,32 @@ struct device_node *of_find_next_cache_node(const struct device_node *np)
>>  }
>>
>>  /**
>> + * of_find_last_cache_level - Find the level at which the last cache is
>> + *             present for the given logical cpu
>> + *
>> + * @cpu: cpu number(logical index) for which the last cache level is needed
>> + *
>> + * Returns the the level at which the last cache is present. It is exactly
>> + * same as  the total number of cache levels for the given logical cpu.
>> + */
>> +int of_find_last_cache_level(unsigned int cpu)
>> +{
>> +       int cache_level = 0;
>> +       struct device_node *prev = NULL, *np = of_cpu_device_node_get(cpu);
>> +
>> +       while (np) {
>> +               prev = np;
>> +               of_node_put(np);
>> +               np = of_find_next_cache_node(np);
>> +       }
>> +
>> +       if (prev)
> 
> Probably don't need this check. Otherwise,
> 
Sure I will drop the check.

> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 

I assume you are fine taking this via arm64 tree. If not, let us know.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
