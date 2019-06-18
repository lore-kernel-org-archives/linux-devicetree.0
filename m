Return-Path: <SRS0=nfyP=UR=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH V5 20/27] PCI: tegra: Use legacy IRQ for port service
 drivers
References: <20190617173952.29363-1-mmaddireddy@nvidia.com>
 <20190617173952.29363-21-mmaddireddy@nvidia.com>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <8a8746f8-3e0f-c724-761e-8bc47b2cc3b6@nvidia.com>
Date: Tue, 18 Jun 2019 11:17:49 +0530
MIME-Version: 1.0
In-Reply-To: <20190617173952.29363-21-mmaddireddy@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: bhelgaas@google.com, lorenzo.pieralisi@arm.com
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 17-Jun-19 11:09 PM, Manikanta Maddireddy wrote:
> Tegra signals PCIe services like AER, PME, etc. over legacy IRQ line.
> By default, service drivers register interrupt routine over MSI IRQ line.
> Use pcie_pme_disable_msi() function to disable MSI for service drivers.
>
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
> V5: No change
>
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
> index 73d5a8841405..9429c0c6a1f3 100644
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

Hi Lorenzo,

I forgot to address Bjorn's comment here, I will correct this in V6.
Let me know if I can publish it today or you want me to wait until
you look into other patches.

Manikanta
