From: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v8 32/45] powerpc/pci: Update bridge windows on PCI plug
Date: Tue, 19 Apr 2016 18:47:21 +1000
Message-ID: <5715F099.1060901@ozlabs.ru>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1455680668-23298-33-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1455680668-23298-33-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, dja@axtens.net, bhelgaas@google.com, robherring2@gmail.com, grant.likely@linaro.org
List-Id: devicetree@vger.kernel.org

On 02/17/2016 02:44 PM, Gavin Shan wrote:
> On the PCI plugging event, PCI slot's subordinate devices are
> scanned and their (IO and MMIO) resources are assigned. Platform
> dependent resources (PE#, IO/MMIO/DMA windows) are allocated or
> created on updating windows of the slot's upstream bridge.
>
> This updates the windows of the hot plugged slot's upstream bridge
> in pcibios_finish_adding_to_bus() so that the platform resources
> (PE#, IO/MMIO/DMA segments) are allocated or created accordingly.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>


To my very limited knowledge of the common PCI code, looks good.


Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>




> ---
>   arch/powerpc/kernel/pci-common.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> index 40df3a5..be9e515 100644
> --- a/arch/powerpc/kernel/pci-common.c
> +++ b/arch/powerpc/kernel/pci-common.c
> @@ -1444,8 +1444,12 @@ void pcibios_finish_adding_to_bus(struct pci_bus *bus)
>   	/* Allocate bus and devices resources */
>   	pcibios_allocate_bus_resources(bus);
>   	pcibios_claim_one_bus(bus);
> -	if (!pci_has_flag(PCI_PROBE_ONLY))
> -		pci_assign_unassigned_bus_resources(bus);
> +	if (!pci_has_flag(PCI_PROBE_ONLY)) {
> +		if (bus->self)
> +			pci_assign_unassigned_bridge_resources(bus->self);
> +		else
> +			pci_assign_unassigned_bus_resources(bus);
> +	}
>
>   	/* Fixup EEH */
>   	eeh_add_device_tree_late(bus);
>


-- 
Alexey
