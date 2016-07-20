From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7792: add SDHI support
Date: Wed, 20 Jul 2016 10:07:39 +0200
Message-ID: <CAMuHMdUUZ=gopWOir9PMiDgJ8o+CMp+qG=FLhGg_gHrMYzwgFg@mail.gmail.com>
References: <2441635.ESeLhIjWEX@wasted.cogentembedded.com> <8030361.FnpbGzHVP8@wasted.cogentembedded.com>
 <20160717225842.GA25133@verge.net.au> <cece2545-52f9-7ddb-36d2-df364a272092@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cece2545-52f9-7ddb-36d2-df364a272092-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Mon, Jul 18, 2016 at 9:12 PM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
>>> --- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
>>> +++ renesas/arch/arm/boot/dts/r8a7792.dtsi
>>> @@ -435,6 +435,18 @@
>>>                         status = "disabled";
>>>                 };
>>>
>>> +               sdhi0: sd@ee100000 {
>>> +                       compatible = "renesas,sdhi-r8a7792";
>>> +                       reg = <0 0xee100000 0 0x200>;
>>
>>
>> I do not have the documentation available to check,
>
>    Me nether. The SDHI .zip only includes the manual for E2, H2, and M2.
>
>> however, I wonder if
>> as per 66f47ed0e86d ("ARM: shmobile: r8a7790: tidyup SDHI register size on
>> DTSI") the register size should be 0x328.
>
>    I just don't know...

>>> +                       interrupts = <0 165 IRQ_TYPE_LEVEL_HIGH>;
>>> +                       dmas = <&dmac0 0xcd>, <&dmac0 0xce>,
>>> +                              <&dmac1 0xcd>, <&dmac1 0xce>;
>>> +                       dma-names = "tx", "rx", "tx", "rx";
>>> +                       clocks = <&mstp3_clks R8A7792_CLK_SDHI0>;
>>> +                       power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
>>> +                       status = "disabled";
>>> +               };
>>> +
>>>                 jpu: jpeg-codec@fe980000 {
>>>                         compatible = "renesas,jpu-r8a7792",
>>>                                      "renesas,rcar-gen2-jpu";
>
>    I also wonder whether whether a single per-SoC SDHI "compatible" is
> valid. The registers and their offsets seem to differ b/w SDHI0 and the
> other SDHI cores...

There's version register.

BTW, given SDHI on V2H doesn't support SDR50/SDR104, unlike the instances
on other R-Car Gen2 SoCs, can you please tell us the version value, as read
from CTL_VERSION in sh_mobile_sdhi_sdbuf_width()?

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
