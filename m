Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 13:06:28 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 03/30] PCI: tegra: Move REFCLK pad settings out of
 phy_power_on()
Message-ID: <20190415110628.GD29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-4-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZJcv+A0YCCLh2VIg"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-4-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--ZJcv+A0YCCLh2VIg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:28PM +0530, Manikanta Maddireddy wrote:
> In Tegra186 PHY programming is done by BPMP-FW, so PHY calls are skipped
> in driver. REFCLK pad settings are independent of PHY and should be
> programmed by driver. So move REFCLK pad settings out of phy_power_on().
> These pad settings tune REFCLK peak to peak amplitude.
>=20
> Fixes: cf5d31801278 ("PCI: tegra: Program PADS_REFCLK_CFG* always, not
> just on legacy SoCs")
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index 0bf270bcea34..a61ce9d475b4 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -852,7 +852,6 @@ static int tegra_pcie_port_phy_power_off(struct tegra=
_pcie_port *port)
>  static int tegra_pcie_phy_power_on(struct tegra_pcie *pcie)
>  {
>  	struct device *dev =3D pcie->dev;
> -	const struct tegra_pcie_soc *soc =3D pcie->soc;
>  	struct tegra_pcie_port *port;
>  	int err;
> =20
> @@ -878,12 +877,6 @@ static int tegra_pcie_phy_power_on(struct tegra_pcie=
 *pcie)
>  		}
>  	}
> =20
> -	/* Configure the reference clock driver */
> -	pads_writel(pcie, soc->pads_refclk_cfg0, PADS_REFCLK_CFG0);
> -
> -	if (soc->num_ports > 2)
> -		pads_writel(pcie, soc->pads_refclk_cfg1, PADS_REFCLK_CFG1);
> -
>  	return 0;
>  }
> =20
> @@ -2092,11 +2085,24 @@ static bool tegra_pcie_port_check_link(struct teg=
ra_pcie_port *port)
>  	return false;
>  }
> =20
> +static void tegra_pcie_apply_pad_settings(struct tegra_pcie *pcie)
> +{
> +	const struct tegra_pcie_soc *soc =3D pcie->soc;
> +
> +	/* Configure the reference clock driver */
> +	pads_writel(pcie, soc->pads_refclk_cfg0, PADS_REFCLK_CFG0);
> +
> +	if (soc->num_ports > 2)
> +		pads_writel(pcie, soc->pads_refclk_cfg1, PADS_REFCLK_CFG1);
> +}
> +
>  static void tegra_pcie_enable_ports(struct tegra_pcie *pcie)
>  {
>  	struct device *dev =3D pcie->dev;
>  	struct tegra_pcie_port *port, *tmp;
> =20
> +	tegra_pcie_apply_pad_settings(pcie);
> +
>  	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
>  		dev_info(dev, "probing port %u, using %u lanes\n",
>  			 port->index, port->lanes);

This also seems to move the programming of these registers to a
different point in time. Was that intentional? If so, please mention it
in the commit message and describe why that's necessary.

If that was not intentional, it seems like the right place to call this
would be right after the call to tegra_pcie_enable_controller() in
tegra_pcie_pm_resume().

Thierry

--ZJcv+A0YCCLh2VIg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0ZbQACgkQ3SOs138+
s6EsXA//YGIAqdBfaxL2OO3F+GGjri8dGsbGAvScPXPlFpgBrny/KS0XmEoqAUsB
Tql8lEvjRZoW/Yy/7xw8SIPyEIZS4LQySrbI8fMsgFtw5qGElc9b61Q25WN4nFYZ
LSGmQ8HmtCTlmtx8Z3OY/GAYxlm5kq2uVuS0iEGfq+BC3eRllPkzGOkBAoDDNjDl
aimHH2rhly8Yb76pCVkoBNY3gMqt1KGKN0Iplm0PBAjcMRirz15qg2YttAe8Dpoe
Z77QmmfRfBOL08SsR7VU/n+nRNSPQrb9YQePaZv4mjkWOnGyofgbn7o5jbdaXczj
91ylB44mDfndTgkszNWQCy3cPDaSCWJfJ9Xyl9NcShNzYIvpW7A99fB2KyFnRAab
VXuBKHAzr7pJQQR8qbidO51ZT664400Iexh6/dZGy8DPZd3mYpSwsAAqlE4NGyHU
xykEe0d7lCrpCPk6CChEscgmOt7ssAe4pB2j9tAcRWMmpf/FDnTlL6uC7LbaG862
IHo9hczy8/l3qYDta+SQUc0aQ+yIrp7SDb6Qs9gMHwb0F741b50nC1MjkdYmInKA
1TXNf7Z89DLb4iOyKJOYPM3C4FDiAlapkXvtfPf87rvp+z665QRwCvC9bDeJ56xZ
rlG8CJq0g+SAnVu9V/MlV14YFC4KRPT2BmJ6KIDE1wkF2m+KiGc=
=Jqbg
-----END PGP SIGNATURE-----

--ZJcv+A0YCCLh2VIg--
