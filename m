From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 18/22] media: platform: Add Sunxi-Cedrus
 VPU decoder driver
Date: Fri, 13 Jul 2018 10:40:58 +0200
Message-ID: <2a64aec733392cd15d87b53a268fb8328af0a82c.camel@bootlin.com>
References: <20180710080114.31469-1-paul.kocialkowski@bootlin.com>
	 <20180710080114.31469-19-paul.kocialkowski@bootlin.com>
	 <e31090c371ae7f7999b0aa983a20f33451cc89fb.camel@collabora.com>
Reply-To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Hb1cmEa3+oOsZx1t5cjo"
Return-path: <linux-sunxi+bncBCOO3QWNR4KRBHOLUHNAKGQE772NRTQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <e31090c371ae7f7999b0aa983a20f33451cc89fb.camel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Keiichi Watanabe <keiichiw-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Smitha T Murthy <smitha.t-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tom Saeger <tom.saeger-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "David
 S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Benoit
List-Id: devicetree@vger.kernel.org


--=-Hb1cmEa3+oOsZx1t5cjo
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 2018-07-10 at 16:57 -0300, Ezequiel Garcia wrote:
> Hey Paul,
> 
> My comments on v4 of course apply here as well.

Yes, it seems that most of your comments were not already adressed by
this v5. I will answer your remarks and suggestions on the v4 thread.

> One other thing...
> 
> On Tue, 2018-07-10 at 10:01 +0200, Paul Kocialkowski wrote:
> > This introduces the Sunxi-Cedrus VPU driver that supports the VPU
> > found
> > in Allwinner SoCs, also known as Video Engine. It is implemented
> > through
> > a v4l2 m2m decoder device and a media device (used for media
> > requests).
> > So far, it only supports MPEG2 decoding.
> > 
> > Since this VPU is stateless, synchronization with media requests is
> > required in order to ensure consistency between frame headers that
> > contain metadata about the frame to process and the raw slice data
> > that
> > is used to generate the frame.
> > 
> > This driver was made possible thanks to the long-standing effort
> > carried out by the linux-sunxi community in the interest of reverse
> > engineering, documenting and implementing support for Allwinner VPU.
> > 
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> > 
> 
> [..]
> > +
> > +static irqreturn_t cedrus_bh(int irq, void *data)
> > +{
> > +	struct cedrus_dev *dev = data;
> > +	struct cedrus_ctx *ctx;
> > +
> > +	ctx = v4l2_m2m_get_curr_priv(dev->m2m_dev);
> > +	if (!ctx) {
> > +		v4l2_err(&dev->v4l2_dev,
> > +			 "Instance released before the end of
> > transaction\n");
> > +		return IRQ_HANDLED;
> > +	}
> > +
> > +	v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
> > +
> 
> I don't like the fact that v4l2_m2m_job_finish calls .device_run
> reentrantly. Let me try to make v4l2_m2m_job_finish() safe to be called
> in atomic context, so hopefully drivers can just call it in the top-
> half.

Thanks for your patches in this direction, I will try them and hopefully
base our next Sunxi-Cedrus version on them, if it seems that this
framework change will be picked-up by maintainers.

> You are returning the buffers in the top-half, so this is just a matter
> or better design, not a performance improvement.

This is definitely a nice design improvement IMO (if not only for
avoiding reentrancy)! 

And this reduces our code path between starting decoding and userspace
notification that decoding finished. Starting the worker thread is no
longer required before notifying userspace, so I think we are going to
see performance improvements from this. Hopefully, the worker thread
will run while userspace is busy preparing the next frame, so this
should work a lot better for us!

Cheers,

Paul

-- 
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-Hb1cmEa3+oOsZx1t5cjo--
