From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] of: alloc anywhere from memblock if range not specified
Date: Fri, 19 Feb 2016 09:28:11 +0100
Message-ID: <56C6D21A.2050100@samsung.com>
References: <1454337867-5111-1-git-send-email-vinmenon@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1454337867-5111-1-git-send-email-vinmenon-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinayak Menon <vinmenon-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, vinayakm.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On 2016-02-01 15:44, Vinayak Menon wrote:
> early_init_dt_alloc_reserved_memory_arch passes end as 0 to
> __memblock_alloc_base, when limits are not specified. But
> __memblock_alloc_base takes end value of 0 as MEMBLOCK_ALLOC_ACCESSIBLE
> and limits the end to memblock.current_limit. This results in regions
> never being placed in HIGHMEM area, for e.g. CMA.
> Let __memblock_alloc_base allocate from anywhere in memory if limits are
> not specified.
>
> Signed-off-by: Vinayak Menon <vinmenon-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Acked-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

You may need to resend it lkml to let someone to pick it for merging.
devicetree ml is mainly for discussing the bindings.

> ---
>   drivers/of/of_reserved_mem.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 1a3556a..ed01c01 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -32,11 +32,13 @@ int __init __weak early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
>   	phys_addr_t align, phys_addr_t start, phys_addr_t end, bool nomap,
>   	phys_addr_t *res_base)
>   {
> +	phys_addr_t base;
>   	/*
>   	 * We use __memblock_alloc_base() because memblock_alloc_base()
>   	 * panic()s on allocation failure.
>   	 */
> -	phys_addr_t base = __memblock_alloc_base(size, align, end);
> +	end = !end ? MEMBLOCK_ALLOC_ANYWHERE : end;
> +	base = __memblock_alloc_base(size, align, end);
>   	if (!base)
>   		return -ENOMEM;
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
