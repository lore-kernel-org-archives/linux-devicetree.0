From: Alexey Kardashevskiy <aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v8 02/45] powerpc/pci: Override pcibios_setup_bridge()
Date: Wed, 13 Apr 2016 15:52:46 +1000
Message-ID: <570DDEAE.1060909@ozlabs.ru>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1455680668-23298-3-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455680668-23298-3-git-send-email-gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, dja-Yfaxwxk/+vWsTnJN9+BGXg@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/17/2016 02:43 PM, Gavin Shan wrote:
> This overrides pcibios_setup_bridge() that is called to update PCI
> bridge windows when PCI resource assignment is completed, to assign
> PE and setup various (resource) mapping for the PE in subsequent
> patches.
>
> Signed-off-by: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>



Reviewed-by: Alexey Kardashevskiy <aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org>


> ---
>   arch/powerpc/include/asm/pci-bridge.h | 2 ++
>   arch/powerpc/kernel/pci-common.c      | 8 ++++++++
>   2 files changed, 10 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
> index 9f165e8..b688d04 100644
> --- a/arch/powerpc/include/asm/pci-bridge.h
> +++ b/arch/powerpc/include/asm/pci-bridge.h
> @@ -33,6 +33,8 @@ struct pci_controller_ops {
>
>   	/* Called during PCI resource reassignment */
>   	resource_size_t (*window_alignment)(struct pci_bus *, unsigned long type);
> +	void		(*setup_bridge)(struct pci_bus *bus,
> +					unsigned long type);
>   	void		(*reset_secondary_bus)(struct pci_dev *dev);
>
>   #ifdef CONFIG_PCI_MSI
> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> index 0f7a60f..40df3a5 100644
> --- a/arch/powerpc/kernel/pci-common.c
> +++ b/arch/powerpc/kernel/pci-common.c
> @@ -124,6 +124,14 @@ resource_size_t pcibios_window_alignment(struct pci_bus *bus,
>   	return 1;
>   }
>
> +void pcibios_setup_bridge(struct pci_bus *bus, unsigned long type)
> +{
> +	struct pci_controller *hose = pci_bus_to_host(bus);
> +
> +	if (hose->controller_ops.setup_bridge)
> +		hose->controller_ops.setup_bridge(bus, type);
> +}
> +
>   void pcibios_reset_secondary_bus(struct pci_dev *dev)
>   {
>   	struct pci_controller *phb = pci_bus_to_host(dev->bus);
>


-- 
Alexey
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
