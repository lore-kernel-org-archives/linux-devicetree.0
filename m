Return-Path: <SRS0=AVXS=S4=gmail.com=thierry.reding@kernel.org>
Date: Fri, 26 Apr 2019 17:32:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 18/28] PCI: tegra: Program AFI_CACHE* registers only
 for Tegra20
Message-ID: <20190426153219.GE19559@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-19-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="maH1Gajj2nflutpK"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-19-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--maH1Gajj2nflutpK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:58:15PM +0530, Manikanta Maddireddy wrote:
> Cacheable upstream transactions are supported in Tegra20 and Tegra186 onl=
y.
> AFI_CACHE* registers are available in Tegra20 to support cacheable upstre=
am
> transactions. In Tegra186, AFI_AXCACHE register is defined instead of
> AFI_CACHE* to be in line with its MSS design. Therefore, program AFI_CACH=
E*
> registers only for Tegra20.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: Used soc variable for comparision instead of compatible string.
>=20
>  drivers/pci/controller/pci-tegra.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index f74930654443..9b841b0392ac 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -323,6 +323,7 @@ struct tegra_pcie_soc {
>  	bool program_deskew_time;
>  	bool raw_violation_fixup;
>  	bool update_fc_timer;
> +	bool has_cache_bars;
>  	struct {
>  		struct {
>  			u32 rp_ectl_2_r1;
> @@ -932,11 +933,13 @@ static void tegra_pcie_setup_translations(struct te=
gra_pcie *pcie)
>  	afi_writel(pcie, 0, AFI_AXI_BAR5_SZ);
>  	afi_writel(pcie, 0, AFI_FPCI_BAR5);
> =20
> -	/* map all upstream transactions as uncached */
> -	afi_writel(pcie, 0, AFI_CACHE_BAR0_ST);
> -	afi_writel(pcie, 0, AFI_CACHE_BAR0_SZ);
> -	afi_writel(pcie, 0, AFI_CACHE_BAR1_ST);
> -	afi_writel(pcie, 0, AFI_CACHE_BAR1_SZ);
> +	if (pcie->soc->has_cache_bars) {
> +		/* map all upstream transactions as uncached */
> +		afi_writel(pcie, 0, AFI_CACHE_BAR0_ST);
> +		afi_writel(pcie, 0, AFI_CACHE_BAR0_SZ);
> +		afi_writel(pcie, 0, AFI_CACHE_BAR1_ST);
> +		afi_writel(pcie, 0, AFI_CACHE_BAR1_SZ);
> +	}
> =20
>  	/* MSI translations are setup only when needed */
>  	afi_writel(pcie, 0, AFI_MSI_FPCI_BAR_ST);

You need to squash the below into this patch. If I do that, then
TrimSlice works again.

Thierry

--- >8 ---
diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pc=
i-tegra.c
index 7071fd026a80..fc61074f6886 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2530,6 +2530,7 @@ static const struct tegra_pcie_soc tegra20_pcie =3D {
  .program_deskew_time =3D false,
  .raw_violation_fixup =3D false,
  .update_fc_timer =3D false,
+ .has_cache_bars =3D true,
  .ectl.enable =3D false,
 };

@@ -2558,6 +2559,7 @@ static const struct tegra_pcie_soc tegra30_pcie =3D {
  .program_deskew_time =3D false,
  .raw_violation_fixup =3D false,
  .update_fc_timer =3D false,
+ .has_cache_bars =3D false,
  .ectl.enable =3D false,
 };

@@ -2581,6 +2583,7 @@ static const struct tegra_pcie_soc tegra124_pcie =3D {
  .program_deskew_time =3D false,
  .raw_violation_fixup =3D true,
  .update_fc_timer =3D false,
+ .has_cache_bars =3D false,
  .ectl.enable =3D false,
 };

@@ -2604,6 +2607,7 @@ static const struct tegra_pcie_soc tegra210_pcie =3D {
  .program_deskew_time =3D true,
  .raw_violation_fixup =3D false,
  .update_fc_timer =3D true,
+ .has_cache_bars =3D false,
  .ectl =3D {
   .regs =3D {
    .rp_ectl_2_r1 =3D 0x0000000f,
@@ -2645,6 +2649,7 @@ static const struct tegra_pcie_soc tegra186_pcie =3D {
  .program_deskew_time =3D false,
  .raw_violation_fixup =3D false,
  .update_fc_timer =3D false,
+ .has_cache_bars =3D false,
  .ectl.enable =3D false,
 };


--maH1Gajj2nflutpK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzDJIMACgkQ3SOs138+
s6FRyw//ZS6UBzIotFfM5JANKOTd3CpkJIsA24iH8V+oRwOgvAwHptuXe3PUtzkp
YyoJLo7vOoA7uH6LTotob3X2rxs4pYO5q5tF41BugoOBbFEi3jkBz/zMlOKLN19i
G0/LS31A7zGquz860WUfhYHw1cmTgWSO4C7Ne/k1UPx9iuiR5xQb+Pywh0XDaFqL
oPk1tAXF6G6mlCLeEwPYDnG3hod1tgbx33izsn9zRPIbkSnawm5F4ifHtZUzziLs
e2g73cr/r/N5HvfLY5yc+pPws7mDp5W2CpjdKV5kT2JGFUhNNBmIKtVviOuw2bCZ
1F698005VzYoQS893xmerqZ12TlA7CojorheBBMqAG6AZok2/pms2oEVa8AX6WOi
XCkPQKQ75ixfZN2t1rIvJMXPWaLdVjYs854SzuUgMz2DPZwPHVtPQVTcdTsRLYgZ
s15FF0LG2UeEF2cHbJTpHOrY6/di3qWW3pbji6ok1unfG7EeVR8rF/AF9knkmppI
9mVOahmluHIBp2+X91zoRPDU2UkaZqaglSPswn81oEj0W50A/urZT/19Na08/hRP
Ori0588ZUahasBORmpBjCcd3ci17SefF/RItNX7xlds15vPaYTamWJ9uBP03/Rgd
t9XC+syol/1BQ2BY2uaUdd5UJbyX73A9Szlgn36Cztwz5LGrZRw=
=7P50
-----END PGP SIGNATURE-----

--maH1Gajj2nflutpK--
