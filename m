From: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v11 2/2] media: V3s: Add support for
 Allwinner CSI.
Date: Sat, 29 Sep 2018 18:18:44 +0800
Message-ID: <20180929181844.87fd7560cc560f268df3c7b4@magewell.com>
References: <1537951420-24752-1-git-send-email-yong.deng@magewell.com>
	<20180928101937.wdlrgezxoqzua5ke@paasikivi.fi.intel.com>
Reply-To: yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD2JNYHK4MEBBKVDXXOQKGQEGMN3GXY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180928101937.wdlrgezxoqzua5ke-z7MJbOB4PBP+e+fPlCVrcFDQ4js95KgL@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Todor Tomov <todor.tomov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sakari,

On Fri, 28 Sep 2018 13:19:37 +0300
Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:

> Hi Yong,
> 
> Thanks for the update! This looks pretty good; some small bits to fix
> still, please see my comments below.
> 
> On Wed, Sep 26, 2018 at 04:43:40PM +0800, Yong Deng wrote:
> > Allwinner V3s SoC features two CSI module. CSI0 is used for MIPI CSI-2
> > interface and CSI1 is used for parallel interface. This is not
> > documented in datasheet but by test and guess.
> > 
> > This patch implement a v4l2 framework driver for it.
> > 
> > Currently, the driver only support the parallel interface. MIPI-CSI2,
> > ISP's support are not included in this patch.
> > 

...

> > +
> > +static void sun6i_csi_v4l2_cleanup(struct sun6i_csi *csi)
> > +{
> > +	v4l2_async_notifier_unregister(&csi->notifier);
> > +	v4l2_async_notifier_cleanup(&csi->notifier);
> > +	sun6i_video_cleanup(&csi->video);
> > +	v4l2_device_unregister(&csi->v4l2_dev);
> > +	media_device_unregister(&csi->media_dev);
> 
> Please unregister the media device as first.

I notice that the release order of intel ipu3 is:
    cio2_notifier_exit(cio2);
    cio2_fbpt_exit_dummy(cio2);
    for (i = 0; i < CIO2_QUEUES; i++) 
        cio2_queue_exit(cio2, &cio2->queue[i]);
    v4l2_device_unregister(&cio2->v4l2_dev);
    media_device_unregister(&cio2->media_dev);
    media_device_cleanup(&cio2->media_dev);
    mutex_destroy(&cio2->lock);

> 
> You're missing freeing the control handler.
> 
> > +	media_device_cleanup(&csi->media_dev);
> > +}
> > +
> > +static int sun6i_csi_v4l2_init(struct sun6i_csi *csi)
> > +{
> > +	int ret;
> > +
> > +	csi->media_dev.dev = csi->dev;
> > +	strlcpy(csi->media_dev.model, "Allwinner Video Capture Device",
> > +		sizeof(csi->media_dev.model));
> 
> strscpy, please.
> 
> > +	csi->media_dev.hw_revision = 0;
> > +
> > +	media_device_init(&csi->media_dev);
> > +
> > +	ret = v4l2_ctrl_handler_init(&csi->ctrl_handler, 0);
> 
> Do you need controls? The driver doesn't appear to register any.

Some one suggest this. They want the drver can pass control queries to 
the subdev.

> 
> > +	if (ret) {
> > +		dev_err(csi->dev, "V4L2 controls handler init failed (%d)\n",
> > +			ret);
> > +		goto clean_media;
> > +	}
> > +
> > +	csi->v4l2_dev.mdev = &csi->media_dev;
> > +	csi->v4l2_dev.ctrl_handler = &csi->ctrl_handler;
> > +	ret = v4l2_device_register(csi->dev, &csi->v4l2_dev);
> > +	if (ret) {
> > +		dev_err(csi->dev, "V4L2 device registration failed (%d)\n",

...

> > +
> > +/*
> > + * PHYS_OFFSET isn't available on all architectures. In order to
> > + * accomodate for COMPILE_TEST, let's define it to something dumb.
> > + */
> > +#ifndef PHYS_OFFSET
> 
> How about:
> 
> #if !defined(CONFIG_COMPILE_TEST) && !defined(PHYS_OFFSET)

Do you mean:
#if defined(CONFIG_COMPILE_TEST) && !defined(PHYS_OFFSET)

> 
> Or something alike. That avoids things going horribly wrong if PHYS_OFFSET
> is undefined for a different reason.
> 
> > +#define PHYS_OFFSET 0
> > +#endif
> > +
> > +static int sun6i_csi_probe(struct platform_device *pdev)
> > +{
> > +	struct sun6i_csi_dev *sdev;
> > +	int ret;
> > +

...

> > +
> > +static const struct v4l2_ioctl_ops sun6i_video_ioctl_ops = {
> > +	.vidioc_querycap		= vidioc_querycap,
> > +	.vidioc_enum_fmt_vid_cap	= vidioc_enum_fmt_vid_cap,
> > +	.vidioc_g_fmt_vid_cap		= vidioc_g_fmt_vid_cap,
> > +	.vidioc_s_fmt_vid_cap		= vidioc_s_fmt_vid_cap,
> > +	.vidioc_try_fmt_vid_cap		= vidioc_try_fmt_vid_cap,
> > +
> > +	.vidioc_enum_input		= vidioc_enum_input,
> > +	.vidioc_s_input			= vidioc_s_input,
> > +	.vidioc_g_input			= vidioc_g_input,
> > +
> > +	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
> > +	.vidioc_querybuf		= vb2_ioctl_querybuf,
> > +	.vidioc_qbuf			= vb2_ioctl_qbuf,
> > +	.vidioc_expbuf			= vb2_ioctl_expbuf,
> > +	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
> > +	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
> > +	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
> > +	.vidioc_streamon		= vb2_ioctl_streamon,
> > +	.vidioc_streamoff		= vb2_ioctl_streamoff,
> > +
> > +	.vidioc_log_status		= v4l2_ctrl_log_status,
> > +	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
> > +	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
> 
> Do you need events? The driver doesn't seem to be using controls for
> anything and I see no trace of events otherwise either.
> 

I am not sure. The reason is same as ctrl handler.


Thanks,
Yong
