From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v5 6/7] PCI: dwc: al: Add support for DW based driver type
Date: Sat, 7 Sep 2019 11:55:57 -0500
Message-ID: <20190907165557.GO103977@google.com>
References: <20190905140018.5139-1-jonnyc@amazon.com>
 <20190905140144.7933-2-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190905140144.7933-2-jonnyc@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Chocron <jonnyc@amazon.com>
Cc: lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, robh+dt@kernel.org, mark.rutland@arm.com, andrew.murray@arm.com, dwmw@amazon.co.uk, benh@kernel.crashing.org, alisaidi@amazon.com, ronenk@amazon.com, barakw@amazon.com, talel@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

s/Add support for DW based driver type/Add Amazon Annapurna Labs PCIe controller driver/

On Thu, Sep 05, 2019 at 05:01:43PM +0300, Jonathan Chocron wrote:
> This driver is DT based and utilizes the DesignWare APIs.
> 
> It allows using a smaller ECAM range for a larger bus range -
> usually an entire bus uses 1MB of address space, but the driver
> can use it for a larger number of buses. This is achieved by using a HW
> mechanism which allows changing the BUS part of the "final" outgoing
> config transaction. There are 2 HW regs, one which is basically a
> bitmask determining which bits to take from the AXI transaction itself
> and another which holds the complementary part programmed by the
> driver.
> 
> All link initializations are handled by the boot FW.
> 
> Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
> Reviewed-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Reviewed-by: Andrew Murray <andrew.murray@arm.com>
> ---
>  drivers/pci/controller/dwc/Kconfig   |  12 +
>  drivers/pci/controller/dwc/pcie-al.c | 365 +++++++++++++++++++++++++++
>  2 files changed, 377 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index 4fada2e93285..0ba988b5b5bc 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -256,4 +256,16 @@ config PCIE_UNIPHIER
>  	  Say Y here if you want PCIe controller support on UniPhier SoCs.
>  	  This driver supports LD20 and PXs3 SoCs.
>  
> +config PCIE_AL
> +	bool "Amazon Annapurna Labs PCIe controller"
> +	depends on OF && (ARM64 || COMPILE_TEST)
> +	depends on PCI_MSI_IRQ_DOMAIN
> +	select PCIE_DW_HOST
> +	help
> +	  Say Y here to enable support of the Amazon's Annapurna Labs PCIe
> +	  controller IP on Amazon SoCs. The PCIe controller uses the DesignWare
> +	  core plus Annapurna Labs proprietary hardware wrappers. This is
> +	  required only for DT-based platforms. ACPI platforms with the
> +	  Annapurna Labs PCIe controller don't need to enable this.

Interesting.  How do you deal with the funky ECAM space on ACPI
platforms?  Oh, never mind, I see, it's the pcie-al.c ECAM ops quirk
that's already in the tree.

Bjorn
