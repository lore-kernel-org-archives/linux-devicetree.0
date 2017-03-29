From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 2/7] rtc: Add rtc-sh
Date: Wed, 29 Mar 2017 08:49:57 +0200
Message-ID: <CAMuHMdVmwJYMzspVeDqToBrkfK+zGLMNhxGvEbqCA-vuCUXqoQ@mail.gmail.com>
References: <20170322142754.30888-1-chris.brandt@renesas.com>
 <20170322142754.30888-3-chris.brandt@renesas.com> <20170329012441.bxnkyqui24mymuvr@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170329012441.bxnkyqui24mymuvr@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, RTCLINUX <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Wed, Mar 29, 2017 at 3:24 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Mar 22, 2017 at 10:27:49AM -0400, Chris Brandt wrote:
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/rtc-sh.txt
>> @@ -0,0 +1,29 @@
>> +* Real Time Clock for Renesas SH and ARM SoCs
>> +
>> +Required properties:
>> +- compatible: Should be "renesas,r7s72100-rtc" and "renesas,sh-rtc" as a
>> +  fallback.
>> +- reg: physical base address and length of memory mapped region.
>> +- interrupts: 3 interrupts for alarm, period, and carry.
>> +- interrupt-names: The interrupts should be labeled as "alarm", "period", and
>> +  "carry".
>> +- clocks: The functional clock source for the RTC controller must be listed
>> +  first (if exists). Additionally, potential clock counting sources are to be
>> +  listed.
>> +- clock-names: The functional clock must be labeled as "fck". Other clocks
>> +  may be named in accordance to the SoC hardware manuals.
>> +
>> +
>> +Example:
>> +rtc: rtc@fcff1000 {
>> +     compatible = "renesas,r7s72100-rtc", "renesas,sh-rtc";
>> +     reg = <0xfcff1000 0x2e>;
>> +     interrupts = <GIC_SPI 276 IRQ_TYPE_EDGE_RISING
>> +                   GIC_SPI 277 IRQ_TYPE_EDGE_RISING
>> +                   GIC_SPI 278 IRQ_TYPE_EDGE_RISING>;
>> +     interrupt-names = "alarm", "period", "carry";
>> +     clocks = <&mstp6_clks R7S72100_CLK_RTC>, <&rtc_x1_clk>,
>> +              <&rtc_x3_clk>, <&extal_clk>;
>> +     clock-names = "fck", "rtc_x1", "rtc_x3", "extal";
>> +     power-domains = <&cpg_clocks>;
>
> Not documented.

"power-domains" is a platform property.

All hardware components need power.
All synchronous hardware components need a clock.
Most hardware components have a reset signal.

Whether these are exposed and can be controlled depends on the platform/SoC.
So documenting them in each and every device binding looks overkill to me.
I think this is something to be addressed by devicetree-specification (which
doesn't handle clocks, power-domains, resets yet).

If you prefer, the property can be removed from the example, though.

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
