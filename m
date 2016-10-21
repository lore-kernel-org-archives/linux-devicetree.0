From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] dt/bindings: arm-boards: Remove skeleton.dtsi inclusion
 from example
Date: Fri, 21 Oct 2016 12:16:53 +0200
Message-ID: <CAMuHMdVS3-xm+7gMkO59VtuN_pLAXSCNRBT1JekFE2cVbwngAQ@mail.gmail.com>
References: <1477041629-23341-1-git-send-email-geert+renesas@glider.be> <20161021094938.GB15372@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161021094938.GB15372@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Fri, Oct 21, 2016 at 11:50 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Fri, Oct 21, 2016 at 11:20:29AM +0200, Geert Uytterhoeven wrote:
>> As of commit 9c0da3cc61f1233c ("ARM: dts: explicitly mark skeleton.dtsi
>> as deprecated"), including skeleton.dtsi is deprecated.
>> Hence remove it from the example.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/arm/arm-boards | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm-boards b/Documentation/devicetree/bindings/arm/arm-boards
>> index ab318a56fca2194f..e667ecbcf226dfe3 100644
>> --- a/Documentation/devicetree/bindings/arm/arm-boards
>> +++ b/Documentation/devicetree/bindings/arm/arm-boards
>> @@ -148,15 +148,14 @@ Example:
>>
>>  /dts-v1/;
>>  #include <dt-bindings/interrupt-controller/irq.h>
>> -#include "skeleton.dtsi"
>>
>>  / {
>>       model = "ARM RealView PB1176 with device tree";
>>       compatible = "arm,realview-pb1176";
>> +     #address-cells = <0>;
>> +     #size-cells = <1>;
>>
>>       soc {
>> -             #address-cells = <1>;
>> -             #size-cells = <1>;
>
> Strictly speaking, these two are still necessary for the ranges
> property. They're *not* inherited per the spec, no matter what Linux
> happens to do today.

I wasn't sure about that part of the change. OK, will fix.

> With those restored:
>
> Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
