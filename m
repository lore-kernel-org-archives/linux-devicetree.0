From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: sunxi: Add cpu-supply for Olimex A20 EVB
Date: Mon, 17 Oct 2016 20:04:52 +0200
Message-ID: <20161017180452.etevnvhr7ywbxmuh@lukather>
References: <20161015152340.43315-1-manu@bidouilliste.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="p7utfmdcyamwndx4"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161015152340.43315-1-manu@bidouilliste.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Emmanuel Vadot <manu@bidouilliste.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--p7utfmdcyamwndx4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 15, 2016 at 05:23:40PM +0200, Emmanuel Vadot wrote:
> sun7i-a20-olimex-som-evb.dts doesn't contain cpu-supply needed for
> voltage-scaling with cpufreq-dt so define it.
> The default voltages are defined in sun7i-a20.dtsi.
>=20
> Signed-off-by: Emmanuel Vadot <manu@bidouilliste.com>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--p7utfmdcyamwndx4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYBRLAAAoJEBx+YmzsjxAgbrQQAK4cTulp/EgldRUY9rSAB+ue
2WwnoITxT6euJe3zS29kB77/nDf0kG+J1U5Ct+5HG3es+Yy/O3dBZoL8KCynsMsK
r895JlzYW1/74OmNVCOd80tvQKfXAv7gl3/tQiwqI+Oz0wt1LhgdcG4Xun0aSjf3
ukYXXIByVAljMSitMAwf5A42bfpAgJ1ArL9hHquqzDBVmwwfI2UBi63e/EuqQpJR
byDHodd2+TVnBhdQCuWKmYvBn82nMo3zWLIraSCaAXYAg8pwGZOsq+Eol8abH7Gi
U1fsx4hTcq/7YIDuKt5+Dytv/16QJOgPfTdtW3Tw2UftgP6MMYZbLxSQ0mmknR61
JG89zGRVlAf+l0whUIMyrvpHdoYCJTsoUG3HROWWmrig6tCSE7Cf/qUK/AuNHyXD
XfvMrgr5lTuzrzPFUbP9ZYQ4syQnVzaK4nYm0gkre506ysdvxMv5phF2Hsh7jDYp
lfkaNb8BPT08yMRLsYNidHDjQ9HNgQ2omB7qU+dXf5TrNoWivBXHG/DdKEywYpSl
GLcmcFz2OPnZOsQakOPeDhyW8db+nOatRq1i6wOmYkx+LYaRrF/55u9aEkOaLOV4
1ww0LEvyK/MH1k7jlV2OvBdEieibE+j2lJ5Aq29NG/8L9lGR7rflpXHdssIA38u0
huSf05ka6Wvf5jiS1Yh8
=L/ee
-----END PGP SIGNATURE-----

--p7utfmdcyamwndx4--
