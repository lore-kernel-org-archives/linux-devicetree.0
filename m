Return-Path: <helgaas@kernel.org>
Date: Fri, 12 Apr 2019 09:50:04 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 22/30] PCI: tegra: Access endpoint config only if PCIe
 link is up
Message-ID: <20190412145003.GE141472@google.com>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-23-mmaddireddy@nvidia.com>
 <20190411201535.GS256045@google.com>
 <e721e7f4-85c9-bee1-7131-12e0b7dfc0d1@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e721e7f4-85c9-bee1-7131-12e0b7dfc0d1@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Ley Foon Tan <lftan@altera.com>, Michal Simek <michal.simek@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

[+cc Jingoo, Gustavo (dwc maintainers), Ley (altera), Michal (xilinx)]

On Fri, Apr 12, 2019 at 12:30:22PM +0530, Manikanta Maddireddy wrote:
> On 12-Apr-19 1:45 AM, Bjorn Helgaas wrote:
> > On Thu, Apr 11, 2019 at 10:33:47PM +0530, Manikanta Maddireddy wrote:
> >> Add PCIe link up check in config read and write callback functions
> >> before accessing endpoint config registers.

> >>  static int tegra_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
> >>  				  int where, int size, u32 *value)
> >>  {
> >> +	struct tegra_pcie *pcie = bus->sysdata;
> >> +	struct pci_dev *bridge;
> >> +	struct tegra_pcie_port *port;
> >> +
> >>  	if (bus->number == 0)
> >>  		return pci_generic_config_read32(bus, devfn, where, size,
> >>  						 value);
> >>  
> >> +	bridge = pcie_find_root_port(bus->self);
> >> +
> >> +	list_for_each_entry(port, &pcie->ports, list)
> >> +		if (port->index + 1 == PCI_SLOT(bridge->devfn))
> >> +			break;
> >> +
> >> +	/* If there is no link, then there is no device */
> >> +	if (!tegra_pcie_link_status(port)) {
> >
> > This is racy and you should avoid it if possible.  The link could go down
> > between calling tegra_pcie_link_status() and issuing the config read/write.
> >
> > If your driver is to be reliable, it must be able to handle any bad
> > consequence of issuing that config read/write anyway, so I think it's
> > better if it doesn't even bother checking whether the link is up.
>
> This change is made based on similar check present in dwc driver
> dw_pcie_valid_device(), reasons for making this change in Tegra might
> differ dwc.

Yes, you won't be surprised to learn that I don't like the similar
checks in dwc, altera, xilinx, and xilinx-nwl either :)  I raise this
issue every time I see it, but I can't remember if I've mentioned dwc
specifically.

We need to either eradicate this pattern of checking for link up, or
include a comment about why it is absolutely necessary.

> Intention here is to reduce the number of AER errors when device is
> falling off the bus or going through hot reset. So racy condition here is
> OK

I'm not convinced about this.  The issues you mention need to be
solved in a generic way, not a tegra-specific way.

We don't want to end up with code that silently avoids the config
access 99.99% of the time, but once in a blue moon, we lose the race
(the device stops responding after we've determined the link is up)
and the access causes a mysterious AER error that we have no way to
debug.

> >> +		*value = 0xffffffff;
> >> +		return PCIBIOS_DEVICE_NOT_FOUND;
> >> +	}
> >> +
> >>  	return pci_generic_config_read(bus, devfn, where, size, value);
> >>  }
