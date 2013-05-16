From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCHv9 7/9] pci: PCIe driver for Marvell Armada 370/XP systems
Date: Thu, 16 May 2013 06:33:14 -0300
Message-ID: <20130516093312.GB2459@localhost>
References: <1368624323-24311-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1368624323-24311-8-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1368624323-24311-8-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-pci-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Bjorn Helgaas <bhelgaas@google.com>, Grant Likely <grant.likely@secretlab.ca>, Lior Amsalem <alior@marvell.com>, Maen Suleiman <maen@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, linux-pci@vger.kernel.org, Thierry Reding <thierry.reding@avionic-design.de>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, May 15, 2013 at 03:25:21PM +0200, Thomas Petazzoni wrote:
[..]
> +
> +static int __init mvebu_pcie_probe(struct platform_device *pdev)
> +{
> +	struct mvebu_pcie *pcie;
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct of_pci_range range;
> +	struct of_pci_range_parser parser;
> +	struct device_node *child;
> +	int i, ret;
> +
> +	pcie =3D devm_kzalloc(&pdev->dev, sizeof(struct mvebu_pcie),
> +			    GFP_KERNEL);
> +	if (!pcie)
> +		return -ENOMEM;
> +
> +	pcie->pdev =3D pdev;
> +
> +	if (of_pci_range_parser_init(&parser, np))
> +		return -EINVAL;
> +
> +	/* Get the I/O and memory ranges from DT */
> +	for_each_of_pci_range(&parser, &range) {
> +		unsigned long restype =3D range.flags & IORESOURCE_TYPE_BITS;
> +		if (restype =3D=3D IORESOURCE_IO) {
> +			of_pci_range_to_resource(&range, np, &pcie->io);
> +			of_pci_range_to_resource(&range, np, &pcie->realio);
> +			pcie->io.name =3D "I/O";
> +			pcie->realio.start =3D max_t(resource_size_t,
> +						   PCIBIOS_MIN_IO,
> +						   range.pci_addr);
> +			pcie->realio.end =3D min_t(resource_size_t,
> +						 IO_SPACE_LIMIT,
> +						 range.pci_addr + range.size);
> +		}
> +		if (restype =3D=3D IORESOURCE_MEM) {
> +			of_pci_range_to_resource(&range, np, &pcie->mem);
> +			pcie->mem.name =3D "MEM";
> +		}
> +	}
> +
> +	/* Get the bus range */
> +	ret =3D of_pci_parse_bus_range(np, &pcie->busn);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to parse bus-range property: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	for_each_child_of_node(pdev->dev.of_node, child) {
> +		if (!of_device_is_available(child))
> +			continue;
> +		pcie->nports++;
> +	}
> +
> +	pcie->ports =3D devm_kzalloc(&pdev->dev, pcie->nports *
> +				   sizeof(struct mvebu_pcie_port),
> +				   GFP_KERNEL);
> +	if (!pcie->ports)
> +		return -ENOMEM;
> +
> +	i =3D 0;
> +	for_each_child_of_node(pdev->dev.of_node, child) {
> +		struct mvebu_pcie_port *port =3D &pcie->ports[i];
> +
> +		if (!of_device_is_available(child))
> +			continue;
> +
> +		port->pcie =3D pcie;
> +
> +		if (of_property_read_u32(child, "marvell,pcie-port",
> +					 &port->port)) {
> +			dev_warn(&pdev->dev,
> +				 "ignoring PCIe DT node, missing pcie-port property\n");
> +			continue;
> +		}
> +
> +		if (of_property_read_u32(child, "marvell,pcie-lane",
> +					 &port->lane))
> +			port->lane =3D 0;
> +
> +		port->name =3D kasprintf(GFP_KERNEL, "pcie%d.%d",
> +				       port->port, port->lane);
> +
> +		port->devfn =3D of_pci_get_devfn(child);
> +		if (port->devfn < 0)
> +			continue;
> +
> +		port->base =3D mvebu_pcie_map_registers(pdev, child, port);
> +		if (!port->base) {
> +			dev_err(&pdev->dev, "PCIe%d.%d: cannot map registers\n",
> +				port->port, port->lane);
> +			continue;
> +		}
> +
> +		if (mvebu_pcie_link_up(port)) {
> +			port->haslink =3D 1;
> +			dev_info(&pdev->dev, "PCIe%d.%d: link up\n",
> +				 port->port, port->lane);
> +		} else {
> +			port->haslink =3D 0;
> +			dev_info(&pdev->dev, "PCIe%d.%d: link down\n",
> +				 port->port, port->lane);
> +		}
> +
> +		port->clk =3D of_clk_get_by_name(child, NULL);
> +		if (!port->clk) {
> +			dev_err(&pdev->dev, "PCIe%d.%d: cannot get clock\n",
> +			       port->port, port->lane);
> +			iounmap(port->base);
> +			port->haslink =3D 0;
> +			continue;
> +		}
> +
> +		port->dn =3D child;
> +
> +		clk_prepare_enable(port->clk);
> +		spin_lock_init(&port->conf_lock);
> +
> +		mvebu_sw_pci_bridge_init(port);
> +
> +		i++;
> +	}
> +
> +	mvebu_pcie_enable(pcie);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mvebu_pcie_of_match_table[] =3D {
> +	{ .compatible =3D "marvell,armada-xp-pcie", },
> +	{ .compatible =3D "marvell,armada-370-pcie", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mvebu_pcie_of_match_table);
> +
> +static struct platform_driver mvebu_pcie_driver =3D {
> +	.driver =3D {
> +		.owner =3D THIS_MODULE,
> +		.name =3D "mvebu-pcie",
> +		.of_match_table =3D
> +		   of_match_ptr(mvebu_pcie_of_match_table),
> +	},
> +};
> +
> +static int mvebu_pcie_init(void)

Building this showed a warning here. It seems you forgot
to mark this one as __init.

--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
