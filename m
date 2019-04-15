Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 15:35:11 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 19/30] PCI: tegra: Use legacy irq for port service drivers
Message-ID: <20190415133511.GU29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-20-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FfX2iGK5t5ehHnsE"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-20-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--FfX2iGK5t5ehHnsE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:44PM +0530, Manikanta Maddireddy wrote:
> Tegra signals PCIe services like AER, PME, etc over legacy IRQ line.
> By default service drivers register interrupt routine over MSI IRQ line,
> use pcie_pme_disable_msi() function to disable MSI for service drivers.
>=20
> PME and AER interrupts registered to MSI without this change
> cat /proc/interrupts | grep -i pci
> 36: 21 0 0 0 0 0 GICv2 104 Level       PCIE
> 37: 35 0 0 0 0 0 GICv2 105 Level       Tegra PCIe MSI
> 76: 0  0 0 0 0 0 Tegra PCIe MSI 0 Edge PCIe PME, aerdrv, PCIe BW notif
>=20
> PME and AER interrupts registered to legacy IRQ with this change
> cat /proc/interrupts | grep -i pci
> 36: 33 0 0 0 0 0 GICv2 104 Level      PCIE, PCIe PME, aerdrv, PCIe BW not=
if
> 37: 52 0 0 0 0 0 GICv2 105 Level      Tegra PCIe MSI
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index dcfe97711cb5..11be88a394e3 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -41,6 +41,7 @@
>  #include <soc/tegra/pmc.h>
> =20
>  #include "../pci.h"
> +#include "../pcie/portdrv.h"
> =20
>  #define INT_PCI_MSI_NR (8 * 32)
> =20
> @@ -2724,6 +2725,9 @@ static int tegra_pcie_probe(struct platform_device =
*pdev)
>  		goto put_resources;
>  	}
> =20
> +	/* PME events are received over legacy INTR, so disable MSI for PME */
> +	pcie_pme_disable_msi();
> +

I don't know about Bjorn, but to me it seems like this should be an
explicit property of the PCI host bridge rather than some global
variable. We already have a couple of flags for similar purposes in
struct pci_host_bridge.

The above seems like it should always work fine and I can't envision a
device where we'd ever have a Tegra PCIe root complex and a different
host bridge, so this wouldn't make a difference one way or the other,
but this global variable seems like a suboptimal solution to me.

Bjorn?

Thierry

--FfX2iGK5t5ehHnsE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0iI8ACgkQ3SOs138+
s6FPaw//blhb2pCkcEGoGDEOW0RH5PpoG7mPFH+LMSGmVNycRI0GdO/f+WebaBem
ZaDxr9RcWowyZIugthAFeyU2fkhojal1PuXfa9ZSUPkIc5+4VLySkjUcwfv+lbZ+
9mXDn2Ej8TOslHYraXxmZ55/iVi326+pdlFXcgENYdlz1s+EjsL17o6jjbdJIMns
YlkUbB9hExhcKT1VPDohSB7fudBgfxnfMvXZaPuW6/j84czUEnrtGpFaTBBsdPcQ
VI+rxxcNGJeS1tS/wUuwaPbgjgRMY8AODpD18o2pvhlnsCROvdQ28TTRvqL758L8
rbFr2pvsHiqYblo+R+yxsYeB1OG7/CK/JZpqXNLCuuW8jGvH5LzMRmyMa8OUOjGC
7kAXZKShJ3daLTmAxxhSGnTUS/aQZLopSjwzP6cZrtZHM+27KiodHPEWY/EwPFYW
Fa/Fl7OiohSIwvQAmrZCuc4RUdQBC9JF7/adWdeyuNXFZUlNLbRJhhQa+m2By69L
G2Po/BV7zjuDmRsbAMbUEFYORyXtMA56aHm1t97IL6HSxtBQ/TkR0jEfHO32+Vhw
6UfbrGBbuiYPXZKcYzv7b3yjCA5odRrDveQptxFaCgKLqYpUKNAfuLmYI7j8Px9O
RanIJB2kgzToTahe21suSajiTKDRaLjh/Q/cg0PJ94x5quQNgZ8=
=3mmt
-----END PGP SIGNATURE-----

--FfX2iGK5t5ehHnsE--
