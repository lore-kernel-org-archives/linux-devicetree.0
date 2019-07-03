Return-Path: <SRS0=cIVi=VA=bootlin.com=maxime.ripard@kernel.org>
Date: Wed, 3 Jul 2019 16:13:00 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 3/7] dt-bindings: net: mdio: Add child nodes
Message-ID: <20190703141300.duhk2qj3m5qpkp3h@flea>
References: <20190703095513.12340-1-maxime.ripard@bootlin.com>
 <20190703095513.12340-3-maxime.ripard@bootlin.com>
 <CAL_JsqKgBXxbg_9ZKfmj6y0s_5Z5QZw3RmdJfSHEpjh84m9brg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t3vspt6dpabgj43y"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKgBXxbg_9ZKfmj6y0s_5Z5QZw3RmdJfSHEpjh84m9brg@mail.gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--t3vspt6dpabgj43y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 03, 2019 at 07:53:43AM -0600, Rob Herring wrote:
> On Wed, Jul 3, 2019 at 3:55 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > The child nodes of a mdio bus are supposed to be ethernet PHYs, with a reg
> > property. Make sure that's validated as well.
>
> I don't think this is always true. I seem to recall there's some
> timestamping devices connected via mdio.
>
> In any case, it's not a long list of names, so we can probably just
> enumerate them as needed. Does this generate any warnings?

I did a run on both arm and arm64 Allwinner DTS, and it doesn't.

I can do one on multi_v7 / arm64's defconfig, but that's probably
going to be a bit hard to tell from the noise of warnings.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--t3vspt6dpabgj43y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXRy37AAKCRDj7w1vZxhR
xVpzAP0QfgtmDLDgzAxLUAk40JbOCuA7vYsWKx9boQv2Joq9YAD+NSZ/8cEK5r0C
UTO6FEbNY9ZrSWPe9DuBwUTtbC8g3w8=
=TelY
-----END PGP SIGNATURE-----

--t3vspt6dpabgj43y--
