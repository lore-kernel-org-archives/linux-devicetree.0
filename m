From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/3] fdt.c: Refactor unflatten_device_tree and add
	fdt_unflatten_tree
Date: Wed, 17 Nov 2010 12:57:28 -0700
Message-ID: <20101117195728.GC2352@angua.secretlab.ca>
References: <1290021345-4303-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1290021345-4303-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1290021345-4303-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<43c2cd79-efaf-4acf-9c85-ca2ef0738e92@SG2EHSMHS003.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <43c2cd79-efaf-4acf-9c85-ca2ef0738e92-RaUQJvECHis6W+Ha+8ZLibjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 17, 2010 at 11:15:45AM -0800, Stephen Neuendorffer wrote:
> unflatten_device_tree has two dependencies on things that happen
> during boot time.  Firstly, it references the initial device tree
> directly. Secondly, it allocates memory using the early boot
> allocator.  This patch factors out these dependencies and uses
> the new __unflatten_device_tree function to implement a driver-visible
> fdt_unflatten_tree function, which can be used to unflatten a
> blob after boot time.
> 
> Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Thanks for the series Stephen.  Looks pretty good.  A few more issues.
The hairiest of which is the ugly casting required to manipulate the
allocated mem pointer (see below).

> ---
>  drivers/of/fdt.c       |  147 ++++++++++++++++++++++++++++++++----------------
>  include/linux/of_fdt.h |    2 +
>  2 files changed, 100 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index c448b2f..e98ee59 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -11,10 +11,12 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/initrd.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_fdt.h>
>  #include <linux/string.h>
>  #include <linux/errno.h>
> +#include <linux/slab.h>
>  
>  #ifdef CONFIG_PPC
>  #include <asm/machdep.h>
> @@ -316,6 +318,94 @@ unsigned long unflatten_dt_node(unsigned long mem,
>  	return mem;
>  }
>  
> +/**
> + * __unflatten_device_tree - create tree of device_nodes from flat blob
> + *
> + * unflattens a device-tree, creating the
> + * tree of struct device_node. It also fills the "name" and "type"
> + * pointers of the nodes so the normal device-tree walking functions
> + * can be used.
> + * @blob: The blob to expand
> + * @mynodes: The device_node tree created by the call
> + * @dt_alloc: An allocator that provides memory for the resulting tree
> + */
> +void __unflatten_device_tree(struct boot_param_header *blob,
> +			     struct device_node **mynodes,
> +			     unsigned long (*dt_alloc)(u64 size, u64 align))
> +{
> +	unsigned long start, mem, size;

mem really needs to be changed to a void* I think (see below).

> +	struct device_node **allnextp = mynodes;
> +
> +	pr_debug(" -> unflatten_device_tree()\n");
> +
> +	if (!blob) {
> +		pr_debug("No device tree pointer\n");
> +		return;
> +	}
> +
> +	pr_debug("Unflattening device tree:\n");
> +	pr_debug("magic: %08x\n", be32_to_cpu(blob->magic));
> +	pr_debug("size: %08x\n", be32_to_cpu(blob->totalsize));
> +	pr_debug("version: %08x\n", be32_to_cpu(blob->version));
> +
> +	if (be32_to_cpu(blob->magic) != OF_DT_HEADER) {
> +		pr_err("Invalid device tree blob header\n");
> +		return;
> +	}
> +
> +	/* First pass, scan for size */
> +	start = ((unsigned long)blob) +
> +		be32_to_cpu(blob->off_dt_struct);
> +	size = unflatten_dt_node(0, &start, NULL, NULL, 0, blob);
> +	size = (size | 3) + 1;
> +
> +	pr_debug("  size is %lx, allocating...\n", size);
> +
> +	/* Allocate memory for the expanded device tree */
> +	mem = (unsigned long) dt_alloc(size + 4,
> +			__alignof__(struct device_node));
> +	mem = (unsigned long) __va(mem);
> +
> +	((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeef);
> +
> +	pr_debug("  unflattening %lx...\n", mem);
> +
> +	/* Second pass, do actual unflattening */
> +	start = ((unsigned long)blob) +
> +		be32_to_cpu(blob->off_dt_struct);
> +	unflatten_dt_node(mem, &start, NULL, &allnextp, 0, blob);
> +	if (be32_to_cpup((__be32 *)start) != OF_DT_END)
> +		pr_warning("Weird tag at end of tree: %08x\n", *((u32 *)start));
> +	if (be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeef)
> +		pr_warning("End of tree marker overwritten: %08x\n",
> +			   be32_to_cpu(((__be32 *)mem)[size / 4]));
> +	*allnextp = NULL;
> +
> +	pr_debug(" <- unflatten_device_tree()\n");
> +}
> +
> +static unsigned long kernel_tree_alloc(u64 size, u64 align)
> +{
> +	return (unsigned long) kzalloc(size, GFP_KERNEL);

The casting indicates a failure in implementation that needs to be
fixed.

> +}
> +
> +/**
> + * fdt_unflatten_tree - create tree of device_nodes from flat blob
> + *
> + * unflattens the device-tree passed by the firmware, creating the
> + * tree of struct device_node. It also fills the "name" and "type"
> + * pointers of the nodes so the normal device-tree walking functions
> + * can be used.
> + */
> +void fdt_unflatten_tree(unsigned long *blob,
> +			struct device_node **mynodes)
> +{
> +	struct boot_param_header *device_tree =
> +		(struct boot_param_header *)blob;
> +	__unflatten_device_tree(device_tree, mynodes, &kernel_tree_alloc);
> +}
> +EXPORT_SYMBOL_GPL(fdt_unflatten_tree);
> +
>  /* Everything below here references initial_boot_params directly. */
>  int __initdata dt_root_addr_cells;
>  int __initdata dt_root_size_cells;
> @@ -577,6 +667,12 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>  	return 1;
>  }
>  
> +static unsigned long __init early_device_tree_alloc(u64 size, u64 align)
> +{
> +	unsigned long mem = early_init_dt_alloc_memory_arch(size, align);
> +	return (unsigned long) __va(mem);

__unflatten_device_tree is still also applying __va() to the return value
from the alloc function.

> +}
> +

