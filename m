From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: UniPhier: add support for UniPhier SoCs and boards
Date: Sat, 18 Apr 2015 01:16:24 +0900
Message-ID: <CAK7LNAQfUqZvTWZyETyXJUr3MDdMtU6MV++jfAcaoqzEKpUxtg@mail.gmail.com>
References: <1429170038-16757-1-git-send-email-yamada.masahiro@socionext.com>
	<1429170038-16757-4-git-send-email-yamada.masahiro@socionext.com>
	<2204571.AOVr95oO32@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2204571.AOVr95oO32@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

2015-04-16 18:44 GMT+09:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> On Thursday 16 April 2015 16:40:37 Masahiro Yamada wrote:
>> +
>> +/ {
>> +     model = "UniPhier PH1-LD4 Reference Board";
>> +     compatible = "socionext,ph1-ld4-ref", "socionext,ph1-ld4";
>> +
>> +     memory {
>> +             device_type = "memory";
>> +             reg = <0x80000000 0x20000000>;
>> +     };
>> +
>> +     chosen {
>> +             bootargs = "console=ttyS0,115200 earlyprintk";
>> +     };
>
> I would remove the 'earlyprintk' option here. You don't add any options
> for the platform in Kconfig.debug, and I hope that we can eventually
> start using earlycon. Please add an appropriate stdio-path property
> here, but note that we are still lacking the fixmap patches to make
> earlycon work.
>
> Otherwise looks good.

I dropped earlyprintk, added stdout-path in v3.

Thanks!


-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
