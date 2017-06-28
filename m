From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/2] PCI: mediatek: Add Mediatek PCIe host controller
 support
Date: Wed, 28 Jun 2017 14:53:26 -0500
Message-ID: <20170628195325.GR17844@bhelgaas-glaptop.roam.corp.google.com>
References: <1495338145-9384-1-git-send-email-ryder.lee@mediatek.com>
 <1495338145-9384-2-git-send-email-ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1495338145-9384-2-git-send-email-ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Red Hung <red.hung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, May 21, 2017 at 11:42:24AM +0800, Ryder Lee wrote:
> Add support for the Mediatek PCIe Gen2 controller which can
> be found on MT7623 series SoCs.
> 
> Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/pci/host/Kconfig         |  11 +
>  drivers/pci/host/Makefile        |   1 +
>  drivers/pci/host/pcie-mediatek.c | 553 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 565 insertions(+)
>  create mode 100644 drivers/pci/host/pcie-mediatek.c
>...

> +static int mtk_pcie_register_host(struct pci_host_bridge *host)
> +{
> +	struct mtk_pcie *pcie = pci_host_bridge_priv(host);
> +	struct pci_bus *child;
> +	int err;
> +
> +	pci_add_flags(PCI_REASSIGN_ALL_RSRC | PCI_REASSIGN_ALL_BUS);

Do you really need the PCI_REASSIGN_ALL_RSRC and PCI_REASSIGN_ALL_BUS
flags?  I'd like to get rid of them because we should automatically
assign resources if the firmware hasn't done it.

Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
