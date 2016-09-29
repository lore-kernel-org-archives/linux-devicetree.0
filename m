From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH RFC 6/8] ARM: dts: r8a7743: add SYS-DMAC support
Date: Thu, 29 Sep 2016 08:36:48 +0200
Message-ID: <CAMuHMdWho3WCpoNW7H_Oa2wnMkDV_3VoRD5EwzRqbfE2bDCtgA@mail.gmail.com>
References: <3533019.Wim1Kuh1ic@wasted.cogentembedded.com> <1815255.1arMxK7TDL@wasted.cogentembedded.com>
 <CAMuHMdXz5K66AU7d-+NsPrAyc8V53mDxzggiUk-TrFRAwBFXOg@mail.gmail.com> <be7575a5-e9a0-05a6-5b2d-803632c7edac@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <be7575a5-e9a0-05a6-5b2d-803632c7edac-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Wed, Sep 28, 2016 at 10:09 PM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> On 09/19/2016 11:19 AM, Geert Uytterhoeven wrote:
>>> --- renesas.orig/arch/arm/boot/dts/r8a7743.dtsi
>>> +++ renesas/arch/arm/boot/dts/r8a7743.dtsi
>>> @@ -90,6 +90,70 @@
>>>                         #power-domain-cells = <1>;
>>>                 };
>>>
>>> +               dmac0: dma-controller@e6700000 {
>>> +                       compatible = "renesas,dmac-r8a7743",
>>
>>
>> To be documented.
>
>    The R-Car DMAC binding has "renesas,dmac-<soctype>" documented.
> I can add the mention of RZ/G and new examples though...

Just adding a line for RZ/G1M should be sufficient. Thanks!

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
