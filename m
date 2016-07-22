From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH] [linux-devel]arm64: Add DTS support for FSL's LS1012A
 SoC
Date: Fri, 22 Jul 2016 09:29:35 -0500
Message-ID: <1469197775.25630.72.camel@buserror.net>
References: <1469165712-4356-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469165712-4356-1-git-send-email-Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bhaskar Upadhaya <Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>, Calvin Johnson <calvin.johnson-3arQi8VN3Tc@public.gmane.org>, Makarand Pawagi <makarand.pawagi-3arQi8VN3Tc@public.gmane.org>, Pratiyush Mohan Srivastava <pratiyush.srivastava-3arQi8VN3Tc@public.gmane.org>, Yunhui Cui <yunhui.cui-3arQi8VN3Tc@public.gmane.org>, Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>, Alison Wang <alison.wang-3arQi8VN3Tc@public.gmane.org>, Jia Hongtao <hongtao.jia-3arQi8VN3Tc@public.gmane.org>, Anji J <anji.jagarlmudi-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2016-07-22 at 11:05 +0530, Bhaskar Upadhaya wrote:
> diff --git a/arch/arm64/boot/dts/freescale/Makefile
> b/arch/arm64/boot/dts/freescale/Makefile
> index 1b7783d..4aa3bee 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -3,6 +3,9 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1043a-rdb.dt=
b
> =C2=A0dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls2080a-qds.dtb
> =C2=A0dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls2080a-rdb.dtb
> =C2=A0dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls2080a-simu.dtb
> +dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1012a-qds.dtb
> +dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1012a-rdb.dtb
> +dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1012a-frdm.dtb
=C2=A0
Please keep such lists sorted.

> +&i2c0 {
> +	status =3D "okay";
> +
> +	codec: sgtl5000@a {
> +		#sound-dai-cells =3D <0>;
> +		compatible =3D "fsl,sgtl5000";
> +		reg =3D <0xa>;
> +		VDDA-supply =3D <&reg_1p8v>;
> +		VDDIO-supply =3D <&reg_1p8v>;
> +		clocks =3D <&sys_mclk 1>;

sys_mclk is a fixed-clock, with #clock-cells =3D <0>. =C2=A0What is the=
 "1" for?

> +	ethernet@1 {
> +		compatible =3D "fsl,pfe-gemac-port";

Binding?

> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		reg =3D <	0x1 >;	/* GEM_ID */
> +		fsl,gemac-bus-id =3D < 0x1 >;	/* BUS_ID */
> +		fsl,gemac-phy-id =3D < 0x1 >;	/* PHY_ID */
> +		fsl,mdio-mux-val =3D <0x0>;

No spaces inside <>

> +		local-mac-address =3D [ 00 AA BB CC DD EE ];

No.

> +	regulators {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;

simple-bus does not make sense with #size-cells =3D <0>. =C2=A0It's for=
 memory-mapped=20
devices.

> +};
> +&ftm0 {

Leave a blank line between nodes.

> +/ {
> +	compatible =3D "fsl,ls1012a";
> +	interrupt-parent =3D <&gic>;
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +
> +	cpus {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <0>;
> +
> +		/*
> +		=C2=A0* We expect the enable-method for cpu's to be "psci", but
> this
> +		=C2=A0* is dependent on the SoC FW, which will fill this in.
> +		=C2=A0*
> +		=C2=A0* Currently supported enable-method is psci v0.2
> +		=C2=A0*/

Why do you expect any enable-method on a chip with only one CPU?


> +	sysclk: sysclk {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <100000000>;
> +		clock-output-names =3D "sysclk";
> +	};
> +
> +	timer {
> +		compatible =3D "arm,armv8-timer";
> +		interrupts =3D <1 13 0x1>, /* Physical Secure PPI */
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<1 14 0x1>, /* Physical Non-Secure =
PPI */
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<1 11 0x1>, /* Virtual PPI */
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<1 10 0x1>; /* Hypervisor PPI */
> +		arm,reread-timer;
> +	};

arm,reread-timer does not belong here.

Please don't blindly copy and paste things, either from one chip to ano=
ther or
from old deprecated internal stuff.


> +
> +		clockgen: clocking@1ee1000 {
> +			compatible =3D "fsl,ls1012a-clockgen","fsl,ls1043a-
> clockgen";
> +			reg =3D <0x0 0x1ee1000 0x0 0x1000>;
> +			#clock-cells =3D <2>;
> +			clocks =3D <&sysclk>;
> +		};

clockgen nodes should not claim compatibility with another SoC. =C2=A0T=
he clocking
options on ls1012a are not the same as on ls1043a.


> +
> +		scfg: scfg@1570000 {
> +			compatible =3D "fsl,ls1012a-scfg", "fsl,ls1043a-
> scfg", "syscon";
> +			reg =3D <0x0 0x1570000 0x0 0x10000>;
> +			big-endian;
> +		};

The SCFG on ls1021a is not compatible with ls1043a.

> +		reset: reset@1EE00B0 {
> +			compatible =3D "fsl,ls-reset";
> +			reg =3D <0x0 0x1EE00B0 0x0 0x4>;
> +			big-endian;
> +		};

This was an old internal hack that doesn't belong here.

> +
> +		rcpm: rcpm@1ee2000 {
> +			compatible =3D "fsl,ls1012a-rcpm", "fsl,ls1043a-
> rcpm", "fsl,qoriq-rcpm-2.1";
> +			reg =3D <0x0 0x1ee2000 0x0 0x10000>;

The RCPM on ls1043a has several registers that ls1012a does not have. =C2=
=A0They
are not compatible.

"rcpm-2.1" is probably not appropriate either.

> +		};
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0ftm0: ftm0@29d0000 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0compatible =3D "fsl,ftm-alarm";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0reg =3D <0x0 0x29d0000 0x0 0x10000>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0interrupts =3D <0 86 0x4>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0big-endian;
> +			rcpm-wakeup =3D <&rcpm 0x00020000 0x0>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0status =3D "disabled";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> +
> +		esdhc0: esdhc@1560000 {

Whitespace

> +		tmu: tmu@1f00000 {
> +			compatible =3D "fsl,qoriq-tmu", "fsl,ls1012a-tmu";

More specific compatibles come first.

> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		pfe_reserved: packetbuffer@83400000 {
> +			reg =3D <0 0x83400000 0 0xc00000>;
> +		};
> +	};

Could you explain this reservation?

> +
> +	pfe: pfe@04000000 {
> +		compatible =3D "fsl,pfe";
> +		ranges =3D <0x0 0x00 0x04000000 0xc00000
> +			=C2=A0=C2=A00x1 0x00 0x83400000 0xc00000>;
> +		reg =3D=C2=A0=C2=A0=C2=A0<0x0 0x90500000 0x0 0x10000>,	/* APB 64K =
*/
> +			<0x0 0x04000000 0x0 0xc00000>,	/* AXI 16M */
> +			<0x0 0x83400000 0x0 0xc00000>,=C2=A0=C2=A0=C2=A0=C2=A0/* PFE DDR =
12M */
> +			<0x0 0x10000000 0x0 0x2000>;	/* OCRAM 8K=C2=A0=C2=A0*/
> +		fsl,pfe-num-interfaces =3D < 0x2 >;
> +		interrupts =3D <0 172 0x4>;
> +		#interrupt-names =3D "hifirq";
> +		memory-region =3D <&pfe_reserved>;
> +		fsl,pfe-scfg =3D <&scfg 0>;

Binding?

> +	};
> +
> +};

Don't put a blank line between these.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
