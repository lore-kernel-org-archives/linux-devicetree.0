From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v2] ARM: imx: Provide support for NXP i.MX7D Cortex-M4
Date: Tue, 3 Jul 2018 09:06:47 +0200
Message-ID: <522e3bdf-9cdf-f584-b063-38dd23982096@pengutronix.de>
References: <20180702062755.17263-1-o.rempel@pengutronix.de>
 <20180703065724.GL4348@dragon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4015051885083508496=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180703065724.GL4348@dragon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4015051885083508496==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Sma8orMqGmKhvOITkNvdUblEisDCxIiQa"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Sma8orMqGmKhvOITkNvdUblEisDCxIiQa
Content-Type: multipart/mixed; boundary="jZEcs7w0REVlI7oNkVOPCFiDwkHAkYo5k";
 protected-headers="v1"
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Message-ID: <522e3bdf-9cdf-f584-b063-38dd23982096@pengutronix.de>
Subject: Re: [PATCH v2] ARM: imx: Provide support for NXP i.MX7D Cortex-M4
References: <20180702062755.17263-1-o.rempel@pengutronix.de>
 <20180703065724.GL4348@dragon>
In-Reply-To: <20180703065724.GL4348@dragon>

--jZEcs7w0REVlI7oNkVOPCFiDwkHAkYo5k
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 03.07.2018 08:57, Shawn Guo wrote:
> On Mon, Jul 02, 2018 at 08:27:55AM +0200, Oleksij Rempel wrote:
>> Cortex M4 part can be started from a boot loader or over
>> Linux remoteproc framework.
>>
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> ---
>>  arch/arm/boot/dts/Makefile         |  2 +-
>>  arch/arm/mach-imx/Kconfig          | 33 +++++++++++++++++++----------=
-
>>  arch/arm/mach-imx/Makefile         |  3 ++-
>>  arch/arm/mach-imx/mach-imx7d-cm4.c | 21 +++++++++++++++++++
>>  4 files changed, 45 insertions(+), 14 deletions(-)
>>  create mode 100644 arch/arm/mach-imx/mach-imx7d-cm4.c
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 7e2424957809..e3fe1bfbc404 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -539,7 +539,7 @@ dtb-$(CONFIG_SOC_IMX6UL) +=3D \
>>  	imx6ull-14x14-evk.dtb \
>>  	imx6ull-colibri-eval-v3.dtb \
>>  	imx6ull-colibri-wifi-eval-v3.dtb
>> -dtb-$(CONFIG_SOC_IMX7D) +=3D \
>> +dtb-$(CONFIG_SOC_IMX7D_CA7) +=3D \
>=20
> We agreed to keep this unchanged, no?

yes. sorry.

