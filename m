From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-am6: add USB support
Date: Tue, 15 Jan 2019 08:36:42 -0600
Message-ID: <20190115143641.m2cvwljr7rbtayi2@kahuna>
References: <1547200861-17795-1-git-send-email-rogerq@ti.com>
 <1547200861-17795-3-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547200861-17795-3-git-send-email-rogerq@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>
Cc: t-kristo@ti.com, nsekhar@ti.com, vigneshr@ti.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12:01-20190111, Roger Quadros wrote:
> Adds support for USB0 and USB1 instances on the AM6 SoC.
> USB0 is limited to high-speed for now.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 80 ++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> index 8b55108..680cbc7 100644
> --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> @@ -199,4 +199,84 @@
>  		#size-cells = <1>;
>  		ranges = <0x0 0x0 0x00100000 0x1c000>;
>  	};
> +
> +	dwc3_0: dwc3@4000000 {
> +		compatible = "ti,am654-dwc3";
> +		reg = <0x0 0x4000000 0x0 0x4000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x4000000 0x20000>;
> +		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> +		dma-coherent;
> +		status = "disabled";

NAK. -> in ARMV8, we dont do default disabled. Instead, please disable
nodes in the board dts or overlay as necessary.

> +		power-domains = <&k3_pds 151>;
> +		assigned-clocks = <&k3_clks 151 2>, <&k3_clks 151 7>;
> +		assigned-clock-parents = <&k3_clks 151 4>,	/* set REF_CLK to 20MHz i.e. PER0_PLL/48 */
> +					 <&k3_clks 151 9>;	/* set PIPE3_TXB_CLK to CLK_12M_RC/256 (for HS only) */
> +
> +		usb0: usb@10000 {
> +			compatible = "snps,dwc3";
> +			reg = <0x10000 0x10000>;
> +			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "peripheral",
> +					  "host",
> +					  "otg";
> +			maximum-speed = "high-speed";
> +			dr_mode = "otg";
> +			phys = <&usb0_phy>;
> +			phy-names = "usb2-phy";
> +			snps,dis_u3_susphy_quirk;
> +		};
> +	};
> +
> +	usb0_phy: phy@4100000 {
> +		compatible = "ti,am654-usb2", "ti,omap-usb2";
> +		reg = <0x0 0x4100000 0x0 0x54>;
> +		syscon-phy-power = <&scm_conf 0x4000>;

Just curious, dont we need a power domain as well?

> +		clocks = <&k3_clks 151 0>, <&k3_clks 151 1>;
> +		clock-names = "wkupclk", "refclk";
> +		#phy-cells = <0>;
> +		status = "disabled";

same here -> please drop

> +	};
> +
> +	dwc3_1: dwc3@4020000 {
> +		compatible = "ti,am654-dwc3";
> +		reg = <0x0 0x4020000 0x0 0x4000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x4020000 0x20000>;
> +		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +		dma-coherent;
> +		status = "disabled";

same here -> please drop

> +		power-domains = <&k3_pds 152>;
> +		assigned-clocks = <&k3_clks 152 2>;
> +		assigned-clock-parents = <&k3_clks 152 4>;	/* set REF_CLK to 20MHz i.e. PER0_PLL/48 */
> +
> +		usb1: usb@10000 {
> +			compatible = "snps,dwc3";
> +			reg = <0x10000 0x10000>;
> +			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "peripheral",
> +					  "host",
> +					  "otg";
> +			maximum-speed = "high-speed";
> +			dr_mode = "otg";
> +			phys = <&usb1_phy>;
> +			phy-names = "usb2-phy";
> +		};
> +	};
> +
> +	usb1_phy: phy@4110000 {
> +		compatible = "ti,am654-usb2", "ti,omap-usb2";
> +		reg = <0x0 0x4110000 0x0 0x54>;
> +		syscon-phy-power = <&scm_conf 0x4020>;

Same question on power domain..

> +		clocks = <&k3_clks 152 0>, <&k3_clks 152 1>;
> +		clock-names = "wkupclk", "refclk";
> +		#phy-cells = <0>;
> +		status = "disabled";

same here -> please drop

> +	};
>  };
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 

-- 
Regards,
Nishanth Menon
