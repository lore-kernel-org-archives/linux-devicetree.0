From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/12] of: Add binding document for MIPS GIC
Date: Tue, 02 Sep 2014 10:27:35 -0700
Message-ID: <5405FE07.4030400@gmail.com>
References: <1409350479-19108-1-git-send-email-abrestic@chromium.org> <1409350479-19108-4-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409350479-19108-4-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jeffrey Deans <jeffrey.deans-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/29/2014 03:14 PM, Andrew Bresticker wrote:
> The Global Interrupt Controller (GIC) present on certain MIPS systems
> can be used to route external interrupts to individual VPEs and CPU
> interrupt vectors.  It also supports a timer and software-generated
> interrupts.
>
> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>   Documentation/devicetree/bindings/mips/gic.txt | 50 ++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mips/gic.txt
>
> diff --git a/Documentation/devicetree/bindings/mips/gic.txt b/Documentation/devicetree/bindings/mips/gic.txt
> new file mode 100644
> index 0000000..725f1ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/gic.txt
> @@ -0,0 +1,50 @@
> +MIPS Global Interrupt Controller (GIC)
> +
> +The MIPS GIC routes external interrupts to individual VPEs and IRQ pins.
> +It also supports a timer and software-generated interrupts which can be
> +used as IPIs.
> +
> +Required properties:
> +- compatible : Should be "mti,global-interrupt-controller"
> +- reg : Base address and length of the GIC registers.
> +- interrupts : Core interrupts to which the GIC may route external interrupts.

This doesn't make sense to me.  The GIC can, and does, route interrupts 
to all CPU cores in a SMP system.  How can there be a concept of only 
associating it with several interrupt lines on a single CPU in the 
system?  That is not what the GIC does, is it?  It is a Global 
interrupts controller, not local.  So specifying device tree bindings 
that don't show its Global nature seems wrong.


> +- interrupt-controller : Identifies the node as an interrupt controller
> +- #interrupt-cells : Specifies the number of cells needed to encode an
> +  interrupt specifier.  Should be 3.
> +  - The first cell is the GIC interrupt number.
> +  - The second cell encodes the interrupt flags.
> +    See <include/dt-bindings/interrupt-controller/irq.h> for a list of valid
> +    flags.
> +  - The optional third cell indicates which CPU interrupt vector the GIC
> +    interrupt should be routed to.  It is a 0-based index into the list of
> +    GIC-to-CPU interrupts specified in the "interrupts" property described
> +    above.  For example, a '2' in this cell will route the interrupt to the
> +    3rd core interrupt listed in 'interrupts'.  If omitted, the interrupt will
> +    be routed to the 1st core interrupt.
> +

This seems like a really convoluted way of doing things that really goes 
against the device tree model.

The routing of interrupts through the GIC to a core interrupt is 
controlled entirely within the GIC hardware and therefore should be a 
property of the GIC itself, not all the random devices connected 
upstream to the GIC.

It also places policy about the priority of the various interrupts into 
the device tree.  Typically the device tree would contain only 
information about the topology of the hardware blocks, not arbitrary 
policy decisions that software could change and still have a perfectly 
functional system.

Therefore I would recommend removing the third cell from the interrupt 
specifier.


> +Example:
> +
> +	cpu_intc: interrupt-controller@0 {
> +		compatible = "mti,cpu-interrupt-controller";
> +
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +	};
> +
> +	gic: interrupt-controller@1bdc0000 {
> +		compatible = "mti,global-interrupt-controller";
> +		reg = <0x1bdc0000 0x20000>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +
> +		interrupt-parent = <&cpu_intc>;
> +		interrupts = <3>, <4>;
> +	};
> +
> +	uart@18101400 {
> +		...
> +		interrupt-parent = <&gic>;
> +		interrupts = <24 IRQ_TYPE_LEVEL_HIGH 0>;
> +		...
> +	};
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
