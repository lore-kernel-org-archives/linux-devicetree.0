From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: uniphier: add UniPhier pinctrl binding
Date: Wed, 29 Nov 2017 12:44:22 +0900
Message-ID: <CAK7LNAQYBe=x8sOBTrz8zE+5JEhOu+3eQKd8fbSAxi9Zuy18jQ@mail.gmail.com>
References: <1511855386-10421-1-git-send-email-yamada.masahiro@socionext.com> <20171128152706.pg3tndrrne3nhduy@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171128152706.pg3tndrrne3nhduy@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,


2017-11-29 0:27 GMT+09:00 Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> On Tue, Nov 28, 2017 at 04:49:45PM +0900, Masahiro Yamada wrote:
>> The driver has been in the tree for a while, but its binding document
>> is missing.  Hence, here it is.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
>> ---
>>
>>  .../pinctrl/socionext,uniphier-pinctrl.txt         | 27 ++++++++++++++++++++++
>>  MAINTAINERS                                        |  1 +
>>  2 files changed, 28 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.txt
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.txt
>> new file mode 100644
>> index 0000000..8173b12
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.txt
>> @@ -0,0 +1,27 @@
>> +UniPhier SoCs pin controller
>> +
>> +Required properties:
>> +- compatible: should be one of the following:
>> +    "socionext,uniphier-ld4-pinctrl"  - for LD4 SoC
>> +    "socionext,uniphier-pro4-pinctrl" - for Pro4 SoC
>> +    "socionext,uniphier-sld8-pinctrl" - for sLD8 SoC
>> +    "socionext,uniphier-pro5-pinctrl" - for Pro5 SoC
>> +    "socionext,uniphier-pxs2-pinctrl" - for PXs2 SoC
>> +    "socionext,uniphier-ld6b-pinctrl" - for LD6b SoC
>> +    "socionext,uniphier-ld11-pinctrl" - for LD11 SoC
>> +    "socionext,uniphier-ld20-pinctrl" - for LD20 SoC
>> +    "socionext,uniphier-pxs3-pinctrl" - for PXs3 SoC
>> +
>> +Note:
>> +The UniPhier pinctrl should be a subnode of a "syscon" compatible node.
>> +
>> +Example:
>> +     soc-glue@5f800000 {
>> +             compatible = "socionext,uniphier-pro4-soc-glue",
>> +                          "simple-mfd", "syscon";
>> +             reg = <0x5f800000 0x2000>;
>> +
>> +             pinctrl: pinctrl {
>> +                     compatible = "socionext,uniphier-pro4-pinctrl";
>
> There's not a contiguous register range that can be put here?


Right.

I saw SATA PHY registers are inserted among the pinctrl registers.

Hardware engineers often make crazy design.





>> +             };
>> +     };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index aa71ab52f..38b0ddc 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2042,6 +2042,7 @@ L:      linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
>>  T:   git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-uniphier.git
>>  S:   Maintained
>>  F:   Documentation/devicetree/bindings/gpio/gpio-uniphier.txt
>> +F:   Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.txt
>>  F:   arch/arm/boot/dts/uniphier*
>>  F:   arch/arm/include/asm/hardware/cache-uniphier.h
>>  F:   arch/arm/mach-uniphier/
>> --
>> 2.7.4
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