Perhaps all arch users should just be forced to provide a real
function for early_init_dt_alloc_memory_arch (no macros or inlines).

>  /**
>   * unflatten_device_tree - create tree of device_nodes from flat blob
>   *
> @@ -587,58 +683,11 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>   */
>  void __init unflatten_device_tree(void)
>  {
> -	unsigned long start, mem, size;
> -	struct device_node **allnextp = &allnodes;
> -
> -	pr_debug(" -> unflatten_device_tree()\n");
> -
> -	if (!initial_boot_params) {
> -		pr_debug("No device tree pointer\n");
> -		return;
> -	}
> -
> -	pr_debug("Unflattening device tree:\n");
> -	pr_debug("magic: %08x\n", be32_to_cpu(initial_boot_params->magic));
> -	pr_debug("size: %08x\n", be32_to_cpu(initial_boot_params->totalsize));
> -	pr_debug("version: %08x\n", be32_to_cpu(initial_boot_params->version));
> -
> -	if (be32_to_cpu(initial_boot_params->magic) != OF_DT_HEADER) {
> -		pr_err("Invalid device tree blob header\n");
> -		return;
> -	}
> -
> -	/* First pass, scan for size */
> -	start = ((unsigned long)initial_boot_params) +
> -		be32_to_cpu(initial_boot_params->off_dt_struct);
> -	size = unflatten_dt_node(0, &start, NULL, NULL, 0, initial_boot_params);
> -	size = (size | 3) + 1;
> -
> -	pr_debug("  size is %lx, allocating...\n", size);
> -
> -	/* Allocate memory for the expanded device tree */
> -	mem = early_init_dt_alloc_memory_arch(size + 4,
> -			__alignof__(struct device_node));
> -	mem = (unsigned long) __va(mem);
> -
> -	((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeef);
> -
> -	pr_debug("  unflattening %lx...\n", mem);
> -
> -	/* Second pass, do actual unflattening */
> -	start = ((unsigned long)initial_boot_params) +
> -		be32_to_cpu(initial_boot_params->off_dt_struct);
> -	unflatten_dt_node(mem, &start, NULL, &allnextp, 0, initial_boot_params);
> -	if (be32_to_cpup((__be32 *)start) != OF_DT_END)
> -		pr_warning("Weird tag at end of tree: %08x\n", *((u32 *)start));
> -	if (be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeef)
> -		pr_warning("End of tree marker overwritten: %08x\n",
> -			   be32_to_cpu(((__be32 *)mem)[size / 4]));
> -	*allnextp = NULL;
> +	__unflatten_device_tree(initial_boot_params, &allnodes,
> +				early_device_tree_alloc);
>  
>  	/* Get pointer to OF "/chosen" node for use everywhere */
>  	of_chosen = of_find_node_by_path("/chosen");
>  	if (of_chosen == NULL)
>  		of_chosen = of_find_node_by_path("/chosen@0");
> -
> -	pr_debug(" <- unflatten_device_tree()\n");
>  }
> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> index 864ec47..5b0e2f3 100644
> --- a/include/linux/of_fdt.h
> +++ b/include/linux/of_fdt.h
> @@ -66,6 +66,8 @@ extern void *fdt_get_property(unsigned long node, const char *name,
>  			      struct boot_param_header *blob);
>  extern int fdt_is_compatible(unsigned long node, const char *name,
>  			     struct boot_param_header *blob);
> +extern void fdt_unflatten_tree(unsigned long *blob,
> +			       struct device_node **mynodes);
>  
>  /* TBD: Temporary export of fdt globals - remove when code fully merged */
>  extern int __initdata dt_root_addr_cells;
> -- 
> 1.5.6.6
> 
> 
> 
> This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
> 
> 
