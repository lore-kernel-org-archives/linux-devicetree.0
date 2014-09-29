From: =?windows-1252?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 2/6] arm64: Add DTS support for Spreadtrum's Shark64 SoC
Date: Mon, 29 Sep 2014 16:55:25 +0200
Message-ID: <542972DD.8020700@suse.de>
References: <1411991314-6636-1-git-send-email-zhang.lyra@gmail.com> <1411991314-6636-3-git-send-email-zhang.lyra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411991314-6636-3-git-send-email-zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, jslaby-AlSwsSmVLrQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, artagnon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, orsonzhai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geng.ren-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, zhizhou.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Am 29.09.2014 um 13:48 schrieb zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org:
> From: "zhizhou.zhang" <zhizhou.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
>=20
> Adds the device tree support for Spreadtrum Shark64 SoC based on ARMv=
8 architecture.
>=20
> Signed-off-by: zhizhou.zhang <zhizhou.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> Signed-off-by: chunyan.zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> ---
>  arch/arm64/boot/dts/sprd_shark64.dts |  110 ++++++++++++++++++++++++=
++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sprd_shark64.dts
>=20
> diff --git a/arch/arm64/boot/dts/sprd_shark64.dts b/arch/arm64/boot/d=
ts/sprd_shark64.dts
> new file mode 100644
> index 0000000..537cd6d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sprd_shark64.dts
> @@ -0,0 +1,110 @@
> +/*
> + * dts file for Spreadtrum(sprd) Shark64 SOC
> + *
> + * Copyright (C) 2014,  Spreadtrum Communications Inc.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of
> + * the License, or (at your option) any later version.
> + */
> +
> +/dts-v1/;
> +
> +/memreserve/ 0x80000000 0x00010000;
> +
> +/ {
> +	model =3D "shark64 Board";

The commit message says SoC but here it says Board. Usually the SoC goe=
s
into a .dtsi file that can then be reused for multiple boards (.dts).
Even if you only have one board for now, this distinction makes sense.

You can use status =3D "disabled"; to prepare nodes in the .dtsi and th=
en
override the ones used via status =3D "okay"; in the .dts file. UARTs a=
re
a typical example where you will see this pattern used.

> +	compatible =3D "sprd,shark64";
> +	interrupt-parent =3D <&gic>;
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +
> +	chosen {
> +		bootargs =3D "earlycon=3Dserial_sprd,0x70000000";
> +      };

Some spaces snuck into this line. ;)

Cheers,
Andreas

> +
> +	cpus {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <0>;
> +
> +		cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,armv8";
> +			reg =3D <0x0 0x0>;
> +			enable-method =3D "spin-table";
> +			cpu-release-addr =3D <0x0 0x8000fff8>;
> +		};
> +		cpu@1 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,armv8";
> +			reg =3D <0x0 0x1>;
> +			enable-method =3D "spin-table";
> +			cpu-release-addr =3D <0x0 0x8000fff8>;
> +		};
> +		cpu@2 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,armv8";
> +			reg =3D <0x0 0x2>;
> +			enable-method =3D "spin-table";
> +			cpu-release-addr =3D <0x0 0x8000fff8>;
> +		};
> +		cpu@3 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,armv8";
> +			reg =3D <0x0 0x3>;
> +			enable-method =3D "spin-table";
> +			cpu-release-addr =3D <0x0 0x8000fff8>;
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0 0x80000000 0 0x20000000>;
> +	};
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +		serial1 =3D &uart1;
> +	};
> +
> +	gic: interrupt-controller@12001000 {
> +		compatible =3D "arm,cortex-a15-gic", "arm,cortex-a9-gic";
> +		#interrupt-cells =3D <3>;
> +		#address-cells =3D <0>;
> +		interrupt-controller;
> +		reg =3D <0 0x12001000 0 0x1000>,
> +		      <0 0x12002000 0 0x1000>;
> +	};
> +
> +	intc:interrupt-controller@71400000 {
> +		compatible =3D "sprd,intc";
> +		#interrupt-cells =3D <0>;
> +		interrupt-controller;
> +		reg =3D	<0 0x71400000 0 0x1000>,
> +			<0 0x71500000 0 0x1000>,
> +			<0 0x71600000 0 0x1000>,
> +			<0 0x71700000 0 0x1000>;
> +	};
> +
> +	timer {
> +		compatible =3D "arm,armv8-timer";
> +		interrupts =3D <1 13 0xff01>,
> +			     <1 14 0xff01>,
> +			     <1 11 0xff01>,
> +			     <1 10 0xff01>;
> +		clock-frequency =3D <26000000>;
> +	};
> +
> +	uart0: uart@70000000 {
> +		compatible =3D "sprd,serial";
> +		reg =3D <0 0x70000000 0 0x100>;
> +		interrupts =3D <0 2 0xf04>;
> +	};
> +
> +	uart1: uart@70100000 {
> +		compatible =3D "sprd,serial";
> +		reg =3D <0 0x70100000 0 0x100>;
> +		interrupts =3D <0 3 0xf04>;
> +	};
> +};

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