>>  	imx7d-cl-som-imx7.dtb \
>>  	imx7d-colibri-emmc-eval-v3.dtb \
>>  	imx7d-colibri-eval-v3.dtb \
>> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
>> index e47fa13f4b0c..5ad58b1cb4bc 100644
>> --- a/arch/arm/mach-imx/Kconfig
>> +++ b/arch/arm/mach-imx/Kconfig
>> @@ -522,18 +522,6 @@ config SOC_IMX6UL
>>  	help
>>  	  This enables support for Freescale i.MX6 UltraLite processor.
>> =20
>> -config SOC_IMX7D
>> -	bool "i.MX7 Dual support"
>> -	select PINCTRL_IMX7D
>> -	select ARM_GIC
>> -	select HAVE_ARM_ARCH_TIMER
>> -	select HAVE_IMX_ANATOP
>> -	select HAVE_IMX_MMDC
>> -	select HAVE_IMX_SRC
>> -	select IMX_GPCV2
>> -	help
>> -		This enables support for Freescale i.MX7 Dual processor.
>> -
>>  config SOC_LS1021A
>>  	bool "Freescale LS1021A support"
>>  	select ARM_GIC
>> @@ -548,6 +536,27 @@ comment "Cortex-A/Cortex-M asymmetric multiproces=
sing platforms"
>> =20
>>  if ARCH_MULTI_V7 || ARM_SINGLE_ARMV7M
>> =20
>> +config SOC_IMX7D_CA7
>> +	bool
>> +	select ARM_GIC
>> +	select HAVE_ARM_ARCH_TIMER
>> +	select HAVE_IMX_ANATOP
>> +	select HAVE_IMX_MMDC
>> +	select HAVE_IMX_SRC
>> +	select IMX_GPCV2
>> +
>> +config SOC_IMX7D_CM4
>> +	bool
>> +	select ARMV7M_SYSTICK
>> +
>> +config SOC_IMX7D
>> +	bool "i.MX7 Dual support"
>> +	select PINCTRL_IMX7D
>> +	select SOC_IMX7D_CA7 if ARCH_MULTI_V7
>> +	select SOC_IMX7D_CM4 if ARM_SINGLE_ARMV7M
>> +	help
>> +		This enables support for Freescale i.MX7 Dual processor.
>> +
>>  config SOC_VF610
>>  	bool "Vybrid Family VF610 support"
>>  	select ARM_GIC if ARCH_MULTI_V7
>> diff --git a/arch/arm/mach-imx/Makefile b/arch/arm/mach-imx/Makefile
>> index 2327e3e876d8..64ebeb6a4f30 100644
>> --- a/arch/arm/mach-imx/Makefile
>> +++ b/arch/arm/mach-imx/Makefile
>> @@ -81,7 +81,8 @@ obj-$(CONFIG_SOC_IMX6SL) +=3D mach-imx6sl.o
>>  obj-$(CONFIG_SOC_IMX6SLL) +=3D mach-imx6sl.o
>>  obj-$(CONFIG_SOC_IMX6SX) +=3D mach-imx6sx.o
>>  obj-$(CONFIG_SOC_IMX6UL) +=3D mach-imx6ul.o
>> -obj-$(CONFIG_SOC_IMX7D) +=3D mach-imx7d.o
>> +obj-$(CONFIG_SOC_IMX7D_CA7) +=3D mach-imx7d.o
>> +obj-$(CONFIG_SOC_IMX7D_CM4) +=3D mach-imx7d-cm4.o
>> =20
>>  ifeq ($(CONFIG_SUSPEND),y)
>>  AFLAGS_suspend-imx6.o :=3D-Wa,-march=3Darmv7-a
>> diff --git a/arch/arm/mach-imx/mach-imx7d-cm4.c b/arch/arm/mach-imx/ma=
ch-imx7d-cm4.c
>> new file mode 100644
>> index 000000000000..c36dea79aeb8
>> --- /dev/null
>> +++ b/arch/arm/mach-imx/mach-imx7d-cm4.c
>> @@ -0,0 +1,21 @@
>> +/*
>> + * Copyright 2017 Pengutronix
>> + *
>> + * This program is free software; you can redistribute it and/or modi=
fy
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>=20
> Can we use SPDX tag for new file?

ok.

> Shawn
>=20
>> +
>> +#include <linux/kernel.h>
>> +#include <asm/v7m.h>
>> +#include <asm/mach/arch.h>
>> +
>> +static const char * const imx7d_cm4_dt_compat[] __initconst =3D {
>> +	"fsl,imx7d-cm4",
>> +	NULL,
>> +};
>> +
>> +DT_MACHINE_START(IMX7D, "Freescale i.MX7 Dual Cortex-M4 (Device Tree)=
")
>> +	.dt_compat =3D imx7d_cm4_dt_compat,
>> +	.restart =3D armv7m_restart,
>> +MACHINE_END
>> --=20
>> 2.17.1
>>
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20


--jZEcs7w0REVlI7oNkVOPCFiDwkHAkYo5k--

--Sma8orMqGmKhvOITkNvdUblEisDCxIiQa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAls7IIcACgkQdQOiSHVI
77T3qwgAt+CszB+qGJR5fb5nAmFCiIGgRpM1p8zsdWVXCQvX50TM+T8qY9jZjLpC
XPmQFM1/HhL4Guzl8+RvoGmPpLor0KbvENuurfzmMNrJjpoGB4ps0un2RGu0VSfL
ROlnJJDRo9TuUzIPfFIPagLGOf8AJ2Di8kn/kTqwvLdVxxz7fsuM3H3RP4is8W0d
geZUojPv4XUSJjXDtaVqOgjdxmP+BdF43vcs/oro2B6H2DXCplZ2n489thNVMC3+
Vebie87bI030I5NnTlA4i5nRGeQgbvI71HejGxEyS9C5ViQQXSKlZLfIWj/q8+qE
YE/b0eIEBbflrksPkPuh/DwPQVF8gg==
=TV4i
-----END PGP SIGNATURE-----

--Sma8orMqGmKhvOITkNvdUblEisDCxIiQa--


--===============4015051885083508496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4015051885083508496==--
