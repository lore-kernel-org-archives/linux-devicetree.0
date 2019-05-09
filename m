Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:29:36 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 20/28] PCI: tegra: Use legacy irq for port service
 drivers
Message-ID: <20190509142936.GQ8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-21-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3mUD2hqWbnBptYHy"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-21-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--3mUD2hqWbnBptYHy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:58:17PM +0530, Manikanta Maddireddy wrote:
> Tegra signals PCIe services like AER, PME, etc over legacy IRQ line.
> By default, service drivers register interrupt routine over MSI IRQ line.
> Use pcie_pme_disable_msi() function to disable MSI for service drivers.
>=20
> PME and AER interrupts registered to MSI without this change,
> cat /proc/interrupts | grep -i pci
> 36: 21 0 0 0 0 0 GICv2 104 Level       PCIE
> 37: 35 0 0 0 0 0 GICv2 105 Level       Tegra PCIe MSI
> 76: 0  0 0 0 0 0 Tegra PCIe MSI 0 Edge PCIe PME, aerdrv, PCIe BW notif
>=20
> PME and AER interrupts registered to legacy IRQ with this change,
> cat /proc/interrupts | grep -i pci
> 36: 33 0 0 0 0 0 GICv2 104 Level      PCIE, PCIe PME, aerdrv, PCIe BW not=
if
> 37: 52 0 0 0 0 0 GICv2 105 Level      Tegra PCIe MSI
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: No change
>=20
>  drivers/pci/controller/pci-tegra.c | 4 ++++
>  1 file changed, 4 insertions(+)

I think I mentioned this before, but it would be nice to make this
setting per-controller rather than system-global. In practice I guess
this doesn't really matter at this point, and I'm not sure how much
Bjorn cares, so:

Acked-by: Thierry Reding <treding@nvidia.com>

>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index 72634ce6d3da..edc6a0f27397 100644
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
> @@ -2721,6 +2722,9 @@ static int tegra_pcie_probe(struct platform_device =
*pdev)
>  		goto put_resources;
>  	}
> =20
> +	/* Switch to legacy IRQ for PCIe services like AER, PME*/
> +	pcie_pme_disable_msi();
> +
>  	pm_runtime_enable(pcie->dev);
>  	err =3D pm_runtime_get_sync(pcie->dev);
>  	if (err) {
> --=20
> 2.17.1
>=20

--3mUD2hqWbnBptYHy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUOVAACgkQ3SOs138+
s6HCxA//UrUL86LMU95RJrjuqvwVYJKT0fSy7PVkjFQQcnF3C+aVPEG/OyiG/B8B
5nwRFNZfmen44uPLeEqbBW8G4kMhFeackzeVTBCHxMUCFnJg6j1hlxqtWJgSo9Lt
se00pexpTVeFsG8s3r7ovdkAtLeWRtgt4W6ldwre7mrSpzQiXs6H7uPB10Z/0QYN
/XkHEoOmivy7AjOSKjBNTox/8vH/buzrbhmnZhYM5wMpT80AaeQ3Laj9s7SWTLvf
ETGaEVwM2KnEouBydan3YXENlSz/auglamH7radXcOHYLGCD35fssZtBb0kUAD2+
pMN6kJOmJmJ0LVAFBDraE8IMRKE4ybfX1i+iZKNLLg0X/cciAy5/4+PID+zYN/92
aPPS1ZeBrRy9kGHQe4xcpgJkcD0yOAtHmXyB5BZrK/CEXwUANRElsMN3MitAfx/9
gR+3orUkfw7dKh5ptyrhmxDo9WOwxC3BvQO5r/xXyaxSCApcEget3Y2sJRJ+pX4G
1RjaFdoSPV4sas+qilLWuXGtRcFZVYzb2FOP0jpOEY/RxMfjTISnQDtW/kttSwrt
uVknQgtMzTPDa7ra6cuufQE8syse2T5rrF/N0r5+3u0/vjQA8sI21rriXi3I8nNJ
BbK01FlMYnj/QS2cavbotIduJkCd50x4r/IpmMTBg+09E6MhJxo=
=ePGI
-----END PGP SIGNATURE-----

--3mUD2hqWbnBptYHy--
