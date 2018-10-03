Return-Path: <SRS0=lJrw=MP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:56509 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726723AbeJCOcG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 3 Oct 2018 10:32:06 -0400
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v8 1/2] arm64: dts: marvell: use new bindings for CP110 interrupts
References: <20181003072515.20121-1-miquel.raynal@bootlin.com>
Date: Wed, 03 Oct 2018 09:44:49 +0200
In-Reply-To: <20181003072515.20121-1-miquel.raynal@bootlin.com> (Miquel
        Raynal's message of "Wed, 3 Oct 2018 09:25:14 +0200")
Message-ID: <87o9cbmq32.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Marc Zyngier <marc.zyngier@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Miquel,
 
 On mer., oct. 03 2018, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Create an ICU subnode for the NSR interrupts. This subnode becomes the
> CP110 interrupt parent, removing the need for the ICU_GRP_NSR parameter.
> Move all DT110 nodes to use these new bindings.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied on mvebu/dt64

Thanks,

Gregory

> ---
>
> This patch is one of the two patches remaining from the series:
> "Add System Error Interrupt support to Armada SoCs".
>
> Changes since v7:
> -----------------
> * Rebased on top of mvebu/dt64
>
>
> arch/arm64/boot/dts/marvell/armada-cp110.dtsi | 141 +++++++++---------
>  1 file changed, 74 insertions(+), 67 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-cp110.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
> index f3a630efcf3a..b1e688e0ce22 100644
> --- a/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
> @@ -43,7 +43,7 @@
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  	compatible = "simple-bus";
> -	interrupt-parent = <&CP110_LABEL(icu)>;
> +	interrupt-parent = <&CP110_LABEL(icu_nsr)>;
>  	ranges;
>  
>  	config-space@CP110_BASE {
> @@ -65,16 +65,16 @@
>  			dma-coherent;
>  
>  			CP110_LABEL(eth0): eth0 {
> -				interrupts = <ICU_GRP_NSR 39 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 43 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 47 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 51 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 55 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 59 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 63 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 67 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 71 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 129 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <39 IRQ_TYPE_LEVEL_HIGH>,
> +					<43 IRQ_TYPE_LEVEL_HIGH>,
> +					<47 IRQ_TYPE_LEVEL_HIGH>,
> +					<51 IRQ_TYPE_LEVEL_HIGH>,
> +					<55 IRQ_TYPE_LEVEL_HIGH>,
> +					<59 IRQ_TYPE_LEVEL_HIGH>,
> +					<63 IRQ_TYPE_LEVEL_HIGH>,
> +					<67 IRQ_TYPE_LEVEL_HIGH>,
> +					<71 IRQ_TYPE_LEVEL_HIGH>,
> +					<129 IRQ_TYPE_LEVEL_HIGH>;
>  				interrupt-names = "hif0", "hif1", "hif2",
>  					"hif3", "hif4", "hif5", "hif6", "hif7",
>  					"hif8", "link";
> @@ -84,16 +84,16 @@
>  			};
>  
>  			CP110_LABEL(eth1): eth1 {
> -				interrupts = <ICU_GRP_NSR 40 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 44 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 48 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 52 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 56 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 60 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 64 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 68 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 72 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 128 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <40 IRQ_TYPE_LEVEL_HIGH>,
> +					<44 IRQ_TYPE_LEVEL_HIGH>,
> +					<48 IRQ_TYPE_LEVEL_HIGH>,
> +					<52 IRQ_TYPE_LEVEL_HIGH>,
> +					<56 IRQ_TYPE_LEVEL_HIGH>,
> +					<60 IRQ_TYPE_LEVEL_HIGH>,
> +					<64 IRQ_TYPE_LEVEL_HIGH>,
> +					<68 IRQ_TYPE_LEVEL_HIGH>,
> +					<72 IRQ_TYPE_LEVEL_HIGH>,
> +					<128 IRQ_TYPE_LEVEL_HIGH>;
>  				interrupt-names = "hif0", "hif1", "hif2",
>  					"hif3", "hif4", "hif5", "hif6", "hif7",
>  					"hif8", "link";
> @@ -103,16 +103,16 @@
>  			};
>  
>  			CP110_LABEL(eth2): eth2 {
> -				interrupts = <ICU_GRP_NSR 41 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 45 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 49 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 53 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 57 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 61 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 65 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 69 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 73 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 127 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <41 IRQ_TYPE_LEVEL_HIGH>,
> +					<45 IRQ_TYPE_LEVEL_HIGH>,
> +					<49 IRQ_TYPE_LEVEL_HIGH>,
> +					<53 IRQ_TYPE_LEVEL_HIGH>,
> +					<57 IRQ_TYPE_LEVEL_HIGH>,
> +					<61 IRQ_TYPE_LEVEL_HIGH>,
> +					<65 IRQ_TYPE_LEVEL_HIGH>,
> +					<69 IRQ_TYPE_LEVEL_HIGH>,
> +					<73 IRQ_TYPE_LEVEL_HIGH>,
> +					<127 IRQ_TYPE_LEVEL_HIGH>;
>  				interrupt-names = "hif0", "hif1", "hif2",
>  					"hif3", "hif4", "hif5", "hif6", "hif7",
>  					"hif8", "link";
> @@ -183,16 +183,23 @@
>  		CP110_LABEL(icu): interrupt-controller@1e0000 {
>  			compatible = "marvell,cp110-icu";
>  			reg = <0x1e0000 0x440>;
> -			#interrupt-cells = <3>;
> -			interrupt-controller;
> -			msi-parent = <&gicp>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			CP110_LABEL(icu_nsr): interrupt-controller@10 {
> +				compatible = "marvell,cp110-icu-nsr";
> +				reg = <0x10 0x20>;
> +				#interrupt-cells = <2>;
> +				interrupt-controller;
> +				msi-parent = <&gicp>;
> +			};
>  		};
>  
>  		CP110_LABEL(rtc): rtc@284000 {
>  			compatible = "marvell,armada-8k-rtc";
>  			reg = <0x284000 0x20>, <0x284080 0x24>;
>  			reg-names = "rtc", "rtc-soc";
> -			interrupts = <ICU_GRP_NSR 77 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <77 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
>  		CP110_LABEL(syscon0): system-controller@440000 {
> @@ -212,10 +219,10 @@
>  				#gpio-cells = <2>;
>  				gpio-ranges = <&CP110_LABEL(pinctrl) 0 0 32>;
>  				interrupt-controller;
> -				interrupts = <ICU_GRP_NSR 86 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 85 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 84 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 83 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <86 IRQ_TYPE_LEVEL_HIGH>,
> +					<85 IRQ_TYPE_LEVEL_HIGH>,
> +					<84 IRQ_TYPE_LEVEL_HIGH>,
> +					<83 IRQ_TYPE_LEVEL_HIGH>;
>  				status = "disabled";
>  			};
>  
> @@ -227,10 +234,10 @@
>  				#gpio-cells = <2>;
>  				gpio-ranges = <&CP110_LABEL(pinctrl) 0 32 31>;
>  				interrupt-controller;
> -				interrupts = <ICU_GRP_NSR 82 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 81 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 80 IRQ_TYPE_LEVEL_HIGH>,
> -					<ICU_GRP_NSR 79 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <82 IRQ_TYPE_LEVEL_HIGH>,
> +					<81 IRQ_TYPE_LEVEL_HIGH>,
> +					<80 IRQ_TYPE_LEVEL_HIGH>,
> +					<79 IRQ_TYPE_LEVEL_HIGH>;
>  				status = "disabled";
>  			};
>  		};
> @@ -253,7 +260,7 @@
>  			"generic-xhci";
>  			reg = <0x500000 0x4000>;
>  			dma-coherent;
> -			interrupts = <ICU_GRP_NSR 106 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <106 IRQ_TYPE_LEVEL_HIGH>;
>  			clock-names = "core", "reg";
>  			clocks = <&CP110_LABEL(clk) 1 22>,
>  				 <&CP110_LABEL(clk) 1 16>;
> @@ -265,7 +272,7 @@
>  			"generic-xhci";
>  			reg = <0x510000 0x4000>;
>  			dma-coherent;
> -			interrupts = <ICU_GRP_NSR 105 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <105 IRQ_TYPE_LEVEL_HIGH>;
>  			clock-names = "core", "reg";
>  			clocks = <&CP110_LABEL(clk) 1 23>,
>  				 <&CP110_LABEL(clk) 1 16>;
> @@ -277,7 +284,7 @@
>  			"generic-ahci";
>  			reg = <0x540000 0x30000>;
>  			dma-coherent;
> -			interrupts = <ICU_GRP_NSR 107 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <107 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&CP110_LABEL(clk) 1 15>,
>  				 <&CP110_LABEL(clk) 1 16>;
>  			status = "disabled";
> @@ -330,7 +337,7 @@
>  			reg = <0x701000 0x20>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> -			interrupts = <ICU_GRP_NSR 120 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <120 IRQ_TYPE_LEVEL_HIGH>;
>  			clock-names = "core", "reg";
>  			clocks = <&CP110_LABEL(clk) 1 21>,
>  				 <&CP110_LABEL(clk) 1 17>;
> @@ -342,7 +349,7 @@
>  			reg = <0x701100 0x20>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> -			interrupts = <ICU_GRP_NSR 121 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <121 IRQ_TYPE_LEVEL_HIGH>;
>  			clock-names = "core", "reg";
>  			clocks = <&CP110_LABEL(clk) 1 21>,
>  				 <&CP110_LABEL(clk) 1 17>;
> @@ -353,7 +360,7 @@
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0x702000 0x100>;
>  			reg-shift = <2>;
> -			interrupts = <ICU_GRP_NSR 122 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <122 IRQ_TYPE_LEVEL_HIGH>;
>  			reg-io-width = <1>;
>  			clock-names = "baudclk", "apb_pclk";
>  			clocks = <&CP110_LABEL(clk) 1 21>,
> @@ -365,7 +372,7 @@
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0x702100 0x100>;
>  			reg-shift = <2>;
> -			interrupts = <ICU_GRP_NSR 123 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <123 IRQ_TYPE_LEVEL_HIGH>;
>  			reg-io-width = <1>;
>  			clock-names = "baudclk", "apb_pclk";
>  			clocks = <&CP110_LABEL(clk) 1 21>,
> @@ -377,7 +384,7 @@
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0x702200 0x100>;
>  			reg-shift = <2>;
> -			interrupts = <ICU_GRP_NSR 124 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <124 IRQ_TYPE_LEVEL_HIGH>;
>  			reg-io-width = <1>;
>  			clock-names = "baudclk", "apb_pclk";
>  			clocks = <&CP110_LABEL(clk) 1 21>,
> @@ -389,7 +396,7 @@
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0x702300 0x100>;
>  			reg-shift = <2>;
> -			interrupts = <ICU_GRP_NSR 125 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <125 IRQ_TYPE_LEVEL_HIGH>;
>  			reg-io-width = <1>;
>  			clock-names = "baudclk", "apb_pclk";
>  			clocks = <&CP110_LABEL(clk) 1 21>,
> @@ -408,7 +415,7 @@
>  			reg = <0x720000 0x54>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> -			interrupts = <ICU_GRP_NSR 115 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <115 IRQ_TYPE_LEVEL_HIGH>;
>  			clock-names = "core", "reg";
>  			clocks = <&CP110_LABEL(clk) 1 2>,
>  				 <&CP110_LABEL(clk) 1 17>;
> @@ -420,7 +427,7 @@
>  			compatible = "marvell,armada-8k-rng",
>  			"inside-secure,safexcel-eip76";
>  			reg = <0x760000 0x7d>;
> -			interrupts = <ICU_GRP_NSR 95 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <95 IRQ_TYPE_LEVEL_HIGH>;
>  			clock-names = "core", "reg";
>  			clocks = <&CP110_LABEL(clk) 1 25>,
>  				 <&CP110_LABEL(clk) 1 17>;
> @@ -430,7 +437,7 @@
>  		CP110_LABEL(sdhci0): sdhci@780000 {
>  			compatible = "marvell,armada-cp110-sdhci";
>  			reg = <0x780000 0x300>;
> -			interrupts = <ICU_GRP_NSR 27 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
>  			clock-names = "core", "axi";
>  			clocks = <&CP110_LABEL(clk) 1 4>, <&CP110_LABEL(clk) 1 18>;
>  			dma-coherent;
> @@ -440,12 +447,12 @@
>  		CP110_LABEL(crypto): crypto@800000 {
>  			compatible = "inside-secure,safexcel-eip197b";
>  			reg = <0x800000 0x200000>;
> -			interrupts = <ICU_GRP_NSR 87 IRQ_TYPE_LEVEL_HIGH>,
> -				<ICU_GRP_NSR 88 IRQ_TYPE_LEVEL_HIGH>,
> -				<ICU_GRP_NSR 89 IRQ_TYPE_LEVEL_HIGH>,
> -				<ICU_GRP_NSR 90 IRQ_TYPE_LEVEL_HIGH>,
> -				<ICU_GRP_NSR 91 IRQ_TYPE_LEVEL_HIGH>,
> -				<ICU_GRP_NSR 92 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <87 IRQ_TYPE_LEVEL_HIGH>,
> +				<88 IRQ_TYPE_LEVEL_HIGH>,
> +				<89 IRQ_TYPE_LEVEL_HIGH>,
> +				<90 IRQ_TYPE_LEVEL_HIGH>,
> +				<91 IRQ_TYPE_LEVEL_HIGH>,
> +				<92 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "mem", "ring0", "ring1",
>  				"ring2", "ring3", "eip";
>  			clock-names = "core", "reg";
> @@ -474,8 +481,8 @@
>  		/* non-prefetchable memory */
>  		0x82000000 0 CP110_PCIEx_MEM_BASE(0) 0  CP110_PCIEx_MEM_BASE(0) 0 0xf00000>;
>  		interrupt-map-mask = <0 0 0 0>;
> -		interrupt-map = <0 0 0 0 &CP110_LABEL(icu) ICU_GRP_NSR 22 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupts = <ICU_GRP_NSR 22 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-map = <0 0 0 0 &CP110_LABEL(icu_nsr) 22 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
>  		num-lanes = <1>;
>  		clock-names = "core", "reg";
>  		clocks = <&CP110_LABEL(clk) 1 13>, <&CP110_LABEL(clk) 1 14>;
> @@ -501,8 +508,8 @@
>  		/* non-prefetchable memory */
>  		0x82000000 0 CP110_PCIEx_MEM_BASE(1) 0  CP110_PCIEx_MEM_BASE(1) 0 0xf00000>;
>  		interrupt-map-mask = <0 0 0 0>;
> -		interrupt-map = <0 0 0 0 &CP110_LABEL(icu) ICU_GRP_NSR 24 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupts = <ICU_GRP_NSR 24 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-map = <0 0 0 0 &CP110_LABEL(icu_nsr) 24 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
>  
>  		num-lanes = <1>;
>  		clock-names = "core", "reg";
> @@ -529,8 +536,8 @@
>  		/* non-prefetchable memory */
>  		0x82000000 0 CP110_PCIEx_MEM_BASE(2) 0  CP110_PCIEx_MEM_BASE(2) 0 0xf00000>;
>  		interrupt-map-mask = <0 0 0 0>;
> -		interrupt-map = <0 0 0 0 &CP110_LABEL(icu) ICU_GRP_NSR 23 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupts = <ICU_GRP_NSR 23 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-map = <0 0 0 0 &CP110_LABEL(icu_nsr) 23 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
>  
>  		num-lanes = <1>;
>  		clock-names = "core", "reg";
> -- 
> 2.17.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
