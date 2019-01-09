Return-Path: <SRS0=TUFM=PR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga12.intel.com ([192.55.52.136]:13755 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730338AbfAIOA1 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 9 Jan 2019 09:00:27 -0500
Date: Wed, 9 Jan 2019 16:00:24 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2 08/13] media: mt9m001: remove remaining soc_camera
 specific code
Message-ID: <20190109140024.jnubog5m2ekquaqo@paasikivi.fi.intel.com>
References: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com>
 <1546959110-19445-9-git-send-email-akinobu.mita@gmail.com>
 <CAC5umyhkAQdKY9PHiZR61UKUu8a8J2V4SrVZ0hu8LC3JeZQjeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC5umyhkAQdKY9PHiZR61UKUu8a8J2V4SrVZ0hu8LC3JeZQjeA@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-media@vger.kernel.org, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Mita-san,

On Wed, Jan 09, 2019 at 12:40:33AM +0900, Akinobu Mita wrote:
> 2019年1月8日(火) 23:52 Akinobu Mita <akinobu.mita@gmail.com>:
> >
> > Remove remaining soc_camera specific code and drop soc_camera dependency
> > from this driver.
> >
> > Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> > ---
> > * No changes from v1
> >
> >  drivers/media/i2c/Kconfig   |  2 +-
> >  drivers/media/i2c/mt9m001.c | 84 ++++++++-------------------------------------
> >  2 files changed, 15 insertions(+), 71 deletions(-)
> >
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index ee3ef1b..bc248d9 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -859,7 +859,7 @@ config VIDEO_VS6624
> >
> >  config VIDEO_MT9M001
> >         tristate "mt9m001 support"
> > -       depends on SOC_CAMERA && I2C
> > +       depends on I2C && VIDEO_V4L2
> >         help
> >           This driver supports MT9M001 cameras from Micron, monochrome
> >           and colour models.
> > diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> > index 1619c8c..0f5e3f9 100644
> > --- a/drivers/media/i2c/mt9m001.c
> > +++ b/drivers/media/i2c/mt9m001.c
> > @@ -15,15 +15,12 @@
> >  #include <linux/slab.h>
> >  #include <linux/videodev2.h>
> >
> > -#include <media/drv-intf/soc_mediabus.h>
> > -#include <media/soc_camera.h>
> >  #include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> >  #include <media/v4l2-subdev.h>
> >
> >  /*
> >   * mt9m001 i2c address 0x5d
> > - * The platform has to define struct i2c_board_info objects and link to them
> > - * from struct soc_camera_host_desc
> >   */
> >
> >  /* mt9m001 selected register addresses */
> > @@ -276,11 +273,15 @@ static int mt9m001_set_selection(struct v4l2_subdev *sd,
> >         rect.width = ALIGN(rect.width, 2);
> >         rect.left = ALIGN(rect.left, 2);
> >
> > -       soc_camera_limit_side(&rect.left, &rect.width,
> > -                    MT9M001_COLUMN_SKIP, MT9M001_MIN_WIDTH, MT9M001_MAX_WIDTH);
> > +       rect.width = clamp_t(u32, rect.width, MT9M001_MIN_WIDTH,
> > +                       MT9M001_MAX_WIDTH);
> > +       rect.left = clamp_t(u32, rect.left, MT9M001_COLUMN_SKIP,
> > +                       MT9M001_COLUMN_SKIP + MT9M001_MAX_WIDTH - rect.width);
> >
> > -       soc_camera_limit_side(&rect.top, &rect.height,
> > -                    MT9M001_ROW_SKIP, MT9M001_MIN_HEIGHT, MT9M001_MAX_HEIGHT);
> > +       rect.height = clamp_t(u32, rect.height, MT9M001_MIN_HEIGHT,
> > +                       MT9M001_MAX_HEIGHT);
> > +       rect.top = clamp_t(u32, rect.top, MT9M001_ROW_SKIP,
> > +                       MT9M001_ROW_SKIP + MT9M001_MAX_HEIGHT - rect.width);
> 
> Oops.  This line isn't correct. s/rect.width/rect.height/

Could you resend just that patch? The rest seems fine as-is, at least on a
quick glance. I'm also waiting for Rob's ack to the binding patch.

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
