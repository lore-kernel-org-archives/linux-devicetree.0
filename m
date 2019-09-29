From: Austin Kim <austinkernel.kim@gmail.com>
Subject: Re: [Patch 02/16] media: ti-vpe: vpe: Add missing null pointer checks
Date: Sun, 29 Sep 2019 09:08:37 +0900
Message-ID: <CAOoBcBUd7reG=-WOq+Vq9SynZMJ81CWFZPN35MkmaQvquZ9xyg@mail.gmail.com>
References: <20190927183650.31345-1-bparrot@ti.com> <20190927183650.31345-3-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927183650.31345-3-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

2019=EB=85=84 9=EC=9B=94 28=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 3:37, B=
enoit Parrot <bparrot@ti.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> A few NULL pointer checks were missing.
> Add check with appropriate return code.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/platform/ti-vpe/vpe.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform=
/ti-vpe/vpe.c
> index 5ba72445584d..56f60dbea15c 100644
> --- a/drivers/media/platform/ti-vpe/vpe.c
> +++ b/drivers/media/platform/ti-vpe/vpe.c
> @@ -1537,6 +1537,8 @@ static int vpe_g_fmt(struct file *file, void *priv,=
 struct v4l2_format *f)
>                 return -EINVAL;
>
>         q_data =3D get_q_data(ctx, f->type);
> +       if (!q_data)
> +               return -EINVAL;

With this commit, it seems that 'Null Pointer Dereference' could be
avoidable even though 'get_q_data(ctx, f->type);' returns NULL.

* Original Code:
        q_data =3D get_q_data(ctx, f->type);
        // q_data =3D NULL;

        pix->width =3D q_data->width;
        // pix->width =3D  (NULL)->width;
        // In this case, data abort would be raised.

>
>         pix->width =3D q_data->width;
>         pix->height =3D q_data->height;
> @@ -2001,6 +2003,8 @@ static int vpe_queue_setup(struct vb2_queue *vq,
>         struct vpe_q_data *q_data;
>
>         q_data =3D get_q_data(ctx, vq->type);
> +       if (!q_data)
> +               return -EINVAL;
>
>         *nplanes =3D q_data->nplanes;
>
> @@ -2025,6 +2029,8 @@ static int vpe_buf_prepare(struct vb2_buffer *vb)
>         vpe_dbg(ctx->dev, "type: %d\n", vb->vb2_queue->type);
>
>         q_data =3D get_q_data(ctx, vb->vb2_queue->type);
> +       if (!q_data)
> +               return -EINVAL;
>         num_planes =3D q_data->nplanes;
>
>         if (vb->vb2_queue->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)=
 {
> @@ -2481,7 +2487,12 @@ static int vpe_probe(struct platform_device *pdev)
>         mutex_init(&dev->dev_mutex);
>
>         dev->res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -                       "vpe_top");
> +                                               "vpe_top");
> +       if (!dev->res) {
> +               dev_err(&pdev->dev, "missing 'vpe_top' resources data\n")=
;
> +               return -ENODEV;
> +       }
> +
>         /*
>          * HACK: we get resource info from device tree in the form of a l=
ist of
>          * VPE sub blocks, the driver currently uses only the base of vpe=
_top
> --
> 2.17.1
>
