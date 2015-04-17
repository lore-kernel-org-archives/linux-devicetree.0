From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: UniPhier: add basic support for UniPhier architecture
Date: Sat, 18 Apr 2015 01:12:36 +0900
Message-ID: <CAK7LNARZC3GFa6KpZNsFuZ+0XZ7K0dEbb++PQzwtsZ2z86n9kA@mail.gmail.com>
References: <1429170038-16757-1-git-send-email-yamada.masahiro@socionext.com>
	<1429170038-16757-2-git-send-email-yamada.masahiro@socionext.com>
	<3655031.20bjeBBBYS@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3655031.20bjeBBBYS@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

2015-04-16 18:41 GMT+09:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> On Thursday 16 April 2015 16:40:35 Masahiro Yamada wrote:
>
>>+ENTRY(uniphier_secondary_startup)
>>+       bl      v7_invalidate_l1
>>+       b       secondary_startup
>>+ENDPROC(uniphier_secondary_startup)
>
> Since this file is really trivial, I wonder if you could just use
> a 'naked' inline assembly function from C code here, to have
> the entire SMP support in one file.

I merged platsmp.c and headsmp.c into a single file in v3.
I added __naked as you suggested.



>> +
>> +#define ROM_BOOT_ROMRSV2             0x59801208
>
> Please don't hardcode any physical addresses, instead find the DT node
> or syscon device in the _boot_secondary implementation.

I implemented it as a syscon device in v3.


> Which device is this register part of?

It is just a simple register for storing destination address for the
secondary CPU.


>> +
>> +static const char * const uniphier_board_dt_compat[] __initconst = {
>> +     "socionext,ph1-sld3",
>> +     "socionext,ph1-ld4",
>> +     "socionext,ph1-pro4",
>> +     "socionext,ph1-sld8",
>> +     "socionext,ph1-pro5",
>> +     "socionext,ph1-proxstream2",
>> +     "socionext,ph1-ld6b",
>> +     NULL,
>> +};
>
> Are these chip names or board names? The list should normally have
> just the socs, which I assume you do, but it's not completely clear
> from the source.

SoC names.

Perhaps, the structure name "uniphier_board_dt_compat" might be confusing.
I renamed it into "uniphier_dt_compat" in v3.


Many thanks!



BTW, I had solved the problem "not syncing: Attempted to kill init!
exitcode=0x00000004 ?",
I posted about two weeks ago.
L2 cache had nothing to do with the issue.
With a little fix of the device tree and an initramdisk I regenerated
using Buildroot,
I succeeded in booting the kernel.



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
