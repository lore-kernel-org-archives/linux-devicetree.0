From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: sun8i: Add board dts file for Banana Pi
 M2 Ultra
Date: Fri, 29 Sep 2017 12:17:40 +0200
Message-ID: <20170929101740.reahjw7wjaspwjld@flea>
References: <20170928092543.45648-1-icenowy@aosc.io>
 <20170928092543.45648-3-icenowy@aosc.io>
 <20170928151225.n4pyvn65u6hvpjd7@flea>
 <FCCC8A9F-4818-4CE3-A7E8-62ED9A864F92@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="3l4qncgm5xe7fica"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <FCCC8A9F-4818-4CE3-A7E8-62ED9A864F92@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--3l4qncgm5xe7fica
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 03:38:59PM +0000, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B49=E6=9C=8828=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
11:12:25, Maxime Ripard <maxime.ripard@free-electrons.com> =E5=86=99=E5=88=
=B0:
> >On Thu, Sep 28, 2017 at 09:25:42AM +0000, Icenowy Zheng wrote:
> >> +&mmc2 {
> >> +	vmmc-supply =3D <&reg_dcdc1>;
> >> +	bus-width =3D <8>;
> >> +	non-removable;
> >> +	status =3D "okay";
> >> +};
> >
> >I guess it's an emmc, it doesn't have a vqmmmc regulator?
>=20
> vqmmc is also 3v3.

You should still put it.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3l4qncgm5xe7fica
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZzh3EAAoJEBx+YmzsjxAgH/sP/2m3V/G07wxFYEyLCbDpyTAr
LeNTmNiOmBkScjz64riGfr7G4ZBUMJ4noBS7sD0/aCljEjuBD0fdHIBgm1NmbWoF
dbtAo/2tkK8W8EORjw6Ka8FAyDaquHJMZBgTSOhk9LzcZUzBAnEc3rbzGqH4XELL
hLOr/S7P/UcmCVzQmkY0yeyuqQI0ElDFzCmq+yyyr2qp6vveVUcZPikBaAZLmSKJ
Y97Xa7PTbQTNnmUKxIThqgcxcGl6+pQBLu4n7bi/QX0W4CYF9Z0vxjLfV+Z3AjUT
CboMdiAFn1hTkVgdMVCV6/xb0YUopB+s1WcVcbmiJrR7CBzHlw0vYng6H845HjFR
Cb0EW2dlGUDTA6ZDeskSE85c7ZErpvAdckItN+77stD8/6ZylOPer8f37loMuXWR
2VkagLsyeX7dMsXS/66fK4ySkEE8vVu2EZORRiZvK76abq0al9oX19mukCKUwGIs
XHHdP0VjYQYzb+3n2WLoTq3iFCGeVYCt6R63KvFpQKyr/NPIQ+2RQTUxE5uPi3nL
BYnj4hdTtfrNExdZ28Xhf6m7EkUe7Dc/rme59xuQ+4OsRlRQDC5saPiaGkIQDRYX
6P4PaUjJA2Jm6/yQjc9TM7JTgVrvY/XrdvqwxCXrNZ2xJBIxPtmiofHaIJ359ZqY
P3v5OY/2a0U9Qs9GbvGF
=329P
-----END PGP SIGNATURE-----

--3l4qncgm5xe7fica--
