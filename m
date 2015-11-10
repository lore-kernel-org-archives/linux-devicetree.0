From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/1] drivers: of: of_reserved_mem: fixup the alignment with
 CMA setup
Date: Tue, 10 Nov 2015 14:43:05 +0100
Message-ID: <5641F469.2030503@samsung.com>
References: <1447158626-7773-1-git-send-email-r64343@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1447158626-7773-1-git-send-email-r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On 2015-11-10 13:30, Jason Liu wrote:
> There is an alignment mismatch issue between the of_reserved_mem and
> the CMA setup requirement. The of_reserved_mem will try to get the
> alignment value from the DTS and pass it to __memblock_alloc_base to
> do the memory block base allocation, but the alignment value specified
> in the DTS may not satisfy the CAM setup requirement since CMA setup
> required the alignment as the following in the code:
>
> align = PAGE_SIZE << max(MAX_ORDER - 1, pageblock_order);
>
> The sanity check in the function of rmem_cma_setup will fail if the
> alignment does not setup correctly and thus CMA will fail to setup.
>
> This patch is to fixup the alignment to meet the CMA setup required.
>
> Mailing-list-thread: https://lkml.org/lkml/2015/11/9/138
> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Acked-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

> ---
>   drivers/of/of_reserved_mem.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 62f467b..9394311 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -124,6 +124,10 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
>   		align = dt_mem_next_cell(dt_root_addr_cells, &prop);
>   	}
>   
> +	/* Need adjust the alignment to satisfy the CMA requirement */
> +	if (IS_ENABLED(CONFIG_CMA) && of_flat_dt_is_compatible(node, "shared-dma-pool"))
> +		align = max(align, (phys_addr_t)PAGE_SIZE << max(MAX_ORDER - 1, pageblock_order));
> +
>   	prop = of_get_flat_dt_prop(node, "alloc-ranges", &len);
>   	if (prop) {
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
