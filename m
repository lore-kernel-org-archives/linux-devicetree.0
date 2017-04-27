From: houlong wei <houlong.wei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] [media] mtk-mdp: Fix g_/s_selection capture/compose
 logic
Date: Thu, 27 Apr 2017 14:11:52 +0800
Message-ID: <1493273512.8340.4.camel@mhfsdcap03>
References: <1492057130-1194-1-git-send-email-minghsiu.tsai@mediatek.com>
         <CAOMLVLiLkZsBfezx6b9Xq=kyPjUZOXwHC4LfHh1=wy6Ynt=zSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMLVLiLkZsBfezx6b9Xq=kyPjUZOXwHC4LfHh1=wy6Ynt=zSQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wu-Cheng Li =?UTF-8?Q?=28=E6=9D=8E=E5=8B=99=E8=AA=A0=29?= <wuchengli-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-04-13 at 14:50 +0800, Wu-Cheng Li (李務誠) wrote:
> Reviewed-by: Wu-Cheng Li <wuchengli-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> On Thu, Apr 13, 2017 at 12:18 PM, Minghsiu Tsai
> <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >
> > Experiments show that the:
> >  (1) mtk-mdp uses the _MPLANE form of CAPTURE/OUTPUT
> >  (2) CAPTURE types use CROP targets, and OUTPUT types use COMPOSE targets
> >
> > Signed-off-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Signed-off-by: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Acked-by:Houlong Wei <houlong.wei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >
> > ---
> >  drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> > index 13afe48..8ab7ca0 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> > @@ -837,12 +837,12 @@ static int mtk_mdp_m2m_g_selection(struct file *file, void *fh,
> >         struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
> >         bool valid = false;
> >
> > -       if (s->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> > -               if (mtk_mdp_is_target_compose(s->target))
> > -                       valid = true;
> > -       } else if (s->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
> > +       if (s->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> >                 if (mtk_mdp_is_target_crop(s->target))
> >                         valid = true;
> > +       } else if (s->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> > +               if (mtk_mdp_is_target_compose(s->target))
> > +                       valid = true;
> >         }
> >         if (!valid) {
> >                 mtk_mdp_dbg(1, "[%d] invalid type:%d,%u", ctx->id, s->type,
> > @@ -907,12 +907,12 @@ static int mtk_mdp_m2m_s_selection(struct file *file, void *fh,
> >         int ret;
> >         bool valid = false;
> >
> > -       if (s->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> > -               if (s->target == V4L2_SEL_TGT_COMPOSE)
> > -                       valid = true;
> > -       } else if (s->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
> > +       if (s->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> >                 if (s->target == V4L2_SEL_TGT_CROP)
> >                         valid = true;
> > +       } else if (s->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> > +               if (s->target == V4L2_SEL_TGT_COMPOSE)
> > +                       valid = true;
> >         }
> >         if (!valid) {
> >                 mtk_mdp_dbg(1, "[%d] invalid type:%d,%u", ctx->id, s->type,
> > @@ -925,7 +925,7 @@ static int mtk_mdp_m2m_s_selection(struct file *file, void *fh,
> >         if (ret)
> >                 return ret;
> >
> > -       if (mtk_mdp_is_target_crop(s->target))
> > +       if (mtk_mdp_is_target_compose(s->target))
> >                 frame = &ctx->s_frame;
> >         else
> >                 frame = &ctx->d_frame;
> > --
> > 1.9.1
> >


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
