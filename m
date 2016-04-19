From: Alexey Kardashevskiy <aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v8 35/45] powerpc/powernv: Fundamental reset in
 pnv_pci_reset_secondary_bus()
Date: Tue, 19 Apr 2016 19:04:19 +1000
Message-ID: <5715F493.2030002@ozlabs.ru>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1455680668-23298-36-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455680668-23298-36-git-send-email-gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, dja-Yfaxwxk/+vWsTnJN9+BGXg@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/17/2016 02:44 PM, Gavin Shan wrote:
> In pnv_pci_reset_secondary_bus(), we should issue fundamental reset
> if any one subordinate device of the specified bus is requesting that.
> Otherwise, the device might not come up after the reset.
>
> Signed-off-by: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>


Reviewed-by: Alexey Kardashevskiy <aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org>


Out of curiosity - what does "fundamental" reset actually do?


> ---
>   arch/powerpc/platforms/powernv/eeh-powernv.c | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
> index 593b8dc..c7454ba 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -866,9 +866,28 @@ static int pnv_eeh_bridge_reset(struct pci_dev *dev, int option)
>   	return 0;
>   }
>
> +static int pnv_pci_dev_reset_type(struct pci_dev *pdev, void *data)
> +{
> +	int *freset = data;
> +
> +	/*
> +	 * Stop the iteration immediately if there has any one
> +	 * PCI device requesting fundamental reset.
> +	 */
> +	*freset |= pdev->needs_freset;
> +	return *freset;
> +}
> +
>   void pnv_pci_reset_secondary_bus(struct pci_dev *dev)
>   {
> -	pnv_eeh_bridge_reset(dev, EEH_RESET_HOT);
> +	int option, freset = 0;
> +
> +	if (dev->subordinate)
> +		pci_walk_bus(dev->subordinate,
> +			     pnv_pci_dev_reset_type, &freset);
> +
> +	option = freset ? EEH_RESET_FUNDAMENTAL : EEH_RESET_HOT;
> +	pnv_eeh_bridge_reset(dev, option);
>   	pnv_eeh_bridge_reset(dev, EEH_RESET_DEACTIVATE);
>   }
>
>


-- 
Alexey
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
