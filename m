Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 16:30:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 02/30] PCI: tegra: Fix PCIe host power up sequence
Message-ID: <20190415143019.GE29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-3-mmaddireddy@nvidia.com>
 <20190415110136.GC29254@ulmo>
 <63ed1e7e-6630-bdba-3acd-c4372e83b259@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Zljh9u/ceMLi+8mf"
Content-Disposition: inline
In-Reply-To: <63ed1e7e-6630-bdba-3acd-c4372e83b259@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--Zljh9u/ceMLi+8mf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2019 at 07:41:21PM +0530, Manikanta Maddireddy wrote:
>=20
> On 15-Apr-19 4:31 PM, Thierry Reding wrote:
> > On Thu, Apr 11, 2019 at 10:33:27PM +0530, Manikanta Maddireddy wrote:
> >> PCIe host power up sequence involves programming AFI(AXI to FPCI bridg=
e)
> >> registers first and then PCIe registers. Otherwise AFI register settin=
gs
> >> may not latch to PCIe IP.
> >>
> >> PCIe root port starts LTSSM as soon as PCIe xrst is deasserted.
> >> So deassert PCIe xrst after programming PCIe registers.
> >>
> >> Modify PCIe power up sequence as follows,
> >>   - Power ungate PCIe partition
> >>   - Enable AFI clock
> >>   - Deassert AFI reset
> >>   - Program AFI registers
> >>   - Enable PCIe clock
> >>   - Deassert PCIe reset
> >>   - Program PCIe registers
> >>   - Deassert PCIe xrst to start LTSSM
> >>
> >> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> >> ---
> >>  drivers/pci/controller/pci-tegra.c | 73 ++++++++++++++++++------------
> >>  1 file changed, 43 insertions(+), 30 deletions(-)
> >>
> >> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controll=
er/pci-tegra.c
> >> index f4f53d092e00..0bf270bcea34 100644
> >> --- a/drivers/pci/controller/pci-tegra.c
> >> +++ b/drivers/pci/controller/pci-tegra.c
> >> @@ -966,9 +966,6 @@ static int tegra_pcie_enable_controller(struct teg=
ra_pcie *pcie)
> >>  		}
> >>  	}
> >> =20
> >> -	/* take the PCIe interface module out of reset */
> >> -	reset_control_deassert(pcie->pcie_xrst);
> >> -
> >>  	/* finally enable PCIe */
> >>  	value =3D afi_readl(pcie, AFI_CONFIGURATION);
> >>  	value |=3D AFI_CONFIGURATION_EN_FPCI;
> >> @@ -997,8 +994,6 @@ static void tegra_pcie_disable_controller(struct t=
egra_pcie *pcie)
> >>  {
> >>  	int err;
> >> =20
> >> -	reset_control_assert(pcie->pcie_xrst);
> >> -
> >>  	if (pcie->soc->program_uphy) {
> >>  		err =3D tegra_pcie_phy_power_off(pcie);
> >>  		if (err < 0)
> >> @@ -1014,13 +1009,11 @@ static void tegra_pcie_power_off(struct tegra_=
pcie *pcie)
> >>  	int err;
> >> =20
> >>  	reset_control_assert(pcie->afi_rst);
> >> -	reset_control_assert(pcie->pex_rst);
> >> =20
> >>  	clk_disable_unprepare(pcie->pll_e);
> >>  	if (soc->has_cml_clk)
> >>  		clk_disable_unprepare(pcie->cml_clk);
> >>  	clk_disable_unprepare(pcie->afi_clk);
> >> -	clk_disable_unprepare(pcie->pex_clk);
> >> =20
> >>  	if (!dev->pm_domain)
> >>  		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
> >> @@ -1036,58 +1029,59 @@ static int tegra_pcie_power_on(struct tegra_pc=
ie *pcie)
> >>  	const struct tegra_pcie_soc *soc =3D pcie->soc;
> >>  	int err;
> >> =20
> >> -	reset_control_assert(pcie->pcie_xrst);
> >> -	reset_control_assert(pcie->afi_rst);
> >> -	reset_control_assert(pcie->pex_rst);
> >> -
> >> -	if (!dev->pm_domain)
> >> -		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
> >> -
> > This code was in place to ensure that PCIe was in a known good state
> > before following the power up sequence below. You mentioned elsewhere
> > that there's a regression on Cardhu after applying this series, so
> > perhaps Cardhu relies on the above hunk?
> No, Tegra30 and Tegra20 has legacy PHY which are dependent on PEX clk and=
 rst.
> PHY power on is done in tegra_pcie_enable_controller(), but in this patch=
 I am
> enabling PEX clk and rst after tegra_pcie_enable_controller(). This caused
> regression on Cardhu.
> I realized that sanity test is failing on Cardhu after publishing this se=
ries, I will
> fix the issue in V2.
> I believe you are talking about the bootloader(uboot) which can enable
> PCIe partition and reset. To bring the PCIe into good state then we
> have to take care of clocks as well. AFAIK clock_disable() is not added
> because it maintains the refcount and any mismatch in the count
> will thrown warning. I downstream kernel I see pmc driver itself taking
> care of initial state and there after maintaining the state with refcount.
> Since bootloader may or may not enable PCIe, Can we get the state fixed
> in pmc driver instead of fixing it in PCIe driver?

I don't think we can do that. The PMC driver only knows about which
clocks and resets need to be controlled as part of which power partition
if we use power domains. We don't do that on all platforms, so there is
not enough information.

Even if we had that information, we would still not be able to force the
clock off because of the reference counting.

Generally, though, the clock don't matter all that much for getting the
hardware into a good state. All we really care about is that it is put
into reset so that when we take it out again we start from scratch.

If we can verify that we don't need this anymore, I'm fine with taking
it out, though. Perhaps do it in a separate patch to make it easier to
revert if it turns out to be necessary on some platform after all.

Thierry

> >>  	/* enable regulators */
> >>  	err =3D regulator_bulk_enable(pcie->num_supplies, pcie->supplies);
> >>  	if (err < 0)
> >>  		dev_err(dev, "failed to enable regulators: %d\n", err);
> >> =20
> >> -	if (dev->pm_domain) {
> >> -		err =3D clk_prepare_enable(pcie->pex_clk);
> >> +	if (!dev->pm_domain) {
> >> +		err =3D tegra_powergate_power_on(TEGRA_POWERGATE_PCIE);
> >>  		if (err) {
> >> -			dev_err(dev, "failed to enable PEX clock: %d\n", err);
> >> -			return err;
> >> +			dev_err(dev, "power ungate failed: %d\n", err);
> >> +			goto regulator_disable;
> >>  		}
> >> -		reset_control_deassert(pcie->pex_rst);
> >> -	} else {
> >> -		err =3D tegra_powergate_sequence_power_up(TEGRA_POWERGATE_PCIE,
> >> -							pcie->pex_clk,
> >> -							pcie->pex_rst);
> >> +		err =3D tegra_powergate_remove_clamping(TEGRA_POWERGATE_PCIE);
> >>  		if (err) {
> >> -			dev_err(dev, "powerup sequence failed: %d\n", err);
> >> -			return err;
> >> +			dev_err(dev, "remove clamp failed: %d\n", err);
> >> +			goto powergate;
> >>  		}
> >>  	}
> >> =20
> >> -	reset_control_deassert(pcie->afi_rst);
> >> -
> >>  	err =3D clk_prepare_enable(pcie->afi_clk);
> >>  	if (err < 0) {
> >>  		dev_err(dev, "failed to enable AFI clock: %d\n", err);
> >> -		return err;
> >> +		goto powergate;
> >>  	}
> >> =20
> >>  	if (soc->has_cml_clk) {
> >>  		err =3D clk_prepare_enable(pcie->cml_clk);
> >>  		if (err < 0) {
> >>  			dev_err(dev, "failed to enable CML clock: %d\n", err);
> >> -			return err;
> >> +			goto afi_clk_disable;
> >>  		}
> >>  	}
> >> =20
> >>  	err =3D clk_prepare_enable(pcie->pll_e);
> >>  	if (err < 0) {
> >>  		dev_err(dev, "failed to enable PLLE clock: %d\n", err);
> >> -		return err;
> >> +		goto cml_clk_disable;
> >>  	}
> >> =20
> >> +	reset_control_deassert(pcie->afi_rst);
> >> +
> >>  	return 0;
> >> +
> >> +cml_clk_disable:
> >> +	if (soc->has_cml_clk)
> >> +		clk_disable_unprepare(pcie->cml_clk);
> >> +afi_clk_disable:
> >> +	clk_disable_unprepare(pcie->afi_clk);
> >> +powergate:
> >> +	if (!dev->pm_domain)
> >> +		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
> >> +regulator_disable:
> >> +	regulator_bulk_disable(pcie->num_supplies, pcie->supplies);
> >> +	return err;
> >>  }
> >> =20
> >>  static int tegra_pcie_clocks_get(struct tegra_pcie *pcie)
> >> @@ -2108,7 +2102,12 @@ static void tegra_pcie_enable_ports(struct tegr=
a_pcie *pcie)
> >>  			 port->index, port->lanes);
> >> =20
> >>  		tegra_pcie_port_enable(port);
> >> +	}
> >> +
> >> +	/* Start LTSSM from Tegra side */
> >> +	reset_control_deassert(pcie->pcie_xrst);
> >> =20
> >> +	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
> >>  		if (tegra_pcie_port_check_link(port))
> >>  			continue;
> >> =20
> >> @@ -2123,6 +2122,8 @@ static void tegra_pcie_disable_ports(struct tegr=
a_pcie *pcie)
> >>  {
> >>  	struct tegra_pcie_port *port, *tmp;
> >> =20
> >> +	reset_control_assert(pcie->pcie_xrst);
> >> +
> >>  	list_for_each_entry_safe(port, tmp, &pcie->ports, list)
> >>  		tegra_pcie_port_disable(port);
> >>  }
> >> @@ -2472,6 +2473,9 @@ static int __maybe_unused tegra_pcie_pm_suspend(=
struct device *dev)
> >> =20
> >>  	tegra_pcie_disable_ports(pcie);
> >> =20
> >> +	reset_control_assert(pcie->pex_rst);
> >> +	clk_disable_unprepare(pcie->pex_clk);
> >> +
> >>  	if (IS_ENABLED(CONFIG_PCI_MSI))
> >>  		tegra_pcie_disable_msi(pcie);
> >> =20
> >> @@ -2501,10 +2505,19 @@ static int __maybe_unused tegra_pcie_pm_resume=
(struct device *dev)
> >>  	if (IS_ENABLED(CONFIG_PCI_MSI))
> >>  		tegra_pcie_enable_msi(pcie);
> >> =20
> >> +	err =3D clk_prepare_enable(pcie->pex_clk);
> >> +	if (err) {
> >> +		dev_err(dev, "failed to enable PEX clock: %d\n", err);
> >> +		goto disable_controller;
> >> +	}
> >> +	reset_control_deassert(pcie->pex_rst);
> >> +
> >>  	tegra_pcie_enable_ports(pcie);
> >> =20
> >>  	return 0;
> >> =20
> >> +disable_controller:
> >> +	tegra_pcie_disable_controller(pcie);
> >>  poweroff:
> >>  	tegra_pcie_power_off(pcie);
> >> =20
> > There's quite a bit going on in this patch in general and I find it hard
> > to review because not all the changes seem related to what you described
> > in the commit message.
> >
> > Can you perhaps try to split out the error cleanup changes into a
> > separate patch where it makes sense? It seems to me like at least for
> > tegra_pcie_power_on() we're currently missing all of the cleanup code.
> > You could make that a preparatory patch that goes before this particular
> > patch, which will hopefully make this patch easier to review.
> >
> > Thierry
> Okay, I will prepare new patch for error handling and restrict this patch=
 only for
