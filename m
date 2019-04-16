Return-Path: <SRS0=Lc6z=SS=gmail.com=thierry.reding@kernel.org>
Date: Tue, 16 Apr 2019 18:11:18 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 16/30] PCI: tegra: Program AFI_CACHE* registers only for
 Tegra20
Message-ID: <20190416161118.GA27141@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-17-mmaddireddy@nvidia.com>
 <20190415132031.GR29254@ulmo>
 <931047de-ead5-8bdf-cf65-e2d42ecd2b66@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <931047de-ead5-8bdf-cf65-e2d42ecd2b66@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2019 at 04:17:46PM +0530, Manikanta Maddireddy wrote:
>=20
>=20
> On 15-Apr-19 6:50 PM, Thierry Reding wrote:
> > On Thu, Apr 11, 2019 at 10:33:41PM +0530, Manikanta Maddireddy wrote:
> >> AFI_CACHE* registers are available only in Tegra20, program them only
> >> for Tegra20.
> >>
> >> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> >> ---
> >>  drivers/pci/controller/pci-tegra.c | 13 ++++++++-----
> >>  1 file changed, 8 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controll=
er/pci-tegra.c
> >> index 8e5fdc8ce3d6..cdaaf13a9fd7 100644
> >> --- a/drivers/pci/controller/pci-tegra.c
> >> +++ b/drivers/pci/controller/pci-tegra.c
> >> @@ -887,6 +887,7 @@ static irqreturn_t tegra_pcie_isr(int irq, void *a=
rg)
> >>   */
> >>  static void tegra_pcie_setup_translations(struct tegra_pcie *pcie)
> >>  {
> >> +	struct device_node *np =3D pcie->dev->of_node;
> >>  	u32 fpci_bar, size, axi_address;
> >> =20
> >>  	/* Bar 0: type 1 extended configuration space */
> >> @@ -927,11 +928,13 @@ static void tegra_pcie_setup_translations(struct=
 tegra_pcie *pcie)
> >>  	afi_writel(pcie, 0, AFI_AXI_BAR5_SZ);
> >>  	afi_writel(pcie, 0, AFI_FPCI_BAR5);
> >> =20
> >> -	/* map all upstream transactions as uncached */
> >> -	afi_writel(pcie, 0, AFI_CACHE_BAR0_ST);
> >> -	afi_writel(pcie, 0, AFI_CACHE_BAR0_SZ);
> >> -	afi_writel(pcie, 0, AFI_CACHE_BAR1_ST);
> >> -	afi_writel(pcie, 0, AFI_CACHE_BAR1_SZ);
> >> +	if (of_device_is_compatible(np, "nvidia,tegra20-pcie")) {
> > At this point we've already matched on that compatible string, so we
> > could probably get that information from the SoC structure. Why are
> > these registers not available on later chips? How would we mark
> > transactions as uncached on later generations of Tegra?
> >
> > Also, typically writing to non-existing registers on Tegra186 would
> > cause an SError exception, but I haven't seen any of those with PCIe
> > on Tegra186. So do these really not exist, or are they simply not used?
> >
> > Thierry
>=20
> Do you want me to add new soc flag for AFI_CACHE registers?
>=20
> As per the HW team feedback, upstream requests targeting DRAM would
> be marked as cacheable when the address of the request are within the
> regions defined by the cache_bar_sz/st registers.
> All upstream DRAM requests are marked as non-cacheable from T30 to T210
> as the field is not used by MSS. In Tegra186 cacheable requests are
> supported by new register AFI_AXCACHE_0*. *
> These register definitions are not present in Tegra186 TRM, but
> register offsets are accessible, so these are not used.
> However Tegra186 simulations traps this register access because
> it is not defined in register spec.

Yes, I think something like .has_cache_bars or similar would be the best
solution here.

Thierry

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly1/qEACgkQ3SOs138+
s6GjSg/9G/38RTSGcytMFlZDKlfai4gw1YZAjD26tRmUZYXCE1aihrewjRMIGpLf
YQNPhfUO4r3YaXsPr0BfZc6Q2uV8blOgx3G3o6HQ7IsCTI8Yq0iTEqPsW10V7QW+
BNG5qVMZkMIURFslFTv6Tj3MeFobDZ7eNn196OgYNdr1HszMR+boiCGwALSDO5mc
YiOZONKMyM7E3kWWwxC2IOEy6mDwYN4iStwH4Wa8Pvq6ARe4pbvww5KwPXsgoVKt
C7eOo74DqrQStSOUxPcf+aRxPc+a3MLa6/aqZngcOJjTZm2eFJ0L9FZ/b4P1+Qmp
+pTugSEbnDYM7bddfLoIamvjRutFZbxNZ3Ah949sg2I7vbu1gr1bY51B7U0xVmZe
hKIBjKyL5qBmkpEOnvzQUitrGQ0ccsubFTSAvXn71+S+hAtVbqcOQccGHGZZVoJx
TUeQGN/Q8+YrhPPhej6iuQ69eifEQDX5BodBwI22KTgGojjfl/hFD3wHr0tLpzPG
kHRcr8R8i+OxBYSNmXzsXN2AN/guXFpaIvHipdvbOO30qv0iW/Zmrf78D6tnCRfV
7vAr1gvMAPV94U6Mb1B2nC14KM+QzblWwqWnQ7xsDtxP4OHAXcdYUTRt5aH8ilV6
rPwzrAJb3x88CMMIbZNnQ6AhyCftGYPHjHs57ZG/5Its4YuBKGM=
=UU8y
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
