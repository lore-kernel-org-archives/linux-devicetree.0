From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 3/3] pci:add support aer/pme interrupts with none
 MSI/MSI-X/INTx mode
Date: Sat, 8 Oct 2016 15:49:59 -0500
Message-ID: <20161008204959.GA17455@rob-hp-laptop>
References: <1473741659-17618-3-git-send-email-po.liu@nxp.com>
 <1475226697-7709-1-git-send-email-po.liu@nxp.com>
 <1475226697-7709-3-git-send-email-po.liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1475226697-7709-3-git-send-email-po.liu-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Po Liu <po.liu-3arQi8VN3Tc@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Roy Zang <roy.zang-3arQi8VN3Tc@public.gmane.org>, Mingkai Hu <mingkai.hu-3arQi8VN3Tc@public.gmane.org>, Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>, Yang-Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Minghuan Lian <minghuan.lian-3arQi8VN3Tc@public.gmane.org>, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 30, 2016 at 05:11:37PM +0800, Po Liu wrote:
> On some platforms, root port doesn't support MSI/MSI-X/INTx in RC mode.
> When chip support the aer/pme interrupts with none MSI/MSI-X/INTx mode,
> maybe there is interrupt line for aer pme etc. Search the interrupt
> number in the fdt file. Then fixup the dev->irq with it.

Again, explain why you are breaking compatibility. Will an old dtb using 
"intr" still work with this change? It should normally. There are some 
exceptions, but you need to say what they are.

> 
> Signed-off-by: Po Liu <po.liu-3arQi8VN3Tc@public.gmane.org>
> ---
> changes for v6:
> 	- modify bindings for "aer""pme";
> 	- changing to the hood method to implement the aer pme interrupt;
> 	- add pme interrupt in the same way;
> 
>  .../devicetree/bindings/pci/layerscape-pci.txt     | 13 +++++--
>  arch/arm/kernel/bios32.c                           | 43 ++++++++++++++++++++++
>  arch/arm64/kernel/pci.c                            | 43 ++++++++++++++++++++++
>  drivers/pci/pcie/portdrv_core.c                    | 31 +++++++++++++++-
>  include/linux/pci.h                                |  1 +
>  5 files changed, 126 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> index 41e9f55..51ed49e 100644
> --- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> +++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> @@ -18,8 +18,12 @@ Required properties:
>  - reg: base addresses and lengths of the PCIe controller
>  - interrupts: A list of interrupt outputs of the controller. Must contain an
>    entry for each entry in the interrupt-names property.
> -- interrupt-names: Must include the following entries:
> -  "intr": The interrupt that is asserted for controller interrupts
> +- interrupt-names: It could include the following entries:

"Could" is not strong enough. Every valid combination of interrupts 
should correspond to a specific compatible string. A given version of 
h/w either has these interrupts or not.

> +  "aer": Asserted for aer interrupt when chip support the aer interrupt with
> +		 none MSI/MSI-X/INTx mode,but there is interrupt line for aer.
> +  "pme": Asserted for pme interrupt when chip support the pme interrupt with
> +		 none MSI/MSI-X/INTx mode,but there is interrupt line for pme.
> +  ......
>  - fsl,pcie-scfg: Must include two entries.
>    The first entry must be a link to the SCFG device node
>    The second entry must be '0' or '1' based on physical PCIe controller index.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
