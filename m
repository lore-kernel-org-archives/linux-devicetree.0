From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v5 22/39] media: Add userspace header file for i.MX
Date: Sat, 11 Mar 2017 00:32:23 +0100
Message-ID: <20170310233223.GD6540@amd>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <1489121599-23206-23-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1489121599-23206-23-git-send-email-steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TZNg+MwTxZMZA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> diff --git a/include/uapi/media/Kbuild b/include/uapi/media/Kbuild
> index aafaa5a..fa78958 100644
> --- a/include/uapi/media/Kbuild
> +++ b/include/uapi/media/Kbuild
> @@ -1 +1,2 @@
>  # UAPI Header export list
> +header-y +=3D imx.h
> diff --git a/include/uapi/media/imx.h b/include/uapi/media/imx.h
> new file mode 100644
> index 0000000..f573de4
> --- /dev/null
> +++ b/include/uapi/media/imx.h
> @@ -0,0 +1,21 @@
> +/*
> + * Copyright (c) 2014-2015 Mentor Graphics Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by =
the
> + * Free Software Foundation; either version 2 of the
> + * License, or (at your option) any later version
> + */
> +
> +#ifndef __UAPI_MEDIA_IMX_H__
> +#define __UAPI_MEDIA_IMX_H__
> +
> +enum imx_ctrl_id {
> +	V4L2_CID_IMX_FIM_ENABLE =3D (V4L2_CID_USER_IMX_BASE + 0),
> +	V4L2_CID_IMX_FIM_NUM,
> +	V4L2_CID_IMX_FIM_TOLERANCE_MIN,
> +	V4L2_CID_IMX_FIM_TOLERANCE_MAX,
> +	V4L2_CID_IMX_FIM_NUM_SKIP,
> +};
> +

Should this #include something so that if userland includes it, it
will not get compile error?

Should there be some documentation of userland API?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljDN4cACgkQMOfwapXb+vJ/xQCgjTZD9Q1WUd1lCNyLHB1cw5G/
M/0AoJ8HYtrzVS2KkBgWcN12g/SFLAdq
=8WnM
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
