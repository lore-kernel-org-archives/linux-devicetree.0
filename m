From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 3/5] media: sunxi: Add A10 CSI driver
Date: Wed, 6 Feb 2019 22:16:05 +0100
Message-ID: <20190206211605.27cq2lxuv3gtyyux@flea>
References: <cover.ba7411f0c7155d0292b38d3dec698e26b5cc813b.1548687041.git-series.maxime.ripard@bootlin.com>
 <c1a7d46f8504decb58ff224b0b5f2f0733282cc6.1548687041.git-series.maxime.ripard@bootlin.com>
 <20190129123949.qdmqnfaym3y42dvj@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190129123949.qdmqnfaym3y42dvj@paasikivi.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Sakari,

Thanks for your review, I have a few questions though, and the rest
will be addressed in the next version.

On Tue, Jan 29, 2019 at 02:39:49PM +0200, Sakari Ailus wrote:
> > +static int csi_notify_complete(struct v4l2_async_notifier *notifier)
> > +{
> > +	struct sun4i_csi *csi = container_of(notifier, struct sun4i_csi,
> > +					     notifier);
> > +	int ret;
> > +
> > +	ret = v4l2_device_register_subdev_nodes(&csi->v4l);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = sun4i_csi_v4l2_register(csi);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return media_create_pad_link(&csi->src_subdev->entity, csi->src_pad,
> > +				     &csi->vdev.entity, 0,
> > +				     MEDIA_LNK_FL_ENABLED |
> > +				     MEDIA_LNK_FL_IMMUTABLE);
> 
> This appears to create a link directly from the sensor entity to the video
> device entity. Is that intentional? I'd expect to see a CSI-2 receiver
> sub-device as well, which I don't see being created by the driver.
> 
> This is indeed a novel proposal. I have some concerns though.
> 
> The user doesn't have access to the configured media bus format (reflecting
> the format on the CSI-2 bus on receiver's side). It's thus difficult to
> figure out whether the V4L2 pixel format configured on the video node
> matches what the sensor outputs. Admittedly, we don't have a perfect
> solution to that whenever the DMA hardware supports multiple V4L2 pixel
> formats on a single media bus format. We might need to have a different
> solution for this one, should it be without that receiver sub-device.
> 
> Could you add the CSI-2 receiver sub-device, please?

Even though the name of the controller is *very* confusing, this isn't
a MIPI-CSI receiver, but a parallel one that supports RGB and BT656
buses.

> > +	csi->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
> 
> Could you make it IMMUTABLE and ENABLED? If there is no need to disable it,
> that is.

The link is already created with those flags, and as far as I know it
doesn't exist for the pads

> > +static int csi_release(struct file *file)
> > +{
> > +	struct sun4i_csi *csi = video_drvdata(file);
> > +	int ret;
> > +
> > +	mutex_lock(&csi->lock);
> > +
> > +	ret = v4l2_fh_release(file);
> 
> v4l2_fh_release() always returns 0. I guess it could be changed to return
> void. The reason it has int is that it could be used as the release
> callback as such.
> 
> > +	v4l2_pipeline_pm_use(&csi->vdev.entity, 0);
> > +	pm_runtime_put(csi->dev);
> > +
> > +	mutex_unlock(&csi->lock);
> > +
> > +	return ret;
> > +}

Do you want me to change the construct then?

Thanks!
Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
