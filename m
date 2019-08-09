Return-Path: <SRS0=2AmA=WF=pengutronix.de=mfe@kernel.org>
Date: Fri, 9 Aug 2019 07:39:44 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v6 09/13] media: tvp5150: add s_power callback
Message-ID: <20190809053944.w72k2igvjzawvr5q@pengutronix.de>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-10-m.felsch@pengutronix.de>
 <20190514171340.444ce55b@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514171340.444ce55b@coco.lan>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi Mauro,

On 19-05-14 17:13, Mauro Carvalho Chehab wrote:
> Em Mon, 15 Apr 2019 14:44:09 +0200
> Marco Felsch <m.felsch@pengutronix.de> escreveu:
> 
> > Don't en-/disable the interrupts during s_stream because someone can
> > disable the stream but wants to get informed if the stream is locked
> > again. So keep the interrupts enabled the whole time the pipeline is
> > opened.
> 
> Not testing on any tvp5150 hardware, looks ok to me.

Means I get your Reviewed-by? :)

Regards,
  Marco

> 
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/media/i2c/tvp5150.c | 23 +++++++++++++++++------
> >  1 file changed, 17 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> > index 305a5e256b31..cd54715eb641 100644
> > --- a/drivers/media/i2c/tvp5150.c
> > +++ b/drivers/media/i2c/tvp5150.c
> > @@ -1370,11 +1370,26 @@ static const struct media_entity_operations tvp5150_sd_media_ops = {
> >  /****************************************************************************
> >  			I2C Command
> >   ****************************************************************************/
> > +static int tvp5150_s_power(struct  v4l2_subdev *sd, int on)
> > +{
> > +	struct tvp5150 *decoder = to_tvp5150(sd);
> > +	unsigned int val = 0;
> > +
> > +	if (on)
> > +		val = TVP5150_INT_A_LOCK;
> > +
> > +	if (decoder->irq)
> > +		/* Enable / Disable lock interrupt */
> > +		regmap_update_bits(decoder->regmap, TVP5150_INT_ENABLE_REG_A,
> > +				   TVP5150_INT_A_LOCK, val);
> > +
> > +	return 0;
> > +}
> >  
> >  static int tvp5150_s_stream(struct v4l2_subdev *sd, int enable)
> >  {
> >  	struct tvp5150 *decoder = to_tvp5150(sd);
> > -	unsigned int mask, val = 0, int_val = 0;
> > +	unsigned int mask, val = 0;
> >  
> >  	mask = TVP5150_MISC_CTL_YCBCR_OE | TVP5150_MISC_CTL_SYNC_OE |
> >  	       TVP5150_MISC_CTL_CLOCK_OE;
> > @@ -1387,15 +1402,10 @@ static int tvp5150_s_stream(struct v4l2_subdev *sd, int enable)
> >  			val = decoder->lock ? decoder->oe : 0;
> >  		else
> >  			val = decoder->oe;
> > -		int_val = TVP5150_INT_A_LOCK;
> >  		v4l2_subdev_notify_event(&decoder->sd, &tvp5150_ev_fmt);
> >  	}
> >  
> >  	regmap_update_bits(decoder->regmap, TVP5150_MISC_CTL, mask, val);
> > -	if (decoder->irq)
> > -		/* Enable / Disable lock interrupt */
> > -		regmap_update_bits(decoder->regmap, TVP5150_INT_ENABLE_REG_A,
> > -				   TVP5150_INT_A_LOCK, int_val);
> >  
> >  	return 0;
> >  }
> > @@ -1586,6 +1596,7 @@ static const struct v4l2_subdev_core_ops tvp5150_core_ops = {
> >  	.g_register = tvp5150_g_register,
> >  	.s_register = tvp5150_s_register,
> >  #endif
> > +	.s_power = tvp5150_s_power,
> >  };
> >  
> >  static const struct v4l2_subdev_tuner_ops tvp5150_tuner_ops = {
> 
> 
> 
> Thanks,
> Mauro
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
