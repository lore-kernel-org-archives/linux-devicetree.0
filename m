Return-Path: <SRS0=T9D/=SR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39797 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbfDOLBk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 15 Apr 2019 07:01:40 -0400
Date: Mon, 15 Apr 2019 13:01:36 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 02/30] PCI: tegra: Fix PCIe host power up sequence
Message-ID: <20190415110136.GC29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-3-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5G06lTa6Jq83wMTw"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-3-mmaddireddy@nvidia.com>
Sender: devicetree-owner@vger.kernel.org
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--5G06lTa6Jq83wMTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:27PM +0530, Manikanta Maddireddy wrote:
> PCIe host power up sequence involves programming AFI(AXI to FPCI bridge)
> registers first and then PCIe registers. Otherwise AFI register settings
> may not latch to PCIe IP.
>=20
> PCIe root port starts LTSSM as soon as PCIe xrst is deasserted.
> So deassert PCIe xrst after programming PCIe registers.
>=20
> Modify PCIe power up sequence as follows,
>   - Power ungate PCIe partition
>   - Enable AFI clock
>   - Deassert AFI reset
>   - Program AFI registers
>   - Enable PCIe clock
>   - Deassert PCIe reset
>   - Program PCIe registers
>   - Deassert PCIe xrst to start LTSSM
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 73 ++++++++++++++++++------------
>  1 file changed, 43 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index f4f53d092e00..0bf270bcea34 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -966,9 +966,6 @@ static int tegra_pcie_enable_controller(struct tegra_=
pcie *pcie)
>  		}
>  	}
> =20
> -	/* take the PCIe interface module out of reset */
> -	reset_control_deassert(pcie->pcie_xrst);
> -
>  	/* finally enable PCIe */
>  	value =3D afi_readl(pcie, AFI_CONFIGURATION);
>  	value |=3D AFI_CONFIGURATION_EN_FPCI;
> @@ -997,8 +994,6 @@ static void tegra_pcie_disable_controller(struct tegr=
a_pcie *pcie)
>  {
>  	int err;
> =20
> -	reset_control_assert(pcie->pcie_xrst);
> -
>  	if (pcie->soc->program_uphy) {
>  		err =3D tegra_pcie_phy_power_off(pcie);
>  		if (err < 0)
> @@ -1014,13 +1009,11 @@ static void tegra_pcie_power_off(struct tegra_pci=
e *pcie)
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
> @@ -1036,58 +1029,59 @@ static int tegra_pcie_power_on(struct tegra_pcie =
*pcie)
>  	const struct tegra_pcie_soc *soc =3D pcie->soc;
>  	int err;
> =20
> -	reset_control_assert(pcie->pcie_xrst);
> -	reset_control_assert(pcie->afi_rst);
> -	reset_control_assert(pcie->pex_rst);
> -
> -	if (!dev->pm_domain)
> -		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
> -

This code was in place to ensure that PCIe was in a known good state
before following the power up sequence below. You mentioned elsewhere
that there's a regression on Cardhu after applying this series, so
perhaps Cardhu relies on the above hunk?

>  	/* enable regulators */
>  	err =3D regulator_bulk_enable(pcie->num_supplies, pcie->supplies);
>  	if (err < 0)
>  		dev_err(dev, "failed to enable regulators: %d\n", err);
> =20
> -	if (dev->pm_domain) {
> -		err =3D clk_prepare_enable(pcie->pex_clk);
> +	if (!dev->pm_domain) {
> +		err =3D tegra_powergate_power_on(TEGRA_POWERGATE_PCIE);
>  		if (err) {
> -			dev_err(dev, "failed to enable PEX clock: %d\n", err);
> -			return err;
> +			dev_err(dev, "power ungate failed: %d\n", err);
> +			goto regulator_disable;
>  		}
> -		reset_control_deassert(pcie->pex_rst);
> -	} else {
> -		err =3D tegra_powergate_sequence_power_up(TEGRA_POWERGATE_PCIE,
> -							pcie->pex_clk,
> -							pcie->pex_rst);
> +		err =3D tegra_powergate_remove_clamping(TEGRA_POWERGATE_PCIE);
>  		if (err) {
> -			dev_err(dev, "powerup sequence failed: %d\n", err);
> -			return err;
> +			dev_err(dev, "remove clamp failed: %d\n", err);
> +			goto powergate;
>  		}
>  	}
> =20
> -	reset_control_deassert(pcie->afi_rst);
> -
>  	err =3D clk_prepare_enable(pcie->afi_clk);
>  	if (err < 0) {
>  		dev_err(dev, "failed to enable AFI clock: %d\n", err);
> -		return err;
> +		goto powergate;
>  	}
> =20
>  	if (soc->has_cml_clk) {
>  		err =3D clk_prepare_enable(pcie->cml_clk);
>  		if (err < 0) {
>  			dev_err(dev, "failed to enable CML clock: %d\n", err);
> -			return err;
> +			goto afi_clk_disable;
>  		}
>  	}
> =20
>  	err =3D clk_prepare_enable(pcie->pll_e);
>  	if (err < 0) {
>  		dev_err(dev, "failed to enable PLLE clock: %d\n", err);
> -		return err;
> +		goto cml_clk_disable;
>  	}
> =20
> +	reset_control_deassert(pcie->afi_rst);
> +
>  	return 0;
> +
> +cml_clk_disable:
> +	if (soc->has_cml_clk)
> +		clk_disable_unprepare(pcie->cml_clk);
> +afi_clk_disable:
> +	clk_disable_unprepare(pcie->afi_clk);
> +powergate:
> +	if (!dev->pm_domain)
> +		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
> +regulator_disable:
> +	regulator_bulk_disable(pcie->num_supplies, pcie->supplies);
> +	return err;
>  }
> =20
>  static int tegra_pcie_clocks_get(struct tegra_pcie *pcie)
> @@ -2108,7 +2102,12 @@ static void tegra_pcie_enable_ports(struct tegra_p=
cie *pcie)
>  			 port->index, port->lanes);
> =20
>  		tegra_pcie_port_enable(port);
> +	}
> +
> +	/* Start LTSSM from Tegra side */
> +	reset_control_deassert(pcie->pcie_xrst);
> =20
> +	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
>  		if (tegra_pcie_port_check_link(port))
>  			continue;
> =20
> @@ -2123,6 +2122,8 @@ static void tegra_pcie_disable_ports(struct tegra_p=
cie *pcie)
>  {
>  	struct tegra_pcie_port *port, *tmp;
> =20
> +	reset_control_assert(pcie->pcie_xrst);
> +
>  	list_for_each_entry_safe(port, tmp, &pcie->ports, list)
>  		tegra_pcie_port_disable(port);
>  }
> @@ -2472,6 +2473,9 @@ static int __maybe_unused tegra_pcie_pm_suspend(str=
uct device *dev)
> =20
>  	tegra_pcie_disable_ports(pcie);
> =20
> +	reset_control_assert(pcie->pex_rst);
> +	clk_disable_unprepare(pcie->pex_clk);
> +
>  	if (IS_ENABLED(CONFIG_PCI_MSI))
>  		tegra_pcie_disable_msi(pcie);
> =20
> @@ -2501,10 +2505,19 @@ static int __maybe_unused tegra_pcie_pm_resume(st=
ruct device *dev)
>  	if (IS_ENABLED(CONFIG_PCI_MSI))
>  		tegra_pcie_enable_msi(pcie);
> =20
> +	err =3D clk_prepare_enable(pcie->pex_clk);
> +	if (err) {
> +		dev_err(dev, "failed to enable PEX clock: %d\n", err);
> +		goto disable_controller;
> +	}
> +	reset_control_deassert(pcie->pex_rst);
> +
>  	tegra_pcie_enable_ports(pcie);
> =20
>  	return 0;
> =20
> +disable_controller:
> +	tegra_pcie_disable_controller(pcie);
>  poweroff:
>  	tegra_pcie_power_off(pcie);
> =20

