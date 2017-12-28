From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 6/9] PCI: cadence: Add host driver for Cadence PCIe
 controller
Date: Thu, 28 Dec 2017 17:01:12 -0600
Message-ID: <20171228230111.GB19819@bhelgaas-glaptop.roam.corp.google.com>
References: <cover.1513620412.git.cyrille.pitchen@free-electrons.com>
 <4b2b67ad54e14ee5e1f83af65e9932ce408e82ec.1513620412.git.cyrille.pitchen@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4b2b67ad54e14ee5e1f83af65e9932ce408e82ec.1513620412.git.cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, stelford-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, dgary-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, kgopi-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, eandrews-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sureshp-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 18, 2017 at 07:16:06PM +0100, Cyrille Pitchen wrote:
> This patch adds support to the Cadence PCIe controller in host mode.
> 
> The "cadence/" entry in drivers/pci/Makefile is placed after the
> "endpoint/" entry so when the next patch introduces a EPC driver for the
> Cadence PCIe controller, drivers/pci/cadence/pcie-cadence-ep.o will be
> linked after drivers/pci/endpoint/*.o objects, otherwise the built-in
> pci-cadence-ep driver would be probed before the PCI endpoint libraries
> would have been initialized, which would result in a kernel crash.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

> diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
> index 7284a7f6ad1e..a66ddb347798 100644
> --- a/drivers/pci/Makefile
> +++ b/drivers/pci/Makefile
> @@ -54,5 +54,6 @@ obj-y += host/
>  obj-y += switch/
>  
>  obj-$(CONFIG_PCI_ENDPOINT)	+= endpoint/
> +obj-$(CONFIG_PCI_CADENCE)	+= cadence/
>  # PCI dwc controller drivers
>  obj-y				+= dwc/

I don't like the fact that the cadence/ rule looks different than the
dwc/ rule for no obvious reason.  With some work, the dwc/ rule could
maybe be made to look like:

  obj-$(CONFIG_PCIE_DW)                 += dwc/

I *think* that should actually be pretty easy.  Everything in
drivers/pci/dwc/Kconfig selects PCIE_DW if set, either via
PCIE_DW_HOST or PCIE_DW_EP.

> diff --git a/drivers/pci/cadence/Kconfig b/drivers/pci/cadence/Kconfig
> new file mode 100644
> index 000000000000..0d15b40861e9
> --- /dev/null
> +++ b/drivers/pci/cadence/Kconfig
> @@ -0,0 +1,24 @@
> +menuconfig PCI_CADENCE
> +	bool "Cadence PCI controllers support"
> +	depends on PCI && HAS_IOMEM
> +	help
> +	  Say Y here if you want to support some Cadence PCI controller.
> +
> +	  When in doubt, say N.
> +
> +if PCI_CADENCE
> +
> +config PCIE_CADENCE
> +	bool
> +
> +config PCIE_CADENCE_HOST
> +	bool "Cadence PCIe host controller"
> +	depends on OF
> +	select IRQ_DOMAIN
> +	select PCIE_CADENCE
> +	help
> +	  Say Y here if you want to support the Cadence PCIe controller in host
> +	  mode. This PCIe controller may be embedded into many different vendors
> +	  SoCs.
> +
> +endif # PCI_CADENCE

Can you just use the same strategy as pci/dwc/Kconfig does, i.e., omit
the top-level PCI_CADENCE symbol?  If we don't need it for dwc, with
its dozen drivers, we probably don't need it for the one or two
Cadence drivers.

Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
