From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] arm64: dts: allwinner: pine64: Prepare optional UART
 nodes with pinctrl
Date: Wed, 19 Apr 2017 16:52:29 +0200
Message-ID: <20170419145229.esqvco3clilqk776@lukather>
References: <20170418053458.phcbp4da3vatejpg@lukather>
 <20170418192538.24174-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gcuhdq3rtrzn43o3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170418192538.24174-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--gcuhdq3rtrzn43o3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2017 at 09:25:38PM +0200, Andreas F=E4rber wrote:
> Pine64 exposes all A64 UARTs, not just UART0.
>=20
> Since the pins can be used as GPIO, don't enable the new UART nodes by
> default, but prepare the pinctrl settings to aid in activating them via
> overlays, i.e., overriding the status property of &uartX nodes.
>=20
> For UART4 (Euler) the safer route of not including RTS/CTS pins is chosen,
> whereas for UART1 (Bluetooth) they are included.
>=20
> Add the corresponding pinctrl nodes where missing.
>=20
> Suggested-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Signed-off-by: Andreas F=E4rber <afaerber@suse.de>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--gcuhdq3rtrzn43o3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJY93mmAAoJEBx+YmzsjxAgHssQAKTF8W9rsJDZU0qgZkOhHUif
EVHkJkTN6c7UeJuHezqeG78jH3T9w7L2fZNAsZZ7A1/ZfANXnEKa60MsV7vLscOF
YldBVvn2/bl8OG4cBctBLEJR3MfUCYWxJMZYpbtfnQWleb/1XzLhuGrcFE25PJ0L
/4/xNaaBfTXCQo/CV5wXdnLK935SxjicpDDtBywh8coGMzS2lWiFO/S6rDHNf8Q+
7ZFH+UwNASIlI8hc86D1udfDGiR166uRPN9yei3WgRJ4UmuVp7UsD7dtS1x/D7GI
c9QkXdyVGF6joA+BW+tZLDfkFnw0kXKvyhFUlEOc4x4pSwWVg12dESBVhXmA1Bw/
PBBUXW77AvTCM/KpajFeL+ZB5dGEb7dQf1V1OqC2HYLPBZgRC+i09JH3s2+jjab2
aVOlH3Zs9OaSDdE7dF4rAJQsZFVODtV2P3nSUUsS+5CmW35vqZ0S+8x5eRJwhEyh
UH/ts5u+tfrbMjrgiXOn9mCtd5AFjSkWXaelUMIdUlIiFSSryCM0q2VjU5FHqFno
ljB26vax8AsqUFjeyFkW3XJDMr/XAPwVklITfXhXvz+HzRe3MFDLXrOi0sh2Uk8S
JukZgDfzxoCYaVIIXN3Rwcng681GneBwdMFwUVuPw1G0g/yGd5aZRmA88bS8MDed
unJ2qI5uibLpgU/MpGdl
=h9w0
-----END PGP SIGNATURE-----

--gcuhdq3rtrzn43o3--
