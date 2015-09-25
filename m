From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] edac: xgene: Fix possible sprintf overflow issue
Date: Fri, 25 Sep 2015 15:45:51 +0200
Message-ID: <20150925134551.GE3568@pd.tnic>
References: <1443116287-11752-1-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443116287-11752-1-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 24, 2015 at 10:38:07AM -0700, Loc Ho wrote:
> Replace sprintf with snprintf to avoid possible string array overflow.
> 
> Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
> ---
>  drivers/edac/xgene_edac.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/edac/xgene_edac.c b/drivers/edac/xgene_edac.c
> index 37121e8..dfa13bb 100644
> --- a/drivers/edac/xgene_edac.c
> +++ b/drivers/edac/xgene_edac.c
> @@ -879,7 +879,7 @@ xgene_edac_pmd_create_debugfs_nodes(struct edac_device_ctl_info *edac_dev)
>  	if (!IS_ENABLED(CONFIG_EDAC_DEBUG) || !ctx->edac->dfs)
>  		return;
>  
> -	sprintf(name, "PMD%d", ctx->pmd);
> +	snprintf(name, sizeof(name), "PMD%d", ctx->pmd);
>  	dbgfs_dir = edac_debugfs_create_dir_at(name, ctx->edac->dfs);
>  	if (!dbgfs_dir)
>  		return;
> @@ -923,7 +923,7 @@ static int xgene_edac_pmd_add(struct xgene_edac *edac, struct device_node *np,
>  		goto err_group;
>  	}
>  
> -	sprintf(edac_name, "l2c%d", pmd);
> +	snprintf(edac_name, sizeof(edac_name), "l2c%d", pmd);
>  	edac_dev = edac_device_alloc_ctl_info(sizeof(*ctx),
>  					      edac_name, 1, "l2c", 1, 2, NULL,
>  					      0, edac_device_alloc_index());
> @@ -1183,7 +1183,7 @@ xgene_edac_l3_create_debugfs_nodes(struct edac_device_ctl_info *edac_dev)
>  	if (!IS_ENABLED(CONFIG_EDAC_DEBUG) || !ctx->edac->dfs)
>  		return;
>  
> -	sprintf(name, "l3c%d", ctx->edac_idx);
> +	snprintf(name, sizeof(name), "l3c%d", ctx->edac_idx);
>  	dbgfs_dir = edac_debugfs_create_dir_at(name, ctx->edac->dfs);
>  	if (!dbgfs_dir)
>  		return;

All 5 applied.

I've merged the last hunk changing xgene_edac_l3_create_debugfs_nodes
into the second patch which adds the L3 support.

Thanks.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
