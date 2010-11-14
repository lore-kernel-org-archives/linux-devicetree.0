From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 4/4] of/fdt: add kernel command line option for
	dtb_compat string
Date: Sat, 13 Nov 2010 23:22:46 -0700
Message-ID: <20101114062246.GD2355@angua.secretlab.ca>
References: <cover.1289520079.git.dirk.brandewie@gmail.com>
	<855a5a11d04a7c1883675b6a77992c4af85222fd.1289520079.git.dirk.brandewie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <855a5a11d04a7c1883675b6a77992c4af85222fd.1289520079.git.dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 11, 2010 at 04:03:50PM -0800, dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Add support for specifying a "compatible" string from the kernel
> command line and functions for the platform to find the compatible
> blob present in the kernel image if any.
> 
> Signed-off-by: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/of/fdt.c       |   52 ++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of_fdt.h |    9 ++++++++
>  2 files changed, 61 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index c1360e0..07fe4c6 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -604,3 +604,55 @@ void __init unflatten_device_tree(void)
>  
>  	pr_debug(" <- unflatten_device_tree()\n");
>  }
> +
> +#ifndef MODULE
> +#ifdef CONFIG_OF_FLATTREE
> +static char dtb_compat_name[MAX_DTB_COMPAT_STR] = "";
> +
> +char __init *of_get_dtb_compatible_string(void)
> +{
> +	return dtb_compat_name;
> +}
> +
> +#ifdef CONFIG_KERNEL_DTB
> +extern char __dtb_start[];
> +extern char __dtb_end[];

'char' is completely bogus in this context.  Either void or struct
boot_param_header would be more accurate and useful.  I believe you
can do:

	extern void __dtb_start;
	extern_void __dtb_end;

And then reference the addresses with &__dtb_start and &__dtb_end.
That would eliminate a lot of the casting below.

> +
> +void *of_find_compatible_dtb(char *name)
> +{
> +	void *rc = NULL;
> +	char *hdr;
> +	unsigned long node, root;
> +	struct boot_param_header *blob, *orig_initial_boot_params;
> +	
> +	orig_initial_boot_params = initial_boot_params;
> +	
> +	if (__dtb_start != __dtb_end){

Don't bother with this if(); the empty condition can be handled in the
while (blob < __dtb_end){...} block.  That way a level of indentation
can be removed.

> +		blob = (struct boot_param_header *)__dtb_start;
> +		do{
> +			node = ((unsigned long)blob) +  
> +				be32_to_cpu(blob->off_dt_struct);

Ugly casting.  I would work with everything as pointers (make node and
blob void*) and only cast when necessary....

wait....

'node' isn't actually used anywhere.  Why is this here?

> +			initial_boot_params = blob;

Blech!  I really need to get Stephen (cc'd) to respin his "of/fdt: Add
unflatten_partial_device_tree" patch that decouples the flattree
functions from initial_boot_params.  Having to do it this way is just
plain ugly.

Stephen: nudge, nudge.

> +			root = of_get_flat_dt_root();
> +			if (of_flat_dt_is_compatible(root, name) > 0) {
> +				rc = (void*) blob;

Unnecessary cast.  Any regular pointer can always be assigned to a void*
variable without a cast..

> +				break;
> +			}
> +			blob = (unsigned long)blob+be32_to_cpu(blob->totalsize);
> +		}while (blob < (struct boot_param_header *)__dtb_end);

Minor coding convention violations.  It is worth running it through
checkpatch.pl before submitting.  checkpatch may not proclaim the
gospel, but it is a useful tool.

> +	}
> +	if (rc == NULL)
> +		initial_boot_params = orig_initial_boot_params;	
> +	return rc;
> +}
> +#endif
> +
> +static int __init dtb_compat_setup(char *line)
> +{
> +	strncpy(dtb_compat_name, line, MAX_DTB_COMPAT_STR);
> +	return 1;
> +}
> +
> +__setup("dtb_compat=", dtb_compat_setup);

Could the searching of the linked-in dtbs be handled here at __setup
time?  That would eliminate the need for a fixed size dtb_compat_name
variable.

Also need to add documentation for dtb_compat parameter to
Documentation/kernel-parameters.txt

> +#endif
> +#endif
> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> index 7bbf5b3..181e413 100644
> --- a/include/linux/of_fdt.h
> +++ b/include/linux/of_fdt.h
> @@ -58,6 +58,8 @@ struct boot_param_header {
>  };
>  
>  #if defined(CONFIG_OF_FLATTREE)
> +#define MAX_DTB_COMPAT_STR 64
> +

Nothing outside fdt.c uses MAC_DTB_COMPAT_STR, so this define should
also be in fdt.c

>  /* TBD: Temporary export of fdt globals - remove when code fully merged */
>  extern int __initdata dt_root_addr_cells;
>  extern int __initdata dt_root_size_cells;
> @@ -82,6 +84,13 @@ extern void early_init_dt_add_memory_arch(u64 base, u64 size);
>  extern u64 early_init_dt_alloc_memory_arch(u64 size, u64 align);
>  extern u64 dt_mem_next_cell(int s, __be32 **cellp);
>  
> +extern char *of_get_dtb_compatible_string(void);
> +#ifdef CONFIG_KERNEL_DTB
> +extern void *of_find_compatible_dtb(char *name);
> +#else
> +static inline void *of_find_compatible_dtb(char *name) {return 0;}
> +
> +#endif 
>  /*
>   * If BLK_DEV_INITRD, the fdt early init code will call this function,
>   * to be provided by the arch code. start and end are specified as
> -- 
> 1.7.2.3
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
