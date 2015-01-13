From: Murali Karicheri <m-karicheri2@ti.com>
Subject: Re: [PATCH] dma-mapping: limit dma_mask in arch_setup_dma_ops()
Date: Tue, 13 Jan 2015 15:38:02 -0500
Message-ID: <54B5822A.8050506@ti.com>
References: <1419458139-4034-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1419458139-4034-1-git-send-email-m-karicheri2@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Murali Karicheri <m-karicheri2@ti.com>
Cc: linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, arnd@arndb.de, will.deacon@arm.com, grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/24/2014 04:55 PM, Murali Karicheri wrote:
> dma_mask should be limited to minimum of the default dma mask
> and dma-range size configured in DT for proper operation.
>
> Signed-off-by: Murali Karicheri<m-karicheri2@ti.com>
> Reviewed-by: Arnd Bergmann<arnd@arndb.de>
> ---
>   arch/arm/mm/dma-mapping.c |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index 7864797..5cea1fc 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -2053,6 +2053,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>   {
>   	struct dma_map_ops *dma_ops;
>
> +	*dev->dma_mask = min((*dev->dma_mask), (dma_base + size - 1));
>   	dev->archdata.dma_coherent = coherent;
>   	if (arm_setup_iommu_dma_ops(dev, dma_base, size, iommu))
>   		dma_ops = arm_get_iommu_dma_map_ops(coherent);
Please discard this as this is still a work in progress. Any change if 
required will be added to my series with subject "PCI: get DMA 
configuration from parent device"

Thanks.
-- 
Murali Karicheri
Linux Kernel, Texas Instruments
