From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] MIPS: dts: ralink: Add Mediatek MT7628A SoC
Date: Thu, 17 Aug 2017 16:34:26 -0500
Message-ID: <20170817213426.34shgxwnjowcg4sk@rob-hp-laptop>
References: <1502814530-40604-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1502814530-40604-1-git-send-email-harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 15, 2017 at 05:28:50PM +0100, Harvey Hunt wrote:
> The MT7628A is the successor to the MT7620 and pin compatible with the
> MT7688A, although the latter supports only a 1T1R antenna rather than
> a 2T2R antenna.
> 
> This commit adds support for the following features:
> 
> - UART
> - USB PHY
> - EHCI
> - Interrupt controller
> - System controller
> - Memory controller
> - Reset controller
> 
> Signed-off-by: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Cc: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
> Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org 
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org 
> Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org 
> ---
>  Documentation/devicetree/bindings/mips/ralink.txt |   1 +
>  arch/mips/boot/dts/ralink/mt7628a.dtsi            | 125 ++++++++++++++++++++++
>  2 files changed, 126 insertions(+)
>  create mode 100644 arch/mips/boot/dts/ralink/mt7628a.dtsi
> 
> diff --git a/Documentation/devicetree/bindings/mips/ralink.txt b/Documentation/devicetree/bindings/mips/ralink.txt
> index b35a8d0..a16e8d7 100644
> --- a/Documentation/devicetree/bindings/mips/ralink.txt
> +++ b/Documentation/devicetree/bindings/mips/ralink.txt
> @@ -15,3 +15,4 @@ value must be one of the following values:
>    ralink,rt5350-soc
>    ralink,mt7620a-soc
>    ralink,mt7620n-soc
> +  ralink,mt7628a-soc
> diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> new file mode 100644
> index 0000000..8461fe9
> --- /dev/null
> +++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> @@ -0,0 +1,125 @@
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "ralink,mt7628a-soc";
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			compatible = "mti,mips24KEc";
> +			device_type = "cpu";
> +			reg = <0>;
> +		};
> +	};
> +
> +	resetctrl: resetctrl {

reset-controller {

> +		compatible = "ralink,rt2880-reset";
> +		#reset-cells = <1>;
> +	};
> +
> +	cpuintc: cpuintc {

interrupt-controller {

> +		#address-cells = <0>;
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +		compatible = "mti,cpu-interrupt-controller";
> +	};
> +
> +	palmbus@10000000 {
> +		compatible = "palmbus";
> +		reg = <0x10000000 0x200000>;
> +		ranges = <0x0 0x10000000 0x1FFFFF>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		sysc@0 {

system-controller@0

> +			compatible = "ralink,mt7620a-sysc";
> +			reg = <0x0 0x100>;
> +		};
> +
> +		intc: intc@200 {

interrupt-controller@200

> +			compatible = "ralink,rt2880-intc";
> +			reg = <0x200 0x100>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			resets = <&resetctrl 9>;
> +			reset-names = "intc";
> +
> +			interrupt-parent = <&cpuintc>;
> +			interrupts = <2>;
> +
> +			ralink,intc-registers = <0x9c 0xa0
> +						 0x6c 0xa4
> +						 0x80 0x78>;
> +		};
> +
> +		memc@300 {

memory-controller@300

> +			compatible = "ralink,mt7620a-memc";
> +			reg = <0x300 0x100>;
> +		};
> +
> +		uartlite@c00 {

serial@c00

And so on. IOW, use standard, generic node names as defined in the DT 
spec.

> +			compatible = "ns16550a";
> +			reg = <0xc00 0x100>;
> +
> +			resets = <&resetctrl 12>;
> +			reset-names = "uart0";
> +
> +			interrupt-parent = <&intc>;
> +			interrupts = <20>;
> +
> +			reg-shift = <2>;
> +		};
> +
> +		uart1@d00 {
> +			compatible = "ns16550a";
> +			reg = <0xd00 0x100>;
> +
> +			resets = <&resetctrl 19>;
> +			reset-names = "uart1";
> +
> +			interrupt-parent = <&intc>;
> +			interrupts = <21>;
> +
> +			reg-shift = <2>;
> +		};
> +
> +		uart2@e00 {
> +			compatible = "ns16550a";
> +			reg = <0xe00 0x100>;
> +
> +			resets = <&resetctrl 20>;
> +			reset-names = "uart2";
> +
> +			interrupt-parent = <&intc>;
> +			interrupts = <22>;
> +
> +			reg-shift = <2>;
> +		};
> +	};
> +
> +	usbphy: uphy@10120000 {
> +		compatible = "mediatek,mt7628-usbphy";
> +		reg = <0x10120000 0x1000>;
> +
> +		#phy-cells = <0>;
> +
> +		resets = <&resetctrl 22 &resetctrl 25>;
> +		reset-names = "host", "device";
> +	};
> +
> +	ehci@101c0000 {
> +		compatible = "generic-ehci";
> +		reg = <0x101c0000 0x1000>;
> +
> +		phys = <&usbphy>;
> +		phy-names = "usb";
> +
> +		interrupt-parent = <&intc>;
> +		interrupts = <18>;
> +	};
> +};
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
