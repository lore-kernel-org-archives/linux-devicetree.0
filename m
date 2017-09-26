From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 03/13] drm/sun4i: tcon: Add support for demuxing TCON
 output on A31
Date: Tue, 26 Sep 2017 11:56:03 +0200
Message-ID: <20170926095603.c67y4rytydya7kjd@flea>
References: <20170926065919.24446-1-wens@csie.org>
 <20170926065919.24446-4-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fwfopzxho5wg6h5l"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170926065919.24446-4-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--fwfopzxho5wg6h5l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 26, 2017 at 06:59:09AM +0000, Chen-Yu Tsai wrote:
> On systems with 2 TCONs such as the A31, it is possible to demux the
> output of the TCONs to one encoder.
>=20
> Add support for this for the A31.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 61 ++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 61 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index e853dfe51389..770b843a6fa9 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -14,9 +14,12 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_encoder.h>
>  #include <drm/drm_modes.h>
>  #include <drm/drm_of.h>
> =20
> +#include <uapi/drm/drm_mode.h>
> +
>  #include <linux/component.h>
>  #include <linux/ioport.h>
>  #include <linux/of_address.h>
> @@ -109,11 +112,69 @@ void sun4i_tcon_enable_vblank(struct sun4i_tcon *tc=
on, bool enable)
>  }
>  EXPORT_SYMBOL(sun4i_tcon_enable_vblank);
> =20
> +static struct sun4i_tcon *sun4i_get_first_tcon(struct drm_device *drm)
> +{
> +	struct sun4i_drv *drv =3D drm->dev_private;
> +	struct sun4i_tcon *tcon;
> +
> +	list_for_each_entry(tcon, &drv->tcon_list, list)
> +		if (tcon->id =3D=3D 0)
> +			return tcon;
> +
> +	dev_warn(drm->dev,
> +		 "TCON0 not found, display output muxing may not work\n");
> +
> +	return tcon;
> +}
> +
> +static int _sun6i_tcon_set_mux(struct drm_encoder *encoder)
> +{
> +	struct sun4i_tcon *tcon =3D sun4i_get_first_tcon(encoder->dev);
> +	int tcon_id =3D drm_crtc_to_sun4i_crtc(encoder->crtc)->tcon->id;
> +	u32 shift;
> +
> +	DRM_DEBUG_DRIVER("Muxing encoder %s to CRTC %s (TCON %d)\n",
> +			 encoder->name, encoder->crtc->name, tcon_id);
> +
> +	/* Only 2 TCONs */
> +	if (tcon_id >=3D 2)
> +		return -EINVAL;
> +
> +	switch (encoder->encoder_type) {
> +	case DRM_MODE_ENCODER_TMDS:
> +		/* HDMI */
> +		shift =3D 8;
> +		break;
> +	case DRM_MODE_ENCODER_DSI:
> +		/* No MIPI DSI on A31s */
> +		if (of_device_is_compatible(tcon->dev->of_node,
> +					    "allwinner,sun6i-a31s-tcon"))

I'm not sure that test is needed.

We won't end up in that case if we don't have a connected DSI block,
which isn't going to be the case on the A31. And I guess we can tackle
DSI later (when I'll send my patches...).

> +			return -EINVAL;
> +		shift =3D 0;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	regmap_update_bits(tcon->regs, SUN4I_TCON_MUX_CTRL_REG,
> +			   0x3 << shift, tcon_id << shift);
> +
> +	return 0;
> +}
> +
>  void sun4i_tcon_set_mux(struct sun4i_tcon *tcon, int channel,
>  			struct drm_encoder *encoder)
>  {
> +	/* Get the device node of the display engine */
> +	struct device_node *node =3D encoder->dev->dev->of_node;
>  	u32 val;
> =20
> +	if (of_device_is_compatible(node, "allwinner,sun6i-a31-display-engine")=
 ||
> +	    of_device_is_compatible(node, "allwinner,sun6i-a31s-display-engine"=
)) {
> +		_sun6i_tcon_set_mux(encoder);
> +		return;
> +	}
> +

I'd really like to avoid mix and matching the structure defined
behaviour and those of_device_is_compatible calls spread out
everywhere.

You can either add a flag or a function pointer.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--fwfopzxho5wg6h5l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZyiQzAAoJEBx+YmzsjxAgqMwP/3tZVN7F6Xj3iCLDqmrB1jUk
hkXd4ZkpoZbU2o/HV0x4WgvkPaV4BKru89zxuefZO6OLsbK/Zt6RINy+JTL0jZss
0LdJu3JZplnZulU4BBUMvmjIIYNdz2MupubhWYOxkYZ6DAa5UAT4z8P5PzojXOPm
Rz+O5kQ6axk5mLE7tdYy0W2UZZX2JUnExDWqNekyxRNtLNWqAwxmOlPrsI0QmRK3
z9AgcC3xDISn/R25dughBVUCQTMmJAAWY2lkZpjY7rehtJmrqCgGqKNxnryVGJfG
k7RMZJYgli2tiTOTpm+J9sWLBn2G1IhOkwc6ETVmVvkocjm+AU/7fcfoCpTc0Rnm
d7hXXE5iTgPbE7gXHD/3wm4KpF8vRvmzAx4SSqWgbp1clOWw+DuH+mwo6rVrFSo4
kGmEGQPZCUWTYee3xBkz8mCh2ii6s+BYPdP7M8pYiqVZc6MS4P/q4cLENvF7WSdF
5rU4VG3juMMN9kd/Lz8Excqk3O3DBKvZeg0wXIiWPsX3W+Q0XZesUcFoEdcHysBU
ncfxxqWhBuCFBMg2kJ2OI4b+5tdLghrKSWueIWbIy28Yuh6h8hV/Ing8ISmFh6uG
XNxXPid+Nnd8QTOuZjRByrxh9oSGa/WdYMZW9p3y7875Rnp/+BiwY8VG7eRv5NKY
YcppixABuYLI24c/2+nD
=P+kw
-----END PGP SIGNATURE-----

--fwfopzxho5wg6h5l--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
