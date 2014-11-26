From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] of/fdt: memblock_reserve /memreserve/ regions in the
 case of partial overlap
Date: Wed, 26 Nov 2014 12:36:06 +0000
Message-ID: <20141126123606.3149CC4099E@trevor.secretlab.ca>
References: <1416927913-2823-1-git-send-email-ian.campbell@citrix.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416927913-2823-1-git-send-email-ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 25 Nov 2014 15:05:13 +0000
, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
 wrote:
> memblock_is_region_reserved() returns true in the case of a partial
> overlap, meaning that the current code fails to reserve the
> non-overlapping portion.
> 
> This call was introduced as part of d1552ce449eb "of/fdt: move
> memreserve and dtb memory reservations into core" which went into
> v3.16.
> 
> I observed this causing a Midway system with a buggy fdt (the header
> declares itself to be larger than it really is) failing to boot
> because the over-inflated size of the fdt was causing it to seem to
> run into the swapper_pg_dir region, meaning the DT wasn't reserved.
> The symptoms were failing to find an disks or network and failing to
> boot.
> 
> However given the ambiguity of whether things like the initrd are
> covered by /memreserve/ and similar I think it is best to also
> register the region rather than just ignoring it.
> 
> Since memblock_reserve() handles overlaps just fine lets just warn and
> carry on.
> 
> Signed-off-by: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # v3.16+

Applied, thanks.

g.

> ---
> v2: Tag for stable v3.16+
>     Just drop the test, no need to log.
> ---
>  drivers/of/fdt.c |    2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 30e97bc..d134710 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -964,8 +964,6 @@ void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
>  int __init __weak early_init_dt_reserve_memory_arch(phys_addr_t base,
>  					phys_addr_t size, bool nomap)
>  {
> -	if (memblock_is_region_reserved(base, size))
> -		return -EBUSY;
>  	if (nomap)
>  		return memblock_remove(base, size);
>  	return memblock_reserve(base, size);
> -- 
> 1.7.10.4
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
