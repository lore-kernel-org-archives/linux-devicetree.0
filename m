From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator, dt: add dt support for tps6502x regulator
Date: Wed, 21 Oct 2015 17:17:32 +0100
Message-ID: <20151021161732.GO32054@sirena.org.uk>
References: <1445236033-27747-1-git-send-email-hs@denx.de>
 <20151021121925.GC8232@sirena.org.uk>
 <56278AA3.3060109@denx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Eclf2LUqbhpvYoNt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56278AA3.3060109@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Schocher <hs@denx.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
List-Id: devicetree@vger.kernel.org


--Eclf2LUqbhpvYoNt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2015 at 02:52:51PM +0200, Heiko Schocher wrote:
> Am 21.10.2015 um 14:19 schrieb Mark Brown:
> >On Mon, Oct 19, 2015 at 08:27:13AM +0200, Heiko Schocher wrote:

> >If this file is needed there is something broken, if this file is not
> >needed then it is just noise since everything in it needs to be
> >overridden by users anyway.  Either way please remove it.

> Uh, I thought to do it like:

> arch/arm/boot/dts/tps65217.dtsi

> but, okay, removed.

That too is broken and should be removed :(

--Eclf2LUqbhpvYoNt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWJ7qbAAoJECTWi3JdVIfQiv0H/2cycPlNqM/RbITdvu5Q02SS
i7lz6LJgGRGKIYECbVPjOK1txE04CB/G6djiLi/V4GCUWgb0k5DusDuybRW/54Iw
5i5jSCde/lj8SHchWo8GyBPI9q0lWvNRxlF14v07CO+2GaFhhmidbQtIAjvllTHe
Ii4nr0qVt8Vko0Qe88PcLuVdlb5EnoNTd7P0Xf2k94/Py4tl+cUgzEC6h155xIA5
S7PjifAt53MQFQsbJRfBkrich4VsgIJ/Lc+W8WpoM72LzdtaxwrIn10w6tAaw2Su
t3goC+MlTrMN5cZ1SLpwP0vS3FtoQgTpa9/iuipa5bttvgGVjr7SH/oIuiepvhw=
=Zlox
-----END PGP SIGNATURE-----

--Eclf2LUqbhpvYoNt--
