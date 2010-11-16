From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/2] of/fdt: add kernel command line option for
	dtb_compat string
Date: Mon, 15 Nov 2010 23:32:53 -0700
Message-ID: <20101116063253.GB4074@angua.secretlab.ca>
References: <cover.1289877715.git.dirk.brandewie@gmail.com>
	<bdb6f333aea69accf3ca3e74c1f01da0a8587aee.1289877715.git.dirk.brandewie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <bdb6f333aea69accf3ca3e74c1f01da0a8587aee.1289877715.git.dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 15, 2010 at 08:01:21PM -0800, dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Add support for specifying a "compatible" string from the kernel
> command line and functions for the platform to find the compatible
> blob present in the kernel image if any.
> 
> Signed-off-by: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Hi Dirk,

a couple of general comments:

A lot of the information in the cover letter should really be here in
the actual patch description.  Use the cover letter to provide context
for the entire series, but put the specifics with each patch.  Version
changelog history should also appear in patch description, not the
cover letter.

For the next version, please cc: linux-kernel-u79uwXL29TaiAVqoAR/hOA@public.gmane.org
This series should have a wider review audience, particularly because
it touches the linker sections and the kernel parameters.  You should
also cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org and
microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org for the patch that adds the common
rules because it will affect both of those architectures directly.

More comments below.

> ---
>  Documentation/kernel-parameters.txt |    7 ++++
>  drivers/of/fdt.c                    |   55 +++++++++++++++++++++++++++++++++++
>  include/linux/of_fdt.h              |    5 +++
>  3 files changed, 67 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-parameters.txt
> index ed45e98..f9b77fa 100644
> --- a/Documentation/kernel-parameters.txt
> +++ b/Documentation/kernel-parameters.txt
> @@ -655,6 +655,13 @@ and is between 256 and 4096 characters. It is defined in the file
>  
>  	dscc4.setup=	[NET]
>  
> +	dtb_compat=	[KNL]
> +			Specify the "compatible" string for the device
> +			tree blob present in the kernel image.  This
> +			string will be used to select the first device
> +			tree blob whose compatible property matches
> +			the string passed on the kernel commandline.
> +
>  	dynamic_printk	Enables pr_debug()/dev_dbg() calls if
>  			CONFIG_DYNAMIC_PRINTK_DEBUG has been enabled.
>  			These can also be switched on/off via
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index c1360e0..77ab091 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -15,6 +15,8 @@
>  #include <linux/of_fdt.h>
>  #include <linux/string.h>
>  #include <linux/errno.h>
> +#include <asm-generic/vmlinux.lds.h>
> +
>  
>  #ifdef CONFIG_PPC
>  #include <asm/machdep.h>
> @@ -604,3 +606,56 @@ void __init unflatten_device_tree(void)
>  
>  	pr_debug(" <- unflatten_device_tree()\n");
>  }
> +
> +#ifndef MODULE

fdt.c cannot be compiled as a module.  Is this necessary?

> +#ifdef CONFIG_OF_FLATTREE

Unnecessary #ifdef.  fdt.c is only compiled when CONFIG_OF_FLATTREE is
set.

> +char dtb_compat_name[MAX_DTB_COMPAT_STR] = "";
> +
> +char __init *of_get_dtb_compatible_string(void)
> +{
> +	return dtb_compat_name;
> +}
> +
> +
> +extern uint8_t __dtb_start[];
> +extern uint8_t __dtb_end[];
> +void *of_find_compatible_dtb(char *name)

Please rename of_flat_dt_find_compatible_dtb() to match the naming
conventions that I'm working to establish in this file.

Also, it should have an __init annotation.

> +{
> +	void *rc = NULL;
> +	unsigned long root, size;
> +	struct boot_param_header  *orig_initial_boot_params;
> +	uint8_t *blob;

blob should be a void* here.  It is never used as a uint8.

> +
> +	orig_initial_boot_params = initial_boot_params;
> +	blob = __dtb_start;
> +	initial_boot_params = (struct boot_param_header *)blob;
> +
> +	do {

Start the loop with "while (blob < __dtb_end) {" to protect against
the possibility that __dtb_start == __dtb_end (no dtbs linked in).

> +		root = of_get_flat_dt_root();

Just to be defencive, should check the value of
initial_boot_params->magic before dereferencing the rest of the
structure or trying to parse nodes.

> +		if (of_flat_dt_is_compatible(root, name) > 0) {
> +			rc = (void *) blob;

Unnecessary cast (regardless of whether blob is a void* or a uint8_t*).

> +			break;
> +		}
> +
> +		size =  be32_to_cpu(initial_boot_params->totalsize);
> +		blob = (uint8_t *) ALIGN(((unsigned long)blob + size),
> +					DTB_ALIGNMENT);

I believe PTR_ALIGN() can be used and the casting removed.

> +		initial_boot_params = (struct boot_param_header *)blob;
> +	} while (blob < __dtb_end);
> +
> +	if (rc == NULL)
> +		initial_boot_params = orig_initial_boot_params;
> +	return rc;
> +}
> +
> +
> +static int __init dtb_compat_setup(char *line)

Please rename of_flat_dt_compat_setup()

> +{
> +	strncpy(dtb_compat_name, line, MAX_DTB_COMPAT_STR);
> +	return 1;
> +}

I don't remember getting a response about whether or not
of_find_compatible_dtb can be called directly from dtb_compat_setup.
Doing so would eliminate the arbitrary MAX_DTB_COMPAT_STR because
there would be no need to keep around a copy of dtb_compat_name.  It
also means that of_find_compatible_dtb() can be restricted to the file
scope.

Is there a use-case for calling of_find_compatible_dtb() anywhere
other than in dtb_compat_setup?

> +
> +early_param("dtb_compat", dtb_compat_setup);
> +#endif
> +#endif
> +
> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> index 7bbf5b3..c696da3c 100644
> --- a/include/linux/of_fdt.h
> +++ b/include/linux/of_fdt.h
> @@ -58,6 +58,8 @@ struct boot_param_header {
>  };
>  
>  #if defined(CONFIG_OF_FLATTREE)
> +#define MAX_DTB_COMPAT_STR 64
> +

Only used by drivers/of/fdt.c, so should not be in a header file.

>  /* TBD: Temporary export of fdt globals - remove when code fully merged */
>  extern int __initdata dt_root_addr_cells;
>  extern int __initdata dt_root_size_cells;
> @@ -82,6 +84,9 @@ extern void early_init_dt_add_memory_arch(u64 base, u64 size);
>  extern u64 early_init_dt_alloc_memory_arch(u64 size, u64 align);
>  extern u64 dt_mem_next_cell(int s, __be32 **cellp);
>  
> +extern char *of_get_dtb_compatible_string(void);
> +extern void *of_find_compatible_dtb(char *name);
> +

As commented above, I don't think either of these need to be visible
outside of fdt.c

g.