> sequence correction

--Zljh9u/ceMLi+8mf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0lXsACgkQ3SOs138+
s6H1mRAAgnYkd+i/O0ot1TColm9iEcg5HPgSOxiu+OEIAR7+1kQfgRoQ2jGJ0mVR
VnRSCsaVke7+J4+UmZh2gzRcYbROCMlwqXkwhtmVaamff/NZpfW1vIU26r25s4zv
TFy+OANppKaaosf0F/5Mg5jXRr72RALzdGWaOJmCwWGNfLUTdQXOqi/osVJwsxZA
dlH0RT4AR3XpuKtj+I7YuzPkr28AHWr8nYnQrNQcAyOAItzCxiQTNT4jj80loddo
yuyDM20lruqPu+BWzD8yx8qbthd2elV2o1q3MQxXUyghNYeciGk0my4J6IYzw5oe
LHcpI7qta+Xu0XfV7HLcI6KWteovr0/RczGnscZpXDZAGzWuNkk0/N5rU6drfvxm
hFxmAZJ4eqiAm+qjMVrIeI8a5fvp71+m5iGw6L1PFDsPuav7eRwiz8+IBJHQyd49
7U+UdV3Sd7pLxupvXCCsOZ0jaBZ7n8VSVVh9jV2jr3jkWs7D5IWBHW7MEyQiNqZH
cfJxLhePxljEqaV2BiV2+olu8zFk9nb9EzKm3T3G/CdsM6nTaz9YgmCkECmtmJNs
XW5fIbfRQQiGVIv93WiPJl8ZYTpaiqlRcqq2CzEJEJv+4dSM0pvsE73bT4MfqblQ
wRvakU85I4L2/EPY4vZ7mCDKSF3dNWT3LPCJhgIv+dRVaGcauX8=
=3tcv
-----END PGP SIGNATURE-----

--Zljh9u/ceMLi+8mf--
