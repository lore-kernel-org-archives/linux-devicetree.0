Return-Path: <SRS0=chGP=UD=gmail.com=thierry.reding@kernel.org>
Date: Tue, 4 Jun 2019 15:14:36 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 22/28] PCI: tegra: Access endpoint config only if PCIe
 link is up
Message-ID: <20190604131436.GS16519@ulmo>
References: <20190516055307.25737-1-mmaddireddy@nvidia.com>
 <20190516055307.25737-23-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8DtChEGCcMdSgkU2"
Content-Disposition: inline
In-Reply-To: <20190516055307.25737-23-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--8DtChEGCcMdSgkU2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 11:23:01AM +0530, Manikanta Maddireddy wrote:
> Few endpoints like Wi-Fi supports power on/off and to leverage that
> root port must support hot-plug and hot-unplug. Tegra PCIe doesn't
> support hot-plug and hot-unplug, however it supports endpoint power
> on/off feature as follows,
>  - Power off sequence:
>    - Transition of PCIe link to L2
>    - Power off endpoint
>    - Leave root port in power up state with the link in L2
>  - Power on sequence:
>    - Power on endpoint
>    - Apply hot reset to get PCIe link up
>=20
> PCIe client driver stops accessing PCIe endpoint config and BAR registers
> after endpoint is powered off. However, software applications like x11
> server or lspci can access endpoint config registers in which case
> host controller raises "response decoding" errors. To avoid this scenario,
> add PCIe link up check in config read and write callback functions before
> accessing endpoint config registers.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V4: No change
>=20
> V3: Update the commit log with explanation for the need of this patch
>=20
> V2: Change tegra_pcie_link_status() to tegra_pcie_link_up()
>=20
>  drivers/pci/controller/pci-tegra.c | 38 ++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)

This still doesn't look right to me conceptually. If somebody wants to
access the PCI devices after the kernel has powered them off, why can't
we just power the devices back on so that we allow userspace to properly
access the devices?

Or if that's not what we want, shouldn't we add something to the core
PCI infrastructure to let us deal with this? It seems like this is some
general problem that would apply to every PCI device and host bridge
driver. Having each driver implement this logic separately doesn't seem
like a good idea to me.

Thierry

> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index d20c88a79e00..33f4dfab9e35 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -428,6 +428,14 @@ static inline u32 pads_readl(struct tegra_pcie *pcie=
, unsigned long offset)
>  	return readl(pcie->pads + offset);
>  }
> =20
> +static bool tegra_pcie_link_up(struct tegra_pcie_port *port)
> +{
> +	u32 value;
> +
> +	value =3D readl(port->base + RP_LINK_CONTROL_STATUS);
> +	return !!(value & RP_LINK_CONTROL_STATUS_DL_LINK_ACTIVE);
> +}
> +
>  /*
>   * The configuration space mapping on Tegra is somewhat similar to the E=
CAM
>   * defined by PCIe. However it deviates a bit in how the 4 bits for exte=
nded
> @@ -493,20 +501,50 @@ static void __iomem *tegra_pcie_map_bus(struct pci_=
bus *bus,
>  static int tegra_pcie_config_read(struct pci_bus *bus, unsigned int devf=
n,
>  				  int where, int size, u32 *value)
>  {
> +	struct tegra_pcie *pcie =3D bus->sysdata;
> +	struct pci_dev *bridge;
> +	struct tegra_pcie_port *port;
> +
>  	if (bus->number =3D=3D 0)
>  		return pci_generic_config_read32(bus, devfn, where, size,
>  						 value);
> =20
> +	bridge =3D pcie_find_root_port(bus->self);
> +
> +	list_for_each_entry(port, &pcie->ports, list)
> +		if (port->index + 1 =3D=3D PCI_SLOT(bridge->devfn))
> +			break;
> +
> +	/* If there is no link, then there is no device */
> +	if (!tegra_pcie_link_up(port)) {
> +		*value =3D 0xffffffff;
> +		return PCIBIOS_DEVICE_NOT_FOUND;
> +	}
> +
>  	return pci_generic_config_read(bus, devfn, where, size, value);
>  }
> =20
>  static int tegra_pcie_config_write(struct pci_bus *bus, unsigned int dev=
fn,
>  				   int where, int size, u32 value)
>  {
> +	struct tegra_pcie *pcie =3D bus->sysdata;
> +	struct tegra_pcie_port *port;
> +	struct pci_dev *bridge;
> +
>  	if (bus->number =3D=3D 0)
>  		return pci_generic_config_write32(bus, devfn, where, size,
>  						  value);
> =20
> +	bridge =3D pcie_find_root_port(bus->self);
> +
> +	list_for_each_entry(port, &pcie->ports, list)
> +		if (port->index + 1 =3D=3D PCI_SLOT(bridge->devfn))
> +			break;
> +
> +	/* If there is no link, then there is no device */
> +	if (!tegra_pcie_link_up(port))
> +		return PCIBIOS_DEVICE_NOT_FOUND;
> +
>  	return pci_generic_config_write(bus, devfn, where, size, value);
>  }
> =20
> --=20
> 2.17.1
>=20

--8DtChEGCcMdSgkU2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2brwACgkQ3SOs138+
s6G6Iw/+IQz1vYysRtpqgy+xN2cWGTm9Dlq/iEFagrSuC3ryrIF5GQnXTZxfEsG/
vlr3VtKlbofo9fsEIpt7rtYtPvtTNX5ueHOE3rlKipcIUxKfc68U77rR6G3xZ9VA
Qol0AQMYEs/E6SKS4i9ashv+wVRMLzv5hT4ScC3dLPjoycQru3qs0OU6WvOpf5Ag
aMF/XmcNJojmJ8WP1byEG9fXoC4OChJDjM3o4r8kbW0x/cIhbcry9P7HB/pvKMDA
7nd3XhVfjlcG246ftmvskHfrvRwA7LFykUfkCQDJlTVQVnsXFfieLtp41zDA+YY2
6hZ+2WWEGf4HBGJo1urQF/yFe3qErAEDjTVRhrgkKG6kdCSmYYqvN17i53EZSbhi
H0O2r4qTeKiExRve/AKywiYYJbn0VM0inSxk96CY9ZynIygUJ1p+cVs++5IKcczv
51nNXhabNh6644X7tnoz2vmDd/fA8njdwakV2NxGbENpKpgP7bT1UuAokdJzXccF
BqMejvYtinFNbpi/WGWz082XauSgeXA0iWD8wqMXthnvfn0U0bgxFYNgB1jAIB0w
HWo6o25/aELWBHLiSDE9SdhDN8Emgd7/v11vJ+EErcXG6jATbkrty02Sm/NCTDeM
z8itU1p9+FyWpwgRYKogoyIdRBrZgwJos2HP888DANLMsvgVGTQ=
=DFTR
-----END PGP SIGNATURE-----

--8DtChEGCcMdSgkU2--
