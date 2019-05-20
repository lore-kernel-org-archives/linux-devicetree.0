Return-Path: <helgaas@kernel.org>
Date: Mon, 20 May 2019 15:37:31 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH V4 20/28] PCI: tegra: Use legacy IRQ for port service
 drivers
Message-ID: <20190520203731.GA54609@google.com>
References: <20190516055307.25737-1-mmaddireddy@nvidia.com>
 <20190516055307.25737-21-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190516055307.25737-21-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, May 16, 2019 at 11:22:59AM +0530, Manikanta Maddireddy wrote:
> Tegra signals PCIe services like AER, PME, etc. over legacy IRQ line.
> By default, service drivers register interrupt routine over MSI IRQ line.
> Use pcie_pme_disable_msi() function to disable MSI for service drivers.

I think this device is not quite spec-compliant:

  https://lore.kernel.org/linux-pci/20190520175729.GC49425@google.com/

and you should work around this with a quirk that sets pdev->no_msi so
we don't use MSI for it at all.

> PME and AER interrupts registered to MSI without this change,
> cat /proc/interrupts | grep -i pci
> 36: 21 0 0 0 0 0 GICv2 104 Level       PCIE
> 37: 35 0 0 0 0 0 GICv2 105 Level       Tegra PCIe MSI
> 76: 0  0 0 0 0 0 Tegra PCIe MSI 0 Edge PCIe PME, aerdrv, PCIe BW notif
> 
> PME and AER interrupts registered to legacy IRQ with this change,
> cat /proc/interrupts | grep -i pci
> 36: 33 0 0 0 0 0 GICv2 104 Level      PCIE, PCIe PME, aerdrv, PCIe BW notif
> 37: 52 0 0 0 0 0 GICv2 105 Level      Tegra PCIe MSI
> 
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
> V4: No change
> 
> V3: Corrected typo in commit log
> 
> V2: No change
> 
>  drivers/pci/controller/pci-tegra.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> index ac57c5badd9b..0024bc42b400 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -41,6 +41,7 @@
>  #include <soc/tegra/pmc.h>
>  
>  #include "../pci.h"
> +#include "../pcie/portdrv.h"
>  
>  #define INT_PCI_MSI_NR (8 * 32)
>  
> @@ -2725,6 +2726,9 @@ static int tegra_pcie_probe(struct platform_device *pdev)
>  		goto put_resources;
>  	}
>  
> +	/* Switch to legacy IRQ for PCIe services like AER, PME*/
> +	pcie_pme_disable_msi();
> +
>  	pm_runtime_enable(pcie->dev);
>  	err = pm_runtime_get_sync(pcie->dev);
>  	if (err) {
> -- 
> 2.17.1
> 
