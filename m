Return-Path: <SRS0=htSe=KB=monstr.eu=monstr@kernel.org>
Reply-To: monstr@monstr.eu
Subject: Re: [PATCHv3] arm: dts: zynq: Add support for Z-turn board
References: <20180306213008.32448-1-tossel@gmail.com>
 <20180328141734.9811-1-tossel@gmail.com>
 <9050d8e3-ed4b-bae7-504d-5106de14e82d@xilinx.com>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <74de5e95-230e-d9db-78fd-f8a5d3f40a71@monstr.eu>
Date: Tue, 17 Jul 2018 15:49:39 +0200
MIME-Version: 1.0
In-Reply-To: <9050d8e3-ed4b-bae7-504d-5106de14e82d@xilinx.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="D7ElqfjmNXPeS06vklCSxhNhybN8qw7nN"
To: Michal Simek <michals@xilinx.com>, Anton Gerasimov <tossel@gmail.com>, devicetree@vger.kernel.org
Cc: michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--D7ElqfjmNXPeS06vklCSxhNhybN8qw7nN
Content-Type: multipart/mixed; boundary="4W3M6yMPh7eh3xAfbFX2xDurFt8VsYSB0";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Michal Simek <michals@xilinx.com>, Anton Gerasimov <tossel@gmail.com>,
 devicetree@vger.kernel.org
Cc: michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com,
 linux@armlinux.org.uk
Message-ID: <74de5e95-230e-d9db-78fd-f8a5d3f40a71@monstr.eu>
Subject: Re: [PATCHv3] arm: dts: zynq: Add support for Z-turn board
References: <20180306213008.32448-1-tossel@gmail.com>
 <20180328141734.9811-1-tossel@gmail.com>
 <9050d8e3-ed4b-bae7-504d-5106de14e82d@xilinx.com>
In-Reply-To: <9050d8e3-ed4b-bae7-504d-5106de14e82d@xilinx.com>

