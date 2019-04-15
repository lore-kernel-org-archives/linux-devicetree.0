Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 15:45:16 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 22/30] PCI: tegra: Access endpoint config only if PCIe
 link is up
Message-ID: <20190415134516.GW29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-23-mmaddireddy@nvidia.com>
 <20190411201535.GS256045@google.com>
 <e721e7f4-85c9-bee1-7131-12e0b7dfc0d1@nvidia.com>
 <20190412145003.GE141472@google.com>
 <1039fbf2-24ad-c31c-93d9-663aab74a26a@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Cf1qy2gtPj5yoBMh"
Content-Disposition: inline
In-Reply-To: <1039fbf2-24ad-c31c-93d9-663aab74a26a@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Ley Foon Tan <lftan@altera.com>, Michal Simek <michal.simek@xilinx.com>
List-ID: <devicetree@vger.kernel.org>


--Cf1qy2gtPj5yoBMh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2019 at 05:06:10PM +0530, Manikanta Maddireddy wrote:
>=20
> On 12-Apr-19 8:20 PM, Bjorn Helgaas wrote:
> > [+cc Jingoo, Gustavo (dwc maintainers), Ley (altera), Michal (xilinx)]
> >
> > On Fri, Apr 12, 2019 at 12:30:22PM +0530, Manikanta Maddireddy wrote:
> >> On 12-Apr-19 1:45 AM, Bjorn Helgaas wrote:
> >>> On Thu, Apr 11, 2019 at 10:33:47PM +0530, Manikanta Maddireddy wrote:
> >>>> Add PCIe link up check in config read and write callback functions
> >>>> before accessing endpoint config registers.
> >>>>  static int tegra_pcie_config_read(struct pci_bus *bus, unsigned int=
 devfn,
> >>>>  				  int where, int size, u32 *value)
> >>>>  {
> >>>> +	struct tegra_pcie *pcie =3D bus->sysdata;
> >>>> +	struct pci_dev *bridge;
> >>>> +	struct tegra_pcie_port *port;
> >>>> +
> >>>>  	if (bus->number =3D=3D 0)
> >>>>  		return pci_generic_config_read32(bus, devfn, where, size,
> >>>>  						 value);
> >>>> =20
> >>>> +	bridge =3D pcie_find_root_port(bus->self);
> >>>> +
> >>>> +	list_for_each_entry(port, &pcie->ports, list)
> >>>> +		if (port->index + 1 =3D=3D PCI_SLOT(bridge->devfn))
> >>>> +			break;
> >>>> +
> >>>> +	/* If there is no link, then there is no device */
> >>>> +	if (!tegra_pcie_link_status(port)) {
> >>> This is racy and you should avoid it if possible.  The link could go =
down
> >>> between calling tegra_pcie_link_status() and issuing the config read/=
write.
> >>>
> >>> If your driver is to be reliable, it must be able to handle any bad
> >>> consequence of issuing that config read/write anyway, so I think it's
> >>> better if it doesn't even bother checking whether the link is up.
> >> This change is made based on similar check present in dwc driver
> >> dw_pcie_valid_device(), reasons for making this change in Tegra might
> >> differ dwc.
> > Yes, you won't be surprised to learn that I don't like the similar
> > checks in dwc, altera, xilinx, and xilinx-nwl either :)  I raise this
> > issue every time I see it, but I can't remember if I've mentioned dwc
> > specifically.
> >
> > We need to either eradicate this pattern of checking for link up, or
> > include a comment about why it is absolutely necessary.
>=20
> This patch is created to address below scenario in our downstream kernel,
> 1) Our platform has WiFi on one slot and GPU in another.
> 2) During WiFi OFF, link is put in L2 and it goes through hot reset
> when turning ON WiFi (since Tegra doesn't support hot-plug).
> 3) Whenever x11 server is started it scans the PCIe bus for video devices.
> Here PCIe configuration registers of all devices are read to find out
> all available video devices.
> 4) If "x11 server" started with WiFi OFF, then we are seeing "response
> decoding error"(Tegra AFI module specific error).
>=20
> Best solution we came up with is to have link up check in config access
> callback functions.

So we really need this to prevent a userspace access to PCI config space
=66rom triggering these errors? I'm not familiar with how PCI access from
userspace works, but if modifying the accessors fixes this problem it
sounds like userspace would end up calling these accessors. If so, it
sounds more like we should fix this at the point where userspace calls
these accessors. According to what you're saying this should never be an
issue from kernel space, because as long as a driver needs access to its
device, the PCI bus should be up.

And if that wasn't the case, then we probably do want to see these AER
errors to help diagnose the issue.

So could we instead have some sort of host bridge operation that would
expose the link status and use that as part of the userspace access to
PCI configuration space?

Thierry

> >> Intention here is to reduce the number of AER errors when device is
> >> falling off the bus or going through hot reset. So racy condition here=
 is
> >> OK
> > I'm not convinced about this.  The issues you mention need to be
> > solved in a generic way, not a tegra-specific way.
> >
> > We don't want to end up with code that silently avoids the config
> > access 99.99% of the time, but once in a blue moon, we lose the race
> > (the device stops responding after we've determined the link is up)
> > and the access causes a mysterious AER error that we have no way to
> > debug.
> >
> >>>> +		*value =3D 0xffffffff;
> >>>> +		return PCIBIOS_DEVICE_NOT_FOUND;
> >>>> +	}
> >>>> +
> >>>>  	return pci_generic_config_read(bus, devfn, where, size, value);
> >>>>  }

--Cf1qy2gtPj5yoBMh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0iuwACgkQ3SOs138+
s6EinBAAmI7StLx0aqjZVpuT7UuaCTeLHdvZjsvruHsU2nTsvfiouC3OVN5RqVmx
XrKDboRjosAvFYQ3ncG0Lyd1S+Og8GFFkpVyDyi8RkQr9Y09nWLSrgyBEw8c5p+4
jS4Tr3EQLB8VuMLkC41AbrZ4R1ZPmKvLtGurutMAX5NDblsPxfMSXDDWHu4R8dl/
tD4c8ieHiJ/u4vt7ANAXI4XQGOhMaq1+yzh4WQ6RPHDGIVipal1vcqeWjXGWq3n6
Tv/yCwLngu+/tGgQOs4zz3pVyWNdSlLbpgvpR0UyGCt2TQPbxkNhTFaAuny1PUfd
joI+a3h2s9l6k1S95xAEsVQNFaUN2GNChX6a/R/NQZK681viR3+V56tSa/3nqTif
r12qfVS3T/fi6dSU+YPaSdqpnMEBIHS2pQk7VxV8YaewvO+csfXVHdl3TY5TK3QA
EkeRbRy4vaPtLEissaKzuPsvh3ssz8yyz6HUa+lcKrnsxXgdMseRCpuja8LVZXUI
jBJw9fHQfxxZlGL02EZtRKQqtgxtWnBGb+5iiv11w6+zGTNeUxXhnY4OPadpZ78b
A8FMhfaBQmxtl60z6fr8AEEf7ZBC2WqA364TdZoIELm+IFrCuSopYQSlXcixjXzZ
TG5UK4P4eAa4S9QrrYaCHNr8VVmb9SDJ2c6lIm2gYr6KqtIxpv4=
=MRyK
-----END PGP SIGNATURE-----

--Cf1qy2gtPj5yoBMh--
