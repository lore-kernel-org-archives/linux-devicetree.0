From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/2] arm64: allwinner: a64: Add Oceanic A64-5inMFD
 initial support
Date: Wed, 6 Mar 2019 10:27:08 +0100
Message-ID: <20190306092708.2pjc7uz6wvku4hkb@flea>
References: <20190226060240.8783-1-jagan@amarulasolutions.com>
 <20190226060240.8783-2-jagan@amarulasolutions.com>
 <20190227153346.dwd3stsbsvf7rwly@flea>
 <CAMty3ZDSZvaxMjcQJLNaTDJQ5OjJ9NbjpOJKWMUE5PhRCzYvqw@mail.gmail.com>
 <20190301145724.vhvyoqkkxdflg2g7@flea>
 <CAMty3ZCUSsN71Q5h_nj6de0Smhqht1S5zq0pLKUqpwq=85XqXw@mail.gmail.com>
 <20190305155919.cm3yrve3vqp7jimh@flea>
 <CAMty3ZD6Bsu7B6phhf4h7jreoM1uvM-ZQNCaUZKKa=1DNOtb8A@mail.gmail.com>
 <7AB137701821F94BAF7B06C1747BA691011A3FE123@OS01.os.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zu35ekksle4uxccu"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7AB137701821F94BAF7B06C1747BA691011A3FE123@OS01.os.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Ryan Pannell <ryan@osukl.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org


--zu35ekksle4uxccu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2019 at 04:35:04PM +0000, Ryan Pannell wrote:
> We don't mind if it has to be:
> compatible =3D "oceanic,5inmfd", "allwinner,sun50i-a64";
>=20
> However, to avoid confusion, might it be worth including the part number =
(We list this as '5205 5" MFD') so this would become:
> compatible =3D "oceanic,5205-5inmfd", "allwinner,sun50i-a64";
>=20
> Perhaps this solves the issue. Please let me know thoughts.

Yep, that works for me

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--zu35ekksle4uxccu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXH+SbAAKCRDj7w1vZxhR
xaCjAQDOfnwVi6nDufhbnd/fMht+7H+wUX0WkLNVOE9IzsRNagEA0KPa+PX96a5n
mJTjNUJrY+tuNcSuBhLyhTz8dOc5kAQ=
=BkSZ
-----END PGP SIGNATURE-----

--zu35ekksle4uxccu--
