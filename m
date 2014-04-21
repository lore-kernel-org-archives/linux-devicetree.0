From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] of: Handle memory@0 node on PPC32 only
Date: Mon, 21 Apr 2014 07:56:22 -0500
Message-ID: <CAL_JsqJTMWKh3gsv0TnRap82+7BM4XaT4ZAWkQmyfvzTqOq12g@mail.gmail.com>
References: <1397756521-29387-1-git-send-email-leif.lindholm@linaro.org>
	<1397756521-29387-4-git-send-email-leif.lindholm@linaro.org>
	<CAMuHMdXBNWum7UJ95uT2hwTd1b5C8ebF2LQ4T-A+RS80p7MH=A@mail.gmail.com>
	<20140418125924.GF5904@bivouac.eciton.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140418125924.GF5904-t77nlHhSwNqAroYi2ySoxKxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 18, 2014 at 7:59 AM, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi Geert,
>
> On Fri, Apr 18, 2014 at 10:04:15AM +0200, Geert Uytterhoeven wrote:
>> On Thu, Apr 17, 2014 at 7:42 PM, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> > In order to deal with an firmware bug on a specific ppc32 platform
>> > (longtrail), early_init_dt_scan_memory() looks for a node called
>> > memory@0 on all platforms. Restrict this quirk to ppc32 kernels only.
>>
>> This breaks backwards compatibilty with old DTSes (at least on ARM/MIPS,
>> where you added the missing property in patches 1 and 2 of the series)?
>
> As Rob said in response to 0/3, the MIPSs would likely not be affected,
> since they embed the DT.
>
>> For the Longtrail, I don't care much anymore, as mine died in 2004.
>> AFAIK, there have never been many users anyway.
>
> There are still a few mentions of it under arch/powerpc/, so I wouldn't
> want to be the one to kill it off...
>
> How about the below v2 3/3 to address the ARM platform?
>
> Regards,
>
> Leif
>
> From 6fa0b837ad71780334eb97d63c507165b6c57add Mon Sep 17 00:00:00 2001
> From: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Date: Thu, 17 Apr 2014 14:24:47 +0100
> Subject: [PATCH] of: arm: powerpc: Restrict memory@0 node handling to
>  affected platforms
>
> In order to deal with a firmware bug on a specific ppc32 platform
> (longtrail), early_init_dt_scan_memory() looks for a node called
> memory@0 on all platforms, for all nodes lacking a device_type.
> Restrict this quirk to ppc32 and the arm mach-ux500 platforms (one of
> which has depended on this special handling).


> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 889005f..230c747 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -77,4 +77,7 @@ config OF_RESERVED_MEM
>         help
>           Helpers to allow for reservation of memory regions
>
> +config OF_MEMORY_AT_0_QUIRK
> +       def_bool n

I do not like this because it would not scale to many quirks. As I
said,, my preference here would be to just add a WARN.

The other option is get approval to break compatibility on the ST
platform. It may not be a concern on certain platforms.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
