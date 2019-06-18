Return-Path: <SRS0=DLCI=UR=gmail.com=thierry.reding@kernel.org>
Date: Tue, 18 Jun 2019 12:51:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V5 26/27] PCI: tegra: Add support for GPIO based PERST#
Message-ID: <20190618105107.GB28892@ulmo>
References: <20190617173952.29363-1-mmaddireddy@nvidia.com>
 <20190617173952.29363-27-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline
In-Reply-To: <20190617173952.29363-27-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 11:09:51PM +0530, Manikanta Maddireddy wrote:
> Tegra PCIe has fixed per port SFIO line to signal PERST#, which can be
> controlled by AFI port register. However, if a platform routes a different
> GPIO to the PCIe slot, then port register cannot control it. Add support
> for GPIO based PERST# signal for such platforms. GPIO number comes from p=
er
> port PCIe device tree node. PCIe driver probe doesn't fail if per port
> "reset-gpios" property is not populated, make sure that DT property is not
> missed for such platforms.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V5:
> * Updated reset gpio toggle logic to reflect active low usage
> * Replaced kasprintf() with devm_kasprintf()
> * Updated commit message with more information.
>=20
> V4: Using devm_gpiod_get_from_of_node() to get reset-gpios
>=20
> V3: Using helper function to get reset-gpios
>=20
> V2: Using standard "reset-gpio" property
>=20
>  drivers/pci/controller/pci-tegra.c | 45 ++++++++++++++++++++++++++----
>  1 file changed, 39 insertions(+), 6 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0IwhsACgkQ3SOs138+
s6GcGw/+Pi6zDjLmsQQqPGMkvQfxr5DbOJxPtZ0K4fWTvoUmoCrw2KAigmmfKupP
vxeKJWlwhTsfe80GMyNaGrCld5QXDb3UuZ1RRd9i24FOymTALu9I3MdFyYBXAuqv
4+xQFl2N/q4/aoBiSgYe2tGAoXYQc0gHDqqKKmCeZfx3/srE0H27fvzH8XUNC1ku
1ZjhYQcNW7y1w1CpRBVjVpxBDweQJ50suyk4kIMMgxXpmYzbB7qWh1lghDaSIMqg
UFKWmjr88p3otYMBDMxxu0U+gYniYApM7+pH4KfV2uf+H8rksF9P9a64IyRsYOL0
9VAM608wGdxvpoZo0PXFbrzz/ABnEBjFd9qX55493zxF0yEwwSWtl4ARFdSggjn+
gBlh6TqFxYvdWU30R4fT1QjHRXTCZEZNeznyXJReRfO/4XKK4VAvJpmlKJTcN5QI
eAmJwnBae9mjZM9VxRGWt171dlkk0FGNcO6xgci51/C8B9LyYzgwtHbB8DBFijCL
hhSc/0WbzPxy+l8T/blPDxeinGxLh8VIY/kzwClySuqOqWt4OJEhlrOdEB9X3KKe
27CT9HK/2PgTyeNOpkSStZl3vr6jgcYhYzDR4lG+NtZGA1oTfmaB2R4HEITA+zzC
tjFIsRf93HLWj5YZNH+NnawThLejWhF3/4Rw5UYBZP+VXYkju+I=
=l/xN
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
