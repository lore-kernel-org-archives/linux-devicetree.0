Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 15:37:15 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 21/30] PCI: tegra: Add "pci" type check before parsing
 child device tree node
Message-ID: <20190415133715.GV29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-22-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SidV/bKy1CyabPX8"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-22-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--SidV/bKy1CyabPX8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:46PM +0530, Manikanta Maddireddy wrote:
> Each root port is added as a child device tree node of PCIe controller
> node. These child nodes are parsed using open firmware PCI bus accessor
> functions. If the child node is not of "pci" type then device tree
> parsing fails. Add "pci" type check before parsing child device tree node.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 3 +++
>  1 file changed, 3 insertions(+)

Erm... what is the use-case that you're trying to support? Why would we
ever have children nodes that are not of type "pci"?

Thierry

>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index 8fdc7934d4c9..d08a63132c77 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -2197,6 +2197,9 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *p=
cie)
>  		unsigned int index;
>  		u32 value;
> =20
> +		if (!of_node_is_type(port, "pci"))
> +			continue;
> +
>  		err =3D of_pci_get_devfn(port);
>  		if (err < 0) {
>  			dev_err(dev, "failed to parse address: %d\n", err);
> --=20
> 2.17.1
>=20

--SidV/bKy1CyabPX8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0iQsACgkQ3SOs138+
s6FUyxAAnkf01jh7+eaGARzrET2gB0JFF7X1kJ7PqoRi3aCw713hwZl800YqX9r0
3rHlnJHLbaezlo1IO25/YS1Z0rYpYxP5Ji6tI9y+XSOaFeBxDCd7a37YPUFzi9EB
mg5THpQenNc5oYQLxW6GeEdmSyTLvGaNnT6Eqlxighemb7WW2Vcnf7cMx5o566Dk
xXlpwiTCVuHVZstPiEUzLcxDw6iTLT1CQKzp3DQGOtCyf88B0IuuEOT1Mnp+co14
rGjYDQz/GzY7trOKv39lkMPO6jUKSz69tFjGbDiFHNX5iiU5ebKy906yi4vxivDv
o6/p33w0VpFQ+fFbyzKME9aNi+vcc2C8sBmrEhx+l/Igozr8F5x/s62ItNBVGgfT
LfdpwnU+L5UX83cH6LhoRbOJCfdBkGaRkKWRLzDig5rB37ShUaMDK8K2P4kY9lZp
IFg/jn+DElCZyjEOSCG2CyWES3Nqe718X1PU458x8A9pBHPOSsVhrgYYZl16DapA
BCdJ9UttI5vGTjmKR4j3yh7hIuZA50tcWZB7V5LE8XNdGrSRE/f+oQZnV0f1+Ug9
fVdojcg58HqXFdyn4uIVEPPRE+ZXdqx9dGuN0hXfI+Jfx16U8cV8LUtqDElZ4B4r
CwK5fgXx3jdGIVUopGuW7Cx9Mu7zZ5Q5xn0y3RXSVqoaNMh3+1w=
=2f7d
-----END PGP SIGNATURE-----

--SidV/bKy1CyabPX8--
