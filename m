From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [Patch 1/3] media: ov5640: add PIXEL_RATE control
Date: Tue, 1 Oct 2019 11:23:41 -0500
Message-ID: <20191001162341.f2o7ruar2nifl5ws@ti.com>
References: <20190925152301.21645-1-bparrot@ti.com>
 <20190925152301.21645-2-bparrot@ti.com>
 <20191001075704.GA5449@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191001075704.GA5449@paasikivi.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sakari,

Thanks for the review.

Sakari Ailus <sakari.ailus@linux.intel.com> wrote on Tue [2019-Oct-01 10:57:04 +0300]:
> Hi Benoit,
> 
> On Wed, Sep 25, 2019 at 10:22:59AM -0500, Benoit Parrot wrote:
> > Add v4l2 controls to report the pixel rates of each mode. This is
> > needed by some CSI2 receiver in order to perform proper DPHY
> > configuration.
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/i2c/ov5640.c | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 500d9bbff10b..c2a44f30d56e 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -193,6 +193,9 @@ struct ov5640_mode_info {
> >  
> >  struct ov5640_ctrls {
> >  	struct v4l2_ctrl_handler handler;
> > +	struct {
> > +		struct v4l2_ctrl *pixel_rate;
> > +	};
> >  	struct {
> >  		struct v4l2_ctrl *auto_exp;
> >  		struct v4l2_ctrl *exposure;
> > @@ -241,6 +244,7 @@ struct ov5640_dev {
> >  	const struct ov5640_mode_info *last_mode;
> >  	enum ov5640_frame_rate current_fr;
> >  	struct v4l2_fract frame_interval;
> > +	u64 pixel_rate;
> >  
> >  	struct ov5640_ctrls ctrls;
> >  
> > @@ -2202,6 +2206,7 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
> >  	const struct ov5640_mode_info *new_mode;
> >  	struct v4l2_mbus_framefmt *mbus_fmt = &format->format;
> >  	struct v4l2_mbus_framefmt *fmt;
> > +	u64 rate;
> >  	int ret;
> >  
> >  	if (format->pad != 0)
> > @@ -2233,6 +2238,12 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
> >  	if (mbus_fmt->code != sensor->fmt.code)
> >  		sensor->pending_fmt_change = true;
> >  
> > +	rate = sensor->current_mode->vtot * sensor->current_mode->htot;
> > +	rate *= ov5640_framerates[sensor->current_fr];
> > +	sensor->pixel_rate = rate;
> > +
> > +	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> > +				 sensor->pixel_rate);
> >  out:
> >  	mutex_unlock(&sensor->lock);
> >  	return ret;
> > @@ -2657,6 +2668,13 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> >  	/* we can use our own mutex for the ctrl lock */
> >  	hdl->lock = &sensor->lock;
> >  
> > +	/* Clock related controls */
> > +	ctrls->pixel_rate =
> > +		v4l2_ctrl_new_std(hdl, ops,
> > +				  V4L2_CID_PIXEL_RATE, 0, INT_MAX, 1,
> > +				  55969920);
> 
> Could you calculate this value instead of using a seemingly random number?

Yes I guess I could, especially if I make a helper function for it :).

> 
> > +	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> >  	/* Auto/manual white balance */
> >  	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
> >  					   V4L2_CID_AUTO_WHITE_BALANCE,
> > @@ -2782,6 +2800,7 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
> >  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> >  	const struct ov5640_mode_info *mode;
> >  	int frame_rate, ret = 0;
> > +	u64 rate;
> >  
> >  	if (fi->pad != 0)
> >  		return -EINVAL;
> > @@ -2816,6 +2835,12 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
> >  		sensor->frame_interval = fi->interval;
> >  		sensor->current_mode = mode;
> >  		sensor->pending_mode_change = true;
> > +
> > +		rate = sensor->current_mode->vtot * sensor->current_mode->htot;
> > +		rate *= ov5640_framerates[sensor->current_fr];
> > +		sensor->pixel_rate = rate;
> 
> I think it'd be better to have a function to calculate the value instead of
> duplicating the code here.

Yes I'll create a helper function.

Benoit

> 
> > +		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> > +					 sensor->pixel_rate);
> >  	}
> >  out:
> >  	mutex_unlock(&sensor->lock);
> 
> -- 
> Kind regards,
> 
> Sakari Ailus
> sakari.ailus@linux.intel.com
