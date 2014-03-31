From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] dt: bindings: add bindings for Broadcom bcm43xx sdio
 devices
Date: Mon, 31 Mar 2014 17:10:42 +0100
Message-ID: <20140331161042.GW2269@sirena.org.uk>
References: <1392059868-8782-1-git-send-email-arend@broadcom.com>
 <52FC8CB3.4090305@gmail.com>
 <52FCB571.4020904@broadcom.com>
 <52FCBC1D.7050501@samsung.com>
 <20140213162249.GT28112@sirena.org.uk>
 <CAPDyKFpU=nQAgfjMm6KNRAEKwChAx_SxFMC-pLbq8yis2mgB=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y88ZgXPnK3pWvLGs"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPDyKFpU=nQAgfjMm6KNRAEKwChAx_SxFMC-pLbq8yis2mgB=Q@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Y88ZgXPnK3pWvLGs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 31, 2014 at 10:24:00AM +0200, Ulf Hansson wrote:

> Using a gpio regulator would simplify here, since the driver don't
> need specific "SDIO hacks" but can use the mmc_regulator_get_supply()
> API, which calculates the OCR mask, based upon the regulator's
> supported voltages.

If that makes life easier the driver could also just instantiate a fixed
regulator itself rather than requiring that one be put in the DT?

--Y88ZgXPnK3pWvLGs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTOZN/AAoJELSic+t+oim9AkYP/RqfpNxK6cszxBAoBuMaYWbA
XjO5rkRzW3reFjkLAm4H1eEMuUG2kGq1hKtEzB5Ou1AWhSSkq15jpD+rI+OdG3js
R6ZWjkgpebGp250+1oxvgRnGSdbb807OXDINjBkZ3BPHcSIhdVhr9PGnXH+rH2io
YQjZ6A5nFBNAXYkVyIKQSKXb6JWZJHyM1j+7/7xrTmCUoLESNnhgKmPkF98xD2lc
hMyzdSLIMO8DRLF04O7BJQ+nUZ4Zi6DZYDzbOV9zShkLPF8qbXfthLE3pGLCvX4t
larAApYd87tBkfsfzhZLxBjeI7cjhlK9SrrQv5WgqioU9Y4EynfiKHSEX7s8fyOM
yDOtX3FbK7AT/Teysvyc5ePiJx55fUOz6Lr2BBQN16r9CuYBKtglZKaoynqPBZBH
TA9/NBYG13xuLWot5b9CcXsGeJ4VVmH7nAmzW+0NDLJE5s2phlVEnrcEwTc3Pj1J
8OkWgZ/GWuGlqNBILHH21nuAtUhZ83g3d7bBU2j1tH354JlkAK4/dtInYgpS94uQ
Z9wMwY/MS5KdeDxAcZAJVehu45ICPNXybBQ3idC1TRbWJzuZ9GtdpAdtho8ekfdh
lwNbowQ7xjER/u1+sTirEvTrMCe3kTrq9F3L+8RFgqMnJr1/lhyQRSbkDPBMBJM6
e+SZc6T9J4Hjqjehxpxm
=2aUg
-----END PGP SIGNATURE-----

--Y88ZgXPnK3pWvLGs--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
