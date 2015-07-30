From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/2] arm64: dts: Add dts files for Marvell Berlin4CT
 SoC
Date: Thu, 30 Jul 2015 10:06:38 +0200
Message-ID: <55B9DB0E.7010303@gmail.com>
References: <1437557992-7111-1-git-send-email-jszhang@marvell.com> <1437557992-7111-2-git-send-email-jszhang@marvell.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437557992-7111-2-git-send-email-jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/22/2015 11:39 AM, Jisheng Zhang wrote:
> Add initial dtsi file to support Marvell Berlin4CT SoC with
> quad Cortex-A53 CPUs.
>
> It also adds dts file for Marvell Berlin4CT DMP board which is
> based on Berlin4CT SoC.
>
> Signed-off-by: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> ---
[...]
> diff --git a/arch/arm64/boot/dts/marvell/berlin4ct-dmp.dts b/arch/arm64/boot/dts/marvell/berlin4ct-dmp.dts
> new file mode 100644
> index 0000000..d1152c0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/marvell/berlin4ct-dmp.dts
> @@ -0,0 +1,66 @@
> +/*
> + * Copyright (C) 2015 Marvell Technology Group Ltd.
> + *
> + * Author: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
[...]
> +/ {

Jisheng,

before I take this series, some nitpicking.

> +	model = "MARVELL BG4CT DMP BOARD";

Are you fine with fixing the broken CAPSLOCK key, i.e. make above
"Marvell BG4CT DMP board" ?

> +	compatible = "marvell,berlin4ct-dmp", "marvell,berlin4ct", "marvell,berlin";
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory {
> +		device_type = "memory";
> +		/* the first 16MB is for firmwares's usage */
> +		reg = <0 0x01000000 0 0x80000000>;
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> new file mode 100644
> index 0000000..becaedc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> @@ -0,0 +1,164 @@
> +/*
> + * Copyright (C) 2015 Marvell Technology Group Ltd.
> + *
> + * Author: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
[...]
> +
> +/ {
> +	compatible = "marvell,berlin";

compatible = "marvell,berlin4ct", "marvell,berlin";

> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
[...]
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0xf7000000 0x1000000>;
> +
> +		osc: osc {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <25000000>;
> +		};

Is the oscillator above really part of the SoC bus fabric? If 25MHz is
the only option for an external OSC, I suggest to move it at least out
of the soc {} node.

Sebastian

> +		gic: interrupt-controller@901000 {
> +			compatible = "arm,gic-400";
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			reg = <0x901000 0x1000>,
> +			      <0x902000 0x2000>,
> +			      <0x904000 0x2000>,
> +			      <0x906000 0x2000>;
> +			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +		};
> +
> +		apb@fc0000 {
> +			compatible = "simple-bus";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0xfc0000 0x10000>;
> +			interrupt-parent = <&sic>;
> +
> +			sic: interrupt-controller@1000 {
> +				compatible = "snps,dw-apb-ictl";
> +				reg = <0x1000 0x30>;
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +				interrupt-parent = <&gic>;
> +				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			uart0: uart@d000 {
> +				compatible = "snps,dw-apb-uart";
> +				reg = <0xd000 0x100>;
> +				interrupts = <8>;
> +				clocks = <&osc>;
> +				reg-shift = <2>;
> +				status = "disabled";
> +			};
> +		};
> +	};
> +};
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
