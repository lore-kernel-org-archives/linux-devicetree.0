From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: Fwd: [PATCH 1/1] of/fdt: failed to mark hotplug range message
Date: Thu, 22 Dec 2016 06:52:45 +0100
Message-ID: <5251e7ef-cadf-7833-9a7e-66ebf78e2e94@gmx.de>
References: <20161222053405.27190-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161222053405.27190-1-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Reza Arbab <arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Balbir Singh <bsingharora-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

scripts/get_maintainers.pl did not show the people involved in creating
the code to be changed.

On 12/22/2016 06:34 AM, Heinrich Schuchardt wrote:
> If marking a hotplug range fails a message
> "failed to mark hotplug range" is written.
> 
> The end address is base + size - 1.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  drivers/of/fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index c9b5cac03b36..fd129b6e5396 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1057,7 +1057,7 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
>  
>  		if (early_init_dt_mark_hotplug_memory_arch(base, size))
>  			pr_warn("failed to mark hotplug range 0x%llx - 0x%llx\n",
> -				base, base + size);
> +				base, base + size - 1);
>  	}
>  
>  	return 0;
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
