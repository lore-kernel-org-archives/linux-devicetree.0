From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH] arm64: zynqmp: Remove ep108 board
Date: Tue, 17 Jul 2018 16:39:52 +0200
Message-ID: <42b604af-b9e0-058a-c3eb-e9a5b6c5e5ca@monstr.eu>
References: <052cdf7d45bb94e106ae33c972a050089ef75803.1523452618.git.michal.simek@xilinx.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="g8Rg39PHsrEx0GDisMxEPuDzrwOM8JsOO"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <052cdf7d45bb94e106ae33c972a050089ef75803.1523452618.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org
Cc: =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, VNSL Durga <vnsl.durga.challa@xilinx.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Kedareswara rao Appana <appanad@xilinx.com>, linux-kernel@vger.kernel.org, Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>, Alistair Francis <alistair.francis@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier@dowhile0.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--g8Rg39PHsrEx0GDisMxEPuDzrwOM8JsOO
Content-Type: multipart/mixed; boundary="0b9ecdrociPCmfNvuPZyqmhbytaO93usl";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org
Cc: =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>,
 Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 VNSL Durga <vnsl.durga.challa@xilinx.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Kedareswara rao Appana <appanad@xilinx.com>, linux-kernel@vger.kernel.org,
 Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
 Alistair Francis <alistair.francis@xilinx.com>, Arnd Bergmann
 <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Javier Martinez Canillas <javier@dowhile0.org>
Message-ID: <42b604af-b9e0-058a-c3eb-e9a5b6c5e5ca@monstr.eu>
Subject: Re: [PATCH] arm64: zynqmp: Remove ep108 board
References: <052cdf7d45bb94e106ae33c972a050089ef75803.1523452618.git.michal.simek@xilinx.com>
In-Reply-To: <052cdf7d45bb94e106ae33c972a050089ef75803.1523452618.git.michal.simek@xilinx.com>

--0b9ecdrociPCmfNvuPZyqmhbytaO93usl
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11.4.2018 15:17, Michal Simek wrote:
> ZynqMP Emulation board is no longer tested and there is no reason to
> keep maintaining it.
>=20
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>=20
>  arch/arm64/boot/dts/xilinx/Makefile           |   1 -
>  .../boot/dts/xilinx/zynqmp-ep108-clk.dtsi     | 137 ----------------
>  arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts   | 154 ------------------=

