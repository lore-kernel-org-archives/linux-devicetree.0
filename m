From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [Linaro-acpi] [PATCH 0/6] Watchdog: introdouce ARM SBSA watchdog driver
Date: Fri, 15 May 2015 16:07:58 +0200
Message-ID: <179589472.1OI8rAN8jV@wuerfel>
References: <=fu.wei@linaro.org> <1431688090-2145-1-git-send-email-fu.wei@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431688090-2145-1-git-send-email-fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Cc: fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 15 May 2015 19:08:04 fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
> From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> This patchset:
> 
>     (1)Introdouces Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt
>     for FDT info of SBSA Generic Watchdog, and give two examples of
>     adding SBSA Generic Watchdog device node into the dts files:
>     foundation-v8.dts and amd-seattle-soc.dtsi
> 
>     (2)Introdouce "pretimeout" into the watchdog framework
> 
>     (3)Introdouces ARM SBSA watchdog driver
>         a.Use linux kernel watchdog framework
>         b.Work with FDT on ARM64
>         c.Use "pretimeout" in watchdog framework
>         d.In first timeout(WS0), do panic to save system context
>         e.Support geting timeout and pretimeout from
>           parameter and FDT at the driver init stage
> 
>     (4)Parse SBSA Generic Watchdog Structure in GTDT table of ACPI,
>        and create a platform device with that information
>        This platform device can be used by This Watchdog driver
> 
> This patchset has been tested with watchdog daemon
> (ACPI/FDT, module/build-in) on the following platforms:
>     (1)ARM Foundation v8 model
>     (2)AMD Seattle B0
> 
> 

I've had a few very minor comments to the individual patches, otherwise
looks good. I have not reviewed the ACPI part of the series, as I have
no knowledge of that.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
