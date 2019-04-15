Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 16:20:12 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 28/30] dt-bindings: pci: tegra: Document nvidia,rst-gpio
 optional prop
Message-ID: <20190415142012.GB29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-29-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qjo19A2vmS5T5MQB"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-29-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--Qjo19A2vmS5T5MQB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:53PM +0530, Manikanta Maddireddy wrote:
> Document "nvidia,rst-gpio" optional property which supports GPIO based
> PERST# signal.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.tx=
t b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> index dca8393b86d1..23928fd59538 100644
> --- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> @@ -75,6 +75,8 @@ Optional properties:
>    Pass pinctrl phandle to allow driver bring PCIe IO out of DPD state.
>  - nvidia,plat-gpios: A list of platform specific gpios which controls
>    endpoint's internal regulator or PCIe logic.
> +- nvidia,rst-gpio: If GPIO is used as PERST# signal instead of available
> +  SFIO, add this property with phandle to GPIO controller and GPIO numbe=
r.

GPIO properties are pretty much standardized, so this should really be
called just "reset-gpio".

Also it looks like this is documented in the wrong place. In the example
below you set this property for the root port, that is inside a child
node of the PCI controller, but if I understand correctly, and it's hard
to say from the context, the above is documented as part of the
properties of the host bridge node.

Thierry

> =20
>  Required properties on Tegra124 and later (deprecated):
>  - phys: Must contain an entry for each entry in phy-names.
> @@ -671,6 +673,7 @@ Board DTS:
> =20
>  		pci@1,0 {
>  			nvidia,num-lanes =3D <4>;
> +			nvidia,rst-gpio =3D <&tegra_main_gpio TEGRA_MAIN_GPIO(A, 3) 0>;
>  			status =3D "okay";
>  		};
> =20
> --=20
> 2.17.1
>=20

--Qjo19A2vmS5T5MQB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0kxwACgkQ3SOs138+
s6EOzw/5ATuYJ27momrmqb3VkwBwBsPFsX9ccnecMg59wUWTPByb7ZiyKgXVchoT
GRNJEHdjrcyiMVwQa037+3T/6N9oEYzBSrK+48uqLgR+Y8rdkMqfNMpf2f+iGeXj
v61oxrdwx3W2KQ9lJOoD2/PHoQ0vF7sJwGdQAeGl5RPgH8dCLxdCrxwM6drn/9zz
BlA2ZklWcW0xDCus77vY/cQUGRqD4PtwvcOs2QmefsmXg45QO3ra6mVRbGn98Svp
e8yb+nKlngE3GtmlpxS0PQJUte/LB+mkcvndU5frGwC8bzXeE6s+7H2AXysdK/O2
gxAdmx2MUOWiG8J81uL5DYAi0OuP0ajBq7SV+CV8ce29viOEu4PqQ/3hfVOugI9X
kN3AIOOEKKahENb+l9qqVMHEZuxbwP0xploOO/5NIR6wtTYBslqc4c0M3xmDnAdu
2KPM7mikqqoO6VNX0FRSBBrV3IodDgKp0388AWK4GeupjhExOlOU53+2qhj6WZbU
SDkcWC0zkVEl/PgYoiEApI+IxeKBjdevlqF7r3L5VNPbBr+FzR8zKZP59n3oK0ep
J1P1PXSSb0LltIdMmtkZj/bczEGUpBTEutaQCFZaZEdEK2tidIlayAy8cQnjjSDO
qxCTzeTMAtIsttvWAlgU13iLYGxGsevxOSYjmXQ82VXVWlw9P2M=
=kTHp
-----END PGP SIGNATURE-----

--Qjo19A2vmS5T5MQB--
