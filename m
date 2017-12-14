From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 00/15] drm/sun4i: Add A83t LVDS support
Date: Thu, 14 Dec 2017 09:37:49 +0100
Message-ID: <20171214083749.cy72egte7lru24nb@flea.lan>
References: <cover.e46a07c0e181d735c807dc94fe0ce0ea013788be.1512662253.git-series.maxime.ripard@free-electrons.com>
 <20171214070157.rqx4tfpluzaqmtxu@plaes.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="e7hn5q6vr45gzn3k"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171214070157.rqx4tfpluzaqmtxu-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, jernej.skrabec-gGgVlfcn5nU@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org


--e7hn5q6vr45gzn3k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2017 at 07:01:57AM +0000, Priit Laes wrote:
> On Thu, Dec 07, 2017 at 04:58:45PM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > Here is an attempt at supporting the LVDS output in our DRM driver. This
> > has been tested on the A83T (with DE2), but since everything is basical=
ly
> > in the TCON, it should also be usable on the older SoCs with minor
> > modifications.
>=20
> I managed to get the single-channel LVDS working on an A10 tablet after
> doing those minor modifications (although, the colours are off a bit).
> So in general this series looks good :)

Is that a Tested-by? :)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--e7hn5q6vr45gzn3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAloyOFoACgkQ0rTAlCFN
r3Roow//QsfAP+DAOtFPAb4JSkeqqnLofabe4Fyc2wxnDH1YqV676HxEQaYE3RTx
fQglP2OHPqa7PQgNWDYHvQTXO3yabyJ3/MGlVqA5FgOJfhQhS5ce8kXJJ/lqpOhN
lBFGRYf5wCoz7fWeGBpym04DfkzfcSNNa0vvQcSAf2DmKyM65uQTp6CSLC2hTrSt
I/gI3BcBOx59+J7A8D5bgdF3ez4dgo6BpwHt3lgmKKQrUSbPXYtbp7h1GM66UCHq
tCOscQUx1furhs3iuCePlABpFLiR1HGF1aHSSy4yo2vLJgHBnGFTUroMkqYEXPt1
g8jlSJcKsoAuEE4JO8NhJMJBW3dD9l63VXmOU3lV/OLSOct0VO3sTkeJK9JmZ1RW
j4X1B731U7arugoaSOJAblth7LCUbX7zWPKIaYY4GTA1PtAXf+KXTfvWTSgPJqpv
tlnjvLPhllXDxLdHb911BOf39z94n1v+z65NOWBjaZGOa0aH5qxywcDFERGz6C2W
VwpVPj1EcECT85SIHJB9DR0kc3PPPqE0sK8L3IXoAcaXX3L/blRf6jYVpyfB1Ruc
HPX70SJDiCuaY6jrRnDX6x1hSfYsZgGpOK8BkV/kIl6yYiGRMvp558jnLVgqr1jJ
j7oIEAP3Q+FIR0RTeFYx6mjpGyhQtnJa6jGWh5ZrYAZ8yaJzmkE=
=mpn1
-----END PGP SIGNATURE-----

--e7hn5q6vr45gzn3k--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
