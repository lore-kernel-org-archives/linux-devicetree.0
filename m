Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:14:38 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 05/28] PCI: tegra: Fix PCIe host power up sequence
Message-ID: <20190509141438.GE8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-6-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="orO6xySwJI16pVnm"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-6-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--orO6xySwJI16pVnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:58:02PM +0530, Manikanta Maddireddy wrote:
> PCIe host power up sequence involves programming AFI(AXI to FPCI bridge)
> registers first and then PCIe registers. Otherwise AFI register settings
> may not latch to PCIe IP.
>=20
> PCIe root port starts LTSSM as soon as PCIe xrst is deasserted.
> So deassert PCIe xrst after programming PCIe registers.
>=20
> Modify PCIe power up sequence as follows,
>  - Power ungate PCIe partition
>  - Enable AFI clock
>  - Deassert AFI reset
>  - Program AFI registers
>  - Enable PCIe clock
>  - Deassert PCIe reset
>  - Program PCIe PHY
>  - Program PCIe pad control registers
>  - Program PCIe root port registers
>  - Deassert PCIe xrst to start LTSSM
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: Error cleanup changes are moved to new patch and only sequence
> correction is done in this patch.
>=20
>  drivers/pci/controller/pci-tegra.c | 51 +++++++++++++++++-------------
>  1 file changed, 29 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index 8c0ad038699d..ed0cfd355b28 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -949,9 +949,6 @@ static void tegra_pcie_enable_controller(struct tegra=
_pcie *pcie)
>  		afi_writel(pcie, value, AFI_FUSE);
>  	}
> =20
> -	/* take the PCIe interface module out of reset */
> -	reset_control_deassert(pcie->pcie_xrst);
> -
>  	/* finally enable PCIe */
>  	value =3D afi_readl(pcie, AFI_CONFIGURATION);
>  	value |=3D AFI_CONFIGURATION_EN_FPCI;
> @@ -981,13 +978,11 @@ static void tegra_pcie_power_off(struct tegra_pcie =
*pcie)
>  	int err;
> =20
>  	reset_control_assert(pcie->afi_rst);
> -	reset_control_assert(pcie->pex_rst);
> =20
>  	clk_disable_unprepare(pcie->pll_e);
>  	if (soc->has_cml_clk)
>  		clk_disable_unprepare(pcie->cml_clk);
>  	clk_disable_unprepare(pcie->afi_clk);
> -	clk_disable_unprepare(pcie->pex_clk);
> =20
>  	if (!dev->pm_domain)
>  		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
> @@ -1015,25 +1010,19 @@ static int tegra_pcie_power_on(struct tegra_pcie =
*pcie)
>  	if (err < 0)
>  		dev_err(dev, "failed to enable regulators: %d\n", err);
> =20
> -	if (dev->pm_domain) {
> -		err =3D clk_prepare_enable(pcie->pex_clk);
> +	if (!dev->pm_domain) {
> +		err =3D tegra_powergate_power_on(TEGRA_POWERGATE_PCIE);
>  		if (err) {
> -			dev_err(dev, "failed to enable PEX clock: %d\n", err);
> +			dev_err(dev, "failed to power ungate: %d\n", err);
>  			goto regulator_disable;
>  		}
> -		reset_control_deassert(pcie->pex_rst);
> -	} else {
> -		err =3D tegra_powergate_sequence_power_up(TEGRA_POWERGATE_PCIE,
> -							pcie->pex_clk,
> -							pcie->pex_rst);
> +		err =3D tegra_powergate_remove_clamping(TEGRA_POWERGATE_PCIE);
>  		if (err) {
> -			dev_err(dev, "powerup sequence failed: %d\n", err);
> -			goto regulator_disable;
> +			dev_err(dev, "failed to remove clamp: %d\n", err);
> +			goto powergate;
>  		}
>  	}
> =20
> -	reset_control_deassert(pcie->afi_rst);
> -
>  	err =3D clk_prepare_enable(pcie->afi_clk);
>  	if (err < 0) {
>  		dev_err(dev, "failed to enable AFI clock: %d\n", err);
> @@ -1054,6 +1043,8 @@ static int tegra_pcie_power_on(struct tegra_pcie *p=
cie)
>  		goto disable_cml_clk;
>  	}
> =20
> +	reset_control_deassert(pcie->afi_rst);
> +
>  	return 0;
> =20
>  disable_cml_clk:
> @@ -1062,9 +1053,6 @@ static int tegra_pcie_power_on(struct tegra_pcie *p=
cie)
>  disable_afi_clk:
>  	clk_disable_unprepare(pcie->afi_clk);
>  powergate:
> -	reset_control_assert(pcie->afi_rst);
> -	reset_control_assert(pcie->pex_rst);
> -	clk_disable_unprepare(pcie->pex_clk);
>  	if (!dev->pm_domain)
>  		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
>  regulator_disable:
> @@ -2114,7 +2102,12 @@ static void tegra_pcie_enable_ports(struct tegra_p=
cie *pcie)
>  			 port->index, port->lanes);
> =20
>  		tegra_pcie_port_enable(port);
> +	}
> =20
> +	/* Start LTSSM from Tegra side */
> +	reset_control_deassert(pcie->pcie_xrst);
> +
> +	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
>  		if (tegra_pcie_port_check_link(port))
>  			continue;
> =20
> @@ -2129,6 +2122,8 @@ static void tegra_pcie_disable_ports(struct tegra_p=
cie *pcie)
>  {
>  	struct tegra_pcie_port *port, *tmp;
> =20
> +	reset_control_assert(pcie->pcie_xrst);
> +
>  	list_for_each_entry_safe(port, tmp, &pcie->ports, list)
>  		tegra_pcie_port_disable(port);
>  }
> @@ -2490,10 +2485,12 @@ static int __maybe_unused tegra_pcie_pm_suspend(s=
truct device *dev)
>  			dev_err(dev, "failed to power off PHY(s): %d\n", err);
>  	}
> =20
> +	reset_control_assert(pcie->pex_rst);
> +	clk_disable_unprepare(pcie->pex_clk);
> +
>  	if (IS_ENABLED(CONFIG_PCI_MSI))
>  		tegra_pcie_disable_msi(pcie);
> =20
> -	reset_control_assert(pcie->pcie_xrst);
>  	tegra_pcie_power_off(pcie);
> =20
>  	return 0;
> @@ -2515,11 +2512,18 @@ static int __maybe_unused tegra_pcie_pm_resume(st=
ruct device *dev)
>  	if (IS_ENABLED(CONFIG_PCI_MSI))
>  		tegra_pcie_enable_msi(pcie);
> =20
> +	err =3D clk_prepare_enable(pcie->pex_clk);
> +	if (err) {
> +		dev_err(dev, "failed to enable PEX clock: %d\n", err);
> +		goto poweroff;
> +	}
> +	reset_control_deassert(pcie->pex_rst);

