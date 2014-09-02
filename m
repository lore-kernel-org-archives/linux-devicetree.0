From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 03/12] of: Add binding document for MIPS GIC
Date: Mon, 1 Sep 2014 17:53:18 -0700
Message-ID: <CAL1qeaH97fL3x689-FwOxRZWS2-6CDzzzJX3xEKdvULHoxjMLA@mail.gmail.com>
References: <1409350479-19108-1-git-send-email-abrestic@chromium.org>
	<1409350479-19108-4-git-send-email-abrestic@chromium.org>
	<20140901110119.GB6617@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140901110119.GB6617@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jeffrey Deans <jeffrey.deans-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 1, 2014 at 4:01 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Fri, Aug 29, 2014 at 11:14:30PM +0100, Andrew Bresticker wrote:
>> The Global Interrupt Controller (GIC) present on certain MIPS systems
>> can be used to route external interrupts to individual VPEs and CPU
>> interrupt vectors.  It also supports a timer and software-generated
>> interrupts.
>>
>> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/mips/gic.txt | 50 ++++++++++++++++++++++++++
>>  1 file changed, 50 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mips/gic.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mips/gic.txt b/Documentation/devicetree/bindings/mips/gic.txt
>> new file mode 100644
>> index 0000000..725f1ef
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/gic.txt
>> @@ -0,0 +1,50 @@
>> +MIPS Global Interrupt Controller (GIC)
>> +
>> +The MIPS GIC routes external interrupts to individual VPEs and IRQ pins.
>> +It also supports a timer and software-generated interrupts which can be
>> +used as IPIs.
>> +
>> +Required properties:
>> +- compatible : Should be "mti,global-interrupt-controller"
>
> I couldn't find "mti" in vendor-prefixes.txt (as of v3.17-rc3). If
> there's not a patch to add it elsewhere, would you mind providing one
> with this series?

Sure.  As James points out, "img" could also be used but I chose "mti"
since the CPU interrupt controller also uses "mti" and I believe the
GIC IP was developed before the acquisition by Imagination (though I'm
not sure if that actually matters).

>> +- reg : Base address and length of the GIC registers.
>> +- interrupts : Core interrupts to which the GIC may route external interrupts.
>
> How many?

Up to 6, one for each of the possible core hardware interrupts (i.e.
interrupt vectors 2 - 7).  Which ones are available to the GIC depend
on the system, for example Malta has an i8259 PIC hooked up to CPU
interrupt vector 2, so that vector should not be used by the GIC.

> In any order?

They can technically be in any order, but when in strictly
increasing/decreasing order they can be used along with the 3rd cell
(described below) to prioritize interrupts.

>> +- interrupt-controller : Identifies the node as an interrupt controller
>> +- #interrupt-cells : Specifies the number of cells needed to encode an
>> +  interrupt specifier.  Should be 3.
>> +  - The first cell is the GIC interrupt number.
>> +  - The second cell encodes the interrupt flags.
>> +    See <include/dt-bindings/interrupt-controller/irq.h> for a list of valid
>> +    flags.
>
> Are all the flags valid for this interrupt controller?

Yes.

>> +  - The optional third cell indicates which CPU interrupt vector the GIC
>> +    interrupt should be routed to.  It is a 0-based index into the list of
>> +    GIC-to-CPU interrupts specified in the "interrupts" property described
>> +    above.  For example, a '2' in this cell will route the interrupt to the
>> +    3rd core interrupt listed in 'interrupts'.  If omitted, the interrupt will
>> +    be routed to the 1st core interrupt.
>
> I don't follow why this should be in the DT. Why is this necessary?

Since the GIC can route external interrupts to any of the CPU hardware
interrupt vectors, it can be used to assign priorities to external
interrupts.  If the CPU is in vectored interrupt mode, the highest
numbered interrupt vector (7) has the highest priority.  An example:

gic: interrupt-controller@1bdc0000 {
        ...
        interrupts = <3>, <4>;
        ...
};

uart {
        ...
        interrupt-parent = <&gic>;
        interrupts = <24 IRQ_TYPE_LEVEL_HIGH 1>;
        ...
};

i2c {
        ...
        interrupt-parent = <&gic>;
        interrupts = <33 IRQ_TYPE_LEVEL_HIGH 0>;
        ...
};

Since the third cell for the UART is '1', it maps to CPU interrupt
vector 4 and thus has a higher priority than the I2C (whose third cell
is 0, mapping to CPU interrupt vector 3).

Perhaps, though, this is an instance of software policy being
specified in device-tree.  Other options would be to a) evenly
distribute the GIC external interrupts across the CPU interrupt
vectors available to the GIC, or b) just map all GIC external
interrupts to a single interrupt vector.

> I also don't follow how this can be ommitted, given interrupt-cells is
> required to be three by the wording above.

If it's absent, the interrupt will be routed to the first CPU
interrupt vector in the list.  It's equivalent to the third cell being
0.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
