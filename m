From: Nicolas Dufresne <nicolas.dufresne@gmail.com>
Subject: Re: [PATCH 1/7] [media]: v4l: add Mediatek MT21 video block format
Date: Wed, 13 Apr 2016 10:23:36 -0400
Message-ID: <1460557416.18956.3.camel@gmail.com>
References: <1460548915-17536-1-git-send-email-tiffany.lin@mediatek.com>
	 <1460548915-17536-2-git-send-email-tiffany.lin@mediatek.com>
Reply-To: nicolas@ndufresne.ca
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460548915-17536-2-git-send-email-tiffany.lin@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tiffany Lin <tiffany.lin@mediatek.com>, Hans Verkuil <hans.verkuil@cisco.com>, daniel.thompson@linaro.org, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Pawel Osciak <posciak@chromium.org>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, PoChun.Lin@mediatek.com
List-Id: devicetree@vger.kernel.org

Le mercredi 13 avril 2016 =C3=A0 20:01 +0800, Tiffany Lin a =C3=A9crit=C2=
=A0:
> From: Daniel Kurtz <djkurtz@chromium.org>
>=20
> Mediatek video format is YVU8_420_2PLANE_PACK8_PROGRESSIVE.
>=20
> Create V4L2_PIX_FMT_MT21 and DRM_FORMAT_MT21 to be consistent with
> V4L2_PIX_FMT_NV12 notation.
>=20
> Signed-off-by: Tiffany Lin <tiffany.lin@mediatek.com>
> ---
> =C2=A0include/uapi/drm/drm_fourcc.h=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A0=C2=
=A01 +
> =C2=A0include/uapi/linux/videodev2.h |=C2=A0=C2=A0=C2=A0=C2=A02 ++

Might be better to split this patch.

> =C2=A02 files changed, 3 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fou=
rcc.h
> index 0b69a77..a193905 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -116,6 +116,7 @@
> =C2=A0#define DRM_FORMAT_NV24		fourcc_code('N', 'V', '2', '4') /* non=
-subsampled Cr:Cb plane */
> =C2=A0#define DRM_FORMAT_NV42		fourcc_code('N', 'V', '4', '2') /* non=
-subsampled Cb:Cr plane */
> =C2=A0
> +#define DRM_FORMAT_MT21		fourcc_code('M', 'T', '2', '1') /* Mediatek=
 Block Mode */

Please document the tiling format, don't just add a define here.

> =C2=A0/*
> =C2=A0 * 3 plane YCbCr
> =C2=A0 * index 0: Y plane, [7:0] Y
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vide=
odev2.h
> index d0acd26..e9e3276 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -527,6 +527,8 @@ struct v4l2_pix_format {
> =C2=A0#define V4L2_PIX_FMT_HM12=C2=A0=C2=A0=C2=A0=C2=A0v4l2_fourcc('H=
', 'M', '1', '2') /*=C2=A0=C2=A08=C2=A0=C2=A0YUV 4:2:0 16x16 macroblock=
s */
> =C2=A0#define V4L2_PIX_FMT_M420=C2=A0=C2=A0=C2=A0=C2=A0v4l2_fourcc('M=
', '4', '2', '0') /* 12=C2=A0=C2=A0YUV 4:2:0 2 lines y, 1 line uv inter=
leaved */
> =C2=A0
> +#define V4L2_PIX_FMT_MT21=C2=A0=C2=A0=C2=A0=C2=A0v4l2_fourcc('M', 'T=
', '2', '1') /* Mediatek Block Mode=C2=A0=C2=A0*/
> +

Same. On Linux Media side, there is docbook documentation where you can
explain in detail.

> =C2=A0/* two planes -- one Y, one Cr + Cb interleaved=C2=A0=C2=A0*/
> =C2=A0#define V4L2_PIX_FMT_NV12=C2=A0=C2=A0=C2=A0=C2=A0v4l2_fourcc('N=
', 'V', '1', '2') /* 12=C2=A0=C2=A0Y/CbCr 4:2:0=C2=A0=C2=A0*/
> =C2=A0#define V4L2_PIX_FMT_NV21=C2=A0=C2=A0=C2=A0=C2=A0v4l2_fourcc('N=
', 'V', '2', '1') /* 12=C2=A0=C2=A0Y/CrCb 4:2:0=C2=A0=C2=A0*/
