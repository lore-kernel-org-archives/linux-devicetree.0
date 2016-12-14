From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2] ARM: dts: sunxi: Change node name for pwrseq pin on
 Olinuxino-lime2-emmc
Date: Wed, 14 Dec 2016 16:30:13 +0100
Message-ID: <20161214153013.bkdm3pu3osepfnn2@lukather>
References: <20161214145724.42745-1-manu@bidouilliste.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4jrqq6x2mmf5ugo7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161214145724.42745-1-manu@bidouilliste.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Emmanuel Vadot <manu@bidouilliste.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--4jrqq6x2mmf5ugo7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2016 at 03:57:24PM +0100, Emmanuel Vadot wrote:
> The node name for the power seq pin is mmc2@0 like the mmc2_pins_a one.
> This makes the original node (mmc2_pins_a) scrapped out of the dtb and
> result in a unusable eMMC if U-Boot didn't configured the pins to the
> correct functions.
>=20
> Changes since v1:
>  * Rename the node mmc2-rst-pin

That changelog should be after the ---. Removed it and applied.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4jrqq6x2mmf5ugo7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYUWWCAAoJEBx+YmzsjxAgqu0P/RpmCYo56YQ1Bvk6W1UHsxul
o+Cahf+hopfeOZbQDgUJlElxcfVphKm29f/EedSe1+6c83IeSvCihH6jimC1ZBBH
hlJxiPsPIqA9VLRCjdI8rWr3ZMadQJhmUraFbxfPitFBaekf7N80ylkxv3OhOyAc
n55pl+QScXj45C4fNRL3J77xthNNtyiJMo4OED9affzdsFWUk1GAIVRiu9wPNmEi
aRDtKfHS4QmC89Uvk/wMIPuvlN6IfGmln3TdzDmalKFFCaCDvgSskx6uY0xP0kK2
RmVTb4pQD+yDVknbhxp26Hw689LP6aCb13StEhii5JtJE49C5kHmfsomLgcagD1j
Mzi9QjMMi7nOjPfl7Cp+BYq7v8MX4gsccIUIbnczOLIQ/noGNL2ymt9HaXuf/ZmH
FLFJiZzeuyZfrI2oun29q9l0OG9fkOmP680OsmKVMWrZOYW4P+Rtyd3DHg++lTZa
3l+m0ZKKyX5SrFd4IwAz6C7bT6k2runqv9yCoZTmqYlNRKMixmVoeKXkEzOzNxCW
qPEjQ9yzjj267ih4FXsFB+dNZBKrgscKgNyEOlW+m8j2PuQ9NSOi8d2L2a4+NPAC
fOT4RUpGjnj+eWl5JtyPows6viZeoQCJ+0SjF0zRzzLdODUz0hU2XfZuh8bE/rU1
18JYzefVzvGkwYqRXgtA
=1XeH
-----END PGP SIGNATURE-----

--4jrqq6x2mmf5ugo7--
