Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 16:07:49 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 23/30] dt-bindings: pci: tegra: Document PCIe DPD pinctrl
 optional prop
Message-ID: <20190415140749.GY29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-24-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I2k41U2G4dq8LTBU"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-24-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--I2k41U2G4dq8LTBU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:48PM +0530, Manikanta Maddireddy wrote:
> Document PCIe DPD pinctrl optional property to put PEX clk & BIAS pads
> in low power mode.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  .../devicetree/bindings/pci/nvidia,tegra20-pcie.txt      | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.tx=
t b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> index 145a4f04194f..fbbd3bcb3435 100644
> --- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> @@ -65,6 +65,15 @@ Required properties:
>    - afi
>    - pcie_x
> =20
> +Optional properties:
> +- pinctrl-names : The pin control state names.
> +- pinctrl-0: PCIe IO(bias & REFCLK) deep power down(DPD) disable state.
> +  In Tegra210 PCIe clamps are not controlling IO signals, so there
> +  is leakagae power even after PCIe power partition is off. Pass

leakage

> +  pinctrl phandle to allow driver to explicitly put PCIe IO in DPD state.
> +- pinctrl-1: PCIe IO(bias & REFCLK) deep power down(DPD) enable state.
> +  Pass pinctrl phandle to allow driver bring PCIe IO out of DPD state.

This is confusingly documented. Your pinctrl-names should list exactly
what states are supported. The generic pinctrl bindings already specify
how to define pinctrl states, so I don't think you need to describe all
of the pinctrl-{0,1,...} states again.

Also, looking at the driver you seem to use custom names for the pinctrl
states, but those states are really just the "active" and the "idle"
states, for which there are standard names.

Something like this perhaps:

- pinctrl-names: A list of pinctrl state names. Must contain the
  following entries:
  - "default": active state, puts PCIe I/O out of deep power down state
  - "idle": puts PCIe I/O into deep power down state

It then goes without saying that the phandle pointed to by pinctrl-0
corresponds to the pinctrl state named by the first entry in
pinctrl-names.

If you use those default names for the states, I don't think you even
need extra code, the pinctrl subsystem should be able to take of that
for you.

Thierry

> +
>  Required properties on Tegra124 and later (deprecated):
>  - phys: Must contain an entry for each entry in phy-names.
>  - phy-names: Must include the following entries:
> --=20
> 2.17.1
>=20

--I2k41U2G4dq8LTBU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0kDIACgkQ3SOs138+
s6HHOw/+Jc2mbic/Ku1DnLSeFPLLEtrssAJMW9l090a4FdfhFqqfhpgHcDfVOrMH
gfAG2EEFbXmXbeOMcYXuNTBxBQuY/gBF14xGTFeHm+sQ/BIBzFIwWYd1i/nFtdnl
f8Dre95O3PvLWrx682tEkm+TGulukVfYyM9OQ+jI34djofo72W34uuewAB0dtjQB
7GQb+IgwwxOxosppm8iTM7UdHJLpHLB21cZdaig9DkIxNxh7l/aaUh96so0GZ6Y5
7QWqkuIHAy9jOArxccjFqQ4TPr1IQDyUNdcxuFYaWZ7ZIeGTubIMfAgGM4xyPx99
ppSCoQQHsuen1OoP7nvjlTDreYzNfI4AAfNcFw5OOW5qbmBqQO0PTvTMk4eFtAFZ
2iF1dv2yWazYzRXdNqxFYfUMo0hX41zsHwBf7KUfFEaX0BAImjV3LuVbUvSyXI7+
0bVcmE5Tk2AlomJq7Dg5540k3esjt1sYOxr1F1DwyQaQbzuO/uW+5VdREklA8AYU
7qC6nzTsPkTW3IKoIBqa2IhQ+3Qrh9a2WkeCL30w+2isdgaLyi1e6+my9GLugcGp
1luVT4x9enkUkM6ChNx8uJ+5H7R8O8isXwTH6wsB9dUz0Izo91tA/mi87JKy9mV8
9BFhD/xn7jM2Oml+YpCh11pAKBLfXQxuSfE+e/ss2Uij7AdemWo=
=BwQh
-----END PGP SIGNATURE-----

--I2k41U2G4dq8LTBU--