--4W3M6yMPh7eh3xAfbFX2xDurFt8VsYSB0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 4.4.2018 08:56, Michal Simek wrote:
> On 28.3.2018 16:17, Anton Gerasimov wrote:
>> Add a dts for MYIR Z-turn board and respective target in Makefile.
>>
>> Signed-off-by: Anton Gerasimov <tossel@gmail.com>
>> ---
>>  arch/arm/boot/dts/Makefile       |   1 +
>>  arch/arm/boot/dts/zynq-zturn.dts | 124 ++++++++++++++++++++++++++++++=
+++++++++
>>  2 files changed, 125 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/zynq-zturn.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index ade7a38543dc..4daa7d5d4db4 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -1067,6 +1067,7 @@ dtb-$(CONFIG_ARCH_ZYNQ) +=3D \
>>  	zynq-zc702.dtb \
>>  	zynq-zc706.dtb \
>>  	zynq-zed.dtb \
>> +	zynq-zturn.dtb \
>>  	zynq-zybo.dtb
>>  dtb-$(CONFIG_MACH_ARMADA_370) +=3D \
>>  	armada-370-db.dtb \
>> diff --git a/arch/arm/boot/dts/zynq-zturn.dts b/arch/arm/boot/dts/zynq=
-zturn.dts
>> new file mode 100644
>> index 000000000000..8aa384b59b7f
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/zynq-zturn.dts
>> @@ -0,0 +1,124 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + *  Copyright (C) 2015 Andrea Merello <adnrea.merello@gmail.com>
>> + *  Copyright (C) 2017 Alexander Graf <agraf@suse.de>
>> + *
>> + *  Based on zynq-zed.dts which is:
>> + *  Copyright (C) 2011 - 2014 Xilinx
>> + *  Copyright (C) 2012 National Instruments Corp.
>> + *
>> + */
>> +
>> +/dts-v1/;
>> +/include/ "zynq-7000.dtsi"
>> +
>> +/ {
>> +	model =3D "Zynq Z-Turn MYIR Board";
>> +	compatible =3D "myir,zynq-zturn", "xlnx,zynq-7000";
>> +
>> +	aliases {
>> +		ethernet0 =3D &gem0;
>> +		serial0 =3D &uart1;
>> +		serial1 =3D &uart0;
>> +		mmc0 =3D &sdhci0;
>> +	};
>> +
>> +	memory@0 {
>> +		device_type =3D "memory";
>> +		reg =3D <0x0 0x40000000>;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path =3D "serial0:115200n8";
>> +	};
>> +
>> +	gpio-leds {
>> +		compatible =3D "gpio-leds";
>> +		usr-led1 {
>> +			label =3D "usr-led1";
>> +			gpios =3D <&gpio0 0x0 0x1>;
>> +			default-state =3D "off";
>> +		};
>> +
>> +		usr-led2 {
>> +			label =3D "usr-led2";
>> +			gpios =3D <&gpio0 0x9 0x1>;
>> +			default-state =3D "off";
>> +		};
>> +	};
>> +
>> +	gpio-keys {
>> +		compatible =3D "gpio-keys";
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +		autorepeat;
>> +		K1 {
>> +			label =3D "K1";
>> +			gpios =3D <&gpio0 0x32 0x1>;
>> +			linux,code =3D <0x66>;
>> +			gpio-key,wakeup;
>> +			autorepeat;
>> +		};
>> +	};
>> +};
>> +
>> +&clkc {
>> +	ps-clk-frequency =3D <33333333>;
>> +};
>> +
>> +&qspi {
>> +	u-boot,dm-pre-reloc;
>> +	status =3D "okay";
>> +};
>> +
>> +&gem0 {
>> +	status =3D "okay";
>> +	phy-mode =3D "rgmii-id";
>> +	phy-handle =3D <&ethernet_phy>;
>> +
>> +	ethernet_phy: ethernet-phy@0 {
>> +		reg =3D <0x0>;
>> +	};
>> +};
>> +
>> +&sdhci0 {
>> +	u-boot,dm-pre-reloc;
>> +	status =3D "okay";
>> +};
>> +
>> +&uart0 {
>> +	u-boot,dm-pre-reloc;
>> +	status =3D "okay";
>> +};
>> +
>> +&uart1 {
>> +	u-boot,dm-pre-reloc;
>> +	status =3D "okay";
>> +};
>> +
>> +&usb0 {
>> +	status =3D "okay";
>> +	dr_mode =3D "host";
>> +};
>> +
>> +&can0 {
>> +	status =3D "okay";
>> +};
>> +
>> +&i2c0 {
>> +	status =3D "okay";
>> +	clock-frequency =3D <400000>;
>> +
>> +	stlm75@49 {
>> +		status =3D "okay";
>> +		compatible =3D "lm75";
>> +		reg =3D <0x49>;
>> +	};
>> +
>> +	accelerometer@53 {
>> +		compatible =3D "adi,adxl345", "adxl345", "adi,adxl34x", "adxl34x";
>> +		reg =3D <0x53>;
>> +		interrupt-parent =3D <&intc>;
>> +		interrupts =3D <0x0 0x1e 0x4>;
>> +	};
>> +};
>>
>=20
> Thanks for v3 and sync with U-Boot.
>=20
> Applied.

FYI: I just find out that qspi(mainline linux is missing driver) and
u-boot things shouldn't be here. I have updated this patch before
sending pull request to arm-soc guys.

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs



--4W3M6yMPh7eh3xAfbFX2xDurFt8VsYSB0--

--D7ElqfjmNXPeS06vklCSxhNhybN8qw7nN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAltN8/QACgkQykllyylKDCGrdQCfQp/v37+csj+W+COXQkvRxGpK
/rIAnA7gIRci2lcNUCfmo+4jeDTe+DQ1
=DU4/
-----END PGP SIGNATURE-----

--D7ElqfjmNXPeS06vklCSxhNhybN8qw7nN--
