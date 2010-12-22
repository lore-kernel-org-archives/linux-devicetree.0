From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH] of/fdt: add kernel command line option for dtb_compat
 string
Date: Wed, 22 Dec 2010 12:04:56 -0800
Message-ID: <4D1259E8.9030706@gmail.com>
References: <1291658059-383-1-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1291658059-383-1-git-send-email-dirk.brandewie@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@xenotime.net>, Grant Likely <grant.likely@secretlab.ca>, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 12/06/2010 09:54 AM, dirk.brandewie@gmail.com wrote:
> From: Dirk Brandewie<dirk.brandewie@gmail.com>
>
> Adds a kernel command line option "dtb_compat=<string>".  This string
> will be used to select the first compatible device tree blob linked
> into the kernel if a device tree blob is was *not* passed in by the
> bootloader.
>
> Signed-off-by: Dirk Brandewie<dirk.brandewie@gmail.com>
> ---
>   Documentation/kernel-parameters.txt |    8 ++++++
>   drivers/of/fdt.c                    |   48 +++++++++++++++++++++++++++++++++++
>   2 files changed, 56 insertions(+), 0 deletions(-)
>
> diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-parameters.txt
> index 92e83e5..64093e5 100644
> --- a/Documentation/kernel-parameters.txt
> +++ b/Documentation/kernel-parameters.txt
> @@ -655,6 +655,14 @@ and is between 256 and 4096 characters. It is defined in the file
>
>   	dscc4.setup=	[NET]
>
> +	dtb_compat=	[KNL]
> +			Specify the "compatible" string for the device
> +			tree blob present in the vmlinux image.  This
> +			string will be used to select the first device
> +			tree blob whose compatible property matches
> +			the string if a dtb was NOT passed in by the
> +			bootloader.
> +
>   	dynamic_printk	Enables pr_debug()/dev_dbg() calls if
>   			CONFIG_DYNAMIC_PRINTK_DEBUG has been enabled.
>   			These can also be switched on/off via
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index c1360e0..ca1318c 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -15,6 +15,8 @@
>   #include<linux/of_fdt.h>
>   #include<linux/string.h>
>   #include<linux/errno.h>
> +#include<asm-generic/vmlinux.lds.h>
> +
>
>   #ifdef CONFIG_PPC
>   #include<asm/machdep.h>
> @@ -604,3 +606,49 @@ void __init unflatten_device_tree(void)
>
>   	pr_debug("<- unflatten_device_tree()\n");
>   }
> +
> +extern uint8_t __dtb_start[];
> +extern uint8_t __dtb_end[];
> +static void __init *of_flat_dt_find_compatible_dtb(char *name)
> +{
> +	void *rc = NULL;
> +	unsigned long root, size;
> +	struct boot_param_header  *orig_initial_boot_params;
> +	uint8_t *blob;
> +
> +	orig_initial_boot_params = initial_boot_params;
> +	blob = __dtb_start;
> +	initial_boot_params = (struct boot_param_header *)blob;
> +
> +	while (blob<  __dtb_end) {
> +		if (be32_to_cpu(initial_boot_params->magic) != OF_DT_HEADER) {
> +			WARN(1, "Invalid device tree blob in vmlinux\n");
> +			break;
> +		}
> +
> +		root = of_get_flat_dt_root();
> +		if (of_flat_dt_is_compatible(root, name)>  0) {
> +			rc = blob;
> +			break;
> +		}
> +
> +		size =  be32_to_cpu(initial_boot_params->totalsize);
> +		blob =  PTR_ALIGN(blob + size, STRUCT_ALIGNMENT);
> +		initial_boot_params = (struct boot_param_header *)blob;
> +	}
> +
> +	if (rc == NULL)
> +		initial_boot_params = orig_initial_boot_params;
> +	return rc;
> +}
> +
> +
> +static int __init of_flat_dtb_compat_setup(char *line)
> +{
> +	if (!initial_boot_params)
> +		initial_boot_params = of_flat_dt_find_compatible_dtb(line);
> +	return 1;
> +}
> +
> +early_param("dtb_compat", of_flat_dtb_compat_setup);
> +
Any more comments on this patch? Is it good to go or DOA?

Thanks
--Dirk

