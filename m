From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 07/11] x86/dtb: add support for PCI devices backed by
	dtb nodes
Date: Sun, 28 Nov 2010 09:33:51 +1100
Message-ID: <1290897231.32570.168.camel@pasglop>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>
	<1290706801-7323-8-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1290706801-7323-8-git-send-email-bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2010-11-25 at 18:39 +0100, Sebastian Andrzej Siewior wrote:
> x86_of_pci_init() does two things:
> - it provides a generic irq enable and disable function. enable queries
>   the device tree for the interrupt information, calls ->xlate on the
>   irq host and updates the pci->irq information for the device.
> 
> - it walks through PCI buss(es) in the device tree and adds its children
>   (devices) nodes to appropriate pci_dev nodes in kernel. So the dtb
>   node information is available at probe time of the PCI device.
> 
> Adding a PCI bus based on the information in the device tree is
> currently not supported. Right now direct access via ioports is used.

That's something we need to eventually put into common code, ie matching
device nodes to PCI devices... In the meantime, your approach will do,
some nits:

> +static int of_irq_map_pci(struct pci_dev *dev, struct of_irq *oirq)
> +{
> +	struct device_node *node;
> +	__be32 laddr[3];
> +	__be32 lspec[2];
> +	int ret;
> +	u8 pin;
> +
> +	node = dev->dev.of_node;
> +	if (!node) {
> +		node = dev->bus->dev.of_node;
> +		if (node) {
> +			ret = of_irq_map_one(node, 0, oirq);
> +			if (!ret)
> +				return ret;
> +		}
> +	}

I don't quite get the logic in getting to the bus' interrupts if you
can't find a device own nodes here...

> +	ret = pci_read_config_byte(dev, PCI_INTERRUPT_PIN, &pin);
> +	if (ret)
> +		return ret;
> +	if (!pin)
> +		return -EINVAL;
> +
> +	laddr[0] = cpu_to_be32((dev->bus->number << 16) | (dev->devfn << 8));
> +	laddr[1] = 0;
> +	laddr[2] = 0;
> +
> +	lspec[0] = cpu_to_be32(pin);
> +	lspec[1] = cpu_to_be32(0);
> +	ret = of_irq_map_raw(node, lspec, 1, laddr, oirq);
> +	if (ret)
> +		return ret;
> +	return 0;
> +}

Ok so I see what you are trying to do, but I think it's not completely
correct, besides you miss the swizzling when crossing P2P bridges and
similar.

I suppose you looked at powerpc's of_irq_map_pci() so I'm not sure why
you modified it the way you did :-) You should probably either move it
to a generic place or copy it for now with a comment indicating where it
comes from so we spot it when we put it into a common code.

> +static int x86_of_pci_irq_enable(struct pci_dev *dev)
> +{
> +	struct of_irq oirq;
> +	u32 virq;
> +	int ret;
> +	u8 pin;
> +
> +	ret = pci_read_config_byte(dev, PCI_INTERRUPT_PIN, &pin);
> +	if (ret)
> +		return ret;
> +	if (!pin)
> +		return 0;
> +
> +	ret = of_irq_map_pci(dev, &oirq);
> +	if (ret)
> +		return ret;
> +
> +	virq = irq_create_of_mapping(oirq.controller, oirq.specifier,
> +			oirq.size);
> +	if (virq == NO_IRQ)
> +		return -EINVAL;
> +	dev->irq = virq;
> +	return 0;
> +}
> +
> +static void x86_of_pci_irq_disable(struct pci_dev *dev)
> +{
> +}
> +
> +void __cpuinit x86_of_pci_init(void)
> +{
> +	struct device_node *np;
> +
> +	pcibios_enable_irq = x86_of_pci_irq_enable;
> +	pcibios_disable_irq = x86_of_pci_irq_disable;
> +
> +	for_each_node_by_type(np, "pci") {
> +		const void *prop;
> +		struct pci_bus *bus;
> +		unsigned int bus_min;
> +		struct device_node *child;
> +
> +		prop = of_get_property(np, "bus-range", NULL);
> +		if (!prop)
> +			continue;
> +		bus_min = be32_to_cpup(prop);
> +
> +		bus = pci_find_bus(0, bus_min);
> +		if (!bus) {
> +			printk(KERN_ERR "Can't find a node for bus %s.\n",
> +					np->full_name);
> +			continue;
> +		}
> +
> +		bus->dev.of_node = np;
> +		for_each_child_of_node(np, child) {
> +			struct pci_dev *dev;
> +			u32 devfn;
> +
> +			prop = of_get_property(child, "reg", NULL);
> +			if (!prop)
> +				continue;
> +
> +			devfn = (be32_to_cpup(prop) >> 8) & 0xff;
> +			dev = pci_get_slot(bus, devfn);
> +			if (!dev)
> +				continue;
> +			dev->dev.of_node = child;
> +		}
> +	}
> +}

That too won't go down bridges, atom never have any ? (no PCIe root
complex at all ? ever will be ? even then, it should be supported as got
knows what we'll handle in the future).

Eventually we want that matching between PCI devices and OF nodes to be
in generic code, so that's not a big deal to have an "inferior" version
temporarily in there I suppose.

Also, aren't you missing a pci_dev_put() after pci_get_slot() ?

>  static int __init early_scan_hpet(unsigned long node, const char *uname,
>  				   int depth, void *data)
>  {

Cheers,
Ben.
