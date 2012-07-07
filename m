From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 06/36] fdt: Add generic dt_memblock_reserve() function
Date: Sat, 07 Jul 2012 16:18:06 -0500
Message-ID: <4FF8A78E.5090709@gmail.com>
References: <1341608777-12982-1-git-send-email-catalin.marinas@arm.com>
 <1341608777-12982-7-git-send-email-catalin.marinas@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1341608777-12982-7-git-send-email-catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/06/2012 04:05 PM, Catalin Marinas wrote:
> This function reserves initial_boot_params total size and reserve map.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

If you had run get_maintainers.pl you would have copied all the
maintainers and the appropriate list (devicetree-discuss) for this patch.

This is hardly generic if you aren't using it anywhere but on a new
arch. Presumably, you can remove the arm 32-bit version, but its still
to be debated whether 32-bit and 64-bit ARM will remain separate.

It does appear that only ARM and powerpc currently handle reserve map,
so the other DT enabled platforms will need to have something similar here.

Rob

> ---
>  drivers/of/fdt.c       |   28 ++++++++++++++++++++++++++++
>  include/linux/of_fdt.h |    1 +
>  2 files changed, 29 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 91a375f..7e9b5b0 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -17,6 +17,7 @@
>  #include <linux/string.h>
>  #include <linux/errno.h>
>  #include <linux/slab.h>
> +#include <linux/memblock.h>
>  
>  #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
>  #ifdef CONFIG_PPC
> @@ -436,6 +437,33 @@ int __initdata dt_root_size_cells;
>  
>  struct boot_param_header *initial_boot_params;
>  
> +void __init dt_memblock_reserve(void)
> +{
> +	u64 *reserve_map, base, size;
> +
> +	if (!initial_boot_params)
> +		return;
> +
> +	/* Reserve the dtb region */
> +	memblock_reserve(virt_to_phys(initial_boot_params),
> +			 be32_to_cpu(initial_boot_params->totalsize));
> +
> +	/*
> +	 * Process the reserve map.  This will probably overlap the initrd
> +	 * and dtb locations which are already reserved, but overlapping
> +	 * doesn't hurt anything
> +	 */
> +	reserve_map = ((void*)initial_boot_params) +
> +			be32_to_cpu(initial_boot_params->off_mem_rsvmap);
> +	while (1) {
> +		base = be64_to_cpup(reserve_map++);
> +		size = be64_to_cpup(reserve_map++);
> +		if (!size)
> +			break;
> +		memblock_reserve(base, size);
> +	}
> +}
> +
>  #ifdef CONFIG_OF_EARLY_FLATTREE
>  
>  /**
> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> index ed136ad..bf4fe1e 100644
> --- a/include/linux/of_fdt.h
> +++ b/include/linux/of_fdt.h
> @@ -117,6 +117,7 @@ extern int early_init_dt_scan_root(unsigned long node, const char *uname,
>  /* Other Prototypes */
>  extern void unflatten_device_tree(void);
>  extern void early_init_devtree(void *);
> +extern void dt_memblock_reserve(void);
>  #else /* CONFIG_OF_FLATTREE */
>  static inline void unflatten_device_tree(void) {}
>  #endif /* CONFIG_OF_FLATTREE */
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
> 
