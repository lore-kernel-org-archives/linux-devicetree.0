Return-Path: <SRS0=iARg=PP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41174 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbfAGONr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 7 Jan 2019 09:13:47 -0500
MIME-Version: 1.0
References: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
 <1545498774-11754-8-git-send-email-akinobu.mita@gmail.com> <20190107112910.waj5sbjje7vobrof@kekkonen.localdomain>
In-Reply-To: <20190107112910.waj5sbjje7vobrof@kekkonen.localdomain>
From: Akinobu Mita <akinobu.mita@gmail.com>
Date: Mon, 7 Jan 2019 23:13:35 +0900
Message-ID: <CAC5umyhHe-56oOOPHDD=-e8bUvJ=HkyKM7HEbJjgkOKTwM=4TA@mail.gmail.com>
Subject: Re: [PATCH 07/12] media: mt9m001: remove remaining soc_camera
 specific code
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

2019=E5=B9=B41=E6=9C=887=E6=97=A5(=E6=9C=88) 20:29 Sakari Ailus <sakari.ail=
us@linux.intel.com>:
>
> Hi Mita-san,
>
> On Sun, Dec 23, 2018 at 02:12:49AM +0900, Akinobu Mita wrote:
> > Remove remaining soc_camera specific code and drop soc_camera dependenc=
y
> > from this driver.
> >
> > Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> > Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> > ---
> >  drivers/media/i2c/Kconfig   |  2 +-
> >  drivers/media/i2c/mt9m001.c | 84 ++++++++-----------------------------=
--------
> >  2 files changed, 15 insertions(+), 71 deletions(-)
> >
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 0efc038..4bdf043 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -845,7 +845,7 @@ config VIDEO_VS6624
> >
> >  config VIDEO_MT9M001
> >       tristate "mt9m001 support"
> > -     depends on SOC_CAMERA && I2C
> > +     depends on I2C && VIDEO_V4L2
> >       help
> >         This driver supports MT9M001 cameras from Micron, monochrome
> >         and colour models.
> > diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> > index f20188a..eb5c4ed 100644
> > --- a/drivers/media/i2c/mt9m001.c
> > +++ b/drivers/media/i2c/mt9m001.c
> > @@ -15,15 +15,12 @@
> >  #include <linux/log2.h>
> >  #include <linux/module.h>
> >
> > -#include <media/soc_camera.h>
> > -#include <media/drv-intf/soc_mediabus.h>
> >  #include <media/v4l2-subdev.h>
> >  #include <media/v4l2-ctrls.h>
>
> While at it, could you order the list alphabetically? The same applies to
> further patches changing included files.

OK.  I'll prepare another separate patch.
