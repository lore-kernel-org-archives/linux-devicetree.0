From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: UniPhier: add USB EHCI device nodes
Date: Wed, 8 Jul 2015 13:51:14 +0900
Message-ID: <CAK7LNATGxa3mnU+rg-5+Eix8rvG-mB-A9SuTyCLHxvfHKOznNg@mail.gmail.com>
References: <1436154450-21102-1-git-send-email-yamada.masahiro@socionext.com>
	<1436154450-21102-4-git-send-email-yamada.masahiro@socionext.com>
	<CAL_JsqJ_5SvSqfhtTYKmj9f2E0w0XLkekdOksDY2VZf7r6ZB+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJ_5SvSqfhtTYKmj9f2E0w0XLkekdOksDY2VZf7r6ZB+g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,


2015-07-07 23:53 GMT+09:00 Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> On Sun, Jul 5, 2015 at 10:47 PM, Masahiro Yamada
> <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
>> Get USB 2.0 host controllers available with generic-ehci bindings.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
>> ---
>
>> diff --git a/arch/arm/boot/dts/uniphier-ph1-ld4.dtsi b/arch/arm/boot/dts/uniphier-ph1-ld4.dtsi
>> index 1261e6d..b042711 100644
>> --- a/arch/arm/boot/dts/uniphier-ph1-ld4.dtsi
>> +++ b/arch/arm/boot/dts/uniphier-ph1-ld4.dtsi
>> @@ -127,6 +127,27 @@
>>                         reg = <0x59800000 0x2000>;
>>                 };
>>
>> +               usb0: usb@5a800100 {
>> +                       compatible = "generic-ehci";
>
> You should also have a chip specific compatible string in addition to
> generic-ehci.

OK, will do.

I will wait a bit more before sending v2
in case someone might have some comments on this series.



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
