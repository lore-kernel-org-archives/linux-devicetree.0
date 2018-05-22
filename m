From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2] ARM64: dts: sun50i: a64: Add spi flash node for sopine
Date: Tue, 22 May 2018 16:27:00 +0200
Message-ID: <20180522142700.ugjpcbajxx4n2n7x@flea>
References: <20180521115413.92070-1-manu@freebsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="thwmgyutocwjxhog"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180521115413.92070-1-manu@freebsd.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Emmanuel Vadot <manu@freebsd.org>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--thwmgyutocwjxhog
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 21, 2018 at 01:54:13PM +0200, Emmanuel Vadot wrote:
> The Sopine and Pine64-LTS have a winbond w25q128 spi flash on spi0.
> Add a node for it.
>=20
> Signed-off-by: Emmanuel Vadot <manu@freebsd.org>

Fixed the prefix and applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--thwmgyutocwjxhog
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsEKLMACgkQ0rTAlCFN
r3RWARAAjLJYiAJkN+Edt4QFd2LqfSB39QbGfUNuRgB4Dop1qr1HMD6B14+dYd4U
3Pv3XUMF6nEHVftufiJpVmE2nThl3LkRGxn3BGCKDkXazIlG/+DnASFwkM1HDIgz
cPi0MUsp88SGyIBLHj/Z9VfWOaHcVqsvBobUMtqteV8kaC9dzC1pQg04C0MYYk0V
FfAD11VWU1AOaRcTlowb1I5rFG2NwpaCLLBc4JdZ4rNefUFLnKxSBtq/enJ8dxoE
WrMbEtjcpkLRHmAl3zwvhcDNr3ODZ56bEVK/RtYBYkFItgxmsah23f4kktlGsAm0
bwyi2SqQDMRdIZobHs72Rc4Zo1ASM/IHW1PGyfXbxt68/nhGOY9cPxF345YFgyT2
X87RYGT8LXc0H1vFBsl6qi9FZu4X4xI7uQTSqcXzQlsNtoCSXUO/5CK4Uz35e3bb
tdpR3ExrRiLfxVrPH4STxqXNkt36HGgQOtfqlTY7tk8kLHRMEAr2JdL53l6eCFWZ
bzku+9EHKgJsQRbSfv6mGkvk2oxJMmU4J7aWzBa58/+sdINnSA/4e3SYoZia8EMe
W7zUP5UWxQStzAtYiPDUQCKEFr7JHomBscJ73zictyCvuENpDxT3/vUEd2DYz3Kb
WaSUJXeCbp6wTk77cleGfoyYoSmEpL29KbpYYsS3jnCjSFYatDw=
=zfa1
-----END PGP SIGNATURE-----

--thwmgyutocwjxhog--
