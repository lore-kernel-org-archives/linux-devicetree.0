From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 00/15] Cedrus H5 and A64 support with A33
 and H3 updates
Date: Wed, 5 Dec 2018 12:07:12 +0100
Message-ID: <20181205110712.dfzdkixpsayue5k7@flea>
References: <20181205092444.29497-1-paul.kocialkowski@bootlin.com>
 <CAGb2v64fjKbxET61S7NzTaPGJc7-XUG=Zb87_BOah9xWr5zpvg@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f7czaut6wahvetbb"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB77CT3QAKGQEOQQSQ6A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v64fjKbxET61S7NzTaPGJc7-XUG=Zb87_BOah9xWr5zpvg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--f7czaut6wahvetbb
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Dec 05, 2018 at 05:48:34PM +0800, Chen-Yu Tsai wrote:
> On Wed, Dec 5, 2018 at 5:25 PM Paul Kocialkowski
> <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > This series adds support for the Allwinner H5 and A64 platforms to the
> > cedrus stateless video codec driver, with minor updates to the A33 and
> > H3 platforms.
> >
> > It requires changes to the SRAM driver bindings and driver, to properly
> > support the H5 and the A64 C1 SRAM section. Because a H5-specific
> > system-control node is introduced, the dummy syscon node that was shared
> > between the H3 and H5 is removed in favor of each platform-specific node.
> > A few fixes are included to ensure that the EMAC clock configuration
> > register is still accessible through the sunxi SRAM driver (instead of the
> > dummy syscon node, that was there for this purpose) on the H3 and H5.
> >
> > The reserved memory nodes for the A33 and H3 are also removed in this
> > series, since they are not actually necessary.
> >
> > Changes since v1:
> > * Removed the reserved-memory nodes for the A64 and H5;
> > * Removed the reserved-memory nodes for the A33 and H3;
> > * Corrected the SRAM bases and sizes to the best of our knowledge;
> > * Dropped cosmetic dt changes already included in the sunxi tree.
> >
> > Paul Kocialkowski (15):
> >   ARM: dts: sun8i: h3: Fix the system-control register range
> >   ARM: dts: sun8i: a33: Remove unnecessary reserved memory node
> >   ARM: dts: sun8i: h3: Remove unnecessary reserved memory node
> >   soc: sunxi: sram: Enable EMAC clock access for H3 variant
> >   dt-bindings: sram: sunxi: Add bindings for the H5 with SRAM C1
> >   soc: sunxi: sram: Add support for the H5 SoC system control
> >   arm64: dts: allwinner: h5: Add system-control node with SRAM C1
> >   ARM/arm64: sunxi: Move H3/H5 syscon label over to soc-specific nodes
> >   dt-bindings: sram: sunxi: Add compatible for the A64 SRAM C1
> >   arm64: dts: allwinner: a64: Add support for the SRAM C1 section
> >   dt-bindings: media: cedrus: Add compatibles for the A64 and H5
> >   media: cedrus: Add device-tree compatible and variant for H5 support
> >   media: cedrus: Add device-tree compatible and variant for A64 support
> >   arm64: dts: allwinner: h5: Add Video Engine node
> >   arm64: dts: allwinner: a64: Add Video Engine node
> 
> Other than the error in patch 7,
> 
> Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied all the patches but 11-13, with the changes discussed on patch 7 fixed.

Thanks!
Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--f7czaut6wahvetbb--
