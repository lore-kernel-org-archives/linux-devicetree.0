From: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v5 3/5] media: Add Mediatek MDP Driver
Date: Thu, 8 Sep 2016 20:21:39 +0800
Message-ID: <1473337299.17443.0.camel@mtksdaap41>
References: <1472559944-55114-1-git-send-email-minghsiu.tsai@mediatek.com>
         <1472559944-55114-4-git-send-email-minghsiu.tsai@mediatek.com>
         <cb59f743-66b9-15cd-0281-54510d7f93ca@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cb59f743-66b9-15cd-0281-54510d7f93ca-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2016-09-05 at 12:17 +0200, Hans Verkuil wrote:
> On 08/30/2016 02:25 PM, Minghsiu Tsai wrote:
> > Add MDP driver for MT8173
> > 
> > Signed-off-by: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/media/platform/Kconfig                |   17 +
> >  drivers/media/platform/Makefile               |    2 +
> >  drivers/media/platform/mtk-mdp/Makefile       |    9 +
> >  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c |  159 ++++
> >  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |   72 ++
> >  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  294 ++++++
> >  drivers/media/platform/mtk-mdp/mtk_mdp_core.h |  260 +++++
> >  drivers/media/platform/mtk-mdp/mtk_mdp_ipi.h  |  126 +++
> >  drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  | 1270 +++++++++++++++++++++++++
> >  drivers/media/platform/mtk-mdp/mtk_mdp_m2m.h  |   22 +
> >  drivers/media/platform/mtk-mdp/mtk_mdp_regs.c |  152 +++
> >  drivers/media/platform/mtk-mdp/mtk_mdp_regs.h |   31 +
> >  drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c  |  145 +++
> >  drivers/media/platform/mtk-mdp/mtk_mdp_vpu.h  |   41 +
> >  14 files changed, 2600 insertions(+)
> >  create mode 100644 drivers/media/platform/mtk-mdp/Makefile
> >  create mode 100644 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> >  create mode 100644 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> >  create mode 100644 drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> >  create mode 100644 drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> >  create mode 100644 drivers/media/platform/mtk-mdp/mtk_mdp_ipi.h
> >  create mode 100644 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> >  create mode 100644 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.h
> >  create mode 100644 drivers/media/platform/mtk-mdp/mtk_mdp_regs.c
> >  create mode 100644 drivers/media/platform/mtk-mdp/mtk_mdp_regs.h
> >  create mode 100644 drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c
> >  create mode 100644 drivers/media/platform/mtk-mdp/mtk_mdp_vpu.h
> > 
> 
> <snip>
> 
> > +static inline bool mtk_mdp_is_target_compose(u32 target)
> > +{
> > +	if (target == V4L2_SEL_TGT_COMPOSE_DEFAULT
> > +	    || target == V4L2_SEL_TGT_COMPOSE_BOUNDS
> > +	    || target == V4L2_SEL_TGT_COMPOSE)
> > +		return true;
> > +	return false;
> > +}
> > +
> > +static inline bool mtk_mdp_is_target_crop(u32 target)
> > +{
> > +	if (target == V4L2_SEL_TGT_CROP_DEFAULT
> > +	    || target == V4L2_SEL_TGT_CROP_BOUNDS
> > +	    || target == V4L2_SEL_TGT_CROP)
> > +		return true;
> > +	return false;
> > +}
> > +
> > +static int mtk_mdp_m2m_g_selection(struct file *file, void *fh,
> > +				       struct v4l2_selection *s)
> > +{
> > +	struct mtk_mdp_frame *frame;
> > +	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
> > +	bool valid = false;
> > +
> > +	if (s->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> > +		if (mtk_mdp_is_target_compose(s->target))
> > +			valid = true;
> > +	} else if (s->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
> > +		if (mtk_mdp_is_target_crop(s->target))
> > +			valid = true;
> > +	}
> > +	if (!valid) {
> > +		mtk_mdp_dbg(1, "[%d] invalid type:%d,%u", ctx->id, s->type,
> > +			    s->target);
> > +		return -EINVAL;
> > +	}
> > +
> > +	frame = mtk_mdp_ctx_get_frame(ctx, s->type);
> > +
> > +	switch (s->target) {
> > +	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> > +	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > +		s->r.left = 0;
> > +		s->r.top = 0;
> > +		s->r.width = frame->width;
> > +		s->r.height = frame->height;
> > +		return 0;
> > +
> > +	case V4L2_SEL_TGT_COMPOSE:
> > +	case V4L2_SEL_TGT_CROP:
> > +		s->r.left = frame->crop.left;
> > +		s->r.top = frame->crop.top;
> > +		s->r.width = frame->crop.width;
> > +		s->r.height = frame->crop.height;
> > +		return 0;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +static int mtk_mdp_check_scaler_ratio(struct mtk_mdp_variant *var, int src_w,
> > +				      int src_h, int dst_w, int dst_h, int rot)
> > +{
> > +	int tmp_w, tmp_h;
> > +
> > +	if (rot == 90 || rot == 270) {
> > +		tmp_w = dst_h;
> > +		tmp_h = dst_w;
> > +	} else {
> > +		tmp_w = dst_w;
> > +		tmp_h = dst_h;
> > +	}
> > +
> > +	if ((src_w / tmp_w) > var->h_scale_down_max ||
> > +	    (src_h / tmp_h) > var->v_scale_down_max ||
> > +	    (tmp_w / src_w) > var->h_scale_up_max ||
> > +	    (tmp_h / src_h) > var->v_scale_up_max)
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_mdp_m2m_s_selection(struct file *file, void *fh,
> > +				   struct v4l2_selection *s)
> > +{
> > +	struct mtk_mdp_frame *frame;
> > +	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
> > +	struct v4l2_rect new_r;
> > +	struct mtk_mdp_variant *variant = ctx->mdp_dev->variant;
> > +	int ret;
> > +	bool valid = false;
> > +
> > +	if (s->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> > +		if (mtk_mdp_is_target_compose(s->target))
> > +			valid = true;
> > +	} else if (s->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
> > +		if (mtk_mdp_is_target_crop(s->target))
> > +			valid = true;
> > +	}
> 
> These tests are wrong: you can't set the _DEFAULT and _BOUNDS targets.
> Those are read-only. It's easiest to just explicitly check for _CROP or
> _COMPOSE here.
> 
> I've added a check to v4l2-compliance to test for this.
> 

I will fix it in v6 and test with the latest v4l2-compliance. Thanks.


> > +	if (!valid) {
> > +		mtk_mdp_dbg(1, "[%d] invalid type:%d,%u", ctx->id, s->type,
> > +			    s->target);
> > +		return -EINVAL;
> > +	}
> > +
> > +	new_r = s->r;
> > +	ret = mtk_mdp_try_crop(ctx, s->type, &new_r);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (mtk_mdp_is_target_crop(s->target))
> > +		frame = &ctx->s_frame;
> > +	else
> > +		frame = &ctx->d_frame;
> > +
> > +	/* Check to see if scaling ratio is within supported range */
> > +	if (mtk_mdp_ctx_state_is_set(ctx, MTK_MDP_DST_FMT | MTK_MDP_SRC_FMT)) {
> > +		if (V4L2_TYPE_IS_OUTPUT(s->type)) {
> > +			ret = mtk_mdp_check_scaler_ratio(variant, new_r.width,
> > +				new_r.height, ctx->d_frame.crop.width,
> > +				ctx->d_frame.crop.height,
> > +				ctx->ctrls.rotate->val);
> > +		} else {
> > +			ret = mtk_mdp_check_scaler_ratio(variant,
> > +				ctx->s_frame.crop.width,
> > +				ctx->s_frame.crop.height, new_r.width,
> > +				new_r.height, ctx->ctrls.rotate->val);
> > +		}
> > +
> > +		if (ret) {
> > +			dev_info(&ctx->mdp_dev->pdev->dev,
> > +				"Out of scaler range");
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	s->r = new_r;
> > +	frame->crop = new_r;
> > +
> > +	return 0;
> > +}
> 
> 
> Regards,
> 
> 	Hans


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
