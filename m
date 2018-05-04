From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 09/10] ARM: dts: sun7i-a20: Add Video
 Engine and reserved memory nodes
Date: Fri, 04 May 2018 10:54:18 +0200
Message-ID: <5f7961d548b4d27eab8e0bd6bcfc35ea70e2d79b.camel@bootlin.com>
References: <20180419154124.17512-1-paul.kocialkowski@bootlin.com>
	 <20180419154536.17846-5-paul.kocialkowski@bootlin.com>
	 <20180420073908.nkcbsdxibnzkqski@flea>
	 <82057e2f734137a3902d9313c228b01ceb345ee7.camel@bootlin.com>
	 <20180504084008.h6p4brari3xrbv6l@flea>
	 <e8cd340605ab4db8ebf2888a4fce645e8bc481d0.camel@bootlin.com>
Reply-To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-nNmSDE07s9p6POYMMwU2"
Return-path: <linux-sunxi+bncBCOO3QWNR4KRBFOAWDLQKGQE2XRXZ2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <e8cd340605ab4db8ebf2888a4fce645e8bc481d0.camel-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Pawel Osciak <pawel-FA/gS7QP4orQT0dZR+AlfA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-nNmSDE07s9p6POYMMwU2
Content-Type: text/plain; charset="UTF-8"

On Fri, 2018-05-04 at 10:47 +0200, Paul Kocialkowski wrote:
> > > > Don't you also need to map the SRAM on the A20?
> > > 
> > > That's a good point, there is currently no syscon handle for A20
> > > (and
> > > also A13). Maybe SRAM is muxed to the VE by default so it "just
> > > works"? 

I just checked on the manual and it appears that SRAM Area C1 is muxed
to the VE at reset, so we can probably keep things as-is until the SRAM
driver is ready to handle explicitly muxing that area to the VE.

-- 
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-nNmSDE07s9p6POYMMwU2--