There's quite a bit going on in this patch in general and I find it hard
to review because not all the changes seem related to what you described
in the commit message.

Can you perhaps try to split out the error cleanup changes into a
separate patch where it makes sense? It seems to me like at least for
tegra_pcie_power_on() we're currently missing all of the cleanup code.
You could make that a preparatory patch that goes before this particular
patch, which will hopefully make this patch easier to review.

Thierry

--5G06lTa6Jq83wMTw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0ZI0ACgkQ3SOs138+
s6GoshAAvjU4jv5Et69Zf0fio32hbjKN+Ue9KkrT8KPqxxCn3nQbzmFs0Z7OzLEo
gB/OLktbScWy3EmI26/iPdNBhepnyfCsm8LkSTgd9I7V0BETQ3pADuug7dGqAtJK
83ZbO4eUrbvApcTajP9a1DK/XSLwkitNWJWy1yaGL1+C/bitaQ8DH4S4b5xiyIK/
oEhmEtuqPKPlf3elMbSs2MsC+F3rr0TC2cnpXVBGZRTYjEhtfL4KsXWbA1r5NxTC
29jQHEx0aqZTe6NslbouTerhTGTCUjujsiVnoZfeqWPfJDIz7Xo4Tv/KC+KBr9xD
w5qcLHGexLz1Q1OCU72vb1DbWhNtNaHcfKWmd/yqBF56rAe1ZuNqSHIdOjkH5iWr
Ew7UWhbaffAnfwhb1bVdUYU8XQ1OFra46bA03Js2unaLow9Azpl0/nvN9JJJEZTW
asfSCFDmaTniXT+SUX3rQf03PLI6q/xEDvlFJ8C7b9RKdapA5RNXnlhOQu5AXtay
Iggwukqqwqj9YyKtSkD8y2Y8I76qAiaL2xiV2XBq38kNYhnTI6EnbTTcZed0xQsI
Z+0pYk5jiqZ0NZczW2IMVsgY/VKwzsZn8KOJoMhfj1EMzzH7R6bWa2d0lnRsfJJ7
lZBAYn739kAXo7m6zojf3XHj09Spnaa9/cog4JhhlOIPpcBJ34w=
=Vuq/
-----END PGP SIGNATURE-----

--5G06lTa6Jq83wMTw--
