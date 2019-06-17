Return-Path: <SRS0=JAT3=UQ=gmail.com=thierry.reding@kernel.org>
Date: Mon, 17 Jun 2019 13:30:38 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 26/28] PCI: Add DT binding for "reset-gpios" property
Message-ID: <20190617113038.GK508@ulmo>
References: <20190516055307.25737-1-mmaddireddy@nvidia.com>
 <20190516055307.25737-27-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3D7yMlnunRPwJqC7"
Content-Disposition: inline
In-Reply-To: <20190516055307.25737-27-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--3D7yMlnunRPwJqC7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 11:23:05AM +0530, Manikanta Maddireddy wrote:
> Add DT binding for "reset-gpios" property which supports GPIO based PERST#
> signal.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
> V4: No change
>=20
> V3: Moved to common pci binding doc
>=20
> V2: Using standard "reset-gpio" property
>=20
>  Documentation/devicetree/bindings/pci/pci.txt | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/pci.txt b/Documentatio=
n/devicetree/bindings/pci/pci.txt
> index c77981c5dd18..79124898aa5b 100644
> --- a/Documentation/devicetree/bindings/pci/pci.txt
> +++ b/Documentation/devicetree/bindings/pci/pci.txt
> @@ -24,3 +24,6 @@ driver implementation may support the following propert=
ies:
>     unsupported link speed, for instance, trying to do training for
>     unsupported link speed, etc.  Must be '4' for gen4, '3' for gen3, '2'
>     for gen2, and '1' for gen1. Any other values are invalid.
> +- reset-gpios:
> +   If present this property specifies PERST# GPIO. Host drivers can pars=
e the
> +   GPIO and apply fundamental reset to endpoints.

As mentioned in patch 27/28, maybe mention here that this is only a
workaround for bad board designs and that it shouldn't be necessary in
the majority of cases.

Thierry

--3D7yMlnunRPwJqC7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Hed4ACgkQ3SOs138+
s6G9tw/+J+LMeHS55p4zNY4O9TsQ67a70Q0zY5+3zr9vtsRGlukvCDgLOn2x00r6
j8vTyJNxIwgZzQjE5tC/zt67Sp9fqi/5tVgMe+0sh9GWIvl0m/3SrdIfkLPNsBWQ
5leiPp92Hvipghscn1EavmWmizQHz9FaXsNnaYALAdW/SWp8fRwukUcuJ5kW+cam
110qZJL+LIqINrS6nHFlmCz5yIjIyQYq3z5rLuGDWl47jGW1cIRfM5KT++23w/vC
MzJxw6MLMTGlqa4CXRN4Gtmvx30ki1O30HVX6CshS1qlZ6/2skzrOWxI+glxV/kY
YK7bv+UV5a+cmwh5pcBi2RZImNRSJQUBzDITT/mERLYghBvIqIJ1FToKlGkCpdhe
CkSdC66puoUAAacbebioJBp8NDG4bDDLZq4NnUqk3X9yAuQ6iTrnMNSFaefmDKWw
0fAdX8U1vNWv5e5gaCXJVAMz53Rqbc6Tjvx1cxt4YEXCSkHbxgz+AdKa/hDJzRn7
dFJnkpPyTXYWtOrsOEgUTy9VLUhnDbKB7fK/vpAlfD+8S77zd3Te6HKqJUS/5Ylx
ldcdblTV9kja5xuweZF9MVIHEL0q/XDfDis7oTCUCr227XMSw39718HXnWRg/+Or
Qy+Tg00yZQ4dSfZ9uonRxWmMnfacpZb1mU4qwH8l2qvzKiGd2ik=
=S/ir
-----END PGP SIGNATURE-----

--3D7yMlnunRPwJqC7--
