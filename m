From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] irqchip: gic: Allow interrupt level to be set for PPIs.
Date: Mon, 01 Dec 2014 11:19:41 +0000
Message-ID: <547C4ECD.20802@arm.com>
References: <1417197340-27298-1-git-send-email-Liviu.Dudau@arm.com> <20141201104145.GY3836@n2100.arm.linux.org.uk> <20141201104612.GM828@e106497-lin.cambridge.arm.com> <20141201110358.GA3836@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141201110358.GA3836-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Russell,

On 01/12/14 11:03, Russell King - ARM Linux wrote:
> On Mon, Dec 01, 2014 at 10:46:13AM +0000, Liviu Dudau wrote:
>> On Mon, Dec 01, 2014 at 10:41:45AM +0000, Russell King - ARM Linux wrote:
>>> On Fri, Nov 28, 2014 at 05:55:40PM +0000, Liviu Dudau wrote:
>>>> +	/*
>>>> +	 * PPIs are optionally configurable, but we cannot distinguish
>>>> +	 * between high and low, nor falling and rising. Change the
>>>> +	 * type so that it passes the next check.
>>>
>>> This comment could do with a /lot/ of improvement.  It sounds like the
>>> only reason this code exists is to bypass the check.  If that's all
>>> that's being done, there's better ways to code it.
>>
>> Hi Russell,
>>
>> You are right, all I want to do is bypass the next check because *if*
>> the PPIs can be configured, then any combination is valid (edge 
>> raising/falling, level low/high). In real systems, PPIs tend to be
>> configured with active level low. That falls the existing check.
> 
>  "fails" :)
> 
> If all you want to do is to bypass the following check, what's wrong
> with actually doing that:
> 
> -	if (type != IRQ_TYPE_LEVEL_HIGH && type != IRQ_TYPE_EDGE_RISING)
> +	if (gicirq >= 32 && type != IRQ_TYPE_LEVEL_HIGH &&
> +	    type != IRQ_TYPE_EDGE_RISING)
> 		return -EINVAL;
> 

I think that will require some additional changes to gic_configure_irq
(in irq-gic-common.c).

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
