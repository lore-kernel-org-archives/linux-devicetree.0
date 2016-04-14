From: tiffany lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/7] [media]: v4l: add Mediatek MT21 video block format
Date: Thu, 14 Apr 2016 14:13:41 +0800
Message-ID: <1460614421.30214.2.camel@mtksdaap41>
References: <1460548915-17536-1-git-send-email-tiffany.lin@mediatek.com>
	 <1460548915-17536-2-git-send-email-tiffany.lin@mediatek.com>
	 <1460557416.18956.3.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460557416.18956.3.camel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org
Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, PoChun.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi=20
On Wed, 2016-04-13 at 10:23 -0400, Nicolas Dufresne wrote:
> Le mercredi 13 avril 2016 =C3=A0 20:01 +0800, Tiffany Lin a =C3=A9cri=
t :
> > From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >=20
> > Mediatek video format is YVU8_420_2PLANE_PACK8_PROGRESSIVE.
> >=20
> > Create V4L2_PIX_FMT_MT21 and DRM_FORMAT_MT21 to be consistent with
> > V4L2_PIX_FMT_NV12 notation.
> >=20
> > Signed-off-by: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  include/uapi/drm/drm_fourcc.h  |    1 +
> >  include/uapi/linux/videodev2.h |    2 ++
>=20
> Might be better to split this patch.
Got it, will split to two patch in next version.

>=20
> >  2 files changed, 3 insertions(+)
> >=20
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_f=
ourcc.h
> > index 0b69a77..a193905 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -116,6 +116,7 @@
> >  #define DRM_FORMAT_NV24		fourcc_code('N', 'V', '2', '4') /* non-su=
bsampled Cr:Cb plane */
> >  #define DRM_FORMAT_NV42		fourcc_code('N', 'V', '4', '2') /* non-su=
bsampled Cb:Cr plane */
> > =20
> > +#define DRM_FORMAT_MT21		fourcc_code('M', 'T', '2', '1') /* Mediat=
ek Block Mode */
>=20
> Please document the tiling format, don't just add a define here.
Got it, will add documentation in next version.

>=20
> >  /*
> >   * 3 plane YCbCr
> >   * index 0: Y plane, [7:0] Y
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vi=
deodev2.h
> > index d0acd26..e9e3276 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -527,6 +527,8 @@ struct v4l2_pix_format {
> >  #define V4L2_PIX_FMT_HM12    v4l2_fourcc('H', 'M', '1', '2') /*  8=
  YUV 4:2:0 16x16 macroblocks */
> >  #define V4L2_PIX_FMT_M420    v4l2_fourcc('M', '4', '2', '0') /* 12=
  YUV 4:2:0 2 lines y, 1 line uv interleaved */
> > =20
> > +#define V4L2_PIX_FMT_MT21    v4l2_fourcc('M', 'T', '2', '1') /* Me=
diatek Block Mode  */
> > +
>=20
> Same. On Linux Media side, there is docbook documentation where you c=
an
> explain in detail.
Got it, will add documentation in next version.

>=20
> >  /* two planes -- one Y, one Cr + Cb interleaved  */
> >  #define V4L2_PIX_FMT_NV12    v4l2_fourcc('N', 'V', '1', '2') /* 12=
  Y/CbCr 4:2:0  */
> >  #define V4L2_PIX_FMT_NV21    v4l2_fourcc('N', 'V', '2', '1') /* 12=
  Y/CrCb 4:2:0  */


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
