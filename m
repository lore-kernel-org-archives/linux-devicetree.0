From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 14/29] metag: use early_init_dt_scan
Date: Fri, 8 Nov 2013 13:06:10 +0000
Message-ID: <527CE1C2.3030007@imgtec.com>
References: <1381163377-21044-1-git-send-email-robherring2@gmail.com> <1381163377-21044-15-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381163377-21044-15-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-metag <linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/10/13 17:29, Rob Herring wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> Convert metag to use new early_init_dt_scan function.
> 
> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

Acked-by: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

Cheers
James

> ---
>  arch/metag/kernel/devtree.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/arch/metag/kernel/devtree.c b/arch/metag/kernel/devtree.c
> index 049af56..68c2fee 100644
> --- a/arch/metag/kernel/devtree.c
> +++ b/arch/metag/kernel/devtree.c
> @@ -43,18 +43,16 @@ void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
>   */
>  struct machine_desc * __init setup_machine_fdt(void *dt)
>  {
> -	struct boot_param_header *devtree = dt;
>  	struct machine_desc *mdesc, *mdesc_best = NULL;
>  	unsigned int score, mdesc_score = ~1;
>  	unsigned long dt_root;
>  	const char *model;
>  
>  	/* check device tree validity */
> -	if (be32_to_cpu(devtree->magic) != OF_DT_HEADER)
> +	if (!early_init_dt_scan(dt))
>  		return NULL;
>  
>  	/* Search the mdescs for the 'best' compatible value match */
> -	initial_boot_params = devtree;
>  	dt_root = of_get_flat_dt_root();
>  
>  	for_each_machine_desc(mdesc) {
> @@ -90,9 +88,6 @@ struct machine_desc * __init setup_machine_fdt(void *dt)
>  		model = "<unknown>";
>  	pr_info("Machine: %s, model: %s\n", mdesc_best->name, model);
>  
> -	/* Retrieve various information from the /chosen node */
> -	of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
> -
>  	return mdesc_best;
>  
>  }
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-metag" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
