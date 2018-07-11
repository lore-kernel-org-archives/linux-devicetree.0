From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v10 2/2] media: V3s: Add support for
 Allwinner CSI.
Date: Wed, 11 Jul 2018 13:12:30 +0200
Message-ID: <20180711111230.gpv7ww2nhaha5hou@flea>
References: <1525417745-37964-1-git-send-email-yong.deng@magewell.com>
 <20180626110821.wkal6fcnoncsze6y@valkosipuli.retiisi.org.uk>
 <20180705154802.03604f156709be11892b19c0@magewell.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wbnyxjafmaafjrkv"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBKWMS7NAKGQEYMDKU4A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180705154802.03604f156709be11892b19c0-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Todor Tomov <todor.tomov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-media
List-Id: devicetree@vger.kernel.org


--wbnyxjafmaafjrkv
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi Sakari,

On Thu, Jul 05, 2018 at 03:48:02PM +0800, Yong wrote:
> > > +
> > > +/* -----------------------------------------------------------------------------
> > > + * Media Operations
> > > + */
> > > +static int sun6i_video_formats_init(struct sun6i_video *video,
> > > +				    const struct media_pad *remote)
> > > +{
> > > +	struct v4l2_subdev_mbus_code_enum mbus_code = { 0 };
> > > +	struct sun6i_csi *csi = video->csi;
> > > +	struct v4l2_format format;
> > > +	struct v4l2_subdev *subdev;
> > > +	u32 pad;
> > > +	const u32 *pixformats;
> > > +	int pixformat_count = 0;
> > > +	u32 subdev_codes[32]; /* subdev format codes, 32 should be enough */
> > > +	int codes_count = 0;
> > > +	int num_fmts = 0;
> > > +	int i, j;
> > > +
> > > +	pad = remote->index;
> > > +	subdev = media_entity_to_v4l2_subdev(remote->entity);
> > > +	if (subdev == NULL)
> > > +		return -ENXIO;
> > > +
> > > +	/* Get supported pixformats of CSI */
> > > +	pixformat_count = sun6i_csi_get_supported_pixformats(csi, &pixformats);
> > > +	if (pixformat_count <= 0)
> > > +		return -ENXIO;
> > > +
> > > +	/* Get subdev formats codes */
> > > +	mbus_code.pad = pad;
> > > +	mbus_code.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> > > +	while (!v4l2_subdev_call(subdev, pad, enum_mbus_code, NULL,
> > > +				 &mbus_code)) {
> > 
> > The formats supported by the external sub-device may depend on horizontal
> > and vertical flipping. You shouldn't assume any particular configuration
> > here: instead, bridge drivers generally just need to make sure the formats
> > match in link validation when streaming is started. At least the CSI-2
> > receiver driver and the DMA engine driver (video device) should check the
> > configuration is valid. See e.g. the IPU3 driver:
> > drivers/media/pci/intel/ipu3/ipu3-cio2.c .
> 
> Can mbus_code be added dynamically ?
> The code here only enum the mbus code and get the possible supported
> pairs of pixformat and mbus by SoC. Not try to check if the formats
> (width height ...) is valid or not. The formats validation will be 
> in link validation when streaming is started as per your advise. 

Can you reply to this so that Yong has a chance to resubmit his serie
before the 4.19 merge window starts?

Or alternatively, is this something we can fix later on, once it's
merged?

Thanks!
Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--wbnyxjafmaafjrkv--
