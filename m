Return-Path: <SRS0=7LTX=UT=gmail.com=thierry.reding@kernel.org>
Date: Thu, 20 Jun 2019 12:25:52 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 00/27] Enable Tegra PCIe root port features
Message-ID: <20190620102552.GB28703@ulmo>
References: <20190618180206.4908-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Content-Disposition: inline
In-Reply-To: <20190618180206.4908-1-mmaddireddy@nvidia.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Manikanta Maddireddy <mmaddireddy@nvidia.com>, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 11:31:39PM +0530, Manikanta Maddireddy wrote:
> This series of patches adds,
> - Tegra root port features like Gen2, AER, etc
> - Power and perf optimizations
> - Fixes like "power up sequence", "dev_err prints", etc
>=20
> This series of patches are tested on Tegra186 based Jetson-TX2, Tegra210
> based Jetson-TX1, T124 based Jetson-TK1, Tegra20 and Tegra30 platforms.
>=20
> Changes from V5 to V6:
>   - Patch [V4, 20/27]: Replaced pcie_pme_disable_msi() with no_msi quirk
>=20
> Changes from V4 to V5:
>  - Patch [V4, 4/28]: Added blank line before block style comment
>  - Patch [V4, 22/28]: "Access endpoint config only if PCIe link is up"
> patch is dropped
>  - Patch [V4, 27/28]:
> * Updated reset gpio toggle logic to reflect active low usage
> * Replaced kasprintf() with devm_kasprintf()
> * Updated commit message with more information.
>=20
> Changes from V3 to V4:
>  - Patch [V3,27/29] is dropped
>  - Patch [V3,28/29]: devm_gpiod_get_from_of_node() is directly used in
>    pci-tegra driver instead of of_get_pci* wrapper function defined in
>    Patch [V3,27/29].
>=20
> Manikanta Maddireddy (27):
>   soc/tegra: pmc: Export tegra_powergate_power_on()
>   PCI: tegra: Handle failure cases in tegra_pcie_power_on()
>   PCI: tegra: Rearrange Tegra PCIe driver functions
>   PCI: tegra: Mask AFI_INTR in runtime suspend
>   PCI: tegra: Fix PCIe host power up sequence
>   PCI: tegra: Add PCIe Gen2 link speed support
>   PCI: tegra: Advertise PCIe Advanced Error Reporting (AER) capability
>   PCI: tegra: Program UPHY electrical settings for Tegra210
>   PCI: tegra: Enable opportunistic UpdateFC and ACK
>   PCI: tegra: Disable AFI dynamic clock gating
>   PCI: tegra: Process pending DLL transactions before entering L1 or L2
>   PCI: tegra: Enable PCIe xclk clock clamping
>   PCI: tegra: Increase the deskew retry time
>   PCI: tegra: Add SW fixup for RAW violations
>   PCI: tegra: Update flow control timer frequency in Tegra210
>   PCI: tegra: Set target speed as Gen1 before starting LTSSM
>   PCI: tegra: Fix PLLE power down issue due to CLKREQ# signal
>   PCI: tegra: Program AFI_CACHE* registers only for Tegra20
>   PCI: tegra: Change PRSNT_SENSE IRQ log to debug
>   PCI: tegra: Disable MSI for Tegra PCIe root port
>   PCI: tegra: Add AFI_PEX2_CTRL reg offset as part of soc struct
>   dt-bindings: pci: tegra: Document PCIe DPD pinctrl optional prop
>   arm64: tegra: Add PEX DPD states as pinctrl properties
>   PCI: tegra: Put PEX CLK & BIAS pads in DPD mode
>   PCI: Add DT binding for "reset-gpios" property
>   PCI: tegra: Add support for GPIO based PERST#
>   PCI: tegra: Change link retry log level to debug

Hi Lorenzo, Bjorn,

There's a build-time dependency from the PCI patches on patch 1 of this
series. I've already Acked that, so I think you should take it through
the PCI tree along with the rest of the series.

The only patch that I picked up is the DT change in patch 23, which is
decoupled from the others via DT, though the data that it adds to DT
will be used in patch 24.

Does that sound good to you?

Thierry

>=20
>  .../bindings/pci/nvidia,tegra20-pcie.txt      |   8 +
>  Documentation/devicetree/bindings/pci/pci.txt |   3 +
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  19 +
>  drivers/pci/controller/pci-tegra.c            | 578 +++++++++++++++---
>  drivers/pci/quirks.c                          |  39 ++
>  drivers/soc/tegra/pmc.c                       |   1 +
>  6 files changed, 568 insertions(+), 80 deletions(-)
>=20
> --=20
> 2.17.1
>=20

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LXy0ACgkQ3SOs138+
s6GtiRAAwFrY3sTpw//mIf0cd83jzuDuxWvqG/UEB4re3vClHiONc/rihLpZi0CY
R5V8Ghe9gsuEQb1ttKobFX/YJ5omW/cXSA3Qc2dy9uQyvMkwcUlpQmfgzaZgl+v2
G6BPqIMLz6/Zb5QeOKH3Dz9XNc1FoZz1mvD7gHdZGeLskAx3Qx9OyMmwLQA1gYSd
rwSPV1uuP2Hpjv3MILNnFKQ/18wdk/fX6Wvnm6GnQAJCw9QywFHer5RvYThFxHrX
oJpUTvCk5I/Z+0CBTOw00hIyV/7Ml4sQPrR4U1TVdBOnPn7HagiWNLkgPxU5KOsP
hG6dvN67x8JuOpazK46UulyDGKUnlndOdRlpPeZDmfN5E6PuOUUIq+O5YjvClIw6
PUg5wDd6eJJAC9U1B8QYIMBFt0EeZ8swYuXaXCE5KY6Ro4VvWW4ll3SMn0TOWjIA
UpX1O9VACuqSXyOGkjA+tuTiSsV0t1mjusvaokEEOTEv0cBOeIi9RG+iYgQDG3l3
hNJEH3I1QA41Hf3mMZuef9AEZl/FuWfpN792KN48cxM14RxuwjuwFA+z0Z1zHjqb
s6ardenJPxEzXzW27x6GA4EcTCuu1Letun+5ew+D9FaefDlSkuM4eFV8ifxVDLFp
Yf/iGDZhrkalTfoBUOs9E7AtAhSdF7n10rXRJ6mU/6EJw70OaqU=
=Pbxk
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--
