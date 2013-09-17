From: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 09/28] of: Introduce common early_init_dt_scan
Date: Tue, 17 Sep 2013 11:16:20 +0530
Message-ID: <5237ECAC.8010400@synopsys.com>
References: <1379372965-22359-1-git-send-email-robherring2@gmail.com> <1379372965-22359-10-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379372965-22359-10-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/17/2013 04:39 AM, Rob Herring wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> Most architectures scan the all the same items early in the FDT and none
> are really architecture specific. Create a common early_init_dt_scan to
> unify the early scan of root, memory, and chosen nodes in the flattened
> DT.
> 
> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/of/fdt.c       | 18 ++++++++++++++++++
>  include/linux/of_fdt.h |  2 ++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index eca1810..0714dd4 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -785,6 +785,24 @@ void * __init __weak early_init_dt_alloc_memory_arch(u64 size, u64 align)
>  }
>  #endif
>  
> +bool __init early_init_dt_scan(void *params)
> +{
> +	/* Setup flat device-tree pointer */
> +	initial_boot_params = params;
> +
> +	/* check device tree validity */
> +	if (be32_to_cpu(initial_boot_params->magic) != OF_DT_HEADER)
> +		return false;
> +
> +	/* Retrieve various information from the /chosen node */
> +	of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
> +	/* Initialize {size,address}-cells info */
> +	of_scan_flat_dt(early_init_dt_scan_root, NULL);
> +	/* Setup memory, calling early_init_dt_add_memory_arch */
> +	of_scan_flat_dt(early_init_dt_scan_memory, NULL);
> +	return true;
> +}

You probably need empty lines here.

-Vineet

> +
>  /**
>   * unflatten_device_tree - create tree of device_nodes from flat blob
>   *
> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> index 58c28a8..73e1651 100644
> --- a/include/linux/of_fdt.h
> +++ b/include/linux/of_fdt.h
> @@ -116,6 +116,8 @@ extern void early_init_dt_setup_initrd_arch(u64 start, u64 end);
>  extern int early_init_dt_scan_root(unsigned long node, const char *uname,
>  				   int depth, void *data);
>  
> +extern bool early_init_dt_scan(void *params);
> +
>  /* Other Prototypes */
>  extern void unflatten_device_tree(void);
>  extern void unflatten_and_copy_device_tree(void);
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
