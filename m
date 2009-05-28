From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 17:47:27 +1000
Message-ID: <1243496847.3171.150.camel@pasglop>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
	<87vdnm8sec.fsf@macbook.be.48ers.dk>
	<4A1D6901.2090508@freescale.com>
	<20090527175609.GB31861@flint.arm.linux.org.uk>
	<4A1D8FBA.6040802@freescale.com>
	<9e4733910905271213k7f4b93e7i7e6f2af24d85f@mail.gmail.com>
	<20090527192116.GA31110@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090527192116.GA31110-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
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
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jon Smirl <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org
List-Id: devicetree@vger.kernel.org


> That's a damned good question - platform devices have been around since
> the dawn of the device model, so the real question which needs to be
> asked is: what was the reason that of_platform_device created rather
> than unifying it with the already provided platform_device ?
> 
> BTW, I can find no such struct "of_platform_device" in include/linux.
> Is it specific to each and every OF implementation?

It's just of_device... of_platform_driver and of_device.

The reason it's there is historical in fact (I created it :-) Mostly
because it predates having the archdata field in struct device which
allows to convey the pointer to the OF tree node to the driver.

Nowadays, I wouldn't necessarily need it.

An interesting example that I may have to implement for powerpc here
is amba as it looks like there may be some folks bridging AXI to
some ppc stuff.

Here, what I would do is define a simple binding that describes how to
represent amba based devices in the tree (mostly having a description
of the bridge itself) and then a file in drivers/amba that contains
code that will instanciate the -existing- amba_device objects as they
are found in the tree.

I can provide the addresses and IRQ routing straight off the tree.

>From there, I have two options to get the ID off them. I can leave the
code as-is in drivers/amba/bus.c to do MMIOs to read it... 

Or I can decide to be fancy and define a property in the DT to carry
that ID and add the ability to the amba core to, when the amba device
has a DT node and that property is present, to avoid that MMIO operation
and create the right ID directly (which can be faster though that
doesn't necessary represent much, it's just an example).

Among other things, we have the ability on ppc64 and sparc64 (and this
code will soon be moved to some generic place for the benefit of others)
to create the entire PCI tree from the DT, by creating the pci_dev's and
populating them from the info in the DT rather than probing config
space. We keep a hook to allow the platform to indicate on a per-bus
basis whether to use the DT or do a hard probe.

This has been very useful in a few circumstances. It was initially done
to avoid doing config space accesses to some weirdo bridges when running
under a hypervisor on IBM machines or other strange things that
hypervisor can invent such as PCI devices with no function 0 :-)

It also proved that it speeds up the PCI discovery significantly.

But it also helps a lot with one important thing: It avoids BAR sizing
on all the devices that are fully described in the tree. That means that
the devices (or entire busses) are no longer taken offline for a little
while during boot... which happens with IRQs enabled, and can be a
killer if your PIC itself is behind one of these devices and you get the
interrupt at the wrong time.

That's just examples of what you -can- do with the DT. We made its usage
mandatory for all platforms on powerpc but you obviously wouldn't want
to do that on ARM. However, it's probably worth providing the optional
infrastructure to use it, and see how it goes with people doing so, it
might end up being a really good thing.

To finish, it's like any tool... its benefits (or lack of) all depends
how it's used.

Cheers,
Ben.
