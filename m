From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: The alignment mismatch issues between the of_reserved_mem and the
 CMA setup requirement
Date: Mon, 9 Nov 2015 08:25:37 -0600
Message-ID: <CAL_JsqKdXeTKSb=J09eYyGEa1MQ7bXod=jQr-pLSi11J9hM3MQ@mail.gmail.com>
References: <DM2PR0301MB1213832E956A5414482EDD74F3150@DM2PR0301MB1213.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DM2PR0301MB1213832E956A5414482EDD74F3150-Cwg/PA1lyPkIGEnr2mw205wN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liu Jason <Hui.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 9, 2015 at 3:39 AM, Liu Jason <Hui.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> There is an alignment mismatch issue between the of_reserved_mem and the CMA setup requirement.
>
> The alignment in Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>
>
> alignment (optional) - length based on parent's #size-cells
>                         - Address boundary for alignment of allocation.
>
>
> But this is not exactly match the CMA setup requirement if the alignment not set or set it not correctly.
>
> The of_reserved_mem will get the alignment from the DTS and pass it to __memblock_alloc_base to
> do the memory block allocation. If no alignment property in the DTS, the align will be SMP_CACHE_BYTES

IMO, any alignment requirement in the DTB should reflect h/w alignment
requirements. We can't know what alignment the OS wants. So if the OS
needs to further increase the alignment, it should adjust the
alignment.

>
> BUT, The CMA setup require the alignment as the following in the code:
>
> align = PAGE_SIZE << max(MAX_ORDER - 1, pageblock_order)
>
> static int __init rmem_cma_setup(struct reserved_mem *rmem)
> {
>         phys_addr_t align = PAGE_SIZE << max(MAX_ORDER - 1, pageblock_order);
>         phys_addr_t mask = align - 1;
>         unsigned long node = rmem->fdt_node;
>         struct cma *cma;
>         int err;
>
>         if (!of_get_flat_dt_prop(node, "reusable", NULL) ||
>             of_get_flat_dt_prop(node, "no-map", NULL))
>                 return -EINVAL;
>
>         if ((rmem->base & mask) || (rmem->size & mask)) {
>                 pr_err("Reserved memory: incorrect alignment of CMA region\n");
>                 return -EINVAL;
>         }
>         <snip>
> }
>
> So, there is very likely that the alignment mismatch between the of_reserved_mem and the CMA setup requirement.
> The sanity check in the rmem_cma_setup will fail and CMA not get set up in the end, this is not expected for CMA.
>
> In the test, there will be following err log when this mismatch happen.
>
> Reserved memory: incorrect alignment of CMA region.
>
> The following patch to fix this issue, any comments?
>
> =======================================================================================
>
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 62f467b..a20d4d3 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -124,6 +124,15 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
>                 align = dt_mem_next_cell(dt_root_addr_cells, &prop);
>         }
>
> +       if (of_flat_dt_is_compatible(node,"shared-dma-pool")) {
> +               phys_addr_t align_required = PAGE_SIZE << max(MAX_ORDER - 1, pageblock_order);
> +                if (!align || align != ALIGN(align, align_required)) {
> +                        pr_warn("Reserved memory: the alignment not set up correctly in '%s' node."
> +                               "change from %pa to %pa \n", uname, &align, &align_required);
> +                        align = align_required;
> +                }
> +        }

You simply need the max required from the DT (which could be more) or
CMA, so this can be simplified to:

align = max(align, PAGE_SIZE << max(MAX_ORDER - 1, pageblock_order));

I don't think you should warn here either.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
