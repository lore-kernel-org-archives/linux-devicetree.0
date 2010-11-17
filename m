From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/3] fdt.c: Add non-boottime device tree functions
Date: Wed, 17 Nov 2010 12:42:03 -0700
Message-ID: <20101117194203.GA2352@angua.secretlab.ca>
References: <1290021345-4303-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<17453aae-47e7-4b69-b7f4-b4577456c637@VA3EHSMHS001.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <17453aae-47e7-4b69-b7f4-b4577456c637-+Ck8Kgl/v09ZbvUCbuG1mrjjLBE8jN/0@public.gmane.org>
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

On Wed, Nov 17, 2010 at 11:15:43AM -0800, Stephen Neuendorffer wrote:
> In preparation for providing run-time handling of device trees, factor
> out some of the basic functions so that they take an arbitrary blob,
> rather than relying on the single boot-time tree.
> 
> Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/of/fdt.c       |  129 ++++++++++++++++++++++++++++++-----------------
>  include/linux/of_fdt.h |    9 +++
>  2 files changed, 91 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index c1360e0..6ae207a 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -22,6 +22,86 @@
>  
>  #include <asm/page.h>
>  
> +char *fdt_get_string(u32 offset,
> +			  struct boot_param_header *blob)

nitpicking: Encouraged naming convention is of_flat_dt_* for this
file.  Also, I think it makes more sense for blob to be the first
argument in all of these functions.

> +{
> +	return ((char *)blob) +
> +		be32_to_cpu(blob->off_dt_strings) + offset;
> +}
> +
> +/**
> + * of_get_flat_dt_prop_blob - Given a node in the given flat blob, return
> + * the property ptr
> + *
> + * This function can be used within scan_flattened_dt callback to get
> + * access to properties
> + */
> +void *fdt_get_property(unsigned long node, const char *name,
> +				 unsigned long *size,
> +				 struct boot_param_header *blob)

Colocate this function with the defintiion of
of_flat_dt_get_property()

> +{
> +	unsigned long p = node;

I think 'p' can be made type void* to eliminate all the casting in
this function (although I understand that this patch just moves code;
so that change doesn't need to be in this patch.

> +
> +	do {
> +		u32 tag = be32_to_cpup((__be32 *)p);
> +		u32 sz, noff;
> +		const char *nstr;
> +
> +		p += 4;
> +		if (tag == OF_DT_NOP)
> +			continue;
> +		if (tag != OF_DT_PROP)
> +			return NULL;
> +
> +		sz = be32_to_cpup((__be32 *)p);
> +		noff = be32_to_cpup((__be32 *)(p + 4));
> +		p += 8;
> +		if (be32_to_cpu(blob->version) < 0x10)
> +			p = ALIGN(p, sz >= 8 ? 8 : 4);

If you change p to void*, then PTR_ALIGN can be used.

> +
> +		nstr = fdt_get_string(noff, blob);
> +		if (nstr == NULL) {
> +			pr_warning("Can't find property index name !\n");
> +			return NULL;
> +		}
> +		if (strcmp(name, nstr) == 0) {
> +			if (size)
> +				*size = sz;
> +			return (void *)p;
> +		}
> +		p += sz;
> +		p = ALIGN(p, 4);
> +	} while (1);
> +}
> +
> +/**
> + * fdt_is_compatible - Return true if given node from the given blob has
> + * compat in its compatible list
> + * @node: node to test
> + * @compat: compatible string to compare with compatible list.
> + * @blob: A device tree blob
> + */
> +int fdt_is_compatible(unsigned long node, const char *compat,
> +				 struct boot_param_header *blob)

Colocate this definition with of_flat_dt_is_compatible.

> +{
> +	const char *cp;
> +	unsigned long cplen, l;
> +
> +	cp = fdt_get_property(node, "compatible", &cplen, blob);
> +	if (cp == NULL)
> +		return 0;
> +	while (cplen > 0) {
> +		if (of_compat_cmp(cp, compat, strlen(compat)) == 0)
> +			return 1;
> +		l = strlen(cp) + 1;
> +		cp += l;
> +		cplen -= l;
> +	}
> +
> +	return 0;
> +}
> +
> +/* Everything below here references initial_boot_params directly. */
>  int __initdata dt_root_addr_cells;
>  int __initdata dt_root_size_cells;
>  
> @@ -121,38 +201,7 @@ unsigned long __init of_get_flat_dt_root(void)
>  void *__init of_get_flat_dt_prop(unsigned long node, const char *name,
>  				 unsigned long *size)
>  {
> -	unsigned long p = node;
> -
> -	do {
> -		u32 tag = be32_to_cpup((__be32 *)p);
> -		u32 sz, noff;
> -		const char *nstr;
> -
> -		p += 4;
> -		if (tag == OF_DT_NOP)
> -			continue;
> -		if (tag != OF_DT_PROP)
> -			return NULL;
> -
> -		sz = be32_to_cpup((__be32 *)p);
> -		noff = be32_to_cpup((__be32 *)(p + 4));
> -		p += 8;
> -		if (be32_to_cpu(initial_boot_params->version) < 0x10)
> -			p = ALIGN(p, sz >= 8 ? 8 : 4);
> -
> -		nstr = find_flat_dt_string(noff);
> -		if (nstr == NULL) {
> -			pr_warning("Can't find property index name !\n");
> -			return NULL;
> -		}
> -		if (strcmp(name, nstr) == 0) {
> -			if (size)
> -				*size = sz;
> -			return (void *)p;
> -		}
> -		p += sz;
> -		p = ALIGN(p, 4);
> -	} while (1);
> +	return fdt_get_property(node, name, size, initial_boot_params);
>  }
>  
>  /**
> @@ -162,21 +211,7 @@ void *__init of_get_flat_dt_prop(unsigned long node, const char *name,
>   */
>  int __init of_flat_dt_is_compatible(unsigned long node, const char *compat)
>  {
> -	const char *cp;
> -	unsigned long cplen, l;
> -
> -	cp = of_get_flat_dt_prop(node, "compatible", &cplen);
> -	if (cp == NULL)
> -		return 0;
> -	while (cplen > 0) {
> -		if (of_compat_cmp(cp, compat, strlen(compat)) == 0)
> -			return 1;
> -		l = strlen(cp) + 1;
> -		cp += l;
> -		cplen -= l;
> -	}
> -
> -	return 0;
> +	return fdt_is_compatible(node, compat, initial_boot_params);
>  }
>  
>  static void *__init unflatten_dt_alloc(unsigned long *mem, unsigned long size,
> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> index 7bbf5b3..864ec47 100644
> --- a/include/linux/of_fdt.h
> +++ b/include/linux/of_fdt.h
> @@ -58,6 +58,15 @@ struct boot_param_header {
>  };
>  
>  #if defined(CONFIG_OF_FLATTREE)
> +/* For scanning an arbitrary device-tree at any time */
> +extern char *fdt_get_string(u32 offset,
> +			    struct boot_param_header *blob);
> +extern void *fdt_get_property(unsigned long node, const char *name,
> +			      unsigned long *size,
> +			      struct boot_param_header *blob);
> +extern int fdt_is_compatible(unsigned long node, const char *name,
> +			     struct boot_param_header *blob);
> +

Other than renaming the functions to match the existing naming
convention, and making 'blob' the first argument, this patch looks
good to me.

g.
