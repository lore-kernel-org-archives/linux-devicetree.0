Return-Path: <SRS0=iARg=PP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38367 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726746AbfAGOPn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 7 Jan 2019 09:15:43 -0500
MIME-Version: 1.0
References: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
 <1545498774-11754-12-git-send-email-akinobu.mita@gmail.com> <20190107113034.4zpxdqoc5xbkvkt7@kekkonen.localdomain>
In-Reply-To: <20190107113034.4zpxdqoc5xbkvkt7@kekkonen.localdomain>
From: Akinobu Mita <akinobu.mita@gmail.com>
Date: Mon, 7 Jan 2019 23:15:32 +0900
Message-ID: <CAC5umyg=PTpksfEXnGEmxsYZnM4Anw=71B7whc3LmaSD50Vu0A@mail.gmail.com>
Subject: Re: [PATCH 11/12] media: mt9m001: make VIDIOC_SUBDEV_G_FMT ioctl work
 with V4L2_SUBDEV_FORMAT_TRY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

2019=E5=B9=B41=E6=9C=887=E6=97=A5(=E6=9C=88) 20:30 Sakari Ailus <sakari.ail=
us@linux.intel.com>:
>
> Hi Mita-san,
>
> On Sun, Dec 23, 2018 at 02:12:53AM +0900, Akinobu Mita wrote:
> > The VIDIOC_SUBDEV_G_FMT ioctl for this driver doesn't recognize
> > V4L2_SUBDEV_FORMAT_TRY and always works as if V4L2_SUBDEV_FORMAT_ACTIVE
> > is specified.
> >
> > Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> > Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> > ---
> >  drivers/media/i2c/mt9m001.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> > index a5b94d7..f4afbc9 100644
> > --- a/drivers/media/i2c/mt9m001.c
> > +++ b/drivers/media/i2c/mt9m001.c
> > @@ -331,6 +331,12 @@ static int mt9m001_get_fmt(struct v4l2_subdev *sd,
> >       if (format->pad)
> >               return -EINVAL;
> >
> > +     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> > +             mf =3D v4l2_subdev_get_try_format(sd, cfg, 0);
> > +             format->format =3D *mf;
> > +             return 0;
> > +     }
> > +
> >       mf->width       =3D mt9m001->rect.width;
> >       mf->height      =3D mt9m001->rect.height;
> >       mf->code        =3D mt9m001->fmt->code;
> > @@ -638,6 +644,26 @@ static const struct v4l2_subdev_core_ops mt9m001_s=
ubdev_core_ops =3D {
> >  #endif
> >  };
> >
> > +static int mt9m001_init_cfg(struct v4l2_subdev *sd,
> > +                         struct v4l2_subdev_pad_config *cfg)
> > +{
> > +     struct i2c_client *client =3D v4l2_get_subdevdata(sd);
> > +     struct mt9m001 *mt9m001 =3D to_mt9m001(client);
> > +     struct v4l2_mbus_framefmt *try_fmt =3D
> > +             v4l2_subdev_get_try_format(sd, cfg, 0);
> > +
> > +     try_fmt->width          =3D mt9m001->rect.width;
> > +     try_fmt->height         =3D mt9m001->rect.height;
> > +     try_fmt->code           =3D mt9m001->fmt->code;
> > +     try_fmt->colorspace     =3D mt9m001->fmt->colorspace;
>
> The initial configuration set here should reflect the default, not curren=
t
> configuration. This appears to refer to the current one.

You are right.  I'll fix this.
