From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v2] [media] mtk-mdp: Fix g_/s_selection capture/compose
 logic
Date: Fri, 16 Jun 2017 12:42:22 +0200
Message-ID: <a180f2fc-1dce-3630-ed48-25c247eff79a@xs4all.nl>
References: <1494556970-12278-1-git-send-email-minghsiu.tsai@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494556970-12278-1-git-send-email-minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Houlong Wei <houlong.wei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Wu-Cheng Li <wuchengli-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/12/17 04:42, Minghsiu Tsai wrote:
> From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> Experiments show that the:
>  (1) mtk-mdp uses the _MPLANE form of CAPTURE/OUTPUT

Please drop this, since this no longer applies to this patch.

>  (2) CAPTURE types use CROP targets, and OUTPUT types use COMPOSE targets

Are you really certain about this?

For m2m devices the output (i.e. memory to hardware) typically crops from memory
and the capture side (hardware to memory) composes into memory.

I.e.: for the output side you crop the part of the memory buffer that you want
to process and on the capture side you compose the result into a memory buffer:
i.e. the memory buffer might be 1920x1080, but you compose the decoder output
into a rectangle of 640x480 at offset 128x128 within that buffer (just an example).

CAPTURE using crop would be if, before the data is DMAed, the hardware decoder
output is cropped. E.g. if the stream fed to the decoder is 1920x1080, but you
want to only DMA a subselection of that, then that would be cropping, and it
would go to a memory buffer of the size of the crop selection.

OUTPUT using compose is highly unlikely: that means that the frame you give
is composed in a larger internal buffer with generated border data around it.
Very rare and really only something that a compositor of some sort would do.

What exactly does the hardware do? Both for the encoder and for the decoder
case. Perhaps if I knew exactly what that is, then I can advise.

Regards,

	Hans

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
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
