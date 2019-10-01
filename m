From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2] PCI: Remove unused includes and superfluous struct
 declaration
Date: Tue, 1 Oct 2019 14:45:19 -0500
Message-ID: <20191001194519.GA63059@google.com>
References: <20190903113059.2901-1-kw@linux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190903113059.2901-1-kw@linux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Wilczynski <kw@linux.com>
Cc: Joerg Roedel <joro@8bytes.org>, Jingoo Han <jingoohan1@gmail.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, iommu@lists.linux-foundation.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 03, 2019 at 01:30:59PM +0200, Krzysztof Wilczynski wrote:
> Remove <linux/pci.h> and <linux/msi.h> from being included
> directly as part of the include/linux/of_pci.h, and remove
> superfluous declaration of struct of_phandle_args.
> 
> Move users of include <linux/of_pci.h> to include <linux/pci.h>
> and <linux/msi.h> directly rather than rely on both being
> included transitively through <linux/of_pci.h>.
> 
> Signed-off-by: Krzysztof Wilczynski <kw@linux.com>

Applied with Rob's reviewed-by to pci/misc for v5.5, thanks!

> ---
>  drivers/iommu/of_iommu.c                          | 2 ++
>  drivers/irqchip/irq-gic-v2m.c                     | 1 +
>  drivers/irqchip/irq-gic-v3-its-pci-msi.c          | 1 +
>  drivers/pci/controller/dwc/pcie-designware-host.c | 1 +
>  drivers/pci/controller/pci-aardvark.c             | 1 +
>  drivers/pci/controller/pci-thunder-pem.c          | 1 +
>  drivers/pci/pci.c                                 | 1 +
>  drivers/pci/probe.c                               | 1 +
>  include/linux/of_pci.h                            | 5 ++---
>  9 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index 614a93aa5305..026ad2b29dcd 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -8,6 +8,8 @@
>  #include <linux/export.h>
>  #include <linux/iommu.h>
>  #include <linux/limits.h>
> +#include <linux/pci.h>
> +#include <linux/msi.h>
>  #include <linux/of.h>
>  #include <linux/of_iommu.h>
>  #include <linux/of_pci.h>
> diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
> index e88e75c22b6a..fbec07d634ad 100644
> --- a/drivers/irqchip/irq-gic-v2m.c
> +++ b/drivers/irqchip/irq-gic-v2m.c
> @@ -17,6 +17,7 @@
>  #include <linux/irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/kernel.h>
> +#include <linux/pci.h>
>  #include <linux/msi.h>
>  #include <linux/of_address.h>
>  #include <linux/of_pci.h>
> diff --git a/drivers/irqchip/irq-gic-v3-its-pci-msi.c b/drivers/irqchip/irq-gic-v3-its-pci-msi.c
> index 229d586c3d7a..87711e0f8014 100644
> --- a/drivers/irqchip/irq-gic-v3-its-pci-msi.c
> +++ b/drivers/irqchip/irq-gic-v3-its-pci-msi.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/acpi_iort.h>
> +#include <linux/pci.h>
>  #include <linux/msi.h>
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index d3156446ff27..7a9bef993e57 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -10,6 +10,7 @@
>  
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
> +#include <linux/msi.h>
>  #include <linux/of_address.h>
>  #include <linux/of_pci.h>
>  #include <linux/pci_regs.h>
> diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
> index fc0fe4d4de49..3a05f6ca95b0 100644
> --- a/drivers/pci/controller/pci-aardvark.c
> +++ b/drivers/pci/controller/pci-aardvark.c
> @@ -16,6 +16,7 @@
>  #include <linux/pci.h>
>  #include <linux/init.h>
>  #include <linux/platform_device.h>
> +#include <linux/msi.h>
>  #include <linux/of_address.h>
>  #include <linux/of_pci.h>
>  
> diff --git a/drivers/pci/controller/pci-thunder-pem.c b/drivers/pci/controller/pci-thunder-pem.c
> index f127ce8bd4ef..9491e266b1ea 100644
> --- a/drivers/pci/controller/pci-thunder-pem.c
> +++ b/drivers/pci/controller/pci-thunder-pem.c
> @@ -6,6 +6,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> +#include <linux/pci.h>
>  #include <linux/of_address.h>
>  #include <linux/of_pci.h>
>  #include <linux/pci-acpi.h>
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 484e35349565..571e7e00984b 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -13,6 +13,7 @@
>  #include <linux/delay.h>
>  #include <linux/dmi.h>
>  #include <linux/init.h>
> +#include <linux/msi.h>
>  #include <linux/of.h>
>  #include <linux/of_pci.h>
>  #include <linux/pci.h>
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 169943f17a4c..11b11a652d18 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -7,6 +7,7 @@
>  #include <linux/delay.h>
>  #include <linux/init.h>
>  #include <linux/pci.h>
> +#include <linux/msi.h>
>  #include <linux/of_device.h>
>  #include <linux/of_pci.h>
>  #include <linux/pci_hotplug.h>
> diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
> index 21a89c4880fa..29658c0ee71f 100644
> --- a/include/linux/of_pci.h
> +++ b/include/linux/of_pci.h
> @@ -2,11 +2,10 @@
>  #ifndef __OF_PCI_H
>  #define __OF_PCI_H
>  
> -#include <linux/pci.h>
> -#include <linux/msi.h>
> +#include <linux/types.h>
> +#include <linux/errno.h>
>  
>  struct pci_dev;
> -struct of_phandle_args;
>  struct device_node;
>  
>  #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_PCI)
> -- 
> 2.23.0
> 
