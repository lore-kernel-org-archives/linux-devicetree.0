From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6] mfd: syscon: Add hardware spinlock support
Date: Tue, 19 Dec 2017 14:55:47 +0800
Message-ID: <CAMz4kuK2JRSZt6BiYu+YRy_+kXNen+NTgayqpXy1n3qL-T9OzQ@mail.gmail.com>
References: <87ec50c846bbc7afc09ba0855aba1cdea6473308.1512048582.git.baolin.wang@linaro.org>
 <20171215104204.p7i27sen77ohbmzi@dell> <CAK8P3a0Eu4zaVrSEMps06ZZmFs=6026WZ7ze5V2k=nu0zL0bxQ@mail.gmail.com>
 <CAMz4ku+KfQRoLTO-T3ciS-1Z9oD=y0LJ25n-YDUMr+aYetbt9A@mail.gmail.com> <CAK8P3a3JTV0z0ua_xbbf8eJFGsgOEai4RC9Ny5-JL80MPuKFSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a3JTV0z0ua_xbbf8eJFGsgOEai4RC9Ny5-JL80MPuKFSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 18 December 2017 at 20:44, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Mon, Dec 18, 2017 at 7:54 AM, Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On 15 December 2017 at 21:13, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>>> On Fri, Dec 15, 2017 at 11:42 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>>
>>>>> @@ -87,6 +88,30 @@ static struct syscon *of_syscon_register(struct device_node *np)
>>>>>       if (ret)
>>>>>               reg_io_width = 4;
>>>>>
>>>>> +     ret = of_hwspin_lock_get_id(np, 0);
>>>>> +     if (ret > 0) {
>>>>> +             syscon_config.hwlock_id = ret;
>>>>> +             syscon_config.hwlock_mode = HWLOCK_IRQSTATE;
>>>>> +     } else {
>>>>> +             switch (ret) {
>>>>> +             case -ENOENT:
>>>>> +                     /* Ignore missing hwlock, it's optional. */
>>>>> +                     break;
>>>>> +             case 0:
>>>>> +                     /* In case of the HWSPINLOCK is not enabled. */
>>>>> +                     if (!IS_ENABLED(CONFIG_HWSPINLOCK))
>>>>> +                             break;
>>>>> +
>>>>> +                     ret = -EINVAL;
>>>>> +                     /* fall-through */
>>>>> +             default:
>>>>> +                     pr_err("Failed to retrieve valid hwlock: %d\n", ret);
>>>>> +                     /* fall-through */
>>>>> +             case -EPROBE_DEFER:
>>>>> +                     goto err_regmap;
>>>>> +             }
>>>
>>> The 'case 0' seems odd here, are we sure that this is always a failure?
>>> From the of_hwspin_lock_get_id() definition it looks like zero might
>>> be valid, and the !CONFIG_HWSPINLOCK implementation appears
>>> to be written so that we should consider '0' valid but unused and
>>> silently continue with that. If that is generally not the intended
>>> use, it should probably return -EINVAL or something like that.
>>
>> Yes, 0 is valid for of_hwspin_lock_get_id(), but if we pass 'hwlock id
>> = 0' to regmap, the regmap core will not regard it as a valid hwlock
>> id to request the hwlock and will use default mutex lock instead of
>> hwlock, which will cause problems. Meanwhile if we silently continue
>> with case 0, users will not realize that they set one invalid hwlock
>> id to regmap core, so here we regarded case 0 as one invalid id to
>> print error messages for users.
>
> Something else still seems wrong then: If regmap doesn't accept a zero
> lock-id, then of_hwspin_lock_get_id() should never return that as a
> valid ID, right?

Um, why regmap doesn't accept a zero lock-id, that because regmap will
reguest hwlock depending on the 'regmap_config->hwlock_id' is not
zero, if regmap regard a zero lock-id as valid which will affect other
'struct regmap_config' definition. So users should not assign the zero
lock-id to regmap.

Now of_hwspin_lock_get_id() can return 0 as valid, which depend on
what is the base id registered by hwspinlock driver. So you think we
should not regard 0 as valid from of_hwspin_lock_get_id(), I can try
to send another patch to fix.

But for this patch I still think we need regard the zero lock-id as
invalid and gave error messages to users.

-- 
Baolin.wang
Best Regards
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
