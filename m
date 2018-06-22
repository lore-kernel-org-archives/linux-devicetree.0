From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] arm64: allwinner: a64-sopine: Add cd-gpios to mmc0 node
Date: Fri, 22 Jun 2018 09:41:43 +0200
Message-ID: <20180622074143.kaobrlvqplq25gry@flea>
References: <20180620093055.10928-1-manu@freebsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="shrrj3he6isqmzjs"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180620093055.10928-1-manu@freebsd.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Emmanuel Vadot <manu@freebsd.org>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--shrrj3he6isqmzjs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2018 at 11:30:55AM +0200, Emmanuel Vadot wrote:
> The card detect GPIO for Sopine and Pine64-LTS is PF6.
> Add this to the dts.
>=20
> Signed-off-by: Emmanuel Vadot <manu@freebsd.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--shrrj3he6isqmzjs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlssqDYACgkQ0rTAlCFN
r3QH+BAAhZchcfL4tkTEe5+AitB50zpXGUyOSiQ1s7Mr86YDSliI8eNS+R3/KKUT
XumhwGexwJUAq47Mh3tNhT2yurVb52wDl4x5h5yNcWChYcG0zi9NvfImjxKprqd6
8dTJ9v3xnIQdgwRllaOgonNVCaVUdXp+7LA1yeb0yes5EcpJ8vk7lMCUMZIotMEk
fCVSJcCLMIBeqggH9QzDSvIefO4VuVyWVyWzav7ZhD89Il8fSvxa3209D05xLsTH
XMQyHnRFn2gFMSxYIVIq1G+/iQF24et2tjKoXAOQavLdqw4BMl/qZJVyWLDgwWOo
hzXl3qZNWadiakd+cmYalZkuzD8aUKyb0Nrg9y5uRl19yC1HapqaUePrO06AFh5M
dGWSPXiCtycXvLgiGYK3ju1O7XBMID6Ndl2dXS+qHjMpTkfRiHS5rXhFSyj/ctYR
x6wa+p8/e/jEB8UTIbGKYdMJDzFfsbePX72laCa3ScAYfqdeFP7KfHtTXclNjCUC
j25XzWxHeMUrpXbIBWYh1P1GKu6dm9wQJBGUcPM5MuXNp61o2SVZuAVfRU8atFtO
VUvoTdVtw10Y3dH15Nz4TA4H8EwQNK4Doww6cdYNWlvrDx/hWgFY0/QhyLwNFIFG
R6JJTTw/3wfW2Cwc2LrDP1VmIWELRQMYOefIRKq/f45+3ZY59bw=
=RgX7
-----END PGP SIGNATURE-----

--shrrj3he6isqmzjs--
