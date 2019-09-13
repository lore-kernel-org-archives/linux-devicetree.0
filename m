From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [Patch 12/13] media: am437x-vpfe: Remove per bus width static
 data
Date: Fri, 13 Sep 2019 08:34:28 -0500
Message-ID: <20190913133428.kavc3dewxhqhmwyj@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
 <20190909162743.30114-13-bparrot@ti.com>
 <add3cb62-1391-f8e3-15f3-f1345e18da47@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <add3cb62-1391-f8e3-15f3-f1345e18da47@xs4all.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hans Verkuil <hverkuil@xs4all.nl> wrote on Fri [2019-Sep-13 15:19:52 +0200]:
> On 9/9/19 6:27 PM, Benoit Parrot wrote:
> > The bus related static data include in the vpfe_fmt
> > static table can be derived dynamically instead.
> > This simplify the table and it's use.
> 
> simplify -> simplifies
> it's -> its
> 
> > 
> > We instead replace the per bus data info with just
> > the usual bit per pixel value for each supported
> 
> bit -> bits

I'll fix all of those, thanks...
It's a shame vi ":set spell" does not help trying to figure out what we
meant to say :)

> 
> > pixel format.
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/platform/am437x/am437x-vpfe.c | 56 ++++++---------------
> >  drivers/media/platform/am437x/am437x-vpfe.h | 16 +-----
> >  2 files changed, 16 insertions(+), 56 deletions(-)
> > 
> > diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> > index 9759ed398943..9855d4cb1d13 100644
> > --- a/drivers/media/platform/am437x/am437x-vpfe.c
> > +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> > @@ -73,73 +73,43 @@ static struct vpfe_fmt formats[] = {
> >  	{
> >  		.fourcc		= V4L2_PIX_FMT_YUYV,
> >  		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
> > -		.l.width	= 10,
> > -		.l.bpp		= 4,
> > -		.s.width	= 8,
> > -		.s.bpp		= 2,
> > +		.bitsperpixel	= 16,
> >  	}, {
> >  		.fourcc		= V4L2_PIX_FMT_UYVY,
> >  		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
> > -		.l.width	= 10,
> > -		.l.bpp		= 4,
> > -		.s.width	= 8,
> > -		.s.bpp		= 2,
> > +		.bitsperpixel	= 16,
> >  	}, {
> >  		.fourcc		= V4L2_PIX_FMT_YVYU,
> >  		.code		= MEDIA_BUS_FMT_YVYU8_2X8,
> > -		.l.width	= 10,
> > -		.l.bpp		= 4,
> > -		.s.width	= 8,
> > -		.s.bpp		= 2,
> > +		.bitsperpixel	= 16,
> >  	}, {
> >  		.fourcc		= V4L2_PIX_FMT_VYUY,
> >  		.code		= MEDIA_BUS_FMT_VYUY8_2X8,
> > -		.l.width	= 10,
> > -		.l.bpp		= 4,
> > -		.s.width	= 8,
> > -		.s.bpp		= 2,
> > +		.bitsperpixel	= 16,
> >  	}, {
> >  		.fourcc		= V4L2_PIX_FMT_SBGGR8,
> >  		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
> > -		.l.width	= 10,
> > -		.l.bpp		= 2,
> > -		.s.width	= 8,
> > -		.s.bpp		= 1,
> > +		.bitsperpixel	= 8,
> >  	}, {
> >  		.fourcc		= V4L2_PIX_FMT_SGBRG8,
> >  		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
> > -		.l.width	= 10,
> > -		.l.bpp		= 2,
> > -		.s.width	= 8,
> > -		.s.bpp		= 1,
> > +		.bitsperpixel	= 8,
> >  	}, {
> >  		.fourcc		= V4L2_PIX_FMT_SGRBG8,
> >  		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
> > -		.l.width	= 10,
> > -		.l.bpp		= 2,
> > -		.s.width	= 8,
> > -		.s.bpp		= 1,
> > +		.bitsperpixel	= 8,
> >  	}, {
> >  		.fourcc		= V4L2_PIX_FMT_SRGGB8,
> >  		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
> > -		.l.width	= 10,
> > -		.l.bpp		= 2,
> > -		.s.width	= 8,
> > -		.s.bpp		= 1,
> > +		.bitsperpixel	= 8,
> >  	}, {
> >  		.fourcc		= V4L2_PIX_FMT_RGB565,
> >  		.code		= MEDIA_BUS_FMT_RGB565_2X8_LE,
> > -		.l.width	= 10,
> > -		.l.bpp		= 4,
> > -		.s.width	= 8,
> > -		.s.bpp		= 2,
> > +		.bitsperpixel	= 16,
> >  	}, {
> >  		.fourcc		= V4L2_PIX_FMT_RGB565X,
> >  		.code		= MEDIA_BUS_FMT_RGB565_2X8_BE,
> > -		.l.width	= 10,
> > -		.l.bpp		= 4,
> > -		.s.width	= 8,
> > -		.s.bpp		= 2,
> > +		.bitsperpixel	= 16,
> >  	},
> >  };
> >  
> > @@ -184,9 +154,11 @@ static unsigned int __get_bytesperpixel(struct vpfe_device *vpfe,
> >  {
> >  	struct vpfe_subdev_info *sdinfo = vpfe->current_subdev;
> >  	unsigned int bus_width = sdinfo->vpfe_param.bus_width;
> > -	u32 bpp;
> > +	u32 bpp, bus_width_bytes, clocksperpixel;
> >  
> > -	bpp = (bus_width == 10) ? fmt->l.bpp : fmt->s.bpp;
> > +	bus_width_bytes = ALIGN(bus_width, 8) >> 3;
> > +	clocksperpixel = DIV_ROUND_UP(fmt->bitsperpixel, bus_width);
> > +	bpp = clocksperpixel * bus_width_bytes;
> >  
> >  	return bpp;
> >  }
> > diff --git a/drivers/media/platform/am437x/am437x-vpfe.h b/drivers/media/platform/am437x/am437x-vpfe.h
> > index 0d10d2b4d7a2..2c9e89395bea 100644
> > --- a/drivers/media/platform/am437x/am437x-vpfe.h
> > +++ b/drivers/media/platform/am437x/am437x-vpfe.h
> > @@ -215,28 +215,16 @@ struct vpfe_ccdc {
> >  	u32 ccdc_ctx[VPFE_REG_END / sizeof(u32)];
> >  };
> >  
> > -/*
> > - * struct bus_format - VPFE bus format information
> > - * @width: Bits per pixel (when transferred over a bus)
> > - * @bpp: Bytes per pixel (when stored in memory)
> > - */
> > -struct bus_format {
> > -	unsigned int width;
> > -	unsigned int bpp;
> > -};
> > -
> >  /*
> >   * struct vpfe_fmt - VPFE media bus format information
> >   * @fourcc: V4L2 pixel format code
> >   * @code: V4L2 media bus format code
> > - * @l: 10 bit bus format info
> > - * @s: 8 bit bus format info
> > + * @bitsperpixel: Bits per pixel over the bus
> >   */
> >  struct vpfe_fmt {
> >  	u32 fourcc;
> >  	u32 code;
> > -	struct bus_format l;
> > -	struct bus_format s;
> > +	u32 bitsperpixel;
> >  };
> >  
> >  /*
> > 
> 
> Regards,
> 
> 	Hans
