From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v6 2/8] media: v4l: Add definition for
 Allwinner's MB32-tiled NV12 format
Date: Sat, 4 Aug 2018 13:42:40 +0200
Message-ID: <4628cfe1-e42f-67ad-20b3-078c6a96d6ed@xs4all.nl>
References: <20180725100256.22833-1-paul.kocialkowski@bootlin.com>
 <20180725100256.22833-3-paul.kocialkowski@bootlin.com>
Reply-To: hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBC3MVVMX3ELBBNNCS3NQKGQEIJJCX2A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180725100256.22833-3-paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/25/2018 12:02 PM, Paul Kocialkowski wrote:
> This introduces support for Allwinner's MB32-tiled NV12 format, where
> each plane is divided into macroblocks of 32x32 pixels. Hence, the size
> of each plane has to be aligned to 32 bytes. The pixels inside each
> macroblock are coded as they would be if the macroblock was a single
> plane, line after line.
> 
> The MB32-tiled NV12 format is used by the video engine on Allwinner
> platforms: it is the default format for decoded frames (and the only one
> available in the oldest supported platforms).
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> ---
>  Documentation/media/uapi/v4l/pixfmt-reserved.rst | 15 ++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ioctl.c             |  1 +
>  include/uapi/linux/videodev2.h                   |  1 +
>  3 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/media/uapi/v4l/pixfmt-reserved.rst b/Documentation/media/uapi/v4l/pixfmt-reserved.rst
> index 38af1472a4b4..9a68b6a787bf 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-reserved.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-reserved.rst
> @@ -243,7 +243,20 @@ please make a proposal on the linux-media mailing list.
>  	It is an opaque intermediate format and the MDP hardware must be
>  	used to convert ``V4L2_PIX_FMT_MT21C`` to ``V4L2_PIX_FMT_NV12M``,
>  	``V4L2_PIX_FMT_YUV420M`` or ``V4L2_PIX_FMT_YVU420``.
> -
> +    * .. _V4L2-PIX-FMT-MB32-NV12:
> +
> +      - ``V4L2_PIX_FMT_MB32_NV12``
> +      - 'MN12'
> +      - Two-planar NV12-based format used by the Allwinner video engine
> +        hardware, with 32x32 tiles for the luminance plane and 32x64 tiles
> +        for the chrominance plane. Each tile is a linear pixel data
> +        representation within its own bounds. Each tile follows the previous
> +        one linearly (as in, from left to right, top to bottom).

as in, -> as in:

> +
> +        The frame dimensions are aligned to match an integer number of
> +        tiles, resulting in 32-aligned resolutions for the luminance plane
> +        and 16-aligned resolutions for the chrominance plane (with 2x2
> +        subsampling).
>  
>  .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 68e914b83a03..7e1c200de10d 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1331,6 +1331,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  		case V4L2_PIX_FMT_SE401:	descr = "GSPCA SE401"; break;
>  		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
>  		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
> +		case V4L2_PIX_FMT_MB32_NV12:	descr = "Allwinner tiled NV12 format"; break;

"Allwinner Tiled NV12 Format"

If it is Allwinner specific, then that should be in the PIX_FMT name as well:
something like V4L2_PIX_FMT_ALLWINNER_MB32_NV12 or perhaps SUNXI_MB32_NV12.

On the other hand, you could also see this as a variant of e.g. V4L2_PIX_FMT_NV12MT
or V4L2_PIX_FMT_NV12MT_16X16. In that case it is not necessarily Allwinner specific
since other devices might choose this format. You can go either way, as long
as it is consistent.

>  		default:
>  			WARN(1, "Unknown pixelformat 0x%08x\n", fmt->pixelformat);
>  			if (fmt->description[0])
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index d171361ed9b3..453d27142e31 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -670,6 +670,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth data 16-bit */
>  #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediatek compressed block mode  */
>  #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
> +#define V4L2_PIX_FMT_MB32_NV12 v4l2_fourcc('M', 'N', '1', '2') /* Allwinner tiled NV12 format */
>  
>  /* 10bit raw bayer packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
>  #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */
> 

Regards,

	Hans
