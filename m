From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH 11/12] ARM: dts: add support for Vybrid running on
 Cortex-M4
Date: Tue, 16 Dec 2014 23:19:08 +0100
Message-ID: <b090cb361e81d2f1be5d21d1a07e9340@agner.ch>
References: <1417565531-4507-1-git-send-email-stefan@agner.ch>
 <1417565531-4507-12-git-send-email-stefan@agner.ch>
 <2994970.DCfUQgtmcD@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2994970.DCfUQgtmcD@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014-12-03 12:03, Arnd Bergmann wrote:
> On Wednesday 03 December 2014 01:12:10 Stefan Agner wrote:
>> diff --git a/arch/arm/boot/dts/vf610m4-colibri.dts b/arch/arm/boot/dts/vf610m4-colibri.dts
>> new file mode 100644
>> index 0000000..051ee0f
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/vf610m4-colibri.dts
>> @@ -0,0 +1,52 @@
>> +/*
>> + * Device tree for Colibri VF61 Cortex-M4 support
>> + *
>> + * Copyright 2014 Stefan Agner
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + */
>> +
>> +/dts-v1/;
>> +#include "vf610m4.dtsi"
>> +
>> +/ {
>> +       model = "VF610 Cortex-M4";
>> +       compatible = "fsl,vf610m4";
>> +
>> +       chosen {
>> +               bootargs = "console=ttyLP2,115200 ihash_entries=64 dhash_entries=64 earlyprintk clk_ignore_unused init=/linuxrc rw";
>> +       };
>> +
> 
> Starting with v3.19, you should be able to use the earlycon framework on
> arm32, so it would be better to replace earlyprintk with earlycon here
> and add a stdout-path property in chosen that points to the console
> uart.

Hi Arnd,

Just started looking in that a bit deeper and some question arose:
Afaik, earlycon need to be supported by the uart driver. The fsl_lpuart,
which is used for Vybrid's uart, does not support earlycon yet. However,
earlyprink already works (see ./arch/arm/include/debug/vf.S). I
understand that earlycon has the advantage of being able to be used on
multiplatform. But earlyprintk is working really early (e.g. before
locating the FDT), and it proved helpful for me when I started working
on that Cortex-M4 stuff. Should earlycon replace earlyprintk completely?

Maybe, on Vybrid, since it would be a good platform for automated !MMU
testing, it would be nice to have earlycon which can be enabled in any
case and would provide output even something blows up quite early... But
I guess I would add earlycon support as part of a new patchset and just
drop earlyprintk here for now.

> 64 hash table entries sounds extremely small, doesn't that impact
> performance? If you have 50MB of actual RAM available, I don't think
> you need that.

Agreed. I copied that from EFM32 which is under much more memory
pressure...

--
Stefan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
