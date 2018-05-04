From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 06/10] media: v4l: Add definition for
 Allwinner's MB32-tiled NV12 format
Date: Fri, 04 May 2018 09:58:41 +0200
Message-ID: <18af23e5efe2cdef5ed4b51c6dbf1ddeef8ffd5f.camel@bootlin.com>
References: <20180419154124.17512-1-paul.kocialkowski@bootlin.com>
	 <20180419154536.17846-2-paul.kocialkowski@bootlin.com>
	 <198e991c-1052-5bfb-f397-0e7d388b3c00@xs4all.nl>
Reply-To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-pjmmlWeTN8CeAiJmte1x"
Return-path: <linux-sunxi+bncBCOO3QWNR4KRBGNGWDLQKGQEML5537Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <198e991c-1052-5bfb-f397-0e7d388b3c00-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Pawel Osciak <pawel-FA/gS7QP4orQT0dZR+AlfA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-pjmmlWeTN8CeAiJmte1x
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, 2018-04-20 at 15:59 +0200, Hans Verkuil wrote:
> On 04/19/18 17:45, Paul Kocialkowski wrote:
> > This introduces support for Allwinner's MB32-tiled NV12 format,
> > where
> > each plane is divided into macroblocks of 32x32 pixels. Hence, the
> > size
> > of each plane has to be aligned to 32 bytes. The pixels inside each
> > macroblock are coded as they would be if the macroblock was a single
> > plane, line after line.
> > 
> > The MB32-tiled NV12 format is used by the video engine on Allwinner
> > platforms: it is the default format for decoded frames (and the only
> > one
> > available in the oldest supported platforms).
> > 
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  include/uapi/linux/videodev2.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/include/uapi/linux/videodev2.h
> > b/include/uapi/linux/videodev2.h
> > index 4b8336f7bcf0..43993a116e2b 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -669,6 +669,7 @@ struct v4l2_pix_format {
> >  #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /*
> > Depth data 16-bit */
> >  #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /*
> > Mediatek compressed block mode  */
> >  #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /*
> > Intel Planar Greyscale 10-bit and Depth 16-bit */
> > +#define V4L2_PIX_FMT_MB32_NV12 v4l2_fourcc('M', 'N', '1', '2') /*
> > Allwinner NV12 in 32x32 macroblocks */
> >  
> >  /* 10bit raw bayer packed, 32 bytes for every 25 pixels, last LSB 6
> > bits unused */
> >  #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3',
> > 'b') /* IPU3 packed 10-bit BGGR bayer */
> > 
> 
> Add an entry for this to v4l_fill_fmtdesc() in v4l2-ioctl.c.
> 
> It also needs to be documented in the spec.

Noted, I will look in that direction for the future versions.

Cheers,

-- 
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-pjmmlWeTN8CeAiJmte1x--
