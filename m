From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/6] Watchdog: introdouce "pretimeout" into framework
Date: Tue, 19 May 2015 01:19:22 +0800
Message-ID: <CADyBb7u=HjZO5CBzZLxw1aWDx0tKdVKBuTrrhrRF9bAQr7pADQ@mail.gmail.com>
References: <=fu.wei@linaro.org>
	<1431689090-3125-1-git-send-email-fu.wei@linaro.org>
	<2464980.1PKdnqcc3c@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2464980.1PKdnqcc3c@wuerfel>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Great thanks for your suggestion :-)

feedback inline below

On 15 May 2015 at 22:04, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 15 May 2015 19:24:48 fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
>> +static void watchdog_check_min_max_pretimeout(struct watchdog_device *wdd)
>> +{
>> +       /*
>> +        * Check that we have valid min and max pretimeout values, if
>> +        * not reset them both to 0 (=not used or unknown)
>> +        */
>> +       if (wdd->min_pretimeout > wdd->max_pretimeout) {
>> +               pr_info("Invalid min and max pretimeout, resetting to 0!\n");
>> +               wdd->min_pretimeout = 0;
>> +               wdd->max_pretimeout = 0;
>> +       }
>> +}
>
> I would probably just fold this function into the existing
> watchdog_check_min_max_timeout() and check both normal and pre-timeout
> there.

yes, I can do that , and that is good idea

>
>> +/**
>> + * watchdog_init_pretimeout() - initialize the pretimeout field
>> + * @pretimeout_parm: pretimeout module parameter
>> + * @dev: Device that stores the timeout-sec property
>> + *
>> + * Initialize the pretimeout field of the watchdog_device struct with either
>> + * the pretimeout module parameter (if it is valid value) or the timeout-sec
>> + * property (only if it is a valid value and the timeout_parm is out of bounds).
>> + * If none of them are valid then we keep the old value (which should normally
>> + * be the default pretimeout value.
>> + *
>> + * A zero is returned on success and -EINVAL for failure.
>> + */
>> +int watchdog_init_pretimeout(struct watchdog_device *wdd,
>> +                            unsigned int pretimeout_parm, struct device *dev)
>> +{
>> +       int ret = 0;
>> +       u32 timeouts[2];
>> +
>> +       watchdog_check_min_max_pretimeout(wdd);
>> +
>> +       /* try to get the timeout module parameter first */
>> +       if (!watchdog_pretimeout_invalid(wdd, pretimeout_parm) &&
>> +           pretimeout_parm) {
>> +               wdd->pretimeout = pretimeout_parm;
>> +               return ret;
>> +       }
>> +       if (pretimeout_parm)
>> +               ret = -EINVAL;
>> +
>> +       /* try to get the timeout_sec property */
>> +       if (!dev || !dev->of_node)
>> +               return ret;
>> +       ret = of_property_read_u32_array(dev->of_node,
>> +                                        "timeout-sec", timeouts, 2);
>> +       if (!watchdog_pretimeout_invalid(wdd, timeouts[1]) && timeouts[1])
>> +               wdd->pretimeout = timeouts[1];
>> +       else
>> +               ret = -EINVAL;
>> +
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(watchdog_init_pretimeout);
>
> Same here: the function is very similar to the watchdog_init_timeout
> function, and it reads the same property, so just do both here.
>
> The easiest way for that is probably to use of_find_property()
> and of_prop_next_u32() to read the two numbers.

integrate watchdog_init_pretimeout and watchdog_init_timeout will be a
little hard,
we may need to change this API to :

watchdog_init_timeouts(struct watchdog_device *wdd, unsigned int timeout_parm,
                             unsigned int pretimeout_parm, struct device *dev)

then we need to update all the watchdog drivers which use this API,
maybe we can do this in a individual patchset, after this pretimeout
patch is merged.

Is that OK  ? :-)  any thought?


>
>         Arnd
>



-- 
Best regards,

Fu Wei
Software Engineer
Red Hat Software (Beijing) Co.,Ltd.Shanghai Branch
Ph: +86 21 61221326(direct)
Ph: +86 186 2020 4684 (mobile)
Room 1512, Regus One Corporate Avenue,Level 15,
One Corporate Avenue,222 Hubin Road,Huangpu District,
Shanghai,China 200021
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
