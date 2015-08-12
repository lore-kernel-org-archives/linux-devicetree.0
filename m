From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 3/4] edac: Add L3/SoC EDAC support to the APM X-Gene
 SoC EDAC driver
Date: Wed, 12 Aug 2015 12:51:21 +0200
Message-ID: <20150812105121.GE14011@nazgul.tnic>
References: <1439326077-25507-1-git-send-email-lho@apm.com>
 <1439326077-25507-2-git-send-email-lho@apm.com>
 <1439326077-25507-3-git-send-email-lho@apm.com>
 <1439326077-25507-4-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1439326077-25507-4-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 11, 2015 at 02:47:56PM -0600, Loc Ho wrote:
> This patch adds EDAC support for the L3 and SoC components.
> 
> Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
> ---
>  drivers/edac/xgene_edac.c |  827 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 files changed, 815 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/edac/xgene_edac.c b/drivers/edac/xgene_edac.c
> index ba06904..d5e33bf 100644
> --- a/drivers/edac/xgene_edac.c
> +++ b/drivers/edac/xgene_edac.c
> @@ -66,6 +66,8 @@ struct xgene_edac {
>  
>  	struct list_head	mcus;
>  	struct list_head	pmds;
> +	struct list_head	l3s;
> +	struct list_head	socs;
>  
>  	struct mutex		mc_lock;
>  	int			mc_active_mask;
> @@ -877,8 +879,8 @@ static const struct file_operations xgene_edac_pmd_debug_inject_fops[] = {
>  	{ }
>  };
>  
> -static void xgene_edac_pmd_create_debugfs_nodes(
> -	struct edac_device_ctl_info *edac_dev)
> +static void
> +xgene_edac_pmd_create_debugfs_nodes(struct edac_device_ctl_info *edac_dev)
>  {
>  	struct xgene_edac_pmd_ctx *ctx = edac_dev->pvt_info;
>  	struct dentry *edac_debugfs;
> @@ -887,10 +889,6 @@ static void xgene_edac_pmd_create_debugfs_nodes(
>  	if (!IS_ENABLED(CONFIG_EDAC_DEBUG))
>  		return;
>  
> -	/*
> -	 * Todo: Switch to common EDAC debug file system for edac device
> -	 *       when available.
> -	 */
>  	if (!ctx->edac->dfs) {
>  		ctx->edac->dfs = debugfs_create_dir(edac_dev->dev->kobj.name,
>  						    NULL);

Why is this removing only the comment and not the debugfs_create_dir()
and the rest of the gunk?

xgene_edac_l3_create_debugfs_nodes() does call debugfs_create_dir()
creating a top-level edac debugfs node too. Why?

Please go through the previous comments I had and make sure you've
incorporated them all. I'm not wasting time reviewing half-baked stuff.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
