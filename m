From: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2] [media] mtk-mdp: Fix g_/s_selection capture/compose
 logic
Date: Thu, 15 Jun 2017 14:29:26 +0800
Message-ID: <1497508166.3384.5.camel@mtksdaap41>
References: <1494556970-12278-1-git-send-email-minghsiu.tsai@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494556970-12278-1-git-send-email-minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Houlong Wei <houlong.wei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Wu-Cheng Li <wuchengli-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Hans,

Would you have time to review this patch v2?
The patch v1 violates v4l2 spec. I have fixed it in v2.


Sincerely,
Ming Hsiu

On Fri, 2017-05-12 at 10:42 +0800, Minghsiu Tsai wrote:
> From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> Experiments show that the:
>  (1) mtk-mdp uses the _MPLANE form of CAPTURE/OUTPUT
>  (2) CAPTURE types use CROP targets, and OUTPUT types use COMPOSE targets
> 
> Signed-off-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Houlong Wei <houlong.wei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> ---
> Changes in v2:
> . Can not use *_MPLANE type in g_/s_selection 
> ---
>  drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> index 13afe48..e18ac626 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> @@ -838,10 +838,10 @@ static int mtk_mdp_m2m_g_selection(struct file *file, void *fh,
>  	bool valid = false;
>  
>  	if (s->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> -		if (mtk_mdp_is_target_compose(s->target))
> +		if (mtk_mdp_is_target_crop(s->target))
>  			valid = true;
>  	} else if (s->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
> -		if (mtk_mdp_is_target_crop(s->target))
> +		if (mtk_mdp_is_target_compose(s->target))
>  			valid = true;
>  	}
>  	if (!valid) {
> @@ -908,10 +908,10 @@ static int mtk_mdp_m2m_s_selection(struct file *file, void *fh,
>  	bool valid = false;
>  
>  	if (s->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> -		if (s->target == V4L2_SEL_TGT_COMPOSE)
> +		if (s->target == V4L2_SEL_TGT_CROP)
>  			valid = true;
>  	} else if (s->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
> -		if (s->target == V4L2_SEL_TGT_CROP)
> +		if (s->target == V4L2_SEL_TGT_COMPOSE)
>  			valid = true;
>  	}
>  	if (!valid) {
> @@ -925,7 +925,7 @@ static int mtk_mdp_m2m_s_selection(struct file *file, void *fh,
>  	if (ret)
>  		return ret;
>  
> -	if (mtk_mdp_is_target_crop(s->target))
> +	if (mtk_mdp_is_target_compose(s->target))
>  		frame = &ctx->s_frame;
>  	else
>  		frame = &ctx->d_frame;


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
