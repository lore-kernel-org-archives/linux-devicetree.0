From: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v8 1/5] Documentation: add sbsa-gwdt driver documentation
Date: Fri, 30 Oct 2015 12:46:28 -0500
Message-ID: <CAOZdJXVan3xaYAS_+150nDO1ogWh+PtkQAZvwrHusJhY4R1a4A@mail.gmail.com>
References: <1445961999-9506-1-git-send-email-fu.wei@linaro.org>
	<1445961999-9506-2-git-send-email-fu.wei@linaro.org>
	<20151027162257.GJ3091@leverpostej>
	<CADyBb7sAcT4bXrkNo2GKx1Tw5wOuf8JeMgCoiAw=owHqvYx6ug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADyBb7sAcT4bXrkNo2GKx1Tw5wOuf8JeMgCoiAw=owHqvYx6ug-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Vipul Gandhi <vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rafael Wysocki <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Dave Young <dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 27, 2015 at 11:10 PM, Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
>> Why is WS1 optional?
>
> According to the description of WS1 in SBSA 2.3 (5.2 Watchdog Operation) page 21
> -----------------
> The signal is fed to a higher agent as an interrupt or reset for it to
> take executive action.
> ----------------
>
> So WS1 maybe a interrupt.
>
> In a real Hardware,  WS1 hooks to a  reset signal pin of BMC, if this
> pin is triggered, BMC will do a real warm reset.
> In this case, WS1 is a reset, Linux doesn't need to deal with that.
>
> For now , I haven't found a hardware use WS1 as  interrupt.
> In <ARM v8-A Foundation Platform User Guide> 3.2 Interrupt maps  Page 22
> Table 3-3 Shared peripheral interrupt assignments
> IRQ ID       SPI offset      Device
> 60               28              EL2 Generic Watchdog WS1
>
> But I don't have further info about it.
>
> Anyway,  because this signal could be interrupt or reset, Linux don't
> need know this signal sometimes.
> So I think it should be optional in binding info.
>
> Do I miss something? Any suggestion ? Please correct me, thanks.

I think maybe Mark was asking why WS1 is optional, not the WS1
interrupt.  Maybe you can reword the documentation to make is clear
that only the *interrupt* for WS1 is optional.

However, the ACPI table only allows for one interrupt, and it's not
clear whether that's the WS0 or WS1 interrupt.  So if both WS0 and WS1
generate an interrupt, how does the driver handle that?

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
