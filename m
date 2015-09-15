From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 5/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Tue, 15 Sep 2015 11:16:28 +0800
Message-ID: <CADyBb7uLiTg=FDe=HzXnKCWgO0y4DtJTOSBtgpm+5FbTH-6WSQ@mail.gmail.com>
References: <=fu.wei@linaro.org>
	<1433217907-928-1-git-send-email-fu.wei@linaro.org>
	<1433217907-928-6-git-send-email-fu.wei@linaro.org>
	<556F4489.6030206@codeaurora.org>
	<20150603182503.GD6460@roeck-us.net>
	<556F4D29.1080001@codeaurora.org>
	<55F207FD.2030007@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55F207FD.2030007-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Vipul Gandhi <vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rafael Wysocki <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jon,

On 11 September 2015 at 06:45, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On 06/03/2015 02:53 PM, Timur Tabi wrote:
>> On 06/03/2015 01:25 PM, Guenter Roeck wrote:
>>> In general the idea here would be to use a crashdump kernel, which,
>>> when loaded, would reset the watchdog before it fires. This kernel
>>> would then write a core dump to a specified location.
>>
>> What is the mechanism for resetting the watchdog?  The only code that
>> knows about the hardware registers is this driver.  Does the crashdump
>> kernel call the watchdog stop function?
>>
>>> If arm64 doesn't support a crashdump kernel, it might still be possible
>>> to log the backtrace somewhere (eg in nvram using pstore if that is
>>> supported via acpi or efi).
>
> Just to go back and explicitly answer this, arm64 does have support for
> crashdump, using the standard kexec/kdump approach, exactly as on x86.
> There's still some more work to be done to get the ACPI case fully
> upstream (e.g. on X-Gene platforms such as the HP ProLiant Moonshot m400
> we need non-PSCI CPU parking protocol offlining when booting in
> UEFI/ACPI mode), but it's what we are doing in RHEL(SA) and the goal is
> to help clean up the remaining pieces upstream there.

Great thanks for your info.

I have tried kexec/kdump on a real aarch64 hardware, that works well.
Although it's still under development and upstreaming, the support is there.

After discussing with some kexec/kdump  developer, I think this driver
can cooperate with kexec/kdump.

>
> Jon.
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
