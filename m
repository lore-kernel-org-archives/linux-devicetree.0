From: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v8 31/45] powerpc/pci: Don't scan empty slot
Date: Tue, 19 Apr 2016 18:19:58 +1000
Message-ID: <5715EA2E.4090105@ozlabs.ru>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1455680668-23298-32-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1455680668-23298-32-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, dja@axtens.net, bhelgaas@google.com, robherring2@gmail.com, grant.likely@linaro.org
List-Id: devicetree@vger.kernel.org

On 02/17/2016 02:44 PM, Gavin Shan wrote:
> In hotplug case, function pci_add_pci_devices() is called to rescan
> the specified PCI bus, which might not have any child devices. Access
> to the PCI bus's child device node will cause kernel crash without
> exception.
>
> This adds one more check to skip scanning PCI bus that doesn't have
> any subordinate devices from device-tree, in order to avoid kernel
> crash.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>


Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> ---
>   arch/powerpc/kernel/pci-hotplug.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-hotplug.c
> index 7929a1c..3628c38 100644
> --- a/arch/powerpc/kernel/pci-hotplug.c
> +++ b/arch/powerpc/kernel/pci-hotplug.c
> @@ -120,7 +120,8 @@ void pci_add_pci_devices(struct pci_bus *bus)
>   	if (mode == PCI_PROBE_DEVTREE) {
>   		/* use ofdt-based probe */
>   		of_rescan_bus(dn, bus);
> -	} else if (mode == PCI_PROBE_NORMAL) {
> +	} else if (mode == PCI_PROBE_NORMAL &&
> +		   dn->child && PCI_DN(dn->child)) {
>   		/*
>   		 * Use legacy probe. In the partial hotplug case, we
>   		 * probably have grandchildren devices unplugged. So
>


-- 
Alexey
