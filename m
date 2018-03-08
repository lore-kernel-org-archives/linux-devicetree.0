Return-Path: <SRS0=+wwX=F6=gmail.com=keepcalm444@kernel.org>
Date: Thu, 8 Mar 2018 11:48:20 +1100
From: Simon Shields <simon@lineageos.org>
Subject: Re: [PATCH v2 2/2] leds: add Panasonic AN30259A support
Message-ID: <20180308004820.GA18019@lineageos.org>
References: <20180307004722.23524-1-simon@lineageos.org>
 <20180307004722.23524-3-simon@lineageos.org>
 <20180307220725.GC10438@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180307220725.GC10438@amd>
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Pavel,

On Wed, Mar 07, 2018 at 11:07:25PM +0100, Pavel Machek wrote:
> Hi!
> 
> > The datasheet is freely available:
> > https://www.alliedelec.com/m/d/a9d2b3ee87c2d1a535a41dd747b1c247.pdf
> 
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called leds-an30259a.
> 
> leds-an30259a.ko?

The vast majority of Kconfig options omit the .ko - a treewide grep
shows only 40 including the .ko.

> 
> > @@ -0,0 +1,382 @@
> > +// SPDX-License-Identifier: GPL-2.0
> 
> I'd prefer 2.0+, but... your choice.

I really don't mind.

> 
> > +/*
> > + * Driver for Panasonic AN30259A 3-channel LED driver
> > + *
> > + * Copyright (c) 2018 Simon Shields <simon@lineageos.org>
> > + *
> > + * Datasheet:
> > + * https://www.alliedelec.com/m/d/a9d2b3ee87c2d1a535a41dd747b1c247.pdf
> > + */
> > +#include <linux/i2c.h>
> > +#include <linux/leds.h>
> 
> I'd do empty line after the comment.
> 
> > +static u8 an30259a_get_dutymax(u8 brightness)
> > +{
> > +	u8 duty_max, floor, ceil;
> > +
> > +	/* squash 8 bit number into 7-bit PWM range */
> > +	duty_max = brightness >> 1;
> 
> We should really start using max_brightness, so that userspace knows
> what 

When outputting constant brightness, the IC supports 8-bit PWM.
For sloped output mode, it's limited to 7 bits, and the bottom 3 bits
are always set.

> 
> > +	/* bottom 3 bits are always set for DUTYMAX
> > +	 * figure out the closest value
> > +	 */
> 
> /*
>  * Multiline comments like this.
>  */
> 
Oops.
> > +	/* slope time controls on/off cycle length */
> > +	ret = regmap_write(led->chip->regmap, REG_SLOPE(num),
> > +			   LED_SLOPETIME1(off) | LED_SLOPETIME2(on));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Finally, enable slope mode. */
> 
> And yes, having sentences in all the comments would be nice. Or maybe
> nowhere. But consistent ;-).
> 
> Since all I'm commenting is whitespace...
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> 

Thanks for the review!

> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

Cheers,
Simon
