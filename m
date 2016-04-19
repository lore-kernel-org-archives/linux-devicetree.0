From: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v8 34/45] powerpc/powernv: Exclude root bus in
 pnv_pci_reset_secondary_bus()
Date: Tue, 19 Apr 2016 18:57:37 +1000
Message-ID: <5715F301.6030902@ozlabs.ru>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1455680668-23298-35-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1455680668-23298-35-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, dja@axtens.net, bhelgaas@google.com, robherring2@gmail.com, grant.likely@linaro.org
List-Id: devicetree@vger.kernel.org

On 02/17/2016 02:44 PM, Gavin Shan wrote:
> The function pnv_pci_reset_secondary_bus() is called like below.
> It's impossible for call the function on root bus. So it's safe
> to remove the root bus case in the function. No functional changes
> introduced.
>
>     pci_parent_bus_reset() / pci_bus_reset() / pci_try_reset_bus()
>     pci_reset_bridge_secondary_bus()
>     pcibios_reset_secondary_bus()
>     pnv_pci_reset_secondary_bus()
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> Reviewed-by: Daniel Axtens <dja@axtens.net>



Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> ---
>   arch/powerpc/platforms/powernv/eeh-powernv.c | 12 ++----------
>   1 file changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
> index 9226df1..593b8dc 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -868,16 +868,8 @@ static int pnv_eeh_bridge_reset(struct pci_dev *dev, int option)
>
>   void pnv_pci_reset_secondary_bus(struct pci_dev *dev)
>   {
> -	struct pci_controller *hose;
> -
> -	if (pci_is_root_bus(dev->bus)) {
> -		hose = pci_bus_to_host(dev->bus);
> -		pnv_eeh_root_reset(hose, EEH_RESET_HOT);
> -		pnv_eeh_root_reset(hose, EEH_RESET_DEACTIVATE);
> -	} else {
> -		pnv_eeh_bridge_reset(dev, EEH_RESET_HOT);
> -		pnv_eeh_bridge_reset(dev, EEH_RESET_DEACTIVATE);
> -	}
> +	pnv_eeh_bridge_reset(dev, EEH_RESET_HOT);
> +	pnv_eeh_bridge_reset(dev, EEH_RESET_DEACTIVATE);
>   }
>
>   static void pnv_eeh_wait_for_pending(struct pci_dn *pdn, const char *type,
>


-- 
Alexey
