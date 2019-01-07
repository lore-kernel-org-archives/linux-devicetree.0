Return-Path: <SRS0=iARg=PP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39669 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbfAGOS7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 7 Jan 2019 09:18:59 -0500
MIME-Version: 1.0
References: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
 <1545498774-11754-13-git-send-email-akinobu.mita@gmail.com> <20190107113243.dte4yqioqy33cwe5@kekkonen.localdomain>
In-Reply-To: <20190107113243.dte4yqioqy33cwe5@kekkonen.localdomain>
From: Akinobu Mita <akinobu.mita@gmail.com>
Date: Mon, 7 Jan 2019 23:18:47 +0900
Message-ID: <CAC5umyjrnxZ4FdGsmy9UZ5FSx16RQwDu2StRg67Kov=pxZrodw@mail.gmail.com>
Subject: Re: [PATCH 12/12] media: mt9m001: set all mbus format field when
 G_FMT and S_FMT ioctls
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

2019=E5=B9=B41=E6=9C=887=E6=97=A5(=E6=9C=88) 20:32 Sakari Ailus <sakari.ail=
us@linux.intel.com>:
>
> Hi Mita-san,
>
> On Sun, Dec 23, 2018 at 02:12:54AM +0900, Akinobu Mita wrote:
> > This driver doesn't set all members of mbus format field when the
> > VIDIOC_SUBDEV_{S,G}_FMT ioctls are called.
> >
> > This is detected by v4l2-compliance.
> >
> > Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> > Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> > ---
> >  drivers/media/i2c/mt9m001.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> > index f4afbc9..82b89d5 100644
> > --- a/drivers/media/i2c/mt9m001.c
> > +++ b/drivers/media/i2c/mt9m001.c
> > @@ -342,6 +342,9 @@ static int mt9m001_get_fmt(struct v4l2_subdev *sd,
> >       mf->code        =3D mt9m001->fmt->code;
> >       mf->colorspace  =3D mt9m001->fmt->colorspace;
> >       mf->field       =3D V4L2_FIELD_NONE;
> > +     mf->ycbcr_enc   =3D V4L2_YCBCR_ENC_DEFAULT;
> > +     mf->quantization =3D V4L2_QUANTIZATION_DEFAULT;
> > +     mf->xfer_func   =3D V4L2_XFER_FUNC_DEFAULT;
>
> Instead of setting the fields individually, would it be feasible to just
> assign mt9m001->fmt to mf?

The data type of mt9m001->fmt is struct mt9m001_datafmt, so it can't
simply assign to mf.
