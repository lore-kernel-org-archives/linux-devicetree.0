From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1] regulator: max8973: add support for junction thermal
 warning
Date: Wed, 6 Jan 2016 12:18:57 +0000
Message-ID: <20160106121857.GW6588@sirena.org.uk>
References: <1452060922-24426-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wt10+cXOThorkX0z"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452060922-24426-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Wt10+cXOThorkX0z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 06, 2016 at 11:45:22AM +0530, Laxman Dewangan wrote:

>  Enhanced transient response (ETR) will affect the configuration of CKADV.
> +-maxim,junction-temp-warning: Junction temp warning on which device generates
> +		warning interrupts.

This needs to specify what the values are - it looks like it's raw
register values but I'd have expected from this that it'd be an actual
temperature.

> +-interrupt-flags: Interrupt flags for registering interrupt which can not be
> +		passed via interrupt properties.

Why is this being specified and what are the values?  Most devices don't
have this...

--Wt10+cXOThorkX0z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWjQYwAAoJECTWi3JdVIfQ7koH/3gFVEW6aerJ/Phss435CRBg
0qHc74KVubTyaD72nVpuhSi04HBWo5LWAX9yLjfd6waugJtEthx/It4kZBnFGurK
CM7Sc/5x99CZcO9Nyn0Y6EqO6BKIq7huLFJZHo1vvRc4F2SzmQOx+VbEnO8ARX20
/xg5FRUcfeOUPk0r/0bmEH4H1dOhk+P1VaJ9RX29QPjYCqWwjyqRCiyfDGqeyt8J
qG0jeAiK9ZftPzOdyHAn/ydqscCvdMLlCuEzbeSD0953xf3E7INgzlOuV/Mm9asU
QTyFVCmG8knWaYDfu2qQHrzKDb2c9ReI0MIMsOXe8ey+hZY1nzaBQBNmqTEoV6Y=
=zj6H
-----END PGP SIGNATURE-----

--Wt10+cXOThorkX0z--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
