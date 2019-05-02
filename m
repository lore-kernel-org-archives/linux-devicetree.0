From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: interrupt-controller: Add Renesas
 RZ/A1 Interrupt Controller
Date: Thu, 2 May 2019 15:02:06 +0100
Message-ID: <506a3763-62c4-6381-c0d2-d5c5ecacd333@arm.com>
References: <20190430121254.3737-1-geert+renesas@glider.be>
 <20190430121254.3737-2-geert+renesas@glider.be>
 <CAL_Jsq+KwOLqd=ZqT-bdM5mp8jfPHu=XingBb6kBsUqHvO=m+g@mail.gmail.com>
 <29e95406-b9fb-fbb6-9240-c3914d885e88@arm.com>
 <CAL_Jsq+FJDdka9BMcXvGveBHiUf=YUU=3gz3e2wxjtXZ+K+NEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+FJDdka9BMcXvGveBHiUf=YUU=3gz3e2wxjtXZ+K+NEA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, devicetree@vger.kernel.org, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 30/04/2019 21:25, Rob Herring wrote:
> On Tue, Apr 30, 2019 at 10:34 AM Marc Zyngier <marc.zyngier@arm.com> wrote:
>>
>> On 30/04/2019 16:02, Rob Herring wrote:
>>> On Tue, Apr 30, 2019 at 7:13 AM Geert Uytterhoeven
>>> <geert+renesas@glider.be> wrote:
>>>>
>>>> Add DT bindings for the Renesas RZ/A1 Interrupt Controller.
>>>>
>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> ---
>>>> v2:
>>>>   - Add "renesas,gic-spi-base",
>>>>   - Document RZ/A2M.
>>>> ---
>>>>  .../renesas,rza1-irqc.txt                     | 30 +++++++++++++++++++
>>>>  1 file changed, 30 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
>>>> new file mode 100644
>>>> index 0000000000000000..ea8ddb6955338ccd
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
>>>> @@ -0,0 +1,30 @@
>>>> +DT bindings for the Renesas RZ/A1 Interrupt Controller
>>>> +
>>>> +The RZ/A1 Interrupt Controller is a front-end for the GIC found on Renesas
>>>> +RZ/A1 and RZ/A2 SoCs:
>>>> +  - IRQ sense select for 8 external interrupts, 1:1-mapped to 8 GIC SPI
>>>> +    interrupts,
>>>> +  - NMI edge select.
>>>> +
>>>> +Required properties:
>>>> +  - compatible: Must be "renesas,<soctype>-irqc", and "renesas,rza1-irqc" as
>>>> +               fallback.
>>>> +               Examples with soctypes are:
>>>> +                 - "renesas,r7s72100-irqc" (RZ/A1H)
>>>> +                 - "renesas,r7s9210-irqc" (RZ/A2M)
>>>> +  - #interrupt-cells: Must be 2 (an interrupt index and flags, as defined
>>>> +                                in interrupts.txt in this directory)
>>>> +  - interrupt-controller: Marks the device as an interrupt controller
>>>> +  - reg: Base address and length of the memory resource used by the interrupt
>>>> +         controller
>>>> +  - renesas,gic-spi-base: Lowest GIC SPI interrupt number this block maps to.
>>>
>>> Why isn't this just an 'interrupts' property?
>>
>> That's likely because of kernel limitations. The DT code does an
>> of_populate() on any device that it finds, parse the "interrupts"
>> propertiy, resulting in the irq_descs being populated.
>>
>> That creates havoc, as these interrupts are not for this device, but for
>> something that is connected to it. This is merely a bridge of some sort.
> 
> 'interrupt-map' would avoid that problem I think.

I'm afraid it doesn't scale at all. Case in point, the GICv3 ITS. Up to
32bit worth of IDs. How do you represent that using an interrupt-map?
Agreed, that's the extreme case, but representing more than a handful of
interrupts using an interrupt-map is a pain.

> 
>> Furthermore, this is a rather long established practice: gic-v2m,
>> gic-v3-mbi, mediatek,sysirq, mediatek,cirq... All the bits of glue that
>> for one reason or another plug onto the GIC use the same method.
> 
> All handling the mapping to the parent in their own way...

Yes, and that's the problem. We need a scalable way to describe ranges
of interrupts that are "forwarded" (for the lack of a better term), but
now "owned" by the the interrupt controller.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
