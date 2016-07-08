From: Julien Grall <julien.grall-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] xen/arm: register clocks used by the hypervisor
Date: Fri, 8 Jul 2016 10:35:55 +0100
Message-ID: <577F73FB.1070302@arm.com>
References: <1467282752-14053-1-git-send-email-dirk.behme@de.bosch.com>
 <146776885213.35356.11565744417822933094@resonance>
 <20733b68-9529-bdb9-2a7d-576c8193f15c@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20733b68-9529-bdb9-2a7d-576c8193f15c-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 08/07/16 07:48, Dirk Behme wrote:
>>>  #include <linux/cpuidle.h>
>>>  #include <linux/cpufreq.h>
>>>  #include <linux/cpu.h>
>>> @@ -444,6 +445,52 @@ static int __init xen_pm_init(void)
>>>  }
>>>  late_initcall(xen_pm_init);
>>>
>>> +/*
>>> + * Check if we want to register some clocks, that they
>>> + * are not freed because unused by clk_disable_unused().
>>> + * E.g. the serial console clock.
>>> + */
>>> +static int __init xen_arm_register_clks(void)
>>> +{
>>> +       struct clk *clk;
>>> +       struct device_node *xen_node;
>>> +       unsigned int i, count;
>>> +       int ret = 0;
>>> +
>>> +       xen_node = of_find_compatible_node(NULL, NULL, "xen,xen");
>>> +       if (!xen_node) {
>>> +               pr_err("Xen support was detected before, but it has
>>> disappeared\n");
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       count = of_clk_get_parent_count(xen_node);
>>> +       if (!count)
>>> +               goto out;
>>> +
>>> +       for (i = 0; i < count; i++) {
>>> +               clk = of_clk_get(xen_node, i);
>>
>> Is there a struct device we can use here?
>
>
> It doesn't look so. Julien?

We don't have a struct device. Maybe we can create a dummy one if it 
simplifies the logic?

-- 
Julien Grall
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
