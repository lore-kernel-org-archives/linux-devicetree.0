From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/2] iommu: dma: Use of_iommu_get_resv_regions()
Date: Mon, 2 Sep 2019 15:22:35 +0100
Message-ID: <1caeaaa0-c5aa-b630-6d42-055b26764f40@arm.com>
References: <20190829111407.17191-1-thierry.reding@gmail.com>
 <20190829111407.17191-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829111407.17191-3-thierry.reding@gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Joerg Roedel <joro@8bytes.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 29/08/2019 12:14, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> For device tree nodes, use the standard of_iommu_get_resv_regions()
> implementation to obtain the reserved memory regions associated with a
> device.

This covers the window between iommu_probe_device() setting up a default 
domain and the device's driver finally probing and taking control, but 
iommu_probe_device() represents the point that the IOMMU driver first 
knows about this device - there's still a window from whenever the IOMMU 
driver itself probed up to here where the "unidentified" traffic may 
have already been disrupted. Some IOMMU drivers have no option but to 
make the necessary configuration during their own probe routine, at 
which point a struct device for the display/etc. endpoint may not even 
exist yet.

Robin.

> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/iommu/dma-iommu.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index de68b4a02aea..31d48e55ab55 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -19,6 +19,7 @@
>   #include <linux/iova.h>
>   #include <linux/irq.h>
>   #include <linux/mm.h>
> +#include <linux/of_iommu.h>
>   #include <linux/pci.h>
>   #include <linux/scatterlist.h>
>   #include <linux/vmalloc.h>
> @@ -164,6 +165,8 @@ void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list)
>   	if (!is_of_node(dev_iommu_fwspec_get(dev)->iommu_fwnode))
>   		iort_iommu_msi_get_resv_regions(dev, list);
>   
> +	if (dev->of_node)
> +		of_iommu_get_resv_regions(dev, list);
>   }
>   EXPORT_SYMBOL(iommu_dma_get_resv_regions);
>   
> 
