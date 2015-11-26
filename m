From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: Preprocessor arithmetic in dtsi files (base + offset)
Date: Thu, 26 Nov 2015 17:23:15 +0100
Message-ID: <CAMuHMdX9JRRURMxmNFcKOkzeO1B5Nmnk+XnOpgcLsPbiG4CfSA@mail.gmail.com>
References: <56570620.3070106@free.fr>
	<20151126135957.GC8644@n2100.arm.linux.org.uk>
	<56571ACC.9080306@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56571ACC.9080306-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mason <slash.tmp-GANU6spQydw@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Sebastian Frias <sebastian_frias-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 26, 2015 at 3:44 PM, Mason <slash.tmp-GANU6spQydw@public.gmane.org> wrote:
> On 26/11/2015 14:59, Russell King - ARM Linux wrote:
>> On Thu, Nov 26, 2015 at 02:16:16PM +0100, Mason wrote:
>>> #define SCU_BASE 0x20000000
>>>
>>>      scu: scu@XXX {
>>>              compatible = "arm,cortex-a9-scu";
>>>              reg = <SCU_BASE 0x100>;
>>>
>>>      gic: interrupt-controller@XXX {
>>>              compatible = "arm,cortex-a9-gic";
>>>              reg = <SCU_BASE+0x1000 0x1000>, <SCU_BASE+0x100 0x0100>;
>>
>> You don't get preprocessor arithmetic here.  What you get is this passed
>> to DTC:
>>
>>               reg = <0x20000000+0x1000 0x1000>...
>>
>> The only time the preprocessor does arithmetic is when it needs to
>> evaluate an expression, eg, in an #if statement.
>
> Doh! Brain malfunction. No arithmetic indeed.
> Working with the preprocessor would have to involve token-pasting.
>
> #define SCU_BASE(OFFSET)        2000##OFFSET
> #define SCU_BASEX(OFFSET)       0x2000##OFFSET
>
>         gic: interrupt-controller@SCU_BASE(1000) {
>                 reg = <SCU_BASEX(1000) 0x1000>, <SCU_BASEX(0100) 0x0100>;
>         };
>
> My very own abomination!

Yeah! ;-)

I guess this would work, too?

scu_container@20000000 {
        compatible = "simple-bus";

        ranges = <0x0 0x20000000 0x10000>;
        #address-cells = <1>;
        #size-cells = <1>;

        scu: scu@0 {
                compatible = "arm,cortex-a9-scu";
                reg = <0x0000 0x100>;

        gic: interrupt-controller@1000 {
                compatible = "arm,cortex-a9-gic";
                reg = <0x1000 0x1000>, <0x0100 0x0100>;

        twd-timer@0600 {
                compatible = "arm,cortex-a9-twd-timer";
                reg = <0x0600 0x10>;
};

No more explicit arithmetic needed, just substitue "20000000".

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