>  3 files changed, 292 deletions(-)
>  delete mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-ep108-clk.dtsi
>  delete mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
>=20
> diff --git a/arch/arm64/boot/dts/xilinx/Makefile b/arch/arm64/boot/dts/=
xilinx/Makefile
> index c2a0c00272e2..d452f80e7601 100644
> --- a/arch/arm64/boot/dts/xilinx/Makefile
> +++ b/arch/arm64/boot/dts/xilinx/Makefile
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> -dtb-$(CONFIG_ARCH_ZYNQMP) +=3D zynqmp-ep108.dtb
>  dtb-$(CONFIG_ARCH_ZYNQMP) +=3D zynqmp-zc1232-revA.dtb
>  dtb-$(CONFIG_ARCH_ZYNQMP) +=3D zynqmp-zc1254-revA.dtb
>  dtb-$(CONFIG_ARCH_ZYNQMP) +=3D zynqmp-zc1275-revA.dtb
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108-clk.dtsi b/arch/ar=
m64/boot/dts/xilinx/zynqmp-ep108-clk.dtsi
> deleted file mode 100644
> index 9f5eedbc2139..000000000000
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108-clk.dtsi
> +++ /dev/null
> @@ -1,137 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -/*
> - * clock specification for Xilinx ZynqMP ep108 development board
> - *
> - * (C) Copyright 2015, Xilinx, Inc.
> - *
> - * Michal Simek <michal.simek@xilinx.com>
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU General Public License as
> - * published by the Free Software Foundation; either version 2 of
> - * the License, or (at your option) any later version.
> - */
> -
> -/ {
> -	misc_clk: misc_clk {
> -		compatible =3D "fixed-clock";
> -		#clock-cells =3D <0>;
> -		clock-frequency =3D <25000000>;
> -	};
> -
> -	i2c_clk: i2c_clk {
> -		compatible =3D "fixed-clock";
> -		#clock-cells =3D <0x0>;
> -		clock-frequency =3D <111111111>;
> -	};
> -
> -	sata_clk: sata_clk {
> -		compatible =3D "fixed-clock";
> -		#clock-cells =3D <0>;
> -		clock-frequency =3D <75000000>;
> -	};
> -
> -	clk100: clk100 {
> -		compatible =3D "fixed-clock";
> -		#clock-cells =3D <0>;
> -		clock-frequency =3D <100000000>;
> -	};
> -
> -	clk600: clk600 {
> -		compatible =3D "fixed-clock";
> -		#clock-cells =3D <0>;
> -		clock-frequency =3D <600000000>;
> -	};
> -};
> -
> -&can0 {
> -	clocks =3D <&misc_clk &misc_clk>;
> -};
> -
> -&can1 {
> -	clocks =3D <&misc_clk &misc_clk>;
> -};
> -
> -&fpd_dma_chan1 {
> -	clocks =3D <&clk600>, <&clk100>;
> -};
> -
> -&fpd_dma_chan2 {
> -	clocks =3D <&clk600>, <&clk100>;
> -};
> -
> -&fpd_dma_chan3 {
> -	clocks =3D <&clk600>, <&clk100>;
> -};
> -
> -&fpd_dma_chan4 {
> -	clocks =3D <&clk600>, <&clk100>;
> -};
> -
> -&fpd_dma_chan5 {
> -	clocks =3D <&clk600>, <&clk100>;
> -};
> -
> -&fpd_dma_chan6 {
> -	clocks =3D <&clk600>, <&clk100>;
> -};
> -
> -&fpd_dma_chan7 {
> -	clocks =3D <&clk600>, <&clk100>;
> -};
> -
> -&fpd_dma_chan8 {
> -	clocks =3D <&clk600>, <&clk100>;
> -};
> -
> -&gem0 {
> -	clocks =3D <&misc_clk>, <&misc_clk>, <&misc_clk>;
> -};
> -
> -&gpio {
> -	clocks =3D <&misc_clk>;
> -};
> -
> -&i2c0 {
> -	clocks =3D <&i2c_clk>;
> -};
> -
> -&i2c1 {
> -	clocks =3D <&i2c_clk>;
> -};
> -
> -&sata {
> -	clocks =3D <&sata_clk>;
> -};
> -
> -&sdhci0 {
> -	clocks =3D <&misc_clk>, <&misc_clk>;
> -};
> -
> -&sdhci1 {
> -	clocks =3D <&misc_clk>, <&misc_clk>;
> -};
> -
> -&spi0 {
> -	clocks =3D <&misc_clk &misc_clk>;
> -};
> -
> -&spi1 {
> -	clocks =3D <&misc_clk &misc_clk>;
> -};
> -
> -&uart0 {
> -	clocks =3D <&misc_clk &misc_clk>;
> -};
> -
> -&usb0 {
> -	clocks =3D <&misc_clk>, <&misc_clk>;
> -};
> -
> -&usb1 {
> -	clocks =3D <&misc_clk>, <&misc_clk>;
> -};
> -
> -&watchdog0 {
> -	clocks=3D <&misc_clk>;
> -};
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64/b=
oot/dts/xilinx/zynqmp-ep108.dts
> deleted file mode 100644
> index 4b0684911626..000000000000
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
> +++ /dev/null
> @@ -1,154 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -/*
> - * dts file for Xilinx ZynqMP ep108 development board
> - *
> - * (C) Copyright 2014 - 2015, Xilinx, Inc.
> - *
> - * Michal Simek <michal.simek@xilinx.com>
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU General Public License as
> - * published by the Free Software Foundation; either version 2 of
> - * the License, or (at your option) any later version.
> - */
> -
> -/dts-v1/;
> -
> -#include "zynqmp.dtsi"
> -#include "zynqmp-ep108-clk.dtsi"
> -
> -/ {
> -	model =3D "ZynqMP EP108";
> -
> -	aliases {
> -		mmc0 =3D &sdhci0;
> -		mmc1 =3D &sdhci1;
> -		serial0 =3D &uart0;
> -	};
> -
> -	chosen {
> -		stdout-path =3D "serial0:115200n8";
> -	};
> -
> -	memory@0 {
> -		device_type =3D "memory";
> -		reg =3D <0x0 0x0 0x0 0x40000000>;
> -	};
> -};
> -
> -&can0 {
> -	status =3D "okay";
> -};
> -
> -&can1 {
> -	status =3D "okay";
> -};
> -
> -&gem0 {
> -	status =3D "okay";
> -	phy-handle =3D <&phy0>;
> -	phy-mode =3D "rgmii-id";
> -	phy0: phy@0 {
> -		reg =3D <0>;
> -		max-speed =3D <100>;
> -	};
> -};
> -
> -&gpio {
> -	status =3D "okay";
> -};
> -
> -&i2c0 {
> -	status =3D "okay";
> -	clock-frequency =3D <400000>;
> -	eeprom@54 {
> -		compatible =3D "atmel,24c64";
> -		reg =3D <0x54>;
> -	};
> -};
> -
> -&i2c1 {
> -	status =3D "okay";
> -	clock-frequency =3D <400000>;
> -	eeprom@55 {
> -		compatible =3D "atmel,24c64";
> -		reg =3D <0x55>;
> -	};
> -};
> -
> -&sata {
> -	status =3D "okay";
> -	ceva,broken-gen2;
> -	/* SATA Phy OOB timing settings */
> -	ceva,p0-cominit-params =3D /bits/ 8 <0x0F 0x25 0x18 0x29>;
> -	ceva,p0-comwake-params =3D /bits/ 8 <0x04 0x0B 0x08 0x0F>;
> -	ceva,p0-burst-params =3D /bits/ 8 <0x0A 0x08 0x4A 0x06>;
> -	ceva,p0-retry-params =3D /bits/ 16 <0x0216 0x7F06>;
> -	ceva,p1-cominit-params =3D /bits/ 8 <0x0F 0x25 0x18 0x29>;
> -	ceva,p1-comwake-params =3D /bits/ 8 <0x04 0x0B 0x08 0x0F>;
> -	ceva,p1-burst-params =3D /bits/ 8 <0x0A 0x08 0x4A 0x06>;
> -	ceva,p1-retry-params =3D /bits/ 16 <0x0216 0x7F06>;
> -};
> -
> -&sdhci0 {
> -	status =3D "okay";
> -	bus-width =3D <8>;
> -};
> -
> -&sdhci1 {
> -	status =3D "okay";
> -};
> -
> -&spi0 {
> -	status =3D "okay";
> -	num-cs =3D <1>;
> -	spi0_flash0: spi0_flash0@0 {
> -		compatible =3D "m25p80";
> -		#address-cells =3D <1>;
> -		#size-cells =3D <1>;
> -		spi-max-frequency =3D <50000000>;
> -		reg =3D <0>;
> -
> -		spi0_flash0@0 {
> -			label =3D "spi0_flash0";
> -			reg =3D <0x0 0x100000>;
> -		};
> -	};
> -};
> -
> -&spi1 {
> -	status =3D "okay";
> -	num-cs =3D <1>;
> -	spi1_flash0: spi1_flash0@0 {
> -		compatible =3D "m25p80";
> -		#address-cells =3D <1>;
> -		#size-cells =3D <1>;
> -		spi-max-frequency =3D <50000000>;
> -		reg =3D <0>;
> -
> -		spi1_flash0@0 {
> -			label =3D "spi1_flash0";
> -			reg =3D <0x0 0x100000>;
> -		};
> -	};
> -};
> -
> -&uart0 {
> -	status =3D "okay";
> -};
> -
> -&usb0 {
> -	status =3D "okay";
> -	dr_mode =3D "peripheral";
> -	maximum-speed =3D "high-speed";
> -};
> -
> -&usb1 {
> -	status =3D "okay";
> -	dr_mode =3D "host";
> -	maximum-speed =3D "high-speed";
> -};
> -
> -&watchdog0 {
> -	status =3D "okay";
> -};
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



--0b9ecdrociPCmfNvuPZyqmhbytaO93usl--

--g8Rg39PHsrEx0GDisMxEPuDzrwOM8JsOO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAltN/7gACgkQykllyylKDCGI8gCfQZyqatwMrzR8lSv3h5XOHVXj
2u4An2mvwvjs2QOIK7UxnjRP6WvK/zGc
=+RNp
-----END PGP SIGNATURE-----

--g8Rg39PHsrEx0GDisMxEPuDzrwOM8JsOO--
