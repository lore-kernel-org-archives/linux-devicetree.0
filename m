Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:34:53 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 23/28] dt-bindings: pci: tegra: Document PCIe DPD
 pinctrl optional prop
Message-ID: <20190509143453.GS8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-24-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+nLR7g8KNfrRqv5t"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-24-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--+nLR7g8KNfrRqv5t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:58:20PM +0530, Manikanta Maddireddy wrote:
> Document PCIe DPD pinctrl optional property to put PEX clk & BIAS pads
> in low power mode.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: Using standard pinctrl names, default and idle
>=20
>  .../devicetree/bindings/pci/nvidia,tegra20-pcie.txt       | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

>=20
> diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.tx=
t b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> index 145a4f04194f..7939bca47861 100644
> --- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> @@ -65,6 +65,14 @@ Required properties:
>    - afi
>    - pcie_x
> =20
> +Optional properties:
> +- pinctrl-names: A list of pinctrl state names. Must contain the followi=
ng
> +  entries:
> +  - "default": active state, puts PCIe I/O out of deep power down state
> +  - "idle": puts PCIe I/O into deep power down state
> +- pinctrl-0: phandle for the default/active state of pin configurations.
> +- pinctrl-1: phandle for the idle state of pin configurations.
> +
>  Required properties on Tegra124 and later (deprecated):
>  - phys: Must contain an entry for each entry in phy-names.
>  - phy-names: Must include the following entries:
> --=20
> 2.17.1
>=20

--+nLR7g8KNfrRqv5t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUOo0ACgkQ3SOs138+
s6Gc2Q/9Hij/GDFHZDNoiDPFsx/57/eFWGTCouIYLoDXk08VWpubGSl2sD+jksB3
OHYY7LaaXH72gI1xgRAPxEmoklwFUVldTP3NjBFxn0g0h6eorrsTOwBedUqOZxoC
pcDnfQ+WiOPXMJzHXae/21cTVv+/4zYmChGai48nMaRu16GvYPANre/welPJxFBM
BDqXImcvWJnORttaDRVfOkP2RgZT2TTwi4OOs+BeraczXNKyXPHlwYeN+4ZaSHRt
3jn69q3+7LplLQNEdCUc1toKzAjDR6NSM8H4HLwkRyNQRKRsDbGw2v6b1R0qm8gc
0QhUi0tC15s24z/iEl0+30+Kh2qe9ql0d8KdBXsxmQD9vFd/WE1qNCHHPBBjXUBu
VzJ+TmrF2assLlxagjAQdwxEV+BAX/UW5y3VbBl/l6jJ+VorAsaif+x5qYRc+2AF
sUHzMzQN7EhbVz43y52vuS7pTzV443KKbGcVKxuO+SGZC4OMRDeibvB4A9mDRQ7a
RzV1z5fqH6+0qJMi6YKVjuTnPlC7bw3RIHALM1SbfOLCU2O7dBIAApNrHgOjiYLV
Wtps3Na4c9dq6qVBrfQizN8BNGNko25oTgfrekh0glFD5Uqhu/MzxNYJ4oeIu0Zm
5YEos99KzjUA4z79Ron5WgAM1GoJ7aJiS9H0XYphm61tFHDP0Nw=
=w2IF
-----END PGP SIGNATURE-----

--+nLR7g8KNfrRqv5t--
