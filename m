From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [Patch 02/16] media: ti-vpe: vpe: Add missing null pointer checks
Date: Mon, 30 Sep 2019 10:58:26 -0500
Message-ID: <20190930155826.pimkap75k67mji3e@ti.com>
References: <20190927183650.31345-1-bparrot@ti.com>
 <20190927183650.31345-3-bparrot@ti.com>
 <CAOoBcBUd7reG=-WOq+Vq9SynZMJ81CWFZPN35MkmaQvquZ9xyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOoBcBUd7reG=-WOq+Vq9SynZMJ81CWFZPN35MkmaQvquZ9xyg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Austin Kim <austinkernel.kim@gmail.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Austin,

Thanks for the review,

Austin Kim <austinkernel.kim@gmail.com> wrote on Sun [2019-Sep-29 09:08:37 +0900]:
> 2019년 9월 28일 (토) 오전 3:37, Benoit Parrot <bparrot@ti.com>님이 작성:
> >
> > A few NULL pointer checks were missing.
> > Add check with appropriate return code.
> >
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/platform/ti-vpe/vpe.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
> > index 5ba72445584d..56f60dbea15c 100644
> > --- a/drivers/media/platform/ti-vpe/vpe.c
> > +++ b/drivers/media/platform/ti-vpe/vpe.c
> > @@ -1537,6 +1537,8 @@ static int vpe_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
> >                 return -EINVAL;
> >
> >         q_data = get_q_data(ctx, f->type);
> > +       if (!q_data)
> > +               return -EINVAL;
> 
> With this commit, it seems that 'Null Pointer Dereference' could be
> avoidable even though 'get_q_data(ctx, f->type);' returns NULL.
> 
> * Original Code:
>         q_data = get_q_data(ctx, f->type);
>         // q_data = NULL;
> 
>         pix->width = q_data->width;
>         // pix->width =  (NULL)->width;
>         // In this case, data abort would be raised.

Yes I know this that is why the NULL check were added.

You mentionned earlier that the NULL pointer dereference could be
avoidable, but based on your comment I fail to see what you mean.

Please also note that this patch was a result of static analysis software
(klocwork) warnings.

Benoit

> 
> >
> >         pix->width = q_data->width;
> >         pix->height = q_data->height;
> > @@ -2001,6 +2003,8 @@ static int vpe_queue_setup(struct vb2_queue *vq,
> >         struct vpe_q_data *q_data;
> >
> >         q_data = get_q_data(ctx, vq->type);
> > +       if (!q_data)
> > +               return -EINVAL;
> >
> >         *nplanes = q_data->nplanes;
> >
> > @@ -2025,6 +2029,8 @@ static int vpe_buf_prepare(struct vb2_buffer *vb)
> >         vpe_dbg(ctx->dev, "type: %d\n", vb->vb2_queue->type);
> >
> >         q_data = get_q_data(ctx, vb->vb2_queue->type);
> > +       if (!q_data)
> > +               return -EINVAL;
> >         num_planes = q_data->nplanes;
> >
> >         if (vb->vb2_queue->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> > @@ -2481,7 +2487,12 @@ static int vpe_probe(struct platform_device *pdev)
> >         mutex_init(&dev->dev_mutex);
> >
> >         dev->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > -                       "vpe_top");
> > +                                               "vpe_top");
> > +       if (!dev->res) {
> > +               dev_err(&pdev->dev, "missing 'vpe_top' resources data\n");
> > +               return -ENODEV;
> > +       }
> > +
> >         /*
> >          * HACK: we get resource info from device tree in the form of a list of
> >          * VPE sub blocks, the driver currently uses only the base of vpe_top
> > --
> > 2.17.1
> >
