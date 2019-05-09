Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:05:59 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 03/28] PCI: tegra: Rearrange Tegra PCIe driver
 functions
Message-ID: <20190509140559.GC8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-4-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="adJ1OR3c6QgCpb/j"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-4-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--adJ1OR3c6QgCpb/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:58:00PM +0530, Manikanta Maddireddy wrote:
> Tegra PCIe has register spec for,
>  - AXI to FPCI(AFI) bridge
>  - Multiple PCIe root ports
>  - PCIe PHY
>  - PCIe pad control
>=20
> Rearrange Tegra PCIe driver functions such that each function programs
> required module only.
>  - tegra_pcie_enable_controller(): Program AFI module and enable PCIe
> controller.
>  - tegra_pcie_phy_power_on(): Bring up PCIe PHY.
>  - tegra_pcie_apply_pad_settings(): Program PCIe REFCLK pad settings.
>  - tegra_pcie_enable_ports(): Program each root port and bring up PCIe
> link.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: This is new patch in V2
>=20
>  drivers/pci/controller/pci-tegra.c | 70 +++++++++++++-----------------
>  1 file changed, 30 insertions(+), 40 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--adJ1OR3c6QgCpb/j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUM8cACgkQ3SOs138+
s6HBUw/+Nge0hAU4yobAmEA4PrdYseRVfQdBLh5I0sOnjta7vUd8lhBu+ZHXLUxT
sQ1SLFFnDK2iq1dOmxlr98Lzfm+WSZ/uBINcD60pwv+dDxDJCBQg2pbT+FmMZjOl
c2xcpE3aEdO2PhPslMTJkOkZPvjzahB9EZRw++AUb/1cmnJlpbR2vN1W9qpO9Yvf
+SihoeLiDEd8J84z7FASb+6UOtan6YmDfVPXzFuvkRs/ZTVg9Zn8/1SvxYgRkJyy
nHnNxLMiaJ6G1G3vb6jLG/QZ2WRJA7EwnhNB9znJQjOKl5ydZ4BPt5Md4RrQKiwo
PHVi7ujVbKbkgES3plvtt5TVv6jPdCopg/8kMj4zgjZLjp37G8GrToKR9a9rczg1
JQRZ3lK65qDqM97JlywjQViLCRr8eFLWL+fb5fNvKf534nqjTz3pBy7BLpRRTJlw
ZLAnrtR1LR78bKfMyPfiBNnYovrUiOyYWyppKqDWIHXmL4VRJjmXtHcVB48Z334Y
K1Wx5nvBnTHhBbN1tKdTSaw5XyoXddvvG3GtIJrzlEkLhSGj0zjpMAyUpuOo3Juf
1IGY5xIo4MA9Smua3qpUNL7vlTXRV3QBor25ka2m02Ic6oA/ueUZfo4nLJMbHhTR
0lffVkIlyZ7QPm5hSBjREi5Dc6u7UZ5q6RPyVxopflUJCU+pGRQ=
=hZ3Q
-----END PGP SIGNATURE-----

--adJ1OR3c6QgCpb/j--
