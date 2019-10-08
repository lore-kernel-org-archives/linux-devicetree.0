From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [Patch v3 1/3] media: ov5640: add PIXEL_RATE control
Date: Tue, 8 Oct 2019 09:58:16 +0300
Message-ID: <20191008065816.GA24435@paasikivi.fi.intel.com>
References: <20191004172418.2339-1-bparrot@ti.com>
 <20191004172418.2339-2-bparrot@ti.com>
 <20191007080320.GG14917@paasikivi.fi.intel.com>
 <20191007151703.z3eejxuujzt5ruth@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191007151703.z3eejxuujzt5ruth@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 07, 2019 at 10:17:03AM -0500, Benoit Parrot wrote:
> Sakari Ailus <sakari.ailus@linux.intel.com> wrote on Mon [2019-Oct-07 11:03:20 +0300]:
> > On Fri, Oct 04, 2019 at 12:24:16PM -0500, Benoit Parrot wrote:
> > > @@ -2657,6 +2669,12 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> > >  	/* we can use our own mutex for the ctrl lock */
> > >  	hdl->lock = &sensor->lock;
> > >  
> > > +	/* Clock related controls */
> > > +	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE,
> > > +					      0, INT_MAX, 1,
> > > +					      ov5640_calc_pixel_rate(sensor));
> > > +	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > 
> > Please check ctrls->pixel_rate first; it may be NULL here.
> 
> How about I just move this line below "if (hdl->error)" instead?

That's fine, too. As long as it won't oops if memory allocation fails...
:-)

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
