Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:25:11 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 18/28] PCI: tegra: Program AFI_CACHE* registers only
 for Tegra20
Message-ID: <20190509142511.GO8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-19-mmaddireddy@nvidia.com>
 <20190426153219.GE19559@ulmo>
 <600692ae-2a0c-766a-1b8f-827a9c73db36@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eQyCKlb8USywWNtC"
Content-Disposition: inline
In-Reply-To: <600692ae-2a0c-766a-1b8f-827a9c73db36@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--eQyCKlb8USywWNtC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2019 at 03:00:01PM +0530, Manikanta Maddireddy wrote:
>=20
>=20
> On 26-Apr-19 9:02 PM, Thierry Reding wrote:
> > On Tue, Apr 23, 2019 at 02:58:15PM +0530, Manikanta Maddireddy wrote:
> >> Cacheable upstream transactions are supported in Tegra20 and Tegra186 =
only.
> >> AFI_CACHE* registers are available in Tegra20 to support cacheable ups=
tream
> >> transactions. In Tegra186, AFI_AXCACHE register is defined instead of
> >> AFI_CACHE* to be in line with its MSS design. Therefore, program AFI_C=
ACHE*
> >> registers only for Tegra20.
> >>
> >> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> >> ---
> >> V2: Used soc variable for comparision instead of compatible string.
> >>
> >>  drivers/pci/controller/pci-tegra.c | 13 ++++++++-----
> >>  1 file changed, 8 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controll=
er/pci-tegra.c
> >> index f74930654443..9b841b0392ac 100644
> >> --- a/drivers/pci/controller/pci-tegra.c
> >> +++ b/drivers/pci/controller/pci-tegra.c
> >> @@ -323,6 +323,7 @@ struct tegra_pcie_soc {
> >>  	bool program_deskew_time;
> >>  	bool raw_violation_fixup;
> >>  	bool update_fc_timer;
> >> +	bool has_cache_bars;
> >>  	struct {
> >>  		struct {
> >>  			u32 rp_ectl_2_r1;
> >> @@ -932,11 +933,13 @@ static void tegra_pcie_setup_translations(struct=
 tegra_pcie *pcie)
> >>  	afi_writel(pcie, 0, AFI_AXI_BAR5_SZ);
> >>  	afi_writel(pcie, 0, AFI_FPCI_BAR5);
> >> =20
> >> -	/* map all upstream transactions as uncached */
> >> -	afi_writel(pcie, 0, AFI_CACHE_BAR0_ST);
> >> -	afi_writel(pcie, 0, AFI_CACHE_BAR0_SZ);
> >> -	afi_writel(pcie, 0, AFI_CACHE_BAR1_ST);
> >> -	afi_writel(pcie, 0, AFI_CACHE_BAR1_SZ);
> >> +	if (pcie->soc->has_cache_bars) {
> >> +		/* map all upstream transactions as uncached */
> >> +		afi_writel(pcie, 0, AFI_CACHE_BAR0_ST);
> >> +		afi_writel(pcie, 0, AFI_CACHE_BAR0_SZ);
> >> +		afi_writel(pcie, 0, AFI_CACHE_BAR1_ST);
> >> +		afi_writel(pcie, 0, AFI_CACHE_BAR1_SZ);
> >> +	}
> >> =20
> >>  	/* MSI translations are setup only when needed */
> >>  	afi_writel(pcie, 0, AFI_MSI_FPCI_BAR_ST);
> > You need to squash the below into this patch. If I do that, then
> > TrimSlice works again.
> >
> > Thierry
> Thank you Thierry for verifying the series on T20 and T30.
> I will take care of this comment in V3.
> Please review other patches and provide Ack.

For the record, with the patch below squashed in, this patch is:

Acked-by: Thierry Reding <treding@nvidia.com>

>=20
> Manikanta
> >
> > --- >8 ---
> > diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controlle=
r/pci-tegra.c
> > index 7071fd026a80..fc61074f6886 100644
> > --- a/drivers/pci/controller/pci-tegra.c
> > +++ b/drivers/pci/controller/pci-tegra.c
> > @@ -2530,6 +2530,7 @@ static const struct tegra_pcie_soc tegra20_pcie =
=3D {
> >   .program_deskew_time =3D false,
> >   .raw_violation_fixup =3D false,
> >   .update_fc_timer =3D false,
> > + .has_cache_bars =3D true,
> >   .ectl.enable =3D false,
> >  };
> >
> > @@ -2558,6 +2559,7 @@ static const struct tegra_pcie_soc tegra30_pcie =
=3D {
> >   .program_deskew_time =3D false,
> >   .raw_violation_fixup =3D false,
> >   .update_fc_timer =3D false,
> > + .has_cache_bars =3D false,
> >   .ectl.enable =3D false,
> >  };
> >
> > @@ -2581,6 +2583,7 @@ static const struct tegra_pcie_soc tegra124_pcie =
=3D {
> >   .program_deskew_time =3D false,
> >   .raw_violation_fixup =3D true,
> >   .update_fc_timer =3D false,
> > + .has_cache_bars =3D false,
> >   .ectl.enable =3D false,
> >  };
> >
> > @@ -2604,6 +2607,7 @@ static const struct tegra_pcie_soc tegra210_pcie =
=3D {
> >   .program_deskew_time =3D true,
> >   .raw_violation_fixup =3D false,
> >   .update_fc_timer =3D true,
> > + .has_cache_bars =3D false,
> >   .ectl =3D {
> >    .regs =3D {
> >     .rp_ectl_2_r1 =3D 0x0000000f,
> > @@ -2645,6 +2649,7 @@ static const struct tegra_pcie_soc tegra186_pcie =
=3D {
> >   .program_deskew_time =3D false,
> >   .raw_violation_fixup =3D false,
> >   .update_fc_timer =3D false,
> > + .has_cache_bars =3D false,
> >   .ectl.enable =3D false,
> >  };
> >
>=20

--eQyCKlb8USywWNtC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUOEYACgkQ3SOs138+
s6F77g//UnCHaLe+ewj8A+IX9zB5yReJNI6LVkiiWgsyyASQAC9aGJq5HieB8mw/
+41dhfl0td10srRlYQb7arJnvlftobclCIF1iBNKaqz6eu4ykL3ofw1ytpD8HPjK
vubSu7ZaNBVBE1q/yZgenivpjaglBTnyJGSPLzKGpjIsZYq4hTWgvQBXONxJi52/
I+TbJIc0+g5nd1Yl0J2zlfctdHKVrzp3r8lJp580KaVRwgJjcZVi2P0kcDxlAHXC
x32k34UHVzOPRE9CKpuppKhh/mJeU4EOTTrWUBLEWfZIDJV8as4O4NTxT4AxKLAL
KplGU0BwERJs4sAvXtCWjWyvzyDMBEJpBV6sHofles5AyWZw8cX2FMJdVU+avvmc
hiT2VonXluMAEXlkheqSFwbFqMrLV/ofnY0SsOXNFql7IVVwwE38cZGFivv2ZZYP
w9Q8O75yCZtE0azVuDtmo8iTMejA+gLIIY0UK502oANxVnlWIMJYYwEPlo1oQ3EE
pmiZEdYCd1NfH2j9MUT8SSKCO2AEdGTuR7XbdY/w7e9Ctv60vCVgDPiM6gXqEBCl
a06JAPSesOiuWJgw7U5DpQ9HKrdB4q/M4EmxNAP9b/tYq8Zdt/L1tTae2pHUXSZS
NLgr7ACSfRtA6+LNXoSzUJQ4qsefpWcUO/31+2gL73aEdIiMNm4=
=oKzY
-----END PGP SIGNATURE-----

--eQyCKlb8USywWNtC--
