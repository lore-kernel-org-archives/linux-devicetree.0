From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 1/4] arm64: dts: allwinner: a64: Add SID node
Date: Mon, 30 Jul 2018 10:26:31 +0200
Message-ID: <20180730082631.es2fbqce5uabi5jc@flea>
References: <20180727115205.20955-1-manu@freebsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gu2eabfhidk4tilw"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180727115205.20955-1-manu@freebsd.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Emmanuel Vadot <manu@freebsd.org>
Cc: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--gu2eabfhidk4tilw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 27, 2018 at 01:52:02PM +0200, Emmanuel Vadot wrote:
> The A64 have a SID controller which consist of EFUSE (starting at 0x200)
> and three registers to read/write some of the protected efuses.
>=20
> Signed-off-by: Emmanuel Vadot <manu@freebsd.org>

Queued all 4 for 4.20, thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--gu2eabfhidk4tilw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAltey7YACgkQ0rTAlCFN
r3RGMQ//a7/Pzi6IclTBAEJiQeaoMfgwEZWiKIkj2/uUfmiVEUi/3wrYMNlfN96R
FK2uPANsvpfTMZLmbu0g+TrEEfDObC1c02m2yvv0EVFcB2x/UhzG4w/YDR2nzqjl
bh2Fvfe8o+qdWE9FEZWWxa3M1xPwBxAMPZTGEjntS9IX1FJ1DQKlSrg2BApooqi2
F6IoXas8yMzkjYehtIda6f9n3eqpEo1A3SrRDObapL5qnsJQUBatNcreyp7TnUv/
2+E2Tz3QsBkr92NRqjuOyMB3GYRH66vZVEVol5T5tJi2Y3vw17RjFzdPH/gSt9ww
pHUOp6AQB7T/d5EvsIKDCqOPhJmrvHvlfVgOIcgrL7vGrD/lNoA1bP0jJ5cb38d3
Sxg7sAqedzpTZZjr31gxtogxBbZpuLgD5/myDRenTM7BO1N819exbCsox76s7ptL
vGB4/an8gOH9z6d2inoGzsG0zV8acqG1X1EvOCmNLJ+zqS8CBI707Jd/l4kUwGTy
FP4Ntxd/43vBv0VqINE1kHMf9uiqoZjCVMwQ7eQpdKdnvtPpXQ19ZivlmjQMeET2
QRLPedo0OWbPntIsflHgIDphEl09F8zIgyUQ2YoQLo70ben8khOOjcU+Tz0PSlKs
FLjIAveQDhWC9aGruugBpSkCd2FMMXhFPj8UYjc2kVLkFtJ3tJM=
=Z+Jb
-----END PGP SIGNATURE-----

--gu2eabfhidk4tilw--
