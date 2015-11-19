From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM64: dts: enable clock support for Broadcom NS2
Date: Wed, 18 Nov 2015 16:03:12 -0800
Message-ID: <564D11C0.409@broadcom.com>
References: <1447888430-4451-1-git-send-email-jonmason@broadcom.com>
 <1447888430-4451-4-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447888430-4451-4-git-send-email-jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 11/18/2015 3:13 PM, Jon Mason wrote:
> Add device tree entries for clock support for Broadcom Northstar 2 SoC
>
> Signed-off-by: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>   arch/arm64/boot/dts/broadcom/ns2.dtsi | 80 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 79 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
> index 9610822..a510d3a 100644
> --- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
> @@ -31,6 +31,7 @@
>    */
>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/bcm-ns2.h>
>
>   /memreserve/ 0x84b00000 0x00000008;
>
> @@ -109,6 +110,33 @@
>   				     <&A57_3>;
>   	};
>
> +	clocks {

Is this a new convention? That is, group all clocks without a base 
register address in a node named "clocks", but at the same time, put all 
other clocks with base register address under a bus node.

> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		osc: oscillator {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <25000000>;
> +		};
> +
> +		iprocmed: iprocmed {
> +			#clock-cells = <0>;
> +			compatible = "fixed-factor-clock";
> +			clocks = <&genpll_scr BCM_NS2_GENPLL_SCR_SCR_CLK>;
> +			clock-div = <2>;
> +			clock-mult = <1>;
> +		};
> +
> +		iprocslow: iprocslow {
> +			#clock-cells = <0>;
> +			compatible = "fixed-factor-clock";
> +			clocks = <&genpll_scr BCM_NS2_GENPLL_SCR_SCR_CLK>;
> +			clock-div = <4>;
> +			clock-mult = <1>;
> +		};
> +	};
> +
>   	soc: soc {
>   		compatible = "simple-bus";
>   		#address-cells = <1>;
> @@ -156,6 +184,56 @@
>   			mmu-masters;
>   		};
>
> +		lcpll_ddr: lcpll_ddr@6501d058 {
> +			#clock-cells = <1>;
> +			compatible = "brcm,ns2-lcpll-ddr";
> +			reg = <0x6501d058 0x20>,
> +			      <0x6501c020 0x4>,
> +			      <0x6501d04c 0x4>;
> +			clocks = <&osc>;
> +			clock-output-names = "lcpll_ddr", "pcie_sata_usb",
> +					     "ddr", "ddr_ch2_unused",
> +					     "ddr_ch3_unused", "ddr_ch4_unused",
> +					     "ddr_ch5_unused";
> +		};
> +
> +		lcpll_ports: lcpll_ports@6501d078 {
> +			#clock-cells = <1>;
> +			compatible = "brcm,ns2-lcpll-ports";
> +			reg = <0x6501d078 0x20>,
> +			      <0x6501c020 0x4>,
> +			      <0x6501d054 0x4>;
> +			clocks = <&osc>;
> +			clock-output-names = "lcpll_ports", "wan", "rgmii",
> +					     "ports_ch2_unused",
> +					     "ports_ch3_unused",
> +					     "ports_ch4_unused",
> +					     "ports_ch5_unused";
> +		};
> +
> +		genpll_scr: genpll_scr@6501d098 {
> +			#clock-cells = <1>;
> +			compatible = "brcm,ns2-genpll-scr";
> +			reg = <0x6501d098 0x32>,
> +			      <0x6501c020 0x4>,
> +			      <0x6501d044 0x4>;
> +			clocks = <&osc>;
> +			clock-output-names = "genpll_scr", "scr", "fs",
> +					     "audio_ref", "scr_ch3_unused",
> +					     "scr_ch4_unused", "scr_ch5_unused";
> +		};
> +
> +		genpll_sw: genpll_sw@6501d0c4 {
> +			#clock-cells = <1>;
> +			compatible = "brcm,ns2-genpll-sw";
> +			reg = <0x6501d0c4 0x32>,
> +			      <0x6501c020 0x4>,
> +			      <0x6501d044 0x4>;
> +			clocks = <&osc>;
> +			clock-output-names = "genpll_sw", "rpe", "250", "nic",
> +					     "chimp", "port", "sdio";
> +		};
> +
>   		crmu: crmu@65024000 {
>   			compatible = "syscon";
>   			reg = <0x65024000 0x100>;
> @@ -204,7 +282,7 @@
>   			interrupts = <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
> -			clock-frequency = <23961600>;
> +			clocks = <&osc>;
>   			status = "disabled";
>   		};
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
