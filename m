Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:04:59 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 02/28] PCI: tegra: Handle failure cases in
 tegra_pcie_power_on()
Message-ID: <20190509140459.GB8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-3-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-3-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:57:59PM +0530, Manikanta Maddireddy wrote:
> Unroll the PCIe power on sequence if any one of the steps fail in
> tegra_pcie_power_on().
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: New patch to handle error cleanup in tegra_pcie_power_on().
>=20
>  drivers/pci/controller/pci-tegra.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUM4sACgkQ3SOs138+
s6G6vw//ZlsjzvQq+kNiozjqfF+5tWoDBYISiX4LL5kIRZ7AuoP5rk/FWwBP1QAl
ONLeFgXNzcbxXlIwvbWyEF1ls+zM3Tjo9cd//0nUOvdRr44nvSvT4XAXv3QwhyPj
XO4yZonLvXL5fh2YxXkrX/vvG6dEfTk+aY+nrBil8Aojq9kwczLgK6pnTDuDQRNf
gECbdjKmlRHLMamLb2hqnzSjWDV0cNdF3y0c8lsjeo+unSDRx2zJ5MJp6VOHyRj4
8/MpuUfsV+ozusZeUYtWJPp2Vxdc3v/4SM9zOx9rDEB3kdZuO4WnEE4FKD39viAm
4lekg9IvtK1VBG3MyS9wCxlHAu+WvFoxe2asFmy51zsps0Zc1UzXnPRp5hU1q+C5
1JGArhghofw6a229Ki2IaV/u68DglkUR6QivB4yxdHODxO5/w21S1CC9IU9Rn4OO
n0qq51KSGqZbN8dQaRUo2EOEFxxIZ1i3mJqltKOIJ4gutkQ7GJR2gX02KwFT6/x0
j7GLq/qqGAV686hQAFVkoYiurwbMmz2MlsnHJ4ZdqWcqjj8Is+jtHpCBiIPPI29u
94WIPIiy0I0IhJz0WuV7f18zFY3DShrrTffuy5Bdchll444OD/a9OV7gSl/J7zrk
9yPlgGbxzgHBjqEsvmX9OrcEe0YTcQ0rlaXNtFME9NwuzrLmzaI=
=ENnA
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
