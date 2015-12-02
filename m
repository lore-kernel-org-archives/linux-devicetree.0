From: Mason <slash.tmp-GANU6spQydw@public.gmane.org>
Subject: Re: Preprocessor arithmetic in dtsi files (base + offset)
Date: Wed, 2 Dec 2015 23:14:29 +0100
Message-ID: <565F6D45.6070201@free.fr>
References: <56570620.3070106@free.fr>
 <20151126135957.GC8644@n2100.arm.linux.org.uk> <56571ACC.9080306@free.fr>
 <CAMuHMdX9JRRURMxmNFcKOkzeO1B5Nmnk+XnOpgcLsPbiG4CfSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdX9JRRURMxmNFcKOkzeO1B5Nmnk+XnOpgcLsPbiG4CfSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Sebastian Frias <sebastian_frias-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 26/11/2015 17:23, Geert Uytterhoeven wrote:

> I guess this would work, too?
> 
> scu_container@20000000 {
>         compatible = "simple-bus";
> 
>         ranges = <0x0 0x20000000 0x10000>;
>         #address-cells = <1>;
>         #size-cells = <1>;
> 
>         scu: scu@0 {
>                 compatible = "arm,cortex-a9-scu";
>                 reg = <0x0000 0x100>;
> 
>         gic: interrupt-controller@1000 {
>                 compatible = "arm,cortex-a9-gic";
>                 reg = <0x1000 0x1000>, <0x0100 0x0100>;
> 
>         twd-timer@0600 {
>                 compatible = "arm,cortex-a9-twd-timer";
>                 reg = <0x0600 0x10>;
> };
> 
> No more explicit arithmetic needed, just substitute "20000000".

I like it! Only one address to change in the next chip.
Minimizes the risk of missing something.

(I see that armada did something similar, but they also grouped
unrelated stuff. And bcm5301x did exactly what you suggested.)

Wondering if there are macro definitions for the intra-SCU offsets?
So I could have symbolic names, such as

  twd-timer@0600 {
    reg = <TWD_OFFSET 0x10>

Didn't see anything appropriate in include and arch/arm.
Should I include my own definitions at the top of the dtsi?

Regards.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
