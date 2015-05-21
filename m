From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [Linaro-acpi] [PATCH v2 0/7] Watchdog: introduce ARM SBSA
 watchdog driver
Date: Thu, 21 May 2015 17:01:01 +0800
Message-ID: <CADyBb7sOrbMGhbstaPF25kJJ=BQmctf31Fb6wf7nwgsL5teuvQ@mail.gmail.com>
References: <=fu.wei@linaro.org>
	<1432197156-16947-1-git-send-email-fu.wei@linaro.org>
	<4405999.8GGyzVsbM7@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4405999.8GGyzVsbM7@wuerfel>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Great thanks for your review! :-)

On 21 May 2015 at 16:46, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 21 May 2015 16:32:29 fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
>>
>> This patchset:
>>
>>     (1)Export "arch_timer_get_rate" in arm_arch_timer.c for the
>>     other drivers, like SBSA watchdog driver
>>
>>     (2)Introduce Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt
>>     for FDT info of SBSA Generic Watchdog, and give two examples of
>>     adding SBSA Generic Watchdog device node into the dts files:
>>     foundation-v8.dts and amd-seattle-soc.dtsi.
>>
>>     (3)Introduce "pretimeout" into the watchdog framework, and update
>>     Documentation/watchdog/watchdog-kernel-api.txt to introduce:
>>         (1)the new elements in the watchdog_device and watchdog_ops struct;
>>         (2)the new API "watchdog_init_timeouts".
>>
>>     (4)Introduce ARM SBSA watchdog driver:
>>         a.Use linux kernel watchdog framework;
>>         b.Work with FDT on ARM64;
>>         c.Use "pretimeout" in watchdog framework;
>>         d.In first timeout(WS0), do panic to save system context;
>>         e.Support geting timeout and pretimeout from parameter and FDT
>>           at the driver init stage.
>
> Looks all good to me, please add
>
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>
> for patches 1-6.

Great! happy to do so :-)

>
>>     (5)Parse SBSA Generic Watchdog Structure in GTDT table of ACPI,
>>     and create a platform device with that information.
>>     This platform device can be used by This Watchdog driver.
>
> This needs to be reviewed by someone who understands ACPI.

yes, maybe Hanjun and Al can help :-)

>
>         Arnd



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
