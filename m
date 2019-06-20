Return-Path: <SRS0=7LTX=UT=gmail.com=thierry.reding@kernel.org>
Date: Thu, 20 Jun 2019 13:14:25 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 00/27] Enable Tegra PCIe root port features
Message-ID: <20190620111425.GA1000@ulmo>
References: <20190618180206.4908-1-mmaddireddy@nvidia.com>
 <20190620102552.GB28703@ulmo>
 <20190620105301.GA23729@e121166-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <20190620105301.GA23729@e121166-lin.cambridge.arm.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Manikanta Maddireddy <mmaddireddy@nvidia.com>, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2019 at 11:53:01AM +0100, Lorenzo Pieralisi wrote:
> On Thu, Jun 20, 2019 at 12:25:52PM +0200, Thierry Reding wrote:
> > On Tue, Jun 18, 2019 at 11:31:39PM +0530, Manikanta Maddireddy wrote:
> > > This series of patches adds,
> > > - Tegra root port features like Gen2, AER, etc
> > > - Power and perf optimizations
> > > - Fixes like "power up sequence", "dev_err prints", etc
> > >=20
> > > This series of patches are tested on Tegra186 based Jetson-TX2, Tegra=
210
> > > based Jetson-TX1, T124 based Jetson-TK1, Tegra20 and Tegra30 platform=
s.
> > >=20
> > > Changes from V5 to V6:
> > >   - Patch [V4, 20/27]: Replaced pcie_pme_disable_msi() with no_msi qu=
irk
> > >=20
> > > Changes from V4 to V5:
> > >  - Patch [V4, 4/28]: Added blank line before block style comment
> > >  - Patch [V4, 22/28]: "Access endpoint config only if PCIe link is up"
> > > patch is dropped
> > >  - Patch [V4, 27/28]:
> > > * Updated reset gpio toggle logic to reflect active low usage
> > > * Replaced kasprintf() with devm_kasprintf()
> > > * Updated commit message with more information.
> > >=20
> > > Changes from V3 to V4:
> > >  - Patch [V3,27/29] is dropped
> > >  - Patch [V3,28/29]: devm_gpiod_get_from_of_node() is directly used in
> > >    pci-tegra driver instead of of_get_pci* wrapper function defined in
> > >    Patch [V3,27/29].
> > >=20
> > > Manikanta Maddireddy (27):
> > >   soc/tegra: pmc: Export tegra_powergate_power_on()
> > >   PCI: tegra: Handle failure cases in tegra_pcie_power_on()
> > >   PCI: tegra: Rearrange Tegra PCIe driver functions
> > >   PCI: tegra: Mask AFI_INTR in runtime suspend
> > >   PCI: tegra: Fix PCIe host power up sequence
> > >   PCI: tegra: Add PCIe Gen2 link speed support
> > >   PCI: tegra: Advertise PCIe Advanced Error Reporting (AER) capability
> > >   PCI: tegra: Program UPHY electrical settings for Tegra210
> > >   PCI: tegra: Enable opportunistic UpdateFC and ACK
> > >   PCI: tegra: Disable AFI dynamic clock gating
> > >   PCI: tegra: Process pending DLL transactions before entering L1 or =
L2
> > >   PCI: tegra: Enable PCIe xclk clock clamping
> > >   PCI: tegra: Increase the deskew retry time
> > >   PCI: tegra: Add SW fixup for RAW violations
> > >   PCI: tegra: Update flow control timer frequency in Tegra210
> > >   PCI: tegra: Set target speed as Gen1 before starting LTSSM
> > >   PCI: tegra: Fix PLLE power down issue due to CLKREQ# signal
> > >   PCI: tegra: Program AFI_CACHE* registers only for Tegra20
> > >   PCI: tegra: Change PRSNT_SENSE IRQ log to debug
> > >   PCI: tegra: Disable MSI for Tegra PCIe root port
> > >   PCI: tegra: Add AFI_PEX2_CTRL reg offset as part of soc struct
> > >   dt-bindings: pci: tegra: Document PCIe DPD pinctrl optional prop
> > >   arm64: tegra: Add PEX DPD states as pinctrl properties
> > >   PCI: tegra: Put PEX CLK & BIAS pads in DPD mode
> > >   PCI: Add DT binding for "reset-gpios" property
> > >   PCI: tegra: Add support for GPIO based PERST#
> > >   PCI: tegra: Change link retry log level to debug
> >=20
> > Hi Lorenzo, Bjorn,
> >=20
> > There's a build-time dependency from the PCI patches on patch 1 of this
> > series. I've already Acked that, so I think you should take it through
> > the PCI tree along with the rest of the series.
> >=20
> > The only patch that I picked up is the DT change in patch 23, which is
> > decoupled from the others via DT, though the data that it adds to DT
> > will be used in patch 24.
> >=20
> > Does that sound good to you?
>=20
> Yes, I will drop patch 20 too as requested. Is there a merge ordering
> dependency between patch 23 and 24 ? If yes we should let Bjorn know
> or you drop patch 23 and I will merge it via PCI, let us know.

Nope, I don't think there are any issues with ordering. Patch 23
basically just adds the DT content that will be used by patch 24 to
dynamically change the pinmux options. Without patch 24, the default
state will be applied, which is what the state will be on boot anyway.
Patch 24 without patch 23 would mean that the PCI driver will try to
select a pinctrl state which does not exist, but this is already handled
gracefully in pinctrl_pm_select_state().

Thierry

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LaooACgkQ3SOs138+
s6HJPhAAjLhryaflH8uX3P6GIMNMIXi/tejz0MLtvqPqHRQU/DEIJaVg1KpUKgGB
sS35X3nSVxmaVX+dcLwirdCQkHUlNefx00vtkUxgWYxrW9bokm6GLoAFt5p4k3iz
CKdyz+WfSbek22kCJPidmHBcjQtMfS+GFSxvA9TTH0+dtw02cXkNSy1ySDBVNBH4
rqhWsqFssy/QGCarz47nc0RjUJW0RrHJXYtRk1mDWpQzt3zBkEjiv3gDrTO6gPzV
PFxIYGY8lxQl//PkZ2JtHI6Y2e+u0hf8HbC+4XKNp+jM4ZusEvKYSj6KMPphpxD0
Mx5XXZT8bBjxsGrthPeRQSX9vpFMV0P6Q7S7D+reoWD1OVbz5UQv1Yg9PID71bgv
XTPOkoklqud06pTzzKbzToXHQEUDaRdnEiwdyeQ3N21uh5027YJyo8rwcewJ3aMC
ht10cqe30IS1PDiepOasOrx4AxxGjdSWVwqVa82sE62aNSfydcVbfw5sptiqNv/x
utM1MMRT+fC2/XIZcfpbfcG8d02rCldCi+s4ToQ5lhz7n/vNdDZNgEwz70wwbqEy
WQUBIsLRKTmAuRyuhiCAgaDGwWGbsx9r7D9wGBKQFBJlL14OdI/7tqjEsWP0Eb+i
CCtvGG0B5Ii3IZZwmlUDKWDQgxntahFJYMgn2XkGWtpSWNkl0QM=
=1uKr
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
