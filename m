Return-Path: <SRS0=iARg=PP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37577 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728076AbfAGOJm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 7 Jan 2019 09:09:42 -0500
MIME-Version: 1.0
References: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
 <1545498774-11754-10-git-send-email-akinobu.mita@gmail.com> <20190107112742.grz2nvaqmcufoblk@kekkonen.localdomain>
In-Reply-To: <20190107112742.grz2nvaqmcufoblk@kekkonen.localdomain>
From: Akinobu Mita <akinobu.mita@gmail.com>
Date: Mon, 7 Jan 2019 23:09:30 +0900
Message-ID: <CAC5umyjoKLOMK_kYovzgkmrzVCwzCj2Yv28p65TTZjBmiE+TGw@mail.gmail.com>
Subject: Re: [PATCH 09/12] media: mt9m001: register to V4L2 asynchronous
 subdevice framework
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Mauro Carvalho Chehab <mchehab@s-opensource.com>
List-ID: <devicetree@vger.kernel.org>

2019=E5=B9=B41=E6=9C=887=E6=97=A5(=E6=9C=88) 20:27 Sakari Ailus <sakari.ail=
us@linux.intel.com>:
>
> Hi Mita-san,
>
> On Sun, Dec 23, 2018 at 02:12:51AM +0900, Akinobu Mita wrote:
> > Register a sub-device to the asynchronous subdevice framework, and also
> > create subdevice device node.
> >
> > Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> > Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> > ---
> >  drivers/media/i2c/Kconfig   | 2 +-
> >  drivers/media/i2c/mt9m001.c | 9 ++++++++-
> >  2 files changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 5e30ad3..a6d8416 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -845,7 +845,7 @@ config VIDEO_VS6624
> >
> >  config VIDEO_MT9M001
> >       tristate "mt9m001 support"
> > -     depends on I2C && VIDEO_V4L2
> > +     depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
>
> VIDEO_V4L2_SUBDEV_API depends on MEDIA_CONTROLLER, so MEDIA_CONTROLLER
> below can be removed.

OK.

> >       depends on MEDIA_CAMERA_SUPPORT
> >       depends on MEDIA_CONTROLLER
> >       help
> > diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> > index e31fb7d..b4deec3 100644
> > --- a/drivers/media/i2c/mt9m001.c
> > +++ b/drivers/media/i2c/mt9m001.c
> > @@ -716,6 +716,7 @@ static int mt9m001_probe(struct i2c_client *client,
> >               return PTR_ERR(mt9m001->reset_gpio);
> >
> >       v4l2_i2c_subdev_init(&mt9m001->subdev, client, &mt9m001_subdev_op=
s);
> > +     mt9m001->subdev.flags =3D V4L2_SUBDEV_FL_HAS_DEVNODE;
>
> |=3D
>
> Otherwise you lose flags set by v4l2_i2c_subdev_init().

Oops.  Thanks for spotting.
