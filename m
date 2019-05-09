Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:35:48 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 25/28] PCI: tegra: Put PEX CLK & BIAS pads in DPD mode
Message-ID: <20190509143548.GT8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-26-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2mNuWrpDTYoom6W8"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-26-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--2mNuWrpDTYoom6W8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:58:22PM +0530, Manikanta Maddireddy wrote:
> In Tegra210 AFI design has clamp value for the BIAS pad as 0, which keeps
> the bias pad in non power down mode. This is leading to power consumption
> of 2 mW in BIAS pad, even if the PCIe partition is powergated. To avoid
> unnecessary power consumption, put PEX CLK & BIAS pads in deep power down
> mode when PCIe partition is power gated.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: Using standard pinctrl functions to apply default and idle states
>=20
>  drivers/pci/controller/pci-tegra.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--2mNuWrpDTYoom6W8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUOsQACgkQ3SOs138+
s6HXahAAjFPWMpQsvEGOlqVlUTWHSBFAFGhPNDZtZO3/1w3FZLLA7z8jAVhF0ZMU
pM9Izyc84Y9P5MNQGXH++noKX6BilbKw1ku0Bdk0IC/jrXXQ8xfmrPy81IrmniE3
xuylXqcdaFtfmveyrtGLWLSKXQBrO0t+UY7qvPFnZpLUVoo4ghWM1fLlIKYT3vMC
+hz9mOMEO4tH0kFKxUFPiN9fROX9JUq2MDCo3pYD8qxqGwWRxvLTolotHAfSJisf
K43ChvCEI4hdOr+6fyBK50/jKLrMgC77XIizFG/F2adqehFsVN3WKerigb/HqLKo
tHeUs5boX5OB1l52TW9dv2VhJMrIsgURK2zyz1zFd2sHiiJkYwS2MioLDn3/s6rB
VPLIIS6vPU4mK99TTH3R4d80JosZ9V5nkqwMXZGtLQP3QSNyNe0iPWJ0ZPHYnb65
ez2fEeDW/nfJ84bEjxZNIq1cB2GPUgOK52Q/sRmFikXd7eEzVFYhG8MhnBpn9iLp
cxFxuehOzD3rDAhU24OUJOjoZnC2qo3qU4Iytdn1BSTWqvBO2W1kHfDnBxwajtUf
DLeINLvoJg0GrRzN7uEWJC0iuGzERE9oXfZdQYOVdUvI8rF80NQ7pfW/+qp2Pt3g
Om/mWgzq/JhpWDD7+hkblTocp9yQMttDDUY+wzxTfsVwID9z4+g=
=hei3
-----END PGP SIGNATURE-----

--2mNuWrpDTYoom6W8--
