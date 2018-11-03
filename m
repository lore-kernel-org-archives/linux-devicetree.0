From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/2] DT: marvell,mmp2: fix TWSI2
Date: Sat, 3 Nov 2018 20:05:24 +0100
Message-ID: <20181103190524.GC31179@amd>
References: <20180917113947.12626-1-lkundrak@v3.sk>
 <20180917113947.12626-2-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180917113947.12626-2-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Eric Miao <eric.y.miao@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org


--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2018-09-17 13:39:46, Lubomir Rintel wrote:
> Marvell keeps their MMP2 datasheet secret, but there are good clues
> that TWSI2 is not on 0xd4025000 on that platform, not does it use
> IRQ 58. In fact, the IRQ 58 on MMP2 seems to be a signal processor:
>=20
>    arch/arm/mach-mmp/irqs.h:#define IRQ_MMP2_MSP  58
>=20
> I'm taking a somewhat educated guess that is probably a copy & paste
> error from PXA168 or PXA910 and that the real controller in fact hides
> at address 0xd4031000 and uses an interrupt line multiplexed via IRQ 17.
>=20
> I'm also copying some properties from TWSI1 that were missing or
> incorrect.
>=20
> Tested on a OLPC XO 1.75 machine, where the RTC is on TWSI2.
>=20
> Cc: Eric Miao <eric.y.miao@gmail.com>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Acked-by: Pavel Machek <pavel@ucw.cz>

>  				status =3D "disabled";
>  			};
> =20
> -			twsi2: i2c@d4025000 {
> +			twsi2: i2c@d4031000 {
>  				compatible =3D "mrvl,mmp-twsi";
> -				reg =3D <0xd4025000 0x1000>;
> -				interrupts =3D <58>;
> +				reg =3D <0xd4031000 0x1000>;
> +				interrupt-parent =3D <&intcmux17>;
> +				interrupts =3D <0>;
>  				clocks =3D <&soc_clocks MMP2_CLK_TWSI1>;
>  				resets =3D <&soc_clocks MMP2_CLK_TWSI1>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
>  				status =3D "disabled";
>  			};
> =20

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvd8XQACgkQMOfwapXb+vKSjACgv6Lkz3rRh4XiylK+HXaqmWqA
3/IAnjQOUO+mZ4PAESNh8Oe7MPWYRAGL
=YgrZ
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--
