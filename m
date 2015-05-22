From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/7] Watchdog: introduce "pretimeout" into framework
Date: Fri, 22 May 2015 18:46:29 +0800
Message-ID: <CADyBb7uh-6=ihfrKHBVXDzAKAE-_GqLXTPJa5_7Gw2R71pyeUg@mail.gmail.com>
References: <=fu.wei@linaro.org>
	<1432197156-16947-1-git-send-email-fu.wei@linaro.org>
	<1432197156-16947-6-git-send-email-fu.wei@linaro.org>
	<555ECD04.6000404@offcode.fi>
	<CADyBb7sZWgNnEoTfaYm6=YcbWgEYRMcaNAdX9Y7B6W9pg+gOmg@mail.gmail.com>
	<555EEFDB.2030907@offcode.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <555EEFDB.2030907-20XrK1Fq8EXHOG6cAo2yLw@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timo Kokkonen <timo.kokkonen-20XrK1Fq8EXHOG6cAo2yLw@public.gmane.org>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Timo,

On 22 May 2015 at 16:59, Timo Kokkonen <timo.kokkonen-20XrK1Fq8EXHOG6cAo2yLw@public.gmane.org> wrote:
> On 22.05.2015 11:23, Fu Wei wrote:
>>
>> Hi Timo,
>>
>>
>> On 22 May 2015 at 14:30, Timo Kokkonen <timo.kokkonen-20XrK1Fq8EXHOG6cAo2yLw@public.gmane.org> wrote:
>>>
>>> On 21.05.2015 11:32, fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
>>>>
>>>>
>>>> From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>>
>>>> Also update Documentation/watchdog/watchdog-kernel-api.txt to
>>>> introduce:
>>>> (1)the new elements in the watchdog_device and watchdog_ops struct;
>>>> (2)the new API "watchdog_init_timeouts".
>>>>
>>>> Reasons:
>>>> (1)kernel already has two watchdog drivers are using "pretimeout":
>>>>          drivers/char/ipmi/ipmi_watchdog.c
>>>>          drivers/watchdog/kempld_wdt.c(but the definition is different)
>>>> (2)some other dirvers are going to use this: ARM SBSA Generic Watchdog
>>>>
>>>
>>> Hi,
>>>
>>> As I was proposing some other API changes with my early-timeout-sec work,
>>> I
>>> can see my work is going to collide with your API change proposal a bit.
>>> So
>>> maybe I should ask your opinion as well..
>>
>>
>> Thank you for reminding me of that, I saw "early-timeout-sec", but
>> because I don't get it in kernel API or watchdog_core.c, so I did not
>> pay attention to it.
>> Sorry.
>>
>>>
>>> Could this pretimeout feature be something that other drivers could
>>> benefit
>>> too?
>>
>>
>> yes , as you may know, I am making a patch for pretimeout support in
>> watchdog framework
>>
>>> I can see that it does not do anything else except call panic() before
>>> letting the watchdog expire. This is something that could be emulated
>>> easily
>>> by the watchdog core for drivers that don't know anything about
>>> pretimeouts
>>> at all.
>>
>>
>> For SBSA watchdog, there are two stage timeout, and according to kernel
>> doc:
>> ----------------------
>> Pretimeouts:
>>
>> Some watchdog timers can be set to have a trigger go off before the
>> actual time they will reset the system.  This can be done with an NMI,
>> interrupt, or other mechanism.  This allows Linux to record useful
>> information (like panic information and kernel coredumps) before it
>> resets.
>> ----------------------
>>
>> I think panic() is the right way to do now.  but people may also need
>> to config :
>> PANIC_TIMEOUT [!=0]
>> KEXEC
>> KDUMP
>> for debug reason
>>
>
> Yes, so basically if we hit pretimeout, we probably have already crashed.

yes,  for now , I only  use panic(), but at the beginning, I offer
user some options:

https://lists.linaro.org/pipermail/linaro-acpi/2015-April/004350.html

> The only difference is that we now have some seconds time to dump out useful
> data and then either reboot or let the actual watchdog reset take care of
> resetting the device. panic() sounds like a good thing to do. Maybe you
> could also dump registers on other CPUs too or try to get out some other
> useful information about the kernel in case it has crashed or something. But
> I'm just guessing.

yes, that is my thought.
because there is the kdump support in panic(), so that can give use a
chance to figure out why the watchdog wasn't fed.

>
>>>
>>> The way I was planning the API change there would need to be a small
>>> change
>>> with each watchdog driver in order to let the watchdog core take over
>>> generic behaviour on behalf of the driver. My goal was to make the change
>>> so
>>> that each driver that gets converted to the new API extensions gets a
>>> support for early-timeout-sec for free, without needing to enable support
>>> for it any way. If the API was designed properly, also pretimeouts could
>>> be
>>> handled easily and maybe even so that other drivers could have that
>>> feature
>>> even though their hardware does not explicitly give any support for it.
>>
>>
>> could you please point out your patch , then I can learn your idea :-)
>> For now , I am working on a common "Pretimeouts" following the concept
>> in kernel doc.
>>
>>>
>>> Any thoughts?
>>
>>
>> my thoughts is in  my pretimeout patch , would you provide some suggestion
>> ?
>>
>
> Here is an archive link to my patch set:
>
> http://www.spinics.net/lists/linux-watchdog/msg06473.html

Ah , cool, I can see some common in your patch. Thanks :-)
See if I can learn something from your patches

>
> Your patch set is adding a new call to the core for adjusting the
> pretimoeut, which is probably a good thing in case the driver needs special
> handling for it anyway. But if the core had capability to emulate pretimeout
> for drivers that can't support it in hardware, it would be good if there was
> a way for the core to support it even though the driver had zero code for
> it. The core also has watchdog_init_timeout() right now but even that is not
> called from that many drivers. I would like to fix that too so that drivers
> would not need to bother so much about it but let core take care of it more.
> This is why I proposed the watchdog_init_params() call that could dig all
> the generic parameters from device tree on behalf of the driver. This is
> where I though timeout and early-timeout-sec parameters would be parsed from
> device tree, but it could also parse pretimeout parameter as well.
> Apparently Guenter did not like my approach so we might need some other way
> to do it.

I am using pretimeout, because SBSA watchdog hardware support two
stages timeout,
I am reusing the existing kernel concept, but your early_timeout_sec
is a new concept.
If you check my previous patchset , you will see : at the beginning,
pretimeout support is not a  generic features in my patchset.
Then  Arnd suggest that I can try to make pretimeout into watchdog
framework, and Guenter said :"Makes sense."
So I am still trying to improve pretimeout support :-)
If I can make pretimeout merged, may be you can try pretimeout to
implement early_timeout_sec function?
It is up to the maintainers, I will try my best.

Thanks :-)

>
> I don't get to say how this should be done, I'm just throwing ideas here.
> But I think the watchdog core would be a lot better place for implementing
> the generic features than drivers. That way a lot of drivers could enable
> support the new features for free.
>
> Thanks,
> -Timo



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
