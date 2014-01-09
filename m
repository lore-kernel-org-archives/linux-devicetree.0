From: Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH RFC 1/3] drivers: base: support cpu cache information
 interface to userspace via sysfs
Date: Thu, 09 Jan 2014 19:47:47 +0000
Message-ID: <52CEFCE3.1040701@arm.com>
References: <1389209168-17189-1-git-send-email-sudeep.holla@arm.com> <1389209168-17189-2-git-send-email-sudeep.holla@arm.com> <20140108202707.GE8417@kroah.com> <52CEF624.9020702@arm.com> <20140109193121.GA14991@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140109193121.GA14991-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Sudeep.Holla-5wv7dgnIgG8@public.gmane.org, "x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ashok Raj <ashok.raj-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/01/14 19:31, Greg Kroah-Hartman wrote:
> On Thu, Jan 09, 2014 at 07:19:00PM +0000, Sudeep Holla wrote:
>> On 08/01/14 20:27, Greg Kroah-Hartman wrote:
>>> On Wed, Jan 08, 2014 at 07:26:06PM +0000, Sudeep Holla wrote:
>>>> From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>>>>
>>>> This patch adds initial support for providing processor cache information
>>>> to userspace through sysfs interface. This is based on x86 implementation
>>>> and hence the interface is intended to be fully compatible.
>>>>
>>>> A per-cpu array of cache information maintained is used mainly for
>>>> sysfs-related book keeping.
>>>>
>>>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>>>> ---
>>>>  drivers/base/Makefile     |   2 +-
>>>>  drivers/base/cacheinfo.c  | 296 ++++++++++++++++++++++++++++++++++++++++++++++
>>>>  include/linux/cacheinfo.h |  43 +++++++
>>>>  3 files changed, 340 insertions(+), 1 deletion(-)
>>>>  create mode 100644 drivers/base/cacheinfo.c
>>>>  create mode 100644 include/linux/cacheinfo.h
>>>>
>>>> diff --git a/drivers/base/Makefile b/drivers/base/Makefile
>>>> index 94e8a80..76f07c8 100644
>>>> --- a/drivers/base/Makefile
>>>> +++ b/drivers/base/Makefile
>>>> @@ -4,7 +4,7 @@ obj-y			:= core.o bus.o dd.o syscore.o \
>>>>  			   driver.o class.o platform.o \
>>>>  			   cpu.o firmware.o init.o map.o devres.o \
>>>>  			   attribute_container.o transport_class.o \
>>>> -			   topology.o
>>>> +			   topology.o cacheinfo.o
>>>>  obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
>>>>  obj-$(CONFIG_DMA_CMA) += dma-contiguous.o
>>>>  obj-y			+= power/
>>>> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
>>>> new file mode 100644
>>>> index 0000000..f436c31
>>>> --- /dev/null
>>>> +++ b/drivers/base/cacheinfo.c
>>>> @@ -0,0 +1,296 @@
>>>> +/*
>>>> + * cacheinfo support - processor cache information via sysfs
>>>> + *
>>>> + * Copyright (C) 2013 ARM Ltd.
>>>> + * All Rights Reserved
>>>> + *
>>>> + * Author: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or modify
>>>> + * it under the terms of the GNU General Public License version 2 as
>>>> + * published by the Free Software Foundation.
>>>> + *
>>>> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any
>>>> + * kind, whether express or implied; without even the implied warranty
>>>> + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>> + * GNU General Public License for more details.
>>>> + */
>>>> +#include <linux/bitops.h>
>>>> +#include <linux/cacheinfo.h>
>>>> +#include <linux/compiler.h>
>>>> +#include <linux/cpu.h>
>>>> +#include <linux/device.h>
>>>> +#include <linux/init.h>
>>>> +#include <linux/kobject.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/sched.h>
>>>> +#include <linux/slab.h>
>>>> +#include <linux/smp.h>
>>>> +#include <linux/sysfs.h>
>>>> +
>>>> +struct cache_attr {
>>>> +	struct attribute attr;
>>>> +	 ssize_t(*show) (unsigned int, unsigned short, char *);
>>>> +	 ssize_t(*store) (unsigned int, unsigned short, const char *, size_t);
>>>> +};
>>>> +
>>>> +/* pointer to kobject for cpuX/cache */
>>>> +static DEFINE_PER_CPU(struct kobject *, ci_cache_kobject);
>>>> +#define per_cpu_cache_kobject(cpu)     (per_cpu(ci_cache_kobject, cpu))
>>>> +
>>>> +struct index_kobject {
>>>> +	struct kobject kobj;
>>>> +	unsigned int cpu;
>>>> +	unsigned short index;
>>>> +};
>>>> +
>>>> +static cpumask_t cache_dev_map;
>>>> +
>>>> +/* pointer to array of kobjects for cpuX/cache/indexY */
>>>
>>> Please don't use "raw" kobjects for this, use the device attribute
>>> groups, that's what they are there for.  Bonus is that your code should
>>> get a lot simpler when you do that.
>>>
>>
>> Yes I now understand device attribute group simplifies the code, but I think
>> kobjects are still needed as we need to track both cpu and cache index.
>> By reusing only cpu device kobject, we can track cpu only.
> 
> I don't understand, you are putting things under the cpu device object,
> why do you care about a "cache" kobject?
> 
Yes though the cache attributes are under cpu objects, it's hierarchical
something like:
/sys/devices/system/cpu/cpu<n>/cache/index<m>/<attribute_x>
<attribute_x> is unique for each pair of (cpu<n>, index<m>
index is more like cache level, but with 2 indices if they are separate(I$,D$)

>> One thought I have is to make cache_info structure common to all architecture
>> (for now its ARM specific) and introduce kobject in that similar to ia64
>> implementation. That even eliminates lot of weak functions defined.
> 
> Please don't use raw kobjects if at all possible, it's not good for a
> variety of reasons (no userspace events, have to roll your own code,
> etc.)
> 
Yes I understand, will try to explore other feasible solutions.

Regards,
Sudeep


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
