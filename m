Return-Path: <SRS0=2AmA=WF=pengutronix.de=mfe@kernel.org>
Date: Fri, 9 Aug 2019 07:42:10 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v6 13/13] media: tvp5150: make debug output more readable
Message-ID: <20190809054210.bff35njzrdss3jrl@pengutronix.de>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-14-m.felsch@pengutronix.de>
 <20190506133905.gvdgrei5n6crbwxc@uno.localdomain>
 <20190514171845.0eafb6f8@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514171845.0eafb6f8@coco.lan>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jacopo Mondi <jacopo@jmondi.org>, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi Mauro,

On 19-05-14 17:18, Mauro Carvalho Chehab wrote:
> Em Mon, 6 May 2019 15:39:05 +0200
> Jacopo Mondi <jacopo@jmondi.org> escreveu:
> 
> > Hi Marco,
> >   thanks
> > 
> > Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> Looks ok to me too.

Same here, can I add your Reviewed-by tag too?

Regards,
  Marco

> > 
> > On Mon, Apr 15, 2019 at 02:44:13PM +0200, Marco Felsch wrote:
> > > The debug output for tvp5150_selmux() isn't really intuitive. Register
> > > values are printed decimal formatted and the input/output driver states
> > > are printed as enum. Even more the "normal" output enum mapps to zero so
> > > a active output will printing output=0 and a inactive output=1.
> > >
> > > Change this by brinting the register values hex formatted and the states
> > > as more readable string.
> > >
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  drivers/media/i2c/tvp5150.c | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> > > index c0ee08546643..13ee6d781efb 100644
> > > --- a/drivers/media/i2c/tvp5150.c
> > > +++ b/drivers/media/i2c/tvp5150.c
> > > @@ -302,9 +302,12 @@ static void tvp5150_selmux(struct v4l2_subdev *sd)
> > >  		break;
> > >  	}
> > >
> > > -	dev_dbg_lvl(sd->dev, 1, debug, "Selecting video route: route input=%i, output=%i => tvp5150 input=%i, opmode=%i\n",
> > > -			decoder->input, decoder->output,
> > > -			input, opmode);
> > > +	dev_dbg_lvl(sd->dev, 1, debug,
> > > +		    "Selecting video route: route input=%s, output=%s => tvp5150 input=0x%02x, opmode=0x%02x\n",
> > > +		    decoder->input == 0 ? "aip1a" :
> > > +		    decoder->input == 2 ? "aip1b" : "svideo",
> > > +		    decoder->output == 0 ? "normal" : "black-frame-gen",
> > > +		    input, opmode);
> > >
> > >  	regmap_write(decoder->regmap, TVP5150_OP_MODE_CTL, opmode);
> > >  	regmap_write(decoder->regmap, TVP5150_VD_IN_SRC_SEL_1, input);
> > > --
> > > 2.20.1
> > >  
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
