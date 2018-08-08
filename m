From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v6 4/8] media: platform: Add Cedrus VPU
 decoder driver
Date: Wed, 08 Aug 2018 11:28:55 +0200
Message-ID: <d807ea19fa4fbbab81d6580399d406f351ac324e.camel@bootlin.com>
References: <20180725100256.22833-1-paul.kocialkowski@bootlin.com>
	 <20180725100256.22833-5-paul.kocialkowski@bootlin.com>
	 <faa0436aad809ca562b5c152420b1e4d4b6f507b.camel@collabora.com>
	 <130e4f08534d0dfbd26f97f9b95d533ce86ceada.camel@bootlin.com>
Reply-To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-oFjxIpdcI3M+8NHK4cGK"
Return-path: <linux-sunxi+bncBCOO3QWNR4KRBY7PVLNQKGQEXYPQAWQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <130e4f08534d0dfbd26f97f9b95d533ce86ceada.camel-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-oFjxIpdcI3M+8NHK4cGK
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, 2018-08-06 at 16:21 +0200, Paul Kocialkowski wrote:
> Hi,
> 
> On Fri, 2018-08-03 at 17:49 -0300, Ezequiel Garcia wrote:
> > On Wed, 2018-07-25 at 12:02 +0200, Paul Kocialkowski wrote:
> > > This introduces the Cedrus VPU driver that supports the VPU found in
> > > Allwinner SoCs, also known as Video Engine. It is implemented through
> > > a v4l2 m2m decoder device and a media device (used for media requests).
> > > So far, it only supports MPEG2 decoding.
> > > 
> > > Since this VPU is stateless, synchronization with media requests is
> > > required in order to ensure consistency between frame headers that
> > > contain metadata about the frame to process and the raw slice data that
> > > is used to generate the frame.
> > > 
> > > This driver was made possible thanks to the long-standing effort
> > > carried out by the linux-sunxi community in the interest of reverse
> > > engineering, documenting and implementing support for Allwinner VPU.
> > > 
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> > 
> > [..]
> > > +static int cedrus_probe(struct platform_device *pdev)
> > > +{
> > > +	struct cedrus_dev *dev;
> > > +	struct video_device *vfd;
> > > +	int ret;
> > > +
> > > +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> > > +	if (!dev)
> > > +		return -ENOMEM;
> > > +
> > > +	dev->dev = &pdev->dev;
> > > +	dev->pdev = pdev;
> > > +
> > > +	ret = cedrus_hw_probe(dev);
> > > +	if (ret) {
> > > +		dev_err(&pdev->dev, "Failed to probe hardware\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	dev->dec_ops[CEDRUS_CODEC_MPEG2] = &cedrus_dec_ops_mpeg2;
> > > +
> > > +	mutex_init(&dev->dev_mutex);
> > > +	spin_lock_init(&dev->irq_lock);
> > > +
> > 
> > A minor thing.
> > 
> > I believe this spinlock is not needed. All the data structures
> > it's accessing are already protected, and some operations
> > (stop_streaming) are guaranteed to not run at the same
> > time as a job.
> 
> I think we were afraid of this kind of scenario happening, but
> everything seems to indicate that these data structures are already
> properly protected by the core, as you're suggesting.
> 
> Removing the lock does not cause any noticeable issue at first try, but
> I'd like to test decoding for a few hours in a row to reduce the
> probability of missing a corner case that our lock was preventing.

After testing for several hours in a row, I got some cases of CPU stall
which did not happen with the driver lock. So it seems safer to keep the
lock around for now and maybe revisit this later, when there is time to
investigate why it is needed.

Cheers,

Paul

> If that goes well, I guess we can remove it from our driver.
> 
> Cheers,
> 
> Paul
> 
-- 
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-oFjxIpdcI3M+8NHK4cGK--
