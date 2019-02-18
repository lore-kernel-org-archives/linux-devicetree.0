Return-Path: <SRS0=m5NJ=QZ=sirena.org.uk=broonie@kernel.org>
Date: Mon, 18 Feb 2019 18:01:08 +0000
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
Message-ID: <20190218180108.GE10794@sirena.org.uk>
References: <20190216174859.15738-1-marek.vasut@gmail.com>
 <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at>
 <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com>
 <E1gvNOx-0000Kc-Dc@stardust.g4.wien.funkfeuer.at>
 <75846117-242c-6861-ace5-dccf88711208@gmail.com>
 <E1gvSbw-0000K8-Hj@stardust.g4.wien.funkfeuer.at>
 <7a993282-9137-caf4-ca0b-b2c01ea9959c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h56sxpGKRmy85csR"
Content-Disposition: inline
In-Reply-To: <7a993282-9137-caf4-ca0b-b2c01ea9959c@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Harald Geyer <harald@ccbib.org>, devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--h56sxpGKRmy85csR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 17, 2019 at 10:57:26PM +0100, Marek Vasut wrote:
> On 2/17/19 9:00 PM, Harald Geyer wrote:

> > If this is the case, why would we need to set an initial state instead
> > of just waiting what the first consumer requests. I still don't see
> > a use case (aside from don't accidentally shut down something important
> > during probing).

> Possibly to prevent a state which might be harmful until the first
> consumer comes up. However this is rather theoretical.

This is the GPIO API restrictions again - there was a big push at one
point to try to ensure that we set the output state when requesting
output GPIOs, and a lot of the time requesting will set a state anyway
when it puts things into output mode so it may as wel be one we know
about.

--h56sxpGKRmy85csR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxq8uMACgkQJNaLcl1U
h9BrYAf9Gp7it3E9GdzB1w2s8DbV0dGv8pDScXg/DRT+V3BqE57PWEc2xYTPSDXd
ZjzZH2Vp6oX0sPR2xitBnOeac/Ohv23UsRwCLmYXUtv4FeEfQLHU+zzziab+h9ko
7nURAJcfhXFbZKA/XEq266V5+S7tB7SzF/3hx+ziyAfJEnKGYcgHxkzknHVIpcll
n6+7cXIxWetvS2W/dzu/cDV7l+ucQDMn4fSu/AXxGCxbFMrpNd/ls/JLS+StOgfq
d2T5CTr8zlm4nStr5XftCAdWZ9NNeSSq1V/csQZhBOUgqtLJt6oOn4Fdm/IG+Iak
PQFtWGduWTX6AZ3jym8fcpaxXjAnMA==
=PZkU
-----END PGP SIGNATURE-----

--h56sxpGKRmy85csR--
