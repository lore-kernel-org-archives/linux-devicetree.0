From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Preprocessor arithmetic in dtsi files (base + offset)
Date: Thu, 26 Nov 2015 17:51:28 +0000
Message-ID: <565746A0.108@arm.com>
References: <56570620.3070106@free.fr>
 <20151126135957.GC8644@n2100.arm.linux.org.uk> <56571ACC.9080306@free.fr>
 <CAMuHMdX9JRRURMxmNFcKOkzeO1B5Nmnk+XnOpgcLsPbiG4CfSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdX9JRRURMxmNFcKOkzeO1B5Nmnk+XnOpgcLsPbiG4CfSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Mason <slash.tmp-GANU6spQydw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Sebastian Frias <sebastian_frias-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 26/11/15 16:23, Geert Uytterhoeven wrote:
[...]
> I guess this would work, too?
>
> scu_container@20000000 {
>          compatible = "simple-bus";
>
>          ranges = <0x0 0x20000000 0x10000>;
>          #address-cells = <1>;
>          #size-cells = <1>;
>
>          scu: scu@0 {
>                  compatible = "arm,cortex-a9-scu";
>                  reg = <0x0000 0x100>;
>
>          gic: interrupt-controller@1000 {
>                  compatible = "arm,cortex-a9-gic";
>                  reg = <0x1000 0x1000>, <0x0100 0x0100>;
>
>          twd-timer@0600 {
>                  compatible = "arm,cortex-a9-twd-timer";
>                  reg = <0x0600 0x10>;
> };
>
> No more explicit arithmetic needed, just substitue "20000000".

Which, funnily enough, ends up looking an awful lot like the definition 
in the hardware documentation[1] too ;)

Robin.

[1]:http://infocenter.arm.com/help/topic/com.arm.doc.ddi0407i/CACCJFCJ.html

> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
