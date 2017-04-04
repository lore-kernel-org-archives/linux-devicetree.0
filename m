From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/7] rtc: Add rtc-sh
Date: Tue, 4 Apr 2017 09:29:27 -0500
Message-ID: <CAL_JsqLLZsLzS4ONOexJADQXXXr9iquFUcVj8kX6AEVwM+x56A@mail.gmail.com>
References: <20170322142754.30888-1-chris.brandt@renesas.com>
 <20170322142754.30888-3-chris.brandt@renesas.com> <20170329012441.bxnkyqui24mymuvr@rob-hp-laptop>
 <CAMuHMdVmwJYMzspVeDqToBrkfK+zGLMNhxGvEbqCA-vuCUXqoQ@mail.gmail.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDJIP47K7MERBX63R3DQKGQEH7CGYKA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAMuHMdVmwJYMzspVeDqToBrkfK+zGLMNhxGvEbqCA-vuCUXqoQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, RTCLINUX <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 29, 2017 at 1:49 AM, Geert Uytterhoeven
<geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> Hi Rob,
>
> On Wed, Mar 29, 2017 at 3:24 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Wed, Mar 22, 2017 at 10:27:49AM -0400, Chris Brandt wrote:
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/rtc/rtc-sh.txt
>>> @@ -0,0 +1,29 @@
>>> +* Real Time Clock for Renesas SH and ARM SoCs
>>> +
>>> +Required properties:
>>> +- compatible: Should be "renesas,r7s72100-rtc" and "renesas,sh-rtc" as a
>>> +  fallback.
>>> +- reg: physical base address and length of memory mapped region.
>>> +- interrupts: 3 interrupts for alarm, period, and carry.
>>> +- interrupt-names: The interrupts should be labeled as "alarm", "period", and
>>> +  "carry".
>>> +- clocks: The functional clock source for the RTC controller must be listed
>>> +  first (if exists). Additionally, potential clock counting sources are to be
>>> +  listed.
>>> +- clock-names: The functional clock must be labeled as "fck". Other clocks
>>> +  may be named in accordance to the SoC hardware manuals.
>>> +
>>> +
>>> +Example:
>>> +rtc: rtc@fcff1000 {
>>> +     compatible = "renesas,r7s72100-rtc", "renesas,sh-rtc";
>>> +     reg = <0xfcff1000 0x2e>;
>>> +     interrupts = <GIC_SPI 276 IRQ_TYPE_EDGE_RISING
>>> +                   GIC_SPI 277 IRQ_TYPE_EDGE_RISING
>>> +                   GIC_SPI 278 IRQ_TYPE_EDGE_RISING>;
>>> +     interrupt-names = "alarm", "period", "carry";
>>> +     clocks = <&mstp6_clks R7S72100_CLK_RTC>, <&rtc_x1_clk>,
>>> +              <&rtc_x3_clk>, <&extal_clk>;
>>> +     clock-names = "fck", "rtc_x1", "rtc_x3", "extal";
>>> +     power-domains = <&cpg_clocks>;
>>
>> Not documented.
>
> "power-domains" is a platform property.
>
> All hardware components need power.
> All synchronous hardware components need a clock.
> Most hardware components have a reset signal.

And we document clocks and reset for every binding.

> Whether these are exposed and can be controlled depends on the platform/SoC.
> So documenting them in each and every device binding looks overkill to me.
> I think this is something to be addressed by devicetree-specification (which
> doesn't handle clocks, power-domains, resets yet).

It's a question of validation. How do I validate power-domains is a
valid property for a given compatible? What if it is required, but not
present? Any node can have it? So it is valid for memory and chosen
nodes, an i2c device, an LCD panel, etc?

> If you prefer, the property can be removed from the example, though.

If it is valid, then I don't want it removed.

Rob

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
