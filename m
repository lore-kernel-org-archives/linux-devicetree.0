Return-Path: <SRS0=E8KO=RY=pengutronix.de=mfe@kernel.org>
Date: Thu, 21 Mar 2019 11:59:14 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v4 4/7] media: v4l2-subdev: add stubs for
 v4l2_subdev_get_try_*
Message-ID: <20190321105914.hqipftguy6p2v7wt@pengutronix.de>
References: <20190129160757.2314-1-m.felsch@pengutronix.de>
 <20190129160757.2314-5-m.felsch@pengutronix.de>
 <20190321100147.eqfnbw6jjatqvfvw@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190321100147.eqfnbw6jjatqvfvw@uno.localdomain>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, p.zabel@pengutronix.de, javierm@redhat.com, afshin.nasser@gmail.com, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi Jacopo,

On 19-03-21 11:01, Jacopo Mondi wrote:
> Hi Marco,
> 
> FYI we've been there already:
> https://patchwork.kernel.org/patch/10703029/
> 
> and that ended with Hans' patch:
> https://patchwork.linuxtv.org/patch/53370/
> which didn't get far unfortunately.

Thanks for this links :) It seems that there isn't a simple solution.

> On Tue, Jan 29, 2019 at 05:07:54PM +0100, Marco Felsch wrote:
> > In case of missing CONFIG_VIDEO_V4L2_SUBDEV_API those helpers aren't
> > available. So each driver have to add ifdefs around those helpers or
> > add the CONFIG_VIDEO_V4L2_SUBDEV_API as dependcy.
> >
> > Make these helpers available in case of CONFIG_VIDEO_V4L2_SUBDEV_API
> > isn't set to avoid ifdefs. This approach is less error prone too.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  include/media/v4l2-subdev.h | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 47af609dc8f1..90c9a301d72a 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -916,8 +916,6 @@ struct v4l2_subdev_fh {
> >  #define to_v4l2_subdev_fh(fh)	\
> >  	container_of(fh, struct v4l2_subdev_fh, vfh)
> >
> > -#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> > -
> >  /**
> >   * v4l2_subdev_get_try_format - ancillary routine to call
> >   *	&struct v4l2_subdev_pad_config->try_fmt
> > @@ -931,9 +929,13 @@ static inline struct v4l2_mbus_framefmt
> >  			    struct v4l2_subdev_pad_config *cfg,
> >  			    unsigned int pad)
> >  {
> > +#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> >  	if (WARN_ON(pad >= sd->entity.num_pads))
> >  		pad = 0;
> >  	return &cfg[pad].try_fmt;
> > +#else
> > +	return NULL;
> 
> Since Hans' attempt didn't succeed, maybe we want to reconsider this
> approach? I liked Lubomir's version better, but in any case, small
> details...
> 
> Shouldn't you return ERR_PTR(-ENOTTY) here instead of NULL ?

Yes that would be better.

> + Sakari, Hans:
> Alternatively, what if we add CONFIG_VIDEO_V4L2_SUBDEV_API as a
> dependency of all sensor drivers that still use the
> 
> #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
> v4l2_subdev_get_try_format(sd, cfg, format->pad);
> #else
> -ENOTTY
> #endif
> 
> pattern so we could remove that block #ifdef blocks and do not touch the
> v4l2-subdev.h header? Should I send a patch?

If I remember rightly the mt9v111 is using the dependency approach to
avoid such ifdef's too. But this seems like Hans approach if I got it
right which wasn't ok for Mauro.

Regards,
Marco

> Thanks
>   j
> 
> 
> > +#endif
> >  }
> >
> >  /**
> > @@ -949,9 +951,13 @@ static inline struct v4l2_rect
> >  			  struct v4l2_subdev_pad_config *cfg,
> >  			  unsigned int pad)
> >  {
> > +#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> >  	if (WARN_ON(pad >= sd->entity.num_pads))
> >  		pad = 0;
> >  	return &cfg[pad].try_crop;
> > +#else
> > +	return NULL;
> > +#endif
> >  }
> >
> >  /**
> > @@ -967,11 +973,14 @@ static inline struct v4l2_rect
> >  			     struct v4l2_subdev_pad_config *cfg,
> >  			     unsigned int pad)
> >  {
> > +#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> >  	if (WARN_ON(pad >= sd->entity.num_pads))
> >  		pad = 0;
> >  	return &cfg[pad].try_compose;
> > -}
> > +#else
> > +	return NULL;
> >  #endif
> > +}
> >
> >  extern const struct v4l2_file_operations v4l2_subdev_fops;
> >
> > --
> > 2.20.1
> >



-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
