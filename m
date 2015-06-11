From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH non-pretimeout 4/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Thu, 11 Jun 2015 13:59:41 +0800
Message-ID: <CADyBb7tiZ=sbBcPd+hM9ab_eM1iL60OKzLAP21AuYU9FxZsR3A@mail.gmail.com>
References: <=fu.wei@linaro.org>
	<1433958452-23721-1-git-send-email-fu.wei@linaro.org>
	<1433958452-23721-5-git-send-email-fu.wei@linaro.org>
	<55791DAD.7030601@roeck-us.net>
	<CADyBb7vcDGuZYZXubM=KVos9Yx8HgoJh1Z9L13ELp0oBOpDxLQ@mail.gmail.com>
	<55792171.7050600@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55792171.7050600-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Vipul Gandhi <vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Guenter,


On 11 June 2015 at 13:49, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On 06/10/2015 10:44 PM, Fu Wei wrote:
>>
>> Hi Guenter,
>>
>> On 11 June 2015 at 13:33, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
>>>
>>> On 06/10/2015 10:47 AM, fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
>>>>
>>>>
>>>> From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>>
>>>> This driver bases on linux kernel watchdog framework.
>>>> It supports getting timeout from parameter and FDT
>>>> at the driver init stage.
>>>> The first timeout period expires, the interrupt routine
>>>> got another timeout period to run panic for saving
>>>> system context.
>>>>
>>>> Signed-off-by: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>> ---
>>>>    drivers/watchdog/Kconfig     |  11 ++
>>>>    drivers/watchdog/Makefile    |   1 +
>>>>    drivers/watchdog/sbsa_gwdt.c | 383
>>>> +++++++++++++++++++++++++++++++++++++++++++
>>>>    3 files changed, 395 insertions(+)
>>>>    create mode 100644 drivers/watchdog/sbsa_gwdt.c
>>>>
>>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>>> index e5e7c55..554f18a 100644
>>>> --- a/drivers/watchdog/Kconfig
>>>> +++ b/drivers/watchdog/Kconfig
>>>> @@ -152,6 +152,17 @@ config ARM_SP805_WATCHDOG
>>>>            ARM Primecell SP805 Watchdog timer. This will reboot your
>>>> system
>>>> when
>>>>            the timeout is reached.
>>>>
>>>> +config ARM_SBSA_WATCHDOG
>>>> +       tristate "ARM SBSA Generic Watchdog"
>>>> +       depends on ARM64
>>>> +       depends on ARM_ARCH_TIMER
>>>> +       select WATCHDOG_CORE
>>>> +       help
>>>> +         ARM SBSA Generic Watchdog. This watchdog has two Watchdog
>>>> timeouts.
>>>> +         The first timeout will trigger a panic; the second timeout
>>>> will
>>>> +         trigger a system reset.
>>>> +         More details: ARM DEN0029B - Server Base System Architecture
>>>> (SBSA)
>>>> +
>>>>    config AT91RM9200_WATCHDOG
>>>>          tristate "AT91RM9200 watchdog"
>>>>          depends on SOC_AT91RM9200 && MFD_SYSCON
>>>> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
>>>> index 5c19294..471f1b7c 100644
>>>> --- a/drivers/watchdog/Makefile
>>>> +++ b/drivers/watchdog/Makefile
>>>> @@ -30,6 +30,7 @@ obj-$(CONFIG_USBPCWATCHDOG) += pcwd_usb.o
>>>>
>>>>    # ARM Architecture
>>>>    obj-$(CONFIG_ARM_SP805_WATCHDOG) += sp805_wdt.o
>>>> +obj-$(CONFIG_ARM_SBSA_WATCHDOG) += sbsa_gwdt.o
>>>>    obj-$(CONFIG_AT91RM9200_WATCHDOG) += at91rm9200_wdt.o
>>>>    obj-$(CONFIG_AT91SAM9X_WATCHDOG) += at91sam9_wdt.o
>>>>    obj-$(CONFIG_CADENCE_WATCHDOG) += cadence_wdt.o
>>>> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
>>>> new file mode 100644
>>>> index 0000000..1ddc10f
>>>> --- /dev/null
>>>> +++ b/drivers/watchdog/sbsa_gwdt.c
>>>> @@ -0,0 +1,383 @@
>>>> +/*
>>>> + * SBSA(Server Base System Architecture) Generic Watchdog driver
>>>> + *
>>>> + * Copyright (c) 2015, Linaro Ltd.
>>>> + * Author: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>> + *         Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or modify
>>>> + * it under the terms of the GNU General Public License 2 as published
>>>> + * by the Free Software Foundation.
>>>> + *
>>>> + * This program is distributed in the hope that it will be useful,
>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>> + * GNU General Public License for more details.
>>>> + *
>>>> + * Note: This SBSA Generic watchdog has two stage timeouts,
>>>> + *       When the first timeout occurs, WS0(SPI or LPI) is triggered,
>>>> + *       the second timeout period(as long as the first timeout period)
>>>> starts.
>>>> + *       In WS0 interrupt routine, panic() will be called for
>>>> collecting
>>>> + *       crashdown info.
>>>> + *       If system can not recover from WS0 interrupt routine, then
>>>> second
>>>> + *       timeout occurs, WS1(reset or higher level interrupt) is
>>>> triggered.
>>>> + *       The two timeout period can be set by WOR(32bit).
>>>> + *       WOR gives a maximum watch period of around 10s at the maximum
>>>> + *       system counter frequency.
>>>> + *       The System Counter shall run at maximum of 400MHz.
>>>> + *
>>>> + *       But If we need a larger timeout period, this driver will
>>>> programme WCV
>>>> + *       directly. That can support more than 10s timeout at the
>>>> maximum
>>>> + *       system counter frequency.
>>>> + *       More details: ARM DEN0029B - Server Base System Architecture
>>>> (SBSA)
>>>> + *
>>>> + * SBSA GWDT:    |---WOR(or WCV)---WS0---WOR(or WCV)---WS1
>>>> + *               |-----timeout-----WS0-----timeout-----WS1
>>>
>>>
>>>
>>> If we use WCV at all, I would like to see something like
>>>
>>>   * SBSA GWDT:    |---WOR(or WCV)---WS0--------WOR------WS1
>>>   *               |-----timeout-----WS0-----------------WS1
>>>   *                                 panic               hw reset
>>>
>>> where WOR would be used up to its maximum, to be replaced by WCV
>>> (but kept at maximum) if the selected timeout is larger than the
>>> maximum timeout selectable with WOR. Would this be possible ?
>>
>>
>> for this part |-----timeout-----WS0,  I am doing this way in
>> non-pretimeout version.
>>
>> but for WS0-----------------WS1, do you mean WOR would always be used
>> up to its maximum???
>
>
> yes
>
>> I don't see any variable attached on it. So I would like to confirm
>> what is this value
>>
>
> min(timeout, max_wor_timeout)

Sure, no problem. just need a very little fix in non-pretimout version

Just delete several lines in "sbsa_gwdt_interrupt", become like this:
+static irqreturn_t sbsa_gwdt_interrupt(int irq, void *dev_id)
+{
+    panic("SBSA Watchdog pre-timeout");
+
+    return IRQ_HANDLED;
+}

this matches your thought.

Any other code I need to improve ? If It is OK for you, I can sent a
new patchset soon.
Please let me know anything else I need to improve.

Great thanks for your time

>
> Guenter
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
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
