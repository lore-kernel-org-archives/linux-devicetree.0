From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/3] fdt.c: Refactor unflatten_dt_node
Date: Wed, 17 Nov 2010 12:50:42 -0700
Message-ID: <20101117195042.GB2352@angua.secretlab.ca>
References: <1290021345-4303-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1290021345-4303-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<897f0b2f-23ac-4652-a61b-fc1ff4e867b6@VA3EHSMHS013.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <897f0b2f-23ac-4652-a61b-fc1ff4e867b6-+Ck8Kgl/v0/T7m58JnLnSLjjLBE8jN/0@public.gmane.org>
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

On Wed, Nov 17, 2010 at 11:15:44AM -0800, Stephen Neuendorffer wrote:
> unflatten_dt_node is a helper function that does most of the work to
> convert a device tree blob into tree of device nodes.  This code
> now uses a passed-in blob instead of using the single boot-time blob,
> allowing it to be called in more contexts.
> 
> Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Bulk of the patch looks good but a bit hard to review due to the way
it is constructed (see below).

g.

> ---
>  drivers/of/fdt.c |  251 +++++++++++++++++++++++++++---------------------------
>  1 files changed, 127 insertions(+), 124 deletions(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 6ae207a..c448b2f 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -101,120 +101,7 @@ int fdt_is_compatible(unsigned long node, const char *compat,
>  	return 0;
>  }
>  
> -/* Everything below here references initial_boot_params directly. */
> -int __initdata dt_root_addr_cells;
> -int __initdata dt_root_size_cells;
> -
> -struct boot_param_header *initial_boot_params;
> -
> -char *find_flat_dt_string(u32 offset)
> -{
> -	return ((char *)initial_boot_params) +
> -		be32_to_cpu(initial_boot_params->off_dt_strings) + offset;
> -}
> -
> -/**
> - * of_scan_flat_dt - scan flattened tree blob and call callback on each.
> - * @it: callback function
> - * @data: context data pointer
> - *
> - * This function is used to scan the flattened device-tree, it is
> - * used to extract the memory information at boot before we can
> - * unflatten the tree
> - */
> -int __init of_scan_flat_dt(int (*it)(unsigned long node,
> -				     const char *uname, int depth,
> -				     void *data),
> -			   void *data)
> -{
> -	unsigned long p = ((unsigned long)initial_boot_params) +
> -		be32_to_cpu(initial_boot_params->off_dt_struct);
> -	int rc = 0;
> -	int depth = -1;
> -
> -	do {
> -		u32 tag = be32_to_cpup((__be32 *)p);
> -		char *pathp;
> -
> -		p += 4;
> -		if (tag == OF_DT_END_NODE) {
> -			depth--;
> -			continue;
> -		}
> -		if (tag == OF_DT_NOP)
> -			continue;
> -		if (tag == OF_DT_END)
> -			break;
> -		if (tag == OF_DT_PROP) {
> -			u32 sz = be32_to_cpup((__be32 *)p);
> -			p += 8;
> -			if (be32_to_cpu(initial_boot_params->version) < 0x10)
> -				p = ALIGN(p, sz >= 8 ? 8 : 4);
> -			p += sz;
> -			p = ALIGN(p, 4);
> -			continue;
> -		}
> -		if (tag != OF_DT_BEGIN_NODE) {
> -			pr_err("Invalid tag %x in flat device tree!\n", tag);
> -			return -EINVAL;
> -		}
> -		depth++;
> -		pathp = (char *)p;
> -		p = ALIGN(p + strlen(pathp) + 1, 4);
> -		if ((*pathp) == '/') {
> -			char *lp, *np;
> -			for (lp = NULL, np = pathp; *np; np++)
> -				if ((*np) == '/')
> -					lp = np+1;
> -			if (lp != NULL)
> -				pathp = lp;
> -		}
> -		rc = it(p, pathp, depth, data);
> -		if (rc != 0)
> -			break;
> -	} while (1);
> -
> -	return rc;
> -}
> -
> -/**
> - * of_get_flat_dt_root - find the root node in the flat blob
> - */
> -unsigned long __init of_get_flat_dt_root(void)
> -{
> -	unsigned long p = ((unsigned long)initial_boot_params) +
> -		be32_to_cpu(initial_boot_params->off_dt_struct);
> -
> -	while (be32_to_cpup((__be32 *)p) == OF_DT_NOP)
> -		p += 4;
> -	BUG_ON(be32_to_cpup((__be32 *)p) != OF_DT_BEGIN_NODE);
> -	p += 4;
> -	return ALIGN(p + strlen((char *)p) + 1, 4);
> -}
> -
> -/**
> - * of_get_flat_dt_prop - Given a node in the flat blob, return the property ptr
> - *
> - * This function can be used within scan_flattened_dt callback to get
> - * access to properties
> - */
> -void *__init of_get_flat_dt_prop(unsigned long node, const char *name,
> -				 unsigned long *size)
> -{
> -	return fdt_get_property(node, name, size, initial_boot_params);
> -}
> -
> -/**
> - * of_flat_dt_is_compatible - Return true if given node has compat in compatible list
> - * @node: node to test
> - * @compat: compatible string to compare with compatible list.
> - */
> -int __init of_flat_dt_is_compatible(unsigned long node, const char *compat)
> -{
> -	return fdt_is_compatible(node, compat, initial_boot_params);
> -}
> -
> -static void *__init unflatten_dt_alloc(unsigned long *mem, unsigned long size,
> +static void *unflatten_dt_alloc(unsigned long *mem, unsigned long size,
>  				       unsigned long align)
>  {
>  	void *res;
> @@ -232,12 +119,14 @@ static void *__init unflatten_dt_alloc(unsigned long *mem, unsigned long size,
>   * @dad: Parent struct device_node
>   * @allnextpp: pointer to ->allnext from last allocated device_node
>   * @fpsize: Size of the node path up at the current depth.
> + * @blob: The parent device tree blob
>   */
> -unsigned long __init unflatten_dt_node(unsigned long mem,
> -					unsigned long *p,
> -					struct device_node *dad,
> -					struct device_node ***allnextpp,
> -					unsigned long fpsize)
> +unsigned long unflatten_dt_node(unsigned long mem,
> +				unsigned long *p,
> +				struct device_node *dad,
> +				struct device_node ***allnextpp,
> +				unsigned long fpsize,
> +				struct boot_param_header *blob)

Ditto here, blob should be the first argument.

>  {
>  	struct device_node *np;
>  	struct property *pp, **prev_pp = NULL;
> @@ -333,10 +222,10 @@ unsigned long __init unflatten_dt_node(unsigned long mem,
>  		sz = be32_to_cpup((__be32 *)(*p));
>  		noff = be32_to_cpup((__be32 *)((*p) + 4));
>  		*p += 8;
> -		if (be32_to_cpu(initial_boot_params->version) < 0x10)
> +		if (be32_to_cpu(blob->version) < 0x10)
>  			*p = ALIGN(*p, sz >= 8 ? 8 : 4);
>  
> -		pname = find_flat_dt_string(noff);
> +		pname = fdt_get_string(noff, blob);
>  		if (pname == NULL) {
>  			pr_info("Can't find property name in list !\n");
>  			break;
> @@ -415,7 +304,8 @@ unsigned long __init unflatten_dt_node(unsigned long mem,
>  		if (tag == OF_DT_NOP)
>  			*p += 4;
>  		else
> -			mem = unflatten_dt_node(mem, p, np, allnextpp, fpsize);
> +			mem = unflatten_dt_node(mem, p, np, allnextpp,
> +						fpsize, blob);
>  		tag = be32_to_cpup((__be32 *)(*p));
>  	}
>  	if (tag != OF_DT_END_NODE) {
> @@ -426,6 +316,119 @@ unsigned long __init unflatten_dt_node(unsigned long mem,
>  	return mem;
>  }
>  
> +/* Everything below here references initial_boot_params directly. */

Unfortunately moving stuff around like this makes the patch harder to
review because mechanical movement is mixed in with functional
changes.  Can you split the rearrangement into a separate patch?


> +int __initdata dt_root_addr_cells;
> +int __initdata dt_root_size_cells;
> +
> +struct boot_param_header *initial_boot_params;
> +
> +char *find_flat_dt_string(u32 offset)
> +{
> +	return ((char *)initial_boot_params) +
> +		be32_to_cpu(initial_boot_params->off_dt_strings) + offset;
> +}

Shouldn't the body of find_flat_dt_string be using the new
fdt_get_string function from patch 1?  Or better yet, convert all
existing users to the new function?  (There are no users of
find_flat_dt_string outside of fdt.c).

> +
> +/**
> + * of_scan_flat_dt - scan flattened tree blob and call callback on each.
> + * @it: callback function
> + * @data: context data pointer
> + *
> + * This function is used to scan the flattened device-tree, it is
> + * used to extract the memory information at boot before we can
> + * unflatten the tree
> + */
> +int __init of_scan_flat_dt(int (*it)(unsigned long node,
> +				     const char *uname, int depth,
> +				     void *data),
> +			   void *data)
> +{
> +	unsigned long p = ((unsigned long)initial_boot_params) +
> +		be32_to_cpu(initial_boot_params->off_dt_struct);
> +	int rc = 0;
> +	int depth = -1;
> +
> +	do {
> +		u32 tag = be32_to_cpup((__be32 *)p);
> +		char *pathp;
> +
> +		p += 4;
> +		if (tag == OF_DT_END_NODE) {
> +			depth--;
> +			continue;
> +		}
> +		if (tag == OF_DT_NOP)
> +			continue;
> +		if (tag == OF_DT_END)
> +			break;
> +		if (tag == OF_DT_PROP) {
> +			u32 sz = be32_to_cpup((__be32 *)p);
> +			p += 8;
> +			if (be32_to_cpu(initial_boot_params->version) < 0x10)
> +				p = ALIGN(p, sz >= 8 ? 8 : 4);
> +			p += sz;
> +			p = ALIGN(p, 4);
> +			continue;
> +		}
> +		if (tag != OF_DT_BEGIN_NODE) {
> +			pr_err("Invalid tag %x in flat device tree!\n", tag);
> +			return -EINVAL;
> +		}
> +		depth++;
> +		pathp = (char *)p;
> +		p = ALIGN(p + strlen(pathp) + 1, 4);
> +		if ((*pathp) == '/') {
> +			char *lp, *np;
> +			for (lp = NULL, np = pathp; *np; np++)
> +				if ((*np) == '/')
> +					lp = np+1;
> +			if (lp != NULL)
> +				pathp = lp;
> +		}
> +		rc = it(p, pathp, depth, data);
> +		if (rc != 0)
> +			break;
> +	} while (1);
> +
> +	return rc;
> +}
> +
> +/**
> + * of_get_flat_dt_root - find the root node in the flat blob
> + */
> +unsigned long __init of_get_flat_dt_root(void)
> +{
> +	unsigned long p = ((unsigned long)initial_boot_params) +
> +		be32_to_cpu(initial_boot_params->off_dt_struct);
> +
> +	while (be32_to_cpup((__be32 *)p) == OF_DT_NOP)
> +		p += 4;
> +	BUG_ON(be32_to_cpup((__be32 *)p) != OF_DT_BEGIN_NODE);
> +	p += 4;
> +	return ALIGN(p + strlen((char *)p) + 1, 4);
> +}

There should also be a generic version of this which accepts a blob
pointer.

> +
> +/**
> + * of_get_flat_dt_prop - Given a node in the flat blob, return the property ptr
> + *
> + * This function can be used within scan_flattened_dt callback to get
> + * access to properties
> + */
> +void *__init of_get_flat_dt_prop(unsigned long node, const char *name,
> +				 unsigned long *size)
> +{
> +	return fdt_get_property(node, name, size, initial_boot_params);
> +}
> +
> +/**
> + * of_flat_dt_is_compatible - Return true if given node has compat in compatible list
> + * @node: node to test
> + * @compat: compatible string to compare with compatible list.
> + */
> +int __init of_flat_dt_is_compatible(unsigned long node, const char *compat)
> +{
> +	return fdt_is_compatible(node, compat, initial_boot_params);
> +}
> +
>  #ifdef CONFIG_BLK_DEV_INITRD
>  /**
>   * early_init_dt_check_for_initrd - Decode initrd location from flat tree
> @@ -607,7 +610,7 @@ void __init unflatten_device_tree(void)
>  	/* First pass, scan for size */
>  	start = ((unsigned long)initial_boot_params) +
>  		be32_to_cpu(initial_boot_params->off_dt_struct);
> -	size = unflatten_dt_node(0, &start, NULL, NULL, 0);
> +	size = unflatten_dt_node(0, &start, NULL, NULL, 0, initial_boot_params);
>  	size = (size | 3) + 1;
>  
>  	pr_debug("  size is %lx, allocating...\n", size);
> @@ -624,7 +627,7 @@ void __init unflatten_device_tree(void)
>  	/* Second pass, do actual unflattening */
>  	start = ((unsigned long)initial_boot_params) +
>  		be32_to_cpu(initial_boot_params->off_dt_struct);
> -	unflatten_dt_node(mem, &start, NULL, &allnextp, 0);
> +	unflatten_dt_node(mem, &start, NULL, &allnextp, 0, initial_boot_params);
>  	if (be32_to_cpup((__be32 *)start) != OF_DT_END)
>  		pr_warning("Weird tag at end of tree: %08x\n", *((u32 *)start));
>  	if (be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeef)
> -- 
> 1.5.6.6
> 
> 
> 
> This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
> 
> 
