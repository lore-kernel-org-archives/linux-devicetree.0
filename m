From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH] powerpc/sequoia: fix NAND partitions not to overlap
Date: Wed, 17 May 2017 14:06:13 +0200
Message-ID: <20170517120613.GA583@amd>
References: <20170402100535.GA18340@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170402100535.GA18340@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: sr@denx.de, jwboyer@linux.vnet.ibm.com, robh+dt@kernel.org, mark.rutland@arm.com, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: trivial@kernel.org, Andrew Morton <akpm@osdl.org>
List-Id: devicetree@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2017-04-02 12:05:36, Pavel Machek wrote:
> Fix overlapping NAND partitions.
>=20
> Signed-off-by: Pavel Machek <pavel@ucw.cz>

Ping? Two partitions at same place are bad news...
									Pavel

> diff --git a/arch/powerpc/boot/dts/sequoia.dts b/arch/powerpc/boot/dts/se=
quoia.dts
> index b1d3292..e41b88a 100644
> --- a/arch/powerpc/boot/dts/sequoia.dts
> +++ b/arch/powerpc/boot/dts/sequoia.dts
> @@ -229,7 +229,7 @@
>  						};
>  						partition@84000 {
>  							label =3D "user";
> -							reg =3D <0x00000000 0x01f7c000>;
> +							reg =3D <0x00084000 0x01f7c000>;
>  						};
>  					};
>  				};
>=20
>=20
>=20



--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkcPLUACgkQMOfwapXb+vLv4gCgtb3eCfVmWElFyIPyhlyCSvlz
/s4AoJ5Hm55rRg5oZVQyfgmrv/FsssHp
=BR+o
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
