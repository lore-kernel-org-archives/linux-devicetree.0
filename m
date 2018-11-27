From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH v4 16/17] ARM: dts: suniv: add initial
 DTSI file for F1C100s
Date: Tue, 27 Nov 2018 10:59:58 +0100
Message-ID: <20181127095958.vxyymf63ehdyem4z@flea>
References: <cover.1543131714.git.mesihkilinc@gmail.com>
 <3a0db6052d58eb440ea29772fc7ad2502a1dfa3b.1543131714.git.mesihkilinc@gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="55oy4ixgvhonlwnx"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBKNL6TPQKGQEM6V6V3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <3a0db6052d58eb440ea29772fc7ad2502a1dfa3b.1543131714.git.mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--55oy4ixgvhonlwnx
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Sun, Nov 25, 2018 at 10:43:19AM +0300, Mesih Kilinc wrote:
> F1C100s is one product with the suniv die, which has a 32MiB co-packaged
> DDR1 DRAM chip. As we have the support for suniv pin controller and CCU now, add a
> initial DTSI for it.
> 
> Signed-off-by: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/suniv-f1c100s.dtsi | 147 +++++++++++++++++++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100644 arch/arm/boot/dts/suniv-f1c100s.dtsi
> 
> diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> new file mode 100644
> index 0000000..11bc999
> --- /dev/null
> +++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> @@ -0,0 +1,147 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR X11)
> +/*
> + * Copyright 2018 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> + * Copyright 2018 Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> + */
> +
> +#include <dt-bindings/clock/suniv-ccu-f1c100s.h>
> +#include <dt-bindings/reset/suniv-ccu-f1c100s.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	interrupt-parent = <&intc>;
> +
> +	clocks {
> +		osc24M: clk-24M {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <24000000>;
> +			clock-output-names = "osc24M";
> +		};
> +
> +		osc32k: clk-32k {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <32768>;
> +			clock-output-names = "osc32k";
> +		};
> +	};
> +
> +	cpus {
> +		cpu {
> +			compatible = "arm,arm926ej-s";
> +			device_type = "cpu";
> +		};
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		sram-controller@1c00000 {
> +			compatible = "allwinner,suniv-f1c100s-system-control",
> +				     "allwinner,sun4i-a10-system-control";
> +			reg = <0x01c00000 0x30>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			sram_d: sram@10000 {
> +				compatible = "mmio-sram";
> +				reg = <0x00010000 0x1000>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges = <0 0x00010000 0x1000>;
> +
> +				otg_sram: sram-section@0 {
> +					compatible = "allwinner,suniv-f1c100s-sram-d",
> +						     "allwinner,sun4i-a10-sram-d";
> +					reg = <0x0000 0x1000>;
> +					status = "disabled";
> +				};
> +			};
> +		};
> +
> +		ccu: clock@1c20000 {
> +			compatible = "allwinner,suniv-f1c100s-ccu";
> +			reg = <0x01c20000 0x400>;
> +			clocks = <&osc24M>, <&osc32k>;
> +			clock-names = "hosc", "losc";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		intc: interrupt-controller@1c20400 {
> +			compatible = "allwinner,suniv-f1c100s-ic";
> +			reg = <0x01c20400 0x400>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +		};
> +
> +		pio: pinctrl@1c20800 {
> +			compatible = "allwinner,suniv-f1c100s-pinctrl";
> +			reg = <0x01c20800 0x400>;
> +			interrupts = <38>, <39>, <40>;
> +			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;

The dt bindings headers and those DT are going to be merged through
separate trees, so you can't use these defines yet. Please use the
actual numbers in the DT for now, and send a patch fixing this when
4.21-rc1 will be out.

> +			clock-names = "apb", "hosc", "losc";
> +			gpio-controller;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			#gpio-cells = <3>;
> +
> +			uart0_pins_a: uart-pins-pe {

This would be uart0_pe_pins: uart0-pe-pins.

Thanks!

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--55oy4ixgvhonlwnx--
