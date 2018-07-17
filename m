From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH] arm64: zynqmp: Use serdev for zcu100 BT
Date: Tue, 17 Jul 2018 16:40:22 +0200
Message-ID: <9e8bdff9-8239-56ea-8ede-472bb47baacd@monstr.eu>
References: <0ce3b4f588f1d9a83cfe99b93af3514f4d893273.1523452571.git.michal.simek@xilinx.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="zMmpjYsj3gX0iHWT1XoIteXxD99uthBdL"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0ce3b4f588f1d9a83cfe99b93af3514f4d893273.1523452571.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zMmpjYsj3gX0iHWT1XoIteXxD99uthBdL
Content-Type: multipart/mixed; boundary="wHVQIfImkgc6Tv4iVZTxwbvCmzhAo6xJe";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Will Deacon <will.deacon@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org
Message-ID: <9e8bdff9-8239-56ea-8ede-472bb47baacd@monstr.eu>
Subject: Re: [PATCH] arm64: zynqmp: Use serdev for zcu100 BT
References: <0ce3b4f588f1d9a83cfe99b93af3514f4d893273.1523452571.git.michal.simek@xilinx.com>
In-Reply-To: <0ce3b4f588f1d9a83cfe99b93af3514f4d893273.1523452571.git.michal.simek@xilinx.com>

--wHVQIfImkgc6Tv4iVZTxwbvCmzhAo6xJe
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11.4.2018 15:16, Michal Simek wrote:
> Mainline started to use serdev interface for uart attached devices.
> Change description to reflect it.
>=20
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>=20
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts b/arch/a=
rm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> index 3e862a9faf26..c7f713c8e69e 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> @@ -89,12 +89,6 @@
>  			gpios =3D <&gpio 25 GPIO_ACTIVE_HIGH>;
>  			default-state =3D "on";
>  		};
> -
> -		bt_power {
> -			label =3D "bt_power";
> -			gpios =3D <&gpio 8 GPIO_ACTIVE_HIGH>;
> -			default-state =3D "on";
> -		};
>  	};
> =20
>  	wmmcsdio_fixed: fixedregulator-mmcsdio {
> @@ -267,6 +261,10 @@
> =20
>  &uart0 {
>  	status =3D "okay";
> +	bluetooth {
> +		compatible =3D "ti,wl1831-st";
> +		enable-gpios =3D <&gpio 8 GPIO_ACTIVE_HIGH>;
> +	};
>  };
> =20
>  &uart1 {
>=20

Applied.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs



--wHVQIfImkgc6Tv4iVZTxwbvCmzhAo6xJe--

--zMmpjYsj3gX0iHWT1XoIteXxD99uthBdL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAltN/9YACgkQykllyylKDCGQSgCfQfqmmsBaP7q3On0LJivHZyex
pNYAn1sGPL1lCMM21pu7/MYWIvP5OTut
=zWFi
-----END PGP SIGNATURE-----

--zMmpjYsj3gX0iHWT1XoIteXxD99uthBdL--
