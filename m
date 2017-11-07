From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/1] add rgb888 pins to a20 to enable parallel rgb LCD
Date: Tue, 7 Nov 2017 14:03:31 +0100
Message-ID: <20171107130331.4wut5g6znzakkg4z@flea>
References: <1510058999-6778-1-git-send-email-giulio.benetti@micronovasrl.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qbltaszgd65ufodu"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1510058999-6778-1-git-send-email-giulio.benetti@micronovasrl.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Giulio Benetti <giulio.benetti@micronovasrl.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--qbltaszgd65ufodu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2017 at 01:49:59PM +0100, Giulio Benetti wrote:
> On sun7i-a20-* there's no way to enable PA00--PA27 as RGB888 LCD0 pins.
>=20
> Add lcd_rgb888_pins in sun7i-a20.dtsi.
>=20
> It can be used on sun7i-a20-olinuxino-lime.dts.
> This patch gives possibility to set parallel lcd pins for RGB888.
> To be used with tcon0 in your <target>.dts

My question was on which board do you want to use it right now. If the
answer is none, then we won't merge that patch, we have too many
pinctrl already to not add the unused ones.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qbltaszgd65ufodu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJaAa8iAAoJEBx+YmzsjxAgcX4QAIYiQR1Lq9OMrC45tD94Yn6M
wD/wqmv/YPFK5yXRyYVQ33Zsl1g/n8seTbfkEpejWVo17lqofzxX5qOdF4l2Eq7K
QN085IBSJynlhe1YutCjXqKuNSQG9WQgL/gjxnmYmgKGCMQ9PjDbNIcYs0ULzEqV
/5pnIvsO3ReLZB397/E1a+r6rIPEq2Lrwgh1X4DUsjSN5xK00PPUnaSVHcsbinMC
Tndo8o1qlg5cHyjXcfRKvXElqyBUs03Fng4Og/8vMguPptr3aXSUMNxHcZLYJwi9
QtwBdmZVW0jNE/Fb+tqKNI0QBhNW3NSaW+0eUif1PAvTRNyW2Zn5pgGQFFET5mB7
RtNp9YZKZbPCdJQa1Aa/dY2DiK9PX8uzfgDZCjvUy5izsnyFr34wk6KRohz8GPrk
EZdsOZF3gXGnqq0yeLfb7HQ4bBbhowJM6Uemvf70qNAcr7MaUIfmvnj/ootLyUtv
VtnTHHKlIfPGW4Sf6RD/T1DDuGRuQKkVYf/CF5E9M6tANUtznPlh2fUPHHJ//m+9
J0GNU7g6Bj+heF3XzwEjG3LStAGYKU+TGvuzb3bIfD5kcG/X/6yL8+R4E+zqzuGx
Lfaap4YcaI7EsyeTbgm25P6/VGHUYxdCmZxIUCQ8V75R7IbhpX8HykNosf9/ohZt
I2AQHHgdWF6VbyNMma0N
=otEV
-----END PGP SIGNATURE-----

--qbltaszgd65ufodu--
