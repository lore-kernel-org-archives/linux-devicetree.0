Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 15:20:31 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 16/30] PCI: tegra: Program AFI_CACHE* registers only for
 Tegra20
Message-ID: <20190415132031.GR29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-17-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VdnGiXwuH6t1Tqzo"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-17-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--VdnGiXwuH6t1Tqzo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:41PM +0530, Manikanta Maddireddy wrote:
> AFI_CACHE* registers are available only in Tegra20, program them only
> for Tegra20.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index 8e5fdc8ce3d6..cdaaf13a9fd7 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -887,6 +887,7 @@ static irqreturn_t tegra_pcie_isr(int irq, void *arg)
>   */
>  static void tegra_pcie_setup_translations(struct tegra_pcie *pcie)
>  {
> +	struct device_node *np =3D pcie->dev->of_node;
>  	u32 fpci_bar, size, axi_address;
> =20
>  	/* Bar 0: type 1 extended configuration space */
> @@ -927,11 +928,13 @@ static void tegra_pcie_setup_translations(struct te=
gra_pcie *pcie)
>  	afi_writel(pcie, 0, AFI_AXI_BAR5_SZ);
>  	afi_writel(pcie, 0, AFI_FPCI_BAR5);
> =20
> -	/* map all upstream transactions as uncached */
> -	afi_writel(pcie, 0, AFI_CACHE_BAR0_ST);
> -	afi_writel(pcie, 0, AFI_CACHE_BAR0_SZ);
> -	afi_writel(pcie, 0, AFI_CACHE_BAR1_ST);
> -	afi_writel(pcie, 0, AFI_CACHE_BAR1_SZ);
> +	if (of_device_is_compatible(np, "nvidia,tegra20-pcie")) {

At this point we've already matched on that compatible string, so we
could probably get that information from the SoC structure. Why are
these registers not available on later chips? How would we mark
transactions as uncached on later generations of Tegra?

Also, typically writing to non-existing registers on Tegra186 would
cause an SError exception, but I haven't seen any of those with PCIe
on Tegra186. So do these really not exist, or are they simply not used?

Thierry

> +		/* map all upstream transactions as uncached */
> +		afi_writel(pcie, 0, AFI_CACHE_BAR0_ST);
> +		afi_writel(pcie, 0, AFI_CACHE_BAR0_SZ);
> +		afi_writel(pcie, 0, AFI_CACHE_BAR1_ST);
> +		afi_writel(pcie, 0, AFI_CACHE_BAR1_SZ);
> +	}
> =20
>  	/* MSI translations are setup only when needed */
>  	afi_writel(pcie, 0, AFI_MSI_FPCI_BAR_ST);
> --=20
> 2.17.1
>=20

--VdnGiXwuH6t1Tqzo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0hR8ACgkQ3SOs138+
s6Gu/w//Twhzo5kuCqVUznoiRP4rcPIQrkat0gCVVlx8jm+WeltFsZfyqCRXg587
hQGyyfyhsQI6/zdUYSv/pCAuI5Ko3pGe1dIri6b2M80+KZNq62Cx95rqt7+Mlt5J
W8CAp9OkjiyCnzVI2ozX+UmkHgupaXqB+XEFyphsjWeLVeZjijZ+p8X9kuX5ON5Z
jDM2H0OhUcApT1vTABQ4mMK5rztiv5NBU48XzMd7JcT4Jn6dPfvznEEJ/29BzJUU
9JcQ6q0LpXTa5ziSFxqZ2ikk7Vg0FXd2HPJeOd8q65wnDoyEnp3whKowJuIhOf0E
oZ2VsD0HQ0TIOvZhR4fgSXz6kucVF/lBjeOgGudhqPTdzd/Gt6/U7GuamkAllEqs
AXdgB2uGrp61UFeEpBUB70mZMQV3raB6LX7eNTec0R0m+qepBWp4X1tEOi5M4zTh
34ocxkz8/H2g6n2VykULUqdklfC8IuYjsvOETrk9JJyqwpMd6bv/TAOBkiUbT6VJ
qZJsyfcy6CG1UNkOvdjy/DXBUA084a+g/RmDaL4slS89MnyOwG4tW7qdcJiK6UR4
zrSe17iyUDh270lkUnthXqaBgGQSYCsUAzcNbcwW/stTVYr/zVuoZ1NyAgpU/Tgo
J8M267lsbJ08ExDMdEKytZpDDE7WpJ1NDhxhUAgQEqceKoWIqeQ=
=LsI6
-----END PGP SIGNATURE-----

--VdnGiXwuH6t1Tqzo--
