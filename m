Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 13:33:04 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 09/30] PCI: tegra: Process pending DLL transactions
 before entering L1 or L2
Message-ID: <20190415113304.GJ29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-10-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SBT+cnFS/G3NVgv4"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-10-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--SBT+cnFS/G3NVgv4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:34PM +0530, Manikanta Maddireddy wrote:
> PM message are truncated while entering L1 or L2, which is resulting in
> receiver errors. Set the required bit to finish processing DLLP before
> link enter L1 or L2.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--SBT+cnFS/G3NVgv4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0a/AACgkQ3SOs138+
s6EZ1A/9H7FTiL5bNpYfqZl/Bkgx3P61HMKh5lIzrmjMbJgWv/REah55hktenUV/
FWzmWUh0cAqLbXtlbTX2crqRVfcURJvyyKYB3lOc+kEwm/558Ifex4DbWTedvBlF
n2ZAlcc+U5fYY1qB/1agxw9rByBfLuOBugmS3+2aU1PXhhFwQhXz3qrZA1rfz0oQ
mbHFjIlT4xtvbq02aALI7G6oSAGnMD5jKx99PhNo78f/2luTjbkg0mdUuzArbkCJ
lLw9HncnLluSsPbY8oiWr6ZwB0rBOsQ27B8DYC9Geitf04XBkOY/3S1XJfbUx0LP
VmbdFuGopMID9j+PA/8kBdacMrDpBJ7pmUjV5uMhhy5/y514pPm1OzVxri6TfA6/
cFyjaURjNysjm/0JfzWSgRlFAOUJkRH638vR2viK6ojcoEvysj2GEDtXhVYTPJ+T
kyTTlWK9S5vDvpp1jDdjlO/Zw/J53LThAXVUnBnzChhWVdIr36AVRI8h12IAffTM
2X7Kcz+yoLfYMj+S3j+IhuNEdeXn+i4QpP3KmR26HPOOIzrSfadhP5hEgSiq4X/Y
s/fkK0UiK90Rcgqm8cDONPR3KX+cqVyeH8HeC8SN1Hfpt2Ki+OXDiFoqWXgReLR4
y54i33/Ws/ZlfvLCZGhYNLguX6T0BL4I9w4kUB5Vxgp4vEEu9hs=
=H46F
-----END PGP SIGNATURE-----

--SBT+cnFS/G3NVgv4--
