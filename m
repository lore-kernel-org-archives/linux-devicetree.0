From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH] arm64: zynqmp: Remove #address/#size-cells from gpio-keys
Date: Tue, 17 Jul 2018 16:42:05 +0200
Message-ID: <50a270ad-93e6-5be2-ab57-bd4cbd9fe49a@monstr.eu>
References: <cc96e8372881438fb069d49126ab713fa03fb074.1525260692.git.michal.simek@xilinx.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="rNj6OcjYfbJvEiaEta93scPgEff3uU0w7"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cc96e8372881438fb069d49126ab713fa03fb074.1525260692.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rNj6OcjYfbJvEiaEta93scPgEff3uU0w7
Content-Type: multipart/mixed; boundary="bpAOc0hM4YirHXmYmS6kfcoRqLeshgDHH";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Will Deacon <will.deacon@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org
Message-ID: <50a270ad-93e6-5be2-ab57-bd4cbd9fe49a@monstr.eu>
Subject: Re: [PATCH] arm64: zynqmp: Remove #address/#size-cells from gpio-keys
References: <cc96e8372881438fb069d49126ab713fa03fb074.1525260692.git.michal.simek@xilinx.com>
In-Reply-To: <cc96e8372881438fb069d49126ab713fa03fb074.1525260692.git.michal.simek@xilinx.com>

--bpAOc0hM4YirHXmYmS6kfcoRqLeshgDHH
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2.5.2018 13:34, Michal Simek wrote:
> dts reports incorrect usage of these properties in gpio-keys node.
> Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary
>=20
> The patch is removing these useless properties.
>=20
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>=20
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts | 2 --
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts | 2 --
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts | 2 --
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts | 2 --
>  4 files changed, 8 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts b/arch/a=
rm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> index c7f713c8e69e..eb5e8bddb610 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> @@ -44,8 +44,6 @@
> =20
>  	gpio-keys {
>  		compatible =3D "gpio-keys";
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
>  		autorepeat;
>  		sw4 {
>  			label =3D "sw4";
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts b/arch/a=
rm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
> index 5b4ffe646a9b..25dd57485323 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
> @@ -41,8 +41,6 @@
> =20
>  	gpio-keys {
>  		compatible =3D "gpio-keys";
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
>  		autorepeat;
>  		sw19 {
>  			label =3D "sw19";
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts b/arch/a=
rm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
> index 668f7f26716a..259f21b0c001 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
> @@ -41,8 +41,6 @@
> =20
>  	gpio-keys {
>  		compatible =3D "gpio-keys";
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
>  		autorepeat;
>  		sw19 {
>  			label =3D "sw19";
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts b/arch/a=
rm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
> index 9a9dd6a0142b..a61b3cc6f4c9 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
> @@ -41,8 +41,6 @@
> =20
>  	gpio-keys {
>  		compatible =3D "gpio-keys";
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
>  		autorepeat;
>  		sw19 {
>  			label =3D "sw19";
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



--bpAOc0hM4YirHXmYmS6kfcoRqLeshgDHH--

--rNj6OcjYfbJvEiaEta93scPgEff3uU0w7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAltOAD0ACgkQykllyylKDCFJ9gCfR4xAncQz6PzgQ/+BVn7ZWP3d
1mgAoIjY4vHuoCrBpcTsKJL1IT5Vbju3
=dHkX
-----END PGP SIGNATURE-----

--rNj6OcjYfbJvEiaEta93scPgEff3uU0w7--
