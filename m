From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 1/5] Documentation: add sbsa-gwdt driver documentation
Date: Mon, 2 Nov 2015 12:03:17 +0800
Message-ID: <CADyBb7sjZ-XcPkGqtD4Dq-V5CmXY1dSBf7RiC7VLunMBrdMvMw@mail.gmail.com>
References: <1445961999-9506-1-git-send-email-fu.wei@linaro.org>
	<1445961999-9506-2-git-send-email-fu.wei@linaro.org>
	<20151027162257.GJ3091@leverpostej>
	<CADyBb7sAcT4bXrkNo2GKx1Tw5wOuf8JeMgCoiAw=owHqvYx6ug@mail.gmail.com>
	<CAOZdJXVan3xaYAS_+150nDO1ogWh+PtkQAZvwrHusJhY4R1a4A@mail.gmail.com>
	<CADyBb7sPqsoQdYBUpHY2HvZ+iT7ABa9NoCX7Jax1NKugYOy1zQ@mail.gmail.com>
	<5633BCA4.1050400@codeaurora.org>
	<20151030190514.GD30791@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151030190514.GD30791@leverpostej>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Vipul Gandhi <vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rafael Wysocki <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Dave Young <dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

Great thanks for your feedback.

On 31 October 2015 at 03:05, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Fri, Oct 30, 2015 at 01:53:24PM -0500, Timur Tabi wrote:
>> On 10/30/2015 01:35 PM, Fu Wei wrote:
>> >>I think maybe Mark was asking why WS1 is optional, not the WS1
>> >My answer is for "why WS1 is optional"!
>> >
>> >>>interrupt.  Maybe you can reword the documentation to make is clear
>> >>>that
>> >I didn't say : "only the*interrupt*  for WS1 is optional."
>>
>> WS1 itself is not optional.  The spec says that WS0 and WS1 are
>> separate events, and doesn't saying anything about either being
>> optional.  The *interrupt* for WS1, however, is optional.
>
> This is a moot point. The distintion between the signal and the
> interrupt doens't matter here.
>
> I was only asking why the interrupt was optional, and it seems per the
> spec it's expected to be handed to an agent at a higher exception level.

yes, that is the good point. Thanks
I have thought about it
My thought is :
In virtualization system, Linux kernel with KVM support as a
Hypervisor, and guest are using a one of SBSA watchdog.
WS0 is handled by guest OS, and WS1 will be handled by Hypervisor.

And in datasheet of Foundation model, we can see:
 IRQ ID       SPI offset      Device
 60               28              EL2 Generic Watchdog WS1

So maybe we need  WS1 interrupt info, Maybe not. So I say :  WS1 info
in FDT binding info is optional.

*BUT*,
(1) I don't see any hardware need to handle WS1 for now, because AMD
seattle is the only real hardware with SBSA watchdog I can test now.
(2) In GTDT, there is not data about WS1
(3) I don't handle WS1 in this driver.

>
> That implies that the OS should only care about WS0, assuming that I've
> understood correctly.

yes, after getting your and Timur's email.  I have thought about this
in the weekend,
Maybe we can forget about WS1 in the FDT binding info temporary until
we need to handle WS1 in Linux on any hardware(or model).

>
> Thanks,
> Mark.



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
