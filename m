From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 3/8] dts: sun8i-h3: move uart0 pinmux/peripheral
 assocation to DSTI
Date: Thu, 8 Sep 2016 08:22:15 +0200
Message-ID: <20160908062215.GC8913@lukather>
References: <1473235141-12768-1-git-send-email-jorik@kippendief.biz>
 <1473235141-12768-4-git-send-email-jorik@kippendief.biz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PuGuTyElPB9bOcsM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473235141-12768-4-git-send-email-jorik@kippendief.biz>
Sender: linux-kernel-owner@vger.kernel.org
To: jorik@kippendief.biz
Cc: wens@csie.org, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--PuGuTyElPB9bOcsM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2016 at 09:58:56AM +0200, jorik@kippendief.biz wrote:
> From: Jorik Jonker <jorik@kippendief.biz>
>=20
> This is the only sensible pinmux/peripheral association for uart0, so I h=
ave
> moved it from the board specific DTS to the DTSI. It is still up to the b=
oards
> to enable it, though.
>=20
> Signed-off-by: Jorik Jonker <jorik@kippendief.biz>

There's really several options for the UART0 to be muxed, so it's
better if we leave that to the board entirely.

That's useful only for pins where you truely have only a single
option in the entire SoC.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--PuGuTyElPB9bOcsM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0QOXAAoJEBx+YmzsjxAgMIcP/iUSAWdHzB/LrTOlN733lAkz
LqZzIc5SQ+QvXSYlG8j6FlXBJUKbpFJTLVHGEW6YBCmVzwyeljtdl9rJrg9IYFmM
Ok60U4IDUU3i2W6991TV0iySLAI1KGy/xwHDfG6XHPh9keWAAuhbr1LZkCVeMbxT
Qok9Scf+2IqdVDf89S3mzFNiXHtygkIJ9sEFztIUzufZ60ksNJv296q1L8EcBOn0
p31bLe+5sTVpnUQTgCHkL6pGdGJ2NWIkvT7k2mCL4QZBgrWa51BaV8poVxVZx5xS
Bj/5r42wVL8z3bfWUXvGFgCZDo9c4GW4tnfJ3PrLUyIzx+wukIwu89u2X/p0l4/F
Hrgm11M5e3WoMQav7FGKLSQwRP5toYX+CUPEf0gDyH1nKR4Dj4XPud9QUngDN90Q
HfJvTLjMH9eUH8ThDKwKq2latzG8/gbqYRXhFdhOhKao470tXrXistltdKKu3bVl
ptHMZzzuXFWhyOl+JAyk720TslPOw2XkwifVyLLWZqcx8piczeQSNzli8WAfwzYC
QaBg81KZtCDfNphQgaQOLG2hSk7mizXavJIAHI6j0xkD1LD0UX+S/tjoJXPWa5hw
GC0FOJJF6b2pa+mVvenQidP1+Rlos510FMLr03klURya+gSSgbYvrNwsU0vsYLIk
JCcmm58tqiw0PjTUve6Z
=fxzo
-----END PGP SIGNATURE-----

--PuGuTyElPB9bOcsM--
