From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Fri, 29 May 2009 08:33:29 +1000
Message-ID: <1243550009.17903.19.camel@pasglop>
References: <20090527175609.GB31861@flint.arm.linux.org.uk>
	<1243496236.3171.140.camel@pasglop>
	<20090528091513.GA14789@n2100.arm.linux.org.uk>
	<20090528.025739.16559619.davem@davemloft.net>
	<1243505493.5573.29.camel@pasglop>
	<20090528103421.GC14789@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090528103421.GC14789-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org, timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2009-05-28 at 11:34 +0100, Russell King - ARM Linux wrote:
> On Thu, May 28, 2009 at 08:11:33PM +1000, Benjamin Herrenschmidt wrote:
> > Well, that example is interesting because you may not want the
> > transceiver to be a child of the UART :-) The tree hierachy is mostly
> > about addressing, and addressing below a UART doesn't mean much.
> > 
> > So if the transceiver has a bunch of MMIO registers, it might be better
> > off located elsewhere, and have the UART have a "fir-transceiver"
> > property with a phandle to the actual device...
> 
> IrDA transceivers do not have MMIO registers.  Transceivers are an IR
> LED, an IR phototransitor andr receiver circuitry.  They're typically
> 9 pin devices with power, ground, transmit, receive and a bunch of
> control signals.

Right, I'm used to those transceivers. For some reason I read from your
previous post that you had such a transceiver with registers. But it
doesn't matter much, it's a valid example of how you can go "accross"
the base hierarchy of the tree if needs be.

In the case of a simple transciever like the ones controlled by GPIOs or
via bit banging on flow control lines, yes, it would probably be a child
of the UART node, eventually with properties describing which GPIOs
(via phandles to GPIO nodes for example) are used to configure it.

I think the -root- of the discussion at this stage is really the problem
of providing those "methods" for power control, clock control, or other
similar housekeeping things. I think the device-tree doesn't make things
better or worse per se, and unless there's an actual live OF
implementation underneath (in which case nodes do have methods you can
call into via OF callbacks), then the device-tree doesn't provide an
automatic way of solving that. But we can invent one :-)

> The kind of reply I was hoping to get to my email was something more
> along these lines - an informed view giving an idea how some of these
> issues would be addressed with an OF device tree.
> 
> I can see how the named functions/directory would work - that seems to
> be relatively simple and straight forward.

Right. It deviates a bit from the idea that the device-tree should be
agnostic to the operating system and only represent the HW layout, but
I'm no religious fanatic and I think it might be a very good compromise.

In many case, sets of "standard" methods could be provided by the kernel
that use properties in the target node as arguments. For example, things
like "simple-enable-gpio" and "simple-reset-gpio" could be generically
provided, using properties such as "enable-gpio" (phandle to a GPIO
node), "enable-delay" (integer duration) etc... in the target node as
"arguments". The platform can then register the more fancy onces it
needs.

> However, the pseudo-device approach I'm less clear about.  With a separate
> driver for the "power control" pseudo-device, how would you communicate
> the state information down to that driver?

It depends. It doesn't have to be "pseudo" actually... in the case of
backlight, one could have a node for backlight control and a real driver
binding to it that just does backlight control. The linkage between that
and the main LCD driver, if necessary, can be done via phandle links in
the tree, and recovering the driver from the node (a bit tricky but
doable).

> I am equating OF devices and drivers too much with the struct device and
> struct driver model, which sounds like it's not the best thing to do with
> OF.

Well, it depends really. Mostly we -do- end up with a struct device for
a node ... but it's not necessarily always true.

Cheers,
Ben.