Can you use a blank line after block statements for better readability?
With that:

Acked-by: Thierry Reding <treding@nvidia.com>

--orO6xySwJI16pVnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUNc4ACgkQ3SOs138+
s6GwcxAAhjKVj8xAhGAYir+ZEOw4G7yNvcJJUxDEisD7WARQvdPYIhLM/z5wL3N9
8eVS4u6syoyIr7Jb6xx5J7lgXRaeIjMwdus73yV0hkMcCE0oTgWed/8/t4k2AUpI
p0EaI3Asfazt+3xgynY2qNzgJk0phJF1r/umVZaqDsDSrMIlb7Lz10wTCfff0+HB
Ttil5aEEbH/qezKQwgArYyM+R0Rd3dQpfpwXacgPclwqmArQKuSZMdBktTt7/veW
hPSJczYezSqxYJQND8VEk2Q41g/HVPA5WxPHt/ClrP1QpjXVYju3HafEHbESM94z
AGxMcdxgO8IJNtC7blj7EabV3z2e0Ag2cavJjBFG5mcTBk2m2bbdtGUxywNQy11s
a4YANcodrqfAXY/CC4L69DWaA7yTXUFYq9JiHyvuAAn4BOgYABg9W+28bwv1ccg4
iAeZ9KEnD8zFs++4S6WEA3AwGIzZ7juzwn4ArTd9RBMS517+YePL9nnx+lXuEgBY
X7J4R/0QwZba/Yh3KOePWG5z44BKNeV/RzinBStzsi6ikf1oVDWuSH74Q1RJuWcd
ns051v/hGFijBI5DE88xG3Ml/kkbmGt8vEdYUT5HILPSramM2N92A//4uzhhoVBu
XOSM+iFeMBTGiLPuuj48zWtpuAnDNBil+RbB1LVnRstBtGLEDPQ=
=6dUx
-----END PGP SIGNATURE-----

--orO6xySwJI16pVnm--
