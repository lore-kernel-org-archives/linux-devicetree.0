From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH V3 1/4] pci: APM X-Gene PCIe controller driver
Date: Thu, 30 Jan 2014 15:16:26 +0100
Message-ID: <201401301516.27091.arnd@arndb.de>
References: <1390599168-13150-1-git-send-email-tinamdar@apm.com> <1390599168-13150-2-git-send-email-tinamdar@apm.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390599168-13150-2-git-send-email-tinamdar-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 24 January 2014, Tanmay Inamdar wrote:

> +static void xgene_pcie_fixup_bridge(struct pci_dev *dev)
> +{
> +	int i;
> +
> +	/* Hide the PCI host BARs from the kernel as their content doesn't
> +	 * fit well in the resource management
> +	 */
> +	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
> +		dev->resource[i].start = dev->resource[i].end = 0;
> +		dev->resource[i].flags = 0;
> +	}
> +	dev_info(&dev->dev, "Hiding X-Gene pci host bridge resources %s\n",
> +		 pci_name(dev));
> +}
> +DECLARE_PCI_FIXUP_HEADER(XGENE_PCIE_VENDORID, XGENE_PCIE_DEVICEID,
> +			 xgene_pcie_fixup_bridge);

Shouldn't this be gone now that the host bridge is correctly shown
at the domain root?

> +static int xgene_pcie_setup(int nr, struct pci_sys_data *sys)
> +{
> +	struct xgene_pcie_port *pp = sys->private_data;
> +	struct resource *io = &pp->realio;
> +
> +	io->start = sys->domain * SZ_64K;
> +	io->end = io->start + SZ_64K;
> +	io->flags = pp->io.res.flags;
> +	io->name = "PCI IO";
> +	pci_ioremap_io(io->start, pp->io.res.start);
> +
> +	pci_add_resource_offset(&sys->resources, io, sys->io_offset);
> +	sys->mem_offset = pp->mem.res.start - pp->mem.pci_addr;
> +	pci_add_resource_offset(&sys->resources, &pp->mem.res,
> +				sys->mem_offset);
> +	return 1;
> +}

Thanks for bringing back the I/O space handling.

You don't seem to set sys->io_offset anywhere, but each of the
ports listed in your DT starts a local bus I/O register range
at port 0.

AFAICT, you need to add (somewhere)

	sys->io_offset = pp->realio.start - pp->io.pci_addr;

but there could be something else missing. You clearly haven't
tested if the I/O space actually works.

If you want to try out the I/O space, I'd suggest using an Intel
e1000 network card, which has both memory and i/o space. There
is a patch at http://www.spinics.net/lists/linux-pci/msg27684.html
that lets you check the I/O registers on it, or you can go
through /dev/port from user space.

I also haven't seen your patch that adds pci_ioremap_io() for
arm64. It would be helpful to keep it in the same patch
series, since it won't build without this patch.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
