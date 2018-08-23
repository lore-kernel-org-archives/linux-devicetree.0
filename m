From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v7 0/8] Cedrus driver for the Allwinner
 Video Engine, using media requests
Date: Thu, 23 Aug 2018 09:40:17 +0200
Message-ID: <3e87ebaccb123dbff8923c7d0235b50cf09a6d07.camel@bootlin.com>
References: <20180809090435.17248-1-paul.kocialkowski@bootlin.com>
	 <828bf3b9f5f2edc2f05b7982ccc5d9777f1a19e3.camel@collabora.com>
Reply-To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-GrXxzMTgca7Nqq3ohf9F"
Return-path: <linux-sunxi+bncBCOO3QWNR4KRB3OJ7HNQKGQELQIMUIA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <828bf3b9f5f2edc2f05b7982ccc5d9777f1a19e3.camel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-GrXxzMTgca7Nqq3ohf9F
Content-Type: text/plain; charset="UTF-8"

Hi Ezequiel,

On Wed, 2018-08-22 at 14:25 -0300, Ezequiel Garcia wrote:
> Hey Paul,
> 
> On Thu, 2018-08-09 at 11:04 +0200, Paul Kocialkowski wrote:
> > This is the seventh iteration of the updated Cedrus driver,
> > that supports the Video Engine found on most Allwinner SoCs, starting
> > with the A10. It was tested on the A13, A20, A33 and H3.
> > 
> > The initial version of this driver[0] was originally written and
> > submitted by Florent Revest using a previous version of the request API
> > that is necessary to provide coherency between controls and the buffers
> > they apply to.
> > 
> > The driver was adapted to use the latest version of the media request
> > API[1], as submitted by Hans Verkuil. Media request API support is a
> > hard requirement for the Cedrus driver.
> > 
> > The driver itself currently only supports MPEG2 and more codecs will be
> > added eventually. The default output frame format provided by the Video
> > Engine is a multi-planar tiled YUV format (based on NV12). A specific
> > format is introduced in the V4L2 API to describe it. Starting with the
> > A33, the Video Engine can also output untiled YUV formats.
> > 
> > This implementation is based on the significant work that was conducted
> > by various members of the linux-sunxi community for understanding and
> > documenting the Video Engine's innards.
> > 
> > In addition to the media requests API, the following series are required
> > for Cedrus:
> > * vicodec: the Virtual Codec driver
> > * allwinner: a64: add SRAM controller / system control
> > * SRAM patches from the Cedrus VPU driver series version 5
> > 
> > Changes since v6:
> > * Reworked MPEG2 controls to stick closer to the bitstream;
> > * Updated controls documentation accordingly and added requested fixes;
> > * Renamed tiled format to V4L2_PIX_FMT_SUNXI_TILED_NV12;
> > * Added various minor driver fixes based on Hans' feedback;
> > * Fixed dst frame alignment based on Jernej's feedback and tests;
> > * Removed set bits for the disabled secondary output.
> > 
> > Changes since v5:
> > * Added MPEG2 quantization matrices definitions and support;
> > * Cleaned up registers definitions;
> > * Moved the driver to staging as requested;
> > 
> 
> I tried to find the reason for moving this driver to staging,
> but couldn't find it in the discussion.
> 
> If there's a legitimate reason, shouldn't you add a TODO file?

Ah, sorry this wasn't made explicit in the log.

The driver was moved to staging because we want to keep the ability to
rework the controls used by the driver, which were not deemed stable
yet. So since the controls are in a staging state, so is the driver
using them. So this probably applies to your driver as well.

-- 
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-GrXxzMTgca7Nqq3ohf9F--
