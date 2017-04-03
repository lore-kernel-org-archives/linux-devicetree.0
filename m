From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 05/11] drm/sun4i: abstract a mixer type
Date: Mon, 3 Apr 2017 10:24:49 +0200
Message-ID: <20170403082449.kyf5dq35nkupd2r7@lukather>
References: <20170329194613.55548-1-icenowy@aosc.io>
 <20170329194613.55548-6-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cvwhnxoeo4e44auw"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170329194613.55548-6-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--cvwhnxoeo4e44auw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

That's much better thanks, but I have a bunch of (minor) comments.

On Thu, Mar 30, 2017 at 03:46:07AM +0800, Icenowy Zheng wrote:
> diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/s=
un4i_crtc.c
> index 33854ee7f636..938dfe7188ff 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
> @@ -25,11 +25,10 @@
> =20
>  #include <video/videomode.h>
> =20
> -#include "sun4i_backend.h"
>  #include "sun4i_crtc.h"
>  #include "sun4i_drv.h"
> -#include "sun4i_layer.h"
>  #include "sunxi_layer.h"
> +#include "sunxi_mixer.h"
>  #include "sun4i_tcon.h"
> =20
>  static void sun4i_crtc_atomic_begin(struct drm_crtc *crtc,
> @@ -57,7 +56,7 @@ static void sun4i_crtc_atomic_flush(struct drm_crtc *cr=
tc,
> =20
>  	DRM_DEBUG_DRIVER("Committing plane changes\n");
> =20
> -	sun4i_backend_commit(scrtc->backend);
> +	scrtc->mixer_ops->commit(scrtc->mixer);

The caller would also have to care about whether that pointer is NULL
or not. This is not really a big deal in the commit case that I expect
to always be filled, but it might be for the color correction.

How about defining some inline functions that would check the
mixer_ops pointer and return if it's NULL?

>  	if (event) {
>  		crtc->state->event =3D NULL;
> @@ -135,8 +134,8 @@ static const struct drm_crtc_funcs sun4i_crtc_funcs =
=3D {
>  	.disable_vblank		=3D sun4i_crtc_disable_vblank,
>  };
> =20
> -struct sun4i_crtc *sun4i_crtc_init(struct drm_device *drm,
> -				   struct sun4i_backend *backend,
> +struct sun4i_crtc *sun4i_crtc_init(struct drm_device *drm, void *mixer,
> +				   const struct sunxi_mixer_ops *mixer_ops,
>  				   struct sun4i_tcon *tcon)
>  {
>  	struct sun4i_crtc *scrtc;
> @@ -146,11 +145,12 @@ struct sun4i_crtc *sun4i_crtc_init(struct drm_devic=
e *drm,
>  	scrtc =3D devm_kzalloc(drm->dev, sizeof(*scrtc), GFP_KERNEL);
>  	if (!scrtc)
>  		return ERR_PTR(-ENOMEM);
> -	scrtc->backend =3D backend;
> +	scrtc->mixer =3D mixer;
> +	scrtc->mixer_ops =3D mixer_ops;
>  	scrtc->tcon =3D tcon;
> =20
>  	/* Create our layers */
> -	scrtc->layers =3D (void **)sun4i_layers_init(drm, scrtc);
> +	scrtc->layers =3D mixer_ops->layers_init(drm, scrtc);

I don't really see why we need the mixer and ops in the CRTC, we
already have it in sun4i_drv, don't we? Can't we just use that
instead?

That would allow just like in the previous patch to loosen the
relationship between the CRTC and what's before it, which will make
our life easier down the road.

> diff --git a/drivers/gpu/drm/sun4i/sunxi_mixer.h b/drivers/gpu/drm/sun4i/=
sunxi_mixer.h
> new file mode 100644
> index 000000000000..11bdd20269ef
> --- /dev/null
> +++ b/drivers/gpu/drm/sun4i/sunxi_mixer.h
> @@ -0,0 +1,22 @@
> +/*
> + * Copyright (C) 2017 Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of
> + * the License, or (at your option) any later version.
> + */
> +
> +#ifndef _SUNXI_MIXER_H_
> +#define _SUNXI_MIXER_H_
> +
> +struct sun4i_crtc;
> +
> +struct sunxi_mixer_ops {
> +	void **(*layers_init)(struct drm_device *drm, struct sun4i_crtc *crtc);
> +	void (*apply_color_correction)(void *mixer);
> +	void (*disable_color_correction)(void *mixer);
> +	void (*commit)(void *mixer);
> +};
> +
> +#endif /* _SUNXI_MIXER_H_ */

I don't really like the "mixer" name here, and backend doesn't seem
appropriate either.

What about "engine"? It sounds more like it covers both cases.

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--cvwhnxoeo4e44auw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY4gbNAAoJEBx+YmzsjxAgFiMP/1hktrfovV6uCHuF80QMM2Sh
nB+PwK1FcQjdB9TFlT1CgUobabGOWrwRPon0+HxR3Sz2KN87O9m+BDNoYTSkPdtu
iyD6AS0HxTAyIkKp97CEZ8sH8ye8u/p51uVcJzlhp++g7oGjqkpXUTpf0bC2/S1/
0xbmQxXrZuexoIJi3FWxIL7cJVZfaeSy4ZUhOdvzRV4t1k0gF8suGQGiHMw54DmQ
7elVml8veie5Fy1g5JUVf/SumhPZid5fli7T6kpLPIYBHjKkZBFtd/JEkE8cS6nm
IAp17MyLr81Hz1TeKgOUyfD9TPKz8cj92OqYPKmW5l9TpOoPq6a8ms4XKflyY4gC
jBquxRLTGQRNWIm3Z8f6CL+EvB+hrAj/0OB7ZNUercoYdLujbsh0GrBzMNz37TOO
B8tskJmh6ADJ3OXxintNkfP2GcYOzmsRhnMQmxHaCskBap8AhbTZ8OEcWjIrjZWp
0qwbH6V7s/bPUC5EuhdIE4nrToFJaS/AItzJPH0lYI04XRqj2x/PmU8R0FwUWdtM
oCKTQ01T/0PHujhUi7qWt7vHTTPZY/eRlQCbjrNrboxneMRMh6DtvkSXAAPz6r/9
JjSGhBphelsrphijeVx83KNuKOJq1IcG9wueEQnv3WN0kXEzMM53YeVwaMAE0mN8
dbJEz5NnklaGQmcIkkFG
=fr78
-----END PGP SIGNATURE-----

--cvwhnxoeo4e44auw--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
