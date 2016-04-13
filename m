From: Alexey Kardashevskiy <aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v8 03/45] powerpc/pci: Cleanup on struct
 pci_controller_ops
Date: Wed, 13 Apr 2016 15:52:25 +1000
Message-ID: <570DDE99.7070103@ozlabs.ru>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1455680668-23298-4-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455680668-23298-4-git-send-email-gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, dja-Yfaxwxk/+vWsTnJN9+BGXg@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/17/2016 02:43 PM, Gavin Shan wrote:
> Each PHB has one instance of "struct pci_controller_ops", which
> includes various callbacks called by PCI subsystem. In the definition
> of this struct, some callbacks have explicit names for its arguments,
> but the left don't have.
>
> This adds all explicit names of the arguments to the callbacks in
> "struct pci_controller_ops" so that the code looks consistent.
>
> Signed-off-by: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> Reviewed-by: Daniel Axtens <dja-Yfaxwxk/+vWsTnJN9+BGXg@public.gmane.org>

With tiny nit below,

Reviewed-by: Alexey Kardashevskiy <aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org>



> ---
>   arch/powerpc/include/asm/pci-bridge.h | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
> index b688d04..4dd6ef4 100644
> --- a/arch/powerpc/include/asm/pci-bridge.h
> +++ b/arch/powerpc/include/asm/pci-bridge.h
> @@ -21,18 +21,19 @@ struct pci_controller_ops {
>   	void		(*dma_dev_setup)(struct pci_dev *dev);
>   	void		(*dma_bus_setup)(struct pci_bus *bus);
>
> -	int		(*probe_mode)(struct pci_bus *);
> +	int		(*probe_mode)(struct pci_bus *bus);
>
>   	/* Called when pci_enable_device() is called. Returns true to
>   	 * allow assignment/enabling of the device. */
> -	bool		(*enable_device_hook)(struct pci_dev *);
> +	bool		(*enable_device_hook)(struct pci_dev *dev);


"pdev" is slightly better as it is of the "pci_dev" type (4130 occurrences 
of "pci_dev *pdev" and just 2833 of "pci_dev *dev" in the current kernel), 
"dev" is for "struct device".




>
> -	void		(*disable_device)(struct pci_dev *);
> +	void		(*disable_device)(struct pci_dev *dev);
>
> -	void		(*release_device)(struct pci_dev *);
> +	void		(*release_device)(struct pci_dev *dev);
>
>   	/* Called during PCI resource reassignment */
> -	resource_size_t (*window_alignment)(struct pci_bus *, unsigned long type);
> +	resource_size_t (*window_alignment)(struct pci_bus *bus,
> +					    unsigned long type);
>   	void		(*setup_bridge)(struct pci_bus *bus,
>   					unsigned long type);
>   	void		(*reset_secondary_bus)(struct pci_dev *dev);
> @@ -46,7 +47,7 @@ struct pci_controller_ops {
>   	int             (*dma_set_mask)(struct pci_dev *dev, u64 dma_mask);
>   	u64		(*dma_get_required_mask)(struct pci_dev *dev);
>
> -	void		(*shutdown)(struct pci_controller *);
> +	void		(*shutdown)(struct pci_controller *hose);
>   };
>
>   /*
>


-- 
Alexey
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
