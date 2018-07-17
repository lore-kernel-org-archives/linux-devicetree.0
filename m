From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH] arm: zynq: Add mmc alias for zc702/zc706/zed/zybo
Date: Tue, 17 Jul 2018 15:42:13 +0200
Message-ID: <deacca38-6626-a1fe-f158-fc0d58acfbce@monstr.eu>
References: <56003f03e66edecb64298317120d4a37b9944a3f.1516199896.git.michal.simek@xilinx.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="VGDL6YPY5rto5H3s2HWSo80eIfn5r3mu7"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56003f03e66edecb64298317120d4a37b9944a3f.1516199896.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, linux-kernel@vger.kernel.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Josh Cartwright <josh.cartwright@ni.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VGDL6YPY5rto5H3s2HWSo80eIfn5r3mu7
Content-Type: multipart/mixed; boundary="OucNRNKXVUYI61Qx977wOpVMb2IcdGp2B";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-kernel@vger.kernel.org,
 Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
 Rob Herring <robh+dt@kernel.org>, Rob Herring <robherring2@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Josh Cartwright
 <josh.cartwright@ni.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org
Message-ID: <deacca38-6626-a1fe-f158-fc0d58acfbce@monstr.eu>
Subject: Re: [PATCH] arm: zynq: Add mmc alias for zc702/zc706/zed/zybo
References: <56003f03e66edecb64298317120d4a37b9944a3f.1516199896.git.michal.simek@xilinx.com>
In-Reply-To: <56003f03e66edecb64298317120d4a37b9944a3f.1516199896.git.michal.simek@xilinx.com>

--OucNRNKXVUYI61Qx977wOpVMb2IcdGp2B
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 17.1.2018 15:38, Michal Simek wrote:
> Add missing mmc alias.
>=20
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>=20
>  arch/arm/boot/dts/zynq-zc702.dts | 1 +
>  arch/arm/boot/dts/zynq-zc706.dts | 1 +
>  arch/arm/boot/dts/zynq-zed.dts   | 1 +
>  arch/arm/boot/dts/zynq-zybo.dts  | 1 +
>  4 files changed, 4 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-=
zc702.dts
> index dd1a731ae24c..46f14422b2e7 100644
> --- a/arch/arm/boot/dts/zynq-zc702.dts
> +++ b/arch/arm/boot/dts/zynq-zc702.dts
> @@ -23,6 +23,7 @@
>  		ethernet0 =3D &gem0;
>  		i2c0 =3D &i2c0;
>  		serial0 =3D &uart1;
> +		mmc0 =3D &sdhci0;
>  	};
> =20
>  	memory@0 {
> diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-=
zc706.dts
> index 8a0c2ff4c5eb..9224b45f9418 100644
> --- a/arch/arm/boot/dts/zynq-zc706.dts
> +++ b/arch/arm/boot/dts/zynq-zc706.dts
> @@ -23,6 +23,7 @@
>  		ethernet0 =3D &gem0;
>  		i2c0 =3D &i2c0;
>  		serial0 =3D &uart1;
> +		mmc0 =3D &sdhci0;
>  	};
> =20
>  	memory@0 {
> diff --git a/arch/arm/boot/dts/zynq-zed.dts b/arch/arm/boot/dts/zynq-ze=
d.dts
> index 1015edd69ff3..c8fad19e07dd 100644
> --- a/arch/arm/boot/dts/zynq-zed.dts
> +++ b/arch/arm/boot/dts/zynq-zed.dts
> @@ -22,6 +22,7 @@
>  	aliases {
>  		ethernet0 =3D &gem0;
>  		serial0 =3D &uart1;
> +		mmc0 =3D &sdhci0;
>  	};
> =20
>  	memory@0 {
> diff --git a/arch/arm/boot/dts/zynq-zybo.dts b/arch/arm/boot/dts/zynq-z=
ybo.dts
> index c131dc45e4eb..b0ad94cb9e4a 100644
> --- a/arch/arm/boot/dts/zynq-zybo.dts
> +++ b/arch/arm/boot/dts/zynq-zybo.dts
> @@ -22,6 +22,7 @@
>  	aliases {
>  		ethernet0 =3D &gem0;
>  		serial0 =3D &uart1;
> +		mmc0 =3D &sdhci0;
>  	};
> =20
>  	memory@0 {
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



--OucNRNKXVUYI61Qx977wOpVMb2IcdGp2B--

--VGDL6YPY5rto5H3s2HWSo80eIfn5r3mu7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAltN8jUACgkQykllyylKDCEqRwCeK6AnYIgeyUFXPCbUe7Py7/Sg
takAoJ1c/Fc6DAXs/cmeoNqRAKR8ON1I
=oupD
-----END PGP SIGNATURE-----

--VGDL6YPY5rto5H3s2HWSo80eIfn5r3mu7--
