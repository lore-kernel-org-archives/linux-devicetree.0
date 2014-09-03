From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 03/12] of: Add binding document for MIPS GIC
Date: Wed, 3 Sep 2014 16:53:42 -0700
Message-ID: <CAL1qeaG_vSiBToi9ZU2=+Guj98gWE_AgmrR7=Z6-PxSNfdH9sA@mail.gmail.com>
References: <1409350479-19108-1-git-send-email-abrestic@chromium.org>
	<1409350479-19108-4-git-send-email-abrestic@chromium.org>
	<5405FE07.4030400@gmail.com>
	<CAL1qeaHcV_4Z9n_THEN_aST3smgaW1vwn81SkmbU0AUJ_rdB1Q@mail.gmail.com>
	<540665BA.3080702@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <540665BA.3080702-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jeffrey Deans <jeffrey.deans-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 2, 2014 at 5:50 PM, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 09/02/2014 12:36 PM, Andrew Bresticker wrote:
>>
>> On Tue, Sep 2, 2014 at 10:27 AM, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> wrote:
>>>
>>> On 08/29/2014 03:14 PM, Andrew Bresticker wrote:
>>>>
>>>>
>>>> The Global Interrupt Controller (GIC) present on certain MIPS systems
>>>> can be used to route external interrupts to individual VPEs and CPU
>>>> interrupt vectors.  It also supports a timer and software-generated
>>>> interrupts.
>>>>
>>>> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>>> ---
>>>>    Documentation/devicetree/bindings/mips/gic.txt | 50
>>>> ++++++++++++++++++++++++++
>>>>    1 file changed, 50 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/mips/gic.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mips/gic.txt
>>>> b/Documentation/devicetree/bindings/mips/gic.txt
>>>> new file mode 100644
>>>> index 0000000..725f1ef
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/mips/gic.txt
>>>> @@ -0,0 +1,50 @@
>>>> +MIPS Global Interrupt Controller (GIC)
>>>> +
>>>> +The MIPS GIC routes external interrupts to individual VPEs and IRQ
>>>> pins.
>>>> +It also supports a timer and software-generated interrupts which can be
>>>> +used as IPIs.
>>>> +
>>>> +Required properties:
>>>> +- compatible : Should be "mti,global-interrupt-controller"
>>>> +- reg : Base address and length of the GIC registers.
>>>> +- interrupts : Core interrupts to which the GIC may route external
>>>> interrupts.
>>>
>>>
>>>
>>> This doesn't make sense to me.  The GIC can, and does, route interrupts
>>> to
>>> all CPU cores in a SMP system.  How can there be a concept of only
>>> associating it with several interrupt lines on a single CPU in the
>>> system?
>>> That is not what the GIC does, is it?  It is a Global interrupts
>>> controller,
>>> not local.  So specifying device tree bindings that don't show its Global
>>> nature seems wrong.
>>
>>
>> While the GIC can route external interrupts to any HW interrupt vector
>> it may not make sense to actually use all those vectors.  For example,
>> the CP0 timer is usually hooked up to HW vector 5 (it could be treated
>> as a GIC local interrupt, though it may still be fixed to HW vector
>> 5).  BTW, the Malta example about the i8259 I gave before was wrong -
>> it appears that it actually gets chained with the GIC.
>
>
> Your comments don't really make sense to me in the context of my knowledge
> of the GIC.
>
> Of course all the CP0 timer and performance counter interrupts are per-CPU
> and routed directly to the corresponding CP0_Cause[IP7..IP2] bits.  We are
> don't need to give them further consideration.
>
>
> Here is the scenario you should consider:
>
>   o 16 CPU cores.
>   o 1 GIC routing interrupts from external sources to the 16 CPUs.
>   o 2 network controllers each with an interrupt line routed to the GIC.
>
> Q: What would the GIC "interrupts" property look like?
>
> Note that the GIC doesn't have a single "interrupt-parent", as it can route
> interrupts to *all* 16 CPUs.
>
> I propose that the GIC have neither an "interrupt-parent", nor "interrupts".
> The fact that it is an "mti,global-interrupt-controller", means that the
> software drivers for the GIC already know how to route interrupts, and any
> information the device tree could contain is redundant.

Ok, I misunderstood your opposition to the binding.

My intention for the "interrupt-parent" and "interrupts" property of
the GIC was to express that GIC interrupts are routed to the CPU
interrupt vectors and that a certain set of these vectors are
available for use by the GIC.  I would agree that these are mostly
redundant (obviously the GIC routes interrupts to CPU interrupt
vecotrs) and that it is not the most accurate description of the
GIC-CPU relationship (the CPU interrupt controller are per-CPU, not
global, and the GIC can route interrupts to any of them), though I'm
not sure that there's a better way of describing it in DT.

So that leaves us with something like this:

interrupt-controller@1bdc0000 {
        compatible = "mti,global-interrupt-controller";

        interrupt-controller;
        #interrupt-cells = <2>;

        available-cpu-vectors = <2>, <3>, ...
};

DT folks, thoughts?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
