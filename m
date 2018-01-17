From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] PCI: move DT PCI functions to PCI core
Date: Wed, 17 Jan 2018 17:55:55 -0600
Message-ID: <20180117235555.GC53542@bhelgaas-glaptop.roam.corp.google.com>
References: <20180104211215.11344-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180104211215.11344-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 04, 2018 at 03:12:12PM -0600, Rob Herring wrote:
> Most subsystem specific functions have been moved into the respective
> subsystems. Only PCI and networking remain. This series moves most of the
> PCI related code to drivers/pci/of.c. Some bus address functions for PCI
> remain in of/address.c because we don't have infrastructure to split up
> the per bus helper functions.
> 
> I expect Bjorn to take this series, so PPC maintainers please ack.
> 
> Rob
> 
> Rob Herring (3):
>   PCI: move OF related PCI functions into PCI core
>   powerpc/pci: use of_irq_parse_and_map_pci helper
>   PCI: make of_irq_parse_pci static
> 
>  arch/arm/mach-mvebu/Kconfig      |   1 -
>  arch/powerpc/kernel/pci-common.c |   8 +-
>  drivers/of/Kconfig               |  16 --
>  drivers/of/Makefile              |   2 -
>  drivers/of/address.c             |   8 +-
>  drivers/of/of_pci.c              | 384 -----------------------------
>  drivers/of/of_pci_irq.c          | 131 ----------
>  drivers/pci/of.c                 | 505 +++++++++++++++++++++++++++++++++++++++
>  include/linux/of_pci.h           |   8 +-
>  9 files changed, 510 insertions(+), 553 deletions(-)
>  delete mode 100644 drivers/of/of_pci.c
>  delete mode 100644 drivers/of/of_pci_irq.c

Applied to pci/dt-resources for v4.16, thanks!

I'll update this if necessary if PPC maintainers comment.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
