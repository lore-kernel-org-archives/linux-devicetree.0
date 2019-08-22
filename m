Return-Path: <SRS0=wUgT=WS=gmail.com=thierry.reding@kernel.org>
Date: Thu, 22 Aug 2019 11:04:49 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V6 4/8] dt-bindings: usb: Add NVIDIA Tegra XUSB device
 mode controller binding
Message-ID: <20190822090449.GB23873@ulmo>
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
 <1565257046-9890-5-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline
In-Reply-To: <1565257046-9890-5-git-send-email-nkristam@nvidia.com>
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 03:07:22PM +0530, Nagarjuna Kristam wrote:
> Add device-tree binding documentation for the XUSB device mode controller
> present on Tegra210 SoC. This controller supports the USB 3.0
> specification.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> Reviewed-by: JC Kuo <jckuo@nvidia.com>
> ---
>  .../devicetree/bindings/usb/nvidia,tegra-xudc.txt  | 110 +++++++++++++++=
++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xu=
dc.txt

Acked-by: Thierry Reding <treding@nvidia.com>

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1eWrEACgkQ3SOs138+
s6HCgA/+P0KOdIRGToKGv75qZZTKyiLgAYXyeU11HjMEsa+B3Vjb9hXDgN784tvH
3mvdR1fPfRR4KishaQv775hATmz/ah5Qts5UJ78syybB25jrS/OB9BHqp3Ei5be6
CW13xC2WhpInCW/WCnjE0c+xdDUHhrj6RaucQ7lavn+AvQnVWCsOoEgW/O8Xjdyr
4A3sNVC1cbJ+Ir6t3T9kV9vnynDEgBI84fAfBf2jKpW2jlXZ061jLxwuQ8iIzgJp
SOMldCNIzV4b6RW+qb/L9y0eoaG9RMYukgj9/SHFPgwmTMd60gY950xRDU/9M4np
4/A9L0auS3nVNM6SwxmqE7pqgFi1PPplpttLb885MXJ9a1vjIXBaDfjDX68pe93b
czpswuHdYKyVWQJmn7Qnv+X1ztb+yRZchCLHXNFeDZDFUAIOVLWas8Tk+5rmX7kR
1ERvarK32Fg+/PoTLOQ88Dgmq6qmBBmvdZsxF8t1aXzdBOTRF+5F9a07LBKe9sEh
w4sQ0VRAVbMbZjB5ecwZsdYZQYw4BI0tZKJn8ITGeT768kZGTcukBO0CdPy4ZtIs
R6vrMZ95NTqH2c+r31KkTEhIxr5yZvtuhpJmezzuc+SwXUj37KgUtRuxmSQjpu9j
LIHLVXqfSWPFPABLKRN2ulHN7wm9FKDxEt2lIKOStVu13E6XMXg=
=8i7g
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
