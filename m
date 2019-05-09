Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:24:26 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 17/28] PCI: tegra: Fix PLLE power down issue due to
 CLKREQ# signal
Message-ID: <20190509142426.GN8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-18-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2+jOUFLb7N+7fooZ"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-18-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--2+jOUFLb7N+7fooZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:58:14PM +0530, Manikanta Maddireddy wrote:
> Disable controllers which failed to link up and configure CLKREQ# signals
> of these controllers as GPIO. This is required to avoid CLKREQ# signal of
> inactive controllers interfering with PLLE power down sequence.
>=20
> PCIE_CLKREQ_GPIO bits are defined only in Tegra186, however programming
> these bits in other SoCs doesn't cause any side effects. Program these
> bits for all Tegra SoCs to avoid conditional check.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: Corrected the comment in driver
>=20
>  drivers/pci/controller/pci-tegra.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--2+jOUFLb7N+7fooZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUOBoACgkQ3SOs138+
s6FxQg/9GCN23PoKSSVWK6D1A6kDYJxTlVQHCvhRE1I8SGKzUdmBGcsZ90xwqrUg
m6AF06HCEFxgXOJAbg9bF9+jwXxom42/C9x8mJ3lq5hXH2vfZvwPZjtUdzc7IcNp
K8C4tLb9fGKcZlPR1AFZuUf2eC6M2WQQtnKrJEr17C+ngdAS0K7b0+1vfzBCHClx
hJy2aYXus4PYne0EwHI990ycRyPSk/MDD/SKlwu8K0TVcVfWWtW0ahio0jhnt42K
cBXLTymRTGk98Gnrp4MunSt3N7QO5A42LMgB2zko6vv9oSHxrf41cggO1x1cSCS3
a0wtLq0REUz2cisatxsNNeVYWTvD9aLeYEti301JqzPHq9MIOa6jIeuTlHKfrpqJ
Ft2P0G6ZfdDydQ9AOBAT/S1LVRGEVsyQwbKKT4a9/6oxuPgWxCl+aTDpjRBezhFy
HuSR2oW4Qwoj99A3ZlFvp1wYIduIeU0Bv69O2YyU+Xr9NuGNXGp3XRrJWL9UqiWz
Az74oT3ooNUVM4684HSMmR6paZ0mIpz7UxtOn55Z43xyWPqPB4Pa5wUda2tc9oYF
tlHQnFtip+2MVbheGZaREowd4FEVWkG504jnbyIVGt63HhI1ErHiNfoDEOOEBUIh
C8fQ9PFFCsDnqrzW/tQdkzFvQ2jzNWJOUCRO2YfzOabV8XzbEK0=
=YoN5
-----END PGP SIGNATURE-----

--2+jOUFLb7N+7fooZ--
