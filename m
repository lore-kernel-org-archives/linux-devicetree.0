From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 5/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Mon, 14 Sep 2015 23:27:55 +0800
Message-ID: <CADyBb7veKjm78ur44QBKNVgxuoMZUDyzmMbiyS6crsi1Bo57Bg@mail.gmail.com>
References: <=fu.wei@linaro.org>
	<1433217907-928-1-git-send-email-fu.wei@linaro.org>
	<1433217907-928-6-git-send-email-fu.wei@linaro.org>
	<556F4489.6030206@codeaurora.org>
	<20150603182503.GD6460@roeck-us.net>
	<556F4D29.1080001@codeaurora.org>
	<55F207FD.2030007@redhat.com>
	<20150914042104.GA4682@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150914042104.GA4682-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Vipul Gandhi <vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rafael Wysocki <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Pratyush,

Great thanks for your help on some update for watchdog framework.

For " Fix parent of watchdog_devices", I will update my patchset.
For the upstreaming patchset"Sysfs status read support", will make a
patch. But upstream it when your patchset is merged.

On 14 September 2015 at 12:21, Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On 10/09/2015:06:45:17 PM, Jon Masters wrote:
>> On 06/03/2015 02:53 PM, Timur Tabi wrote:
>> > On 06/03/2015 01:25 PM, Guenter Roeck wrote:
>> >> In general the idea here would be to use a crashdump kernel, which,
>> >> when loaded, would reset the watchdog before it fires. This kernel
>> >> would then write a core dump to a specified location.
>
> And this is what we do in fedora or RHEL. There had been some work ongoing in
> fedora [1][2] which will help to reset any active watchdog in kdump kernel(if
> the watchdog driver has been registered to watchdog_class). It will eventually
> help a watchdog on ARM64 platform as well.
>
> [1] https://lists.fedoraproject.org/pipermail/kexec/2015-September/002295.html
> [2] https://github.com/pratyushanand/kexec-tools/commits/watchdog_fmaster
>
> ~Pratyush



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
