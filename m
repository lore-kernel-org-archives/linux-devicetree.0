From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [Patch v2 3/3] media: ov5640: Make 2592x1944 mode only available
 at 15 fps
Date: Thu, 3 Oct 2019 07:09:02 -0500
Message-ID: <20191003120902.wd3w2qmiry5bpa4h@ti.com>
References: <20191002135134.12273-1-bparrot@ti.com>
 <20191002135134.12273-4-bparrot@ti.com>
 <20191003073155.4sl3jkmobnm53tm2@uno.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191003073155.4sl3jkmobnm53tm2@uno.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jacopo Mondi <jacopo@jmondi.org> wrote on Thu [2019-Oct-03 09:31:55 +0200]:
> Hi Benoit,
> 
> On Wed, Oct 02, 2019 at 08:51:34AM -0500, Benoit Parrot wrote:
> > The sensor data sheet clearly state that 2592x1944 only works at 15 fps
> > make sure we don't try to miss configure the pll out of acceptable
> > range.
> 
> The datasheet clearly indicates that 15 fps is the maximum achievable
> rate with that resolution, so I guess preventing it from being set
> to anything faster than that it's acceptable.
> >
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/i2c/ov5640.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 103a4e8f88e1..d5b0be2c7a0a 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -1613,6 +1613,11 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
> >  	    !(mode->hact == 640 && mode->vact == 480))
> >  		return NULL;
> >
> > +	/* 2592x1944 only works at 15fps */
> > +	if (fr != OV5640_15_FPS &&
> 
> As long as 15 fps is the lower framerate declared in
> ov5640_framerates[] this is ok, but I would make this condition a
> check for "fr  > OV5640_15_FPS" so that it's safe for future
> extensions.
> 
> (And I would check for the resolution first then FPS, so you check
> the most unlikely condition first, but that's really a minor
> optimization).

Ah, very good I'll change that.

Benoit

> 
> With the above small details addressed
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> Thanks
>    j
> 
> > +	    (mode->hact == 2592 && mode->vact == 1944))
> > +		return NULL;
> > +
> >  	return mode;
> >  }
> >
> > --
> > 2.17.1
> >
