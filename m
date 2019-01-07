Return-Path: <SRS0=iARg=PP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga12.intel.com ([192.55.52.136]:27230 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728364AbfAGOKK (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 7 Jan 2019 09:10:10 -0500
Date: Mon, 7 Jan 2019 16:10:03 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 06/12] media: mt9m001: switch s_power callback to runtime
 PM
Message-ID: <20190107141003.li4x37co2s4jk5xm@kekkonen.localdomain>
References: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
 <1545498774-11754-7-git-send-email-akinobu.mita@gmail.com>
 <20190107100034.po3jsnc3rdj37l4x@kekkonen.localdomain>
 <CAC5umyg0=JO2d_TbmGWp4OaiZWCiQEdx6RBwpOTNEd6Ug8MqLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC5umyg0=JO2d_TbmGWp4OaiZWCiQEdx6RBwpOTNEd6Ug8MqLg@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-media@vger.kernel.org, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Mita-san,

On Mon, Jan 07, 2019 at 11:07:18PM +0900, Akinobu Mita wrote:
> 2019年1月7日(月) 19:00 Sakari Ailus <sakari.ailus@linux.intel.com>:
> >
> > Hi Mita-san,
> >
> > Thanks for the patchset.
> >
> > On Sun, Dec 23, 2018 at 02:12:48AM +0900, Akinobu Mita wrote:
> > > Switch s_power() callback to runtime PM framework.  This also removes
> > > soc_camera specific power management code and introduces reset and standby
> > > gpios instead.
> > >
> > > Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> > > Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> > > ---
> > >  drivers/media/i2c/mt9m001.c | 242 ++++++++++++++++++++++++++++++++------------
> > >  1 file changed, 178 insertions(+), 64 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> > > index c0180fdc..f20188a 100644
> > > --- a/drivers/media/i2c/mt9m001.c
> > > +++ b/drivers/media/i2c/mt9m001.c
> > > @@ -5,6 +5,10 @@
> > >   * Copyright (C) 2008, Guennadi Liakhovetski <kernel@pengutronix.de>
> > >   */
> > >
> > > +#include <linux/clk.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/pm_runtime.h>
> > >  #include <linux/videodev2.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/i2c.h>
> > > @@ -13,7 +17,6 @@
> > >
> > >  #include <media/soc_camera.h>
> > >  #include <media/drv-intf/soc_mediabus.h>
> > > -#include <media/v4l2-clk.h>
> > >  #include <media/v4l2-subdev.h>
> > >  #include <media/v4l2-ctrls.h>
> > >
> > > @@ -92,8 +95,12 @@ struct mt9m001 {
> > >               struct v4l2_ctrl *autoexposure;
> > >               struct v4l2_ctrl *exposure;
> > >       };
> > > +     bool streaming;
> > > +     struct mutex mutex;
> > >       struct v4l2_rect rect;  /* Sensor window */
> > > -     struct v4l2_clk *clk;
> > > +     struct clk *clk;
> > > +     struct gpio_desc *standby_gpio;
> > > +     struct gpio_desc *reset_gpio;
> > >       const struct mt9m001_datafmt *fmt;
> > >       const struct mt9m001_datafmt *fmts;
> > >       int num_fmts;
> > > @@ -177,8 +184,7 @@ static int mt9m001_init(struct i2c_client *client)
> > >       return multi_reg_write(client, init_regs, ARRAY_SIZE(init_regs));
> > >  }
> > >
> > > -static int mt9m001_apply_selection(struct v4l2_subdev *sd,
> > > -                                 struct v4l2_rect *rect)
> > > +static int mt9m001_apply_selection(struct v4l2_subdev *sd)
> > >  {
> > >       struct i2c_client *client = v4l2_get_subdevdata(sd);
> > >       struct mt9m001 *mt9m001 = to_mt9m001(client);
> > > @@ -190,11 +196,11 @@ static int mt9m001_apply_selection(struct v4l2_subdev *sd,
> > >                * The caller provides a supported format, as verified per
> > >                * call to .set_fmt(FORMAT_TRY).
> > >                */
> > > -             { MT9M001_COLUMN_START, rect->left },
> > > -             { MT9M001_ROW_START, rect->top },
> > > -             { MT9M001_WINDOW_WIDTH, rect->width - 1 },
> > > +             { MT9M001_COLUMN_START, mt9m001->rect.left },
> > > +             { MT9M001_ROW_START, mt9m001->rect.top },
> > > +             { MT9M001_WINDOW_WIDTH, mt9m001->rect.width - 1 },
> > >               { MT9M001_WINDOW_HEIGHT,
> > > -                     rect->height + mt9m001->y_skip_top - 1 },
> > > +                     mt9m001->rect.height + mt9m001->y_skip_top - 1 },
> > >       };
> > >
> > >       return multi_reg_write(client, regs, ARRAY_SIZE(regs));
> > > @@ -203,11 +209,50 @@ static int mt9m001_apply_selection(struct v4l2_subdev *sd,
> > >  static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
> > >  {
> > >       struct i2c_client *client = v4l2_get_subdevdata(sd);
> > > +     struct mt9m001 *mt9m001 = to_mt9m001(client);
> > > +     int ret = 0;
> > >
> > > -     /* Switch to master "normal" mode or stop sensor readout */
> > > -     if (reg_write(client, MT9M001_OUTPUT_CONTROL, enable ? 2 : 0) < 0)
> > > -             return -EIO;
> > > -     return 0;
> > > +     mutex_lock(&mt9m001->mutex);
> > > +
> > > +     if (mt9m001->streaming == enable)
> > > +             goto done;
> > > +
> > > +     if (enable) {
> > > +             ret = pm_runtime_get_sync(&client->dev);
> > > +             if (ret < 0) {
> > > +                     pm_runtime_put_noidle(&client->dev);
> > > +                     goto done;
> >
> > How about adding another label for calling pm_runtime_put()? The error
> > handling is the same in all cases. You can also use pm_runtime_put()
> > instead of pm_runtime_put_noidle() here; there's no harm done.
> 
> There are two ways that I can think of.  Which one do you prefer?
> 
> (1)
> done:
>         mutex_unlock(&mt9m001->mutex);
> 
>         return 0;
> 
> enable_error:
>         pm_runtime_put(&client->dev);
>         mutex_unlock(&mt9m001->mutex);
> 
>         return ret;
> }
> 
> (2)
> done:
>         if (ret && enable)
>                pm_runtime_put(&client->dev);
> 
>         mutex_unlock(&mt9m001->mutex);
> 
>         return ret;
> }

I'd prefer the first; it's cleaner. I might call the new label e.g.
put_unlock as that describes what it does.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
