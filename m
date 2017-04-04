From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 2/7] rtc: Add rtc-sh
Date: Tue, 4 Apr 2017 17:27:35 +0200
Message-ID: <CAMuHMdWs5ecdD6oCZ9ZO-mWkqwTJabHcn26TgfSwA4cGbp=9=Q@mail.gmail.com>
References: <20170322142754.30888-1-chris.brandt@renesas.com>
 <20170322142754.30888-3-chris.brandt@renesas.com> <20170329012441.bxnkyqui24mymuvr@rob-hp-laptop>
 <CAMuHMdVmwJYMzspVeDqToBrkfK+zGLMNhxGvEbqCA-vuCUXqoQ@mail.gmail.com> <CAL_JsqLLZsLzS4ONOexJADQXXXr9iquFUcVj8kX6AEVwM+x56A@mail.gmail.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCQJP74GSUDRB2PWR3DQKGQEUY44Q2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: geert.uytterhoeven-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
In-Reply-To: <CAL_JsqLLZsLzS4ONOexJADQXXXr9iquFUcVj8kX6AEVwM+x56A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, RTCLINUX <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, Apr 4, 2017 at 4:29 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Mar 29, 2017 at 1:49 AM, Geert Uytterhoeven
> <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>> On Wed, Mar 29, 2017 at 3:24 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> On Wed, Mar 22, 2017 at 10:27:49AM -0400, Chris Brandt wrote:
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/rtc/rtc-sh.txt

>>>> +Example:
>>>> +rtc: rtc@fcff1000 {
>>>> +     compatible = "renesas,r7s72100-rtc", "renesas,sh-rtc";
>>>> +     reg = <0xfcff1000 0x2e>;
>>>> +     interrupts = <GIC_SPI 276 IRQ_TYPE_EDGE_RISING
>>>> +                   GIC_SPI 277 IRQ_TYPE_EDGE_RISING
>>>> +                   GIC_SPI 278 IRQ_TYPE_EDGE_RISING>;
>>>> +     interrupt-names = "alarm", "period", "carry";
>>>> +     clocks = <&mstp6_clks R7S72100_CLK_RTC>, <&rtc_x1_clk>,
>>>> +              <&rtc_x3_clk>, <&extal_clk>;
>>>> +     clock-names = "fck", "rtc_x1", "rtc_x3", "extal";
>>>> +     power-domains = <&cpg_clocks>;
>>>
>>> Not documented.
>>
>> "power-domains" is a platform property.
>>
>> All hardware components need power.
>> All synchronous hardware components need a clock.
>> Most hardware components have a reset signal.
>
> And we document clocks and reset for every binding.

Then we'll have to add lots of them ;-)

Usually these are documented only if the user (the driver) cares about them,
and/or if there are multiple of the same type. E.g.
  - The driver needs to know or control a clock frequency,
  - The driver needs to enable/disable a clock,
  - The driver needs to know or control one or more voltages,
  - ...

It's not that devices without documented regulators, power-domains, or clocks
properties no longer consume power or don't run from a clock.  These are just
not described in DT, as deemed unimportant.  But on some platforms, they may
become important.

>> Whether these are exposed and can be controlled depends on the platform/SoC.
>> So documenting them in each and every device binding looks overkill to me.
>> I think this is something to be addressed by devicetree-specification (which
>> doesn't handle clocks, power-domains, resets yet).
>
> It's a question of validation. How do I validate power-domains is a
> valid property for a given compatible? What if it is required, but not

With platform property, I mean that it depends on the platform, not on the
compatible value of the device.

For a generic compatible value ("renesas,sh-srtc") you cannot know, as
it depends on the actual SoC the (same) RTC device is part of.

For an SoC-specific compatible value ("renesas,r7s72100-rtc"), you could know
from the compatible value (an r7s72100 SoC must have r7s72100 clocks, and the
r7s72100 clock domain, cfr.
Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt).
However. the SoC-specific compatible values exist only as a workaround
for not knowing
the exact version of the IP cores.

> present? Any node can have it? So it is valid for memory and chosen
> nodes, an i2c device, an LCD panel, etc?

It's not valid for a chosen node ;-)

It can be valid for memory (or the memory-controller; oops, the memory node is
not a child of the memory-controller node), i2c devices, LCD panels, ...
depending on the platform.

Consider e.g. i2c devices. I can add a GPIO-controlled MOSFET bank to my board,
to enable power to individual i2c devices, and abstract that as a
power-controller in DT.  Suddenly I have to add power-domains properties to the
individual i2c device nodes, while the i2c devices itself haven't changed, and
thus keep the same compatible values.
Should I now document the power-domains property in the i2c devices' DT binding
documents?

On Linux, the drivers won't care, as the platform-specific things are handled
transparently by Runtime PM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
