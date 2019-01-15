From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH v3 02/14] media: ov7670: split register setting from
 set_framerate() logic
Date: Tue, 15 Jan 2019 09:30:31 +0100
Message-ID: <f6807e8ec5900b07bbaf6bb7e969b3da9be30f14.camel@v3.sk>
References: <20181120100318.367987-1-lkundrak@v3.sk>
         <20181120100318.367987-3-lkundrak@v3.sk>
         <20190114230307.h5poc22jfs32hly3@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190114230307.h5poc22jfs32hly3@valkosipuli.retiisi.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>, Libin Yang <lbyang@marvell.com>, Albert Wang <twang13@marvell.com>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-01-15 at 01:03 +0200, Sakari Ailus wrote:
> On Tue, Nov 20, 2018 at 11:03:07AM +0100, Lubomir Rintel wrote:
> > This will allow us to restore the last set frame rate after the device
> > returns from a power off.
> > 
> > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > 
> > ---
> > Changes since v2:
> > - This patch was added to the series
> > 
> >  drivers/media/i2c/ov7670.c | 30 ++++++++++++++----------------
> >  1 file changed, 14 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
> > index ee2302fbdeee..ead0c360df33 100644
> > --- a/drivers/media/i2c/ov7670.c
> > +++ b/drivers/media/i2c/ov7670.c
> > @@ -810,13 +810,24 @@ static void ov7675_get_framerate(struct v4l2_subdev *sd,
> >  			(4 * clkrc);
> >  }
> >  
> > +static int ov7675_apply_framerate(struct v4l2_subdev *sd)
> > +{
> > +	struct ov7670_info *info = to_state(sd);
> > +	int ret;
> > +
> > +	ret = ov7670_write(sd, REG_CLKRC, info->clkrc);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return ov7670_write(sd, REG_DBLV, info->pll_bypass ? DBLV_BYPASS : DBLV_X4);
> > +}
> > +
> >  static int ov7675_set_framerate(struct v4l2_subdev *sd,
> >  				 struct v4l2_fract *tpf)
> >  {
> >  	struct ov7670_info *info = to_state(sd);
> >  	u32 clkrc;
> >  	int pll_factor;
> > -	int ret;
> >  
> >  	/*
> >  	 * The formula is fps = 5/4*pixclk for YUV/RGB and
> > @@ -825,19 +836,10 @@ static int ov7675_set_framerate(struct v4l2_subdev *sd,
> >  	 * pixclk = clock_speed / (clkrc + 1) * PLLfactor
> >  	 *
> >  	 */
> > -	if (info->pll_bypass) {
> > -		pll_factor = 1;
> > -		ret = ov7670_write(sd, REG_DBLV, DBLV_BYPASS);
> > -	} else {
> > -		pll_factor = PLL_FACTOR;
> > -		ret = ov7670_write(sd, REG_DBLV, DBLV_X4);
> > -	}
> > -	if (ret < 0)
> > -		return ret;
> > -
> >  	if (tpf->numerator == 0 || tpf->denominator == 0) {
> >  		clkrc = 0;
> >  	} else {
> > +		pll_factor = info->pll_bypass ? 1 : PLL_FACTOR;
> >  		clkrc = (5 * pll_factor * info->clock_speed * tpf->numerator) /
> >  			(4 * tpf->denominator);
> >  		if (info->fmt->mbus_code == MEDIA_BUS_FMT_SBGGR8_1X8)
> > @@ -859,11 +861,7 @@ static int ov7675_set_framerate(struct v4l2_subdev *sd,
> >  	/* Recalculate frame rate */
> >  	ov7675_get_framerate(sd, tpf);
> >  
> > -	ret = ov7670_write(sd, REG_CLKRC, info->clkrc);
> > -	if (ret < 0)
> > -		return ret;
> > -
> > -	return ov7670_write(sd, REG_DBLV, DBLV_X4);
> > +	return ov7675_apply_framerate(sd);
> >  }
> >  
> >  static void ov7670_get_framerate_legacy(struct v4l2_subdev *sd,
> 
> Unfortunately this one no longer applies due to Jacopo's patch "v4l2: i2c:
> ov7670: Fix PLL bypass register values" in my tree. Could you resend it if
> you still think it's useful, please?
> 
> My tree is here:
> 
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/>
> 
> I've applied the rest there, with a trivial patch I'll send briefly.

Thank you.

It seems that you've accidentally attached the hunks of that patch to a
previous one though ("media: ov7670: split register setting from
set_fmt() logic"). There's just one conflicted line to resolve left.

I have a branch based on your tree that reverts the patch first and
then applies the two cleanly:

 git pull https://github.com/hackerspace/olpc-xo175-linux.git lr/ov7670

Feel free to pull, or, if you're fine with rebasing your tree, remove
the patch from your tree and then just pick the two.

Alternatively, if you prefer a patch by e-mail, please just let me know
when you've fixed things up in your tree.

Cheers
Lubo

> 
> Thanks.
> 
