From: Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH v6 01/17] media: videodev2.h, v4l2-ioctl: add rkisp1
 meta buffer format
Date: Fri, 26 Apr 2019 16:34:10 -0400
Message-ID: <2367b550d815bdf4c50aae692a5549f9be6a0802.camel@ndufresne.ca>
References: <20180308094807.9443-1-jacob-chen@iotwrt.com>
         <20180308094807.9443-2-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-mOui5ucgkVhFyJMZ5z0C"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180308094807.9443-2-jacob-chen@iotwrt.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacob Chen <jacob-chen@iotwrt.com>, linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mchehab@kernel.org, linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, tfiga@chromium.org, zhengsq@rock-chips.com, laurent.pinchart@ideasonboard.com, zyc@rock-chips.com, eddie.cai.linux@gmail.com, jeffy.chen@rock-chips.com, devicetree@vger.kernel.org, heiko@sntech.de, Jacob Chen <jacob2.chen@rock-chips.com>
List-Id: devicetree@vger.kernel.org


--=-mOui5ucgkVhFyJMZ5z0C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 08 mars 2018 =C3=A0 17:47 +0800, Jacob Chen a =C3=A9crit :
> From: Shunqian Zheng <zhengsq@rock-chips.com>
>=20
> Add the Rockchip ISP1 specific processing parameter format
> V4L2_META_FMT_RK_ISP1_PARAMS and metadata format
> V4L2_META_FMT_RK_ISP1_STAT_3A for 3A.
>=20
> Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
> Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
> Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>  include/uapi/linux/videodev2.h       | 4 ++++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 1be54429d601..bdd469290d66 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1257,6 +1257,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>  	case V4L2_META_FMT_VSP1_HGO:	descr =3D "R-Car VSP1 1-D Histogram"; brea=
k;
>  	case V4L2_META_FMT_VSP1_HGT:	descr =3D "R-Car VSP1 2-D Histogram"; brea=
k;
>  	case V4L2_META_FMT_UVC:		descr =3D "UVC payload header metadata"; break=
;
> +	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr =3D "Rockchip ISP1 3A params";=
 break;
> +	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr =3D "Rockchip ISP1 3A statist=
ics"; break;
> =20
>  	default:
>  		/* Compressed formats */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index e20d10df75c1..359ad8bbf9bf 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -698,6 +698,10 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-C=
ar VSP1 2-D Histogram */
>  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC=
 Payload Header metadata */
> =20
> +/* Vendor specific - used for IPU3 camera sub-system */

Did you mean "RK_ISP1 camera sub-system" ?

> +#define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* =
Rockchip ISP1 params */
> +#define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /*=
 Rockchip ISP1 3A statistics */
> +
>  /* priv field value to indicates that subsequent fields are valid. */
>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
> =20

--=-mOui5ucgkVhFyJMZ5z0C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXMNrQgAKCRBxUwItrAao
HMr/AKCH5EVntTk1jT5u0f41G/tqfeI+CwCgwiiFz0hcOaFAjBEJIqWm5+mUPpM=
=9X8/
-----END PGP SIGNATURE-----

--=-mOui5ucgkVhFyJMZ5z0C--
