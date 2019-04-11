From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
Subject: Re: [PATCH v2 4/8] arm64: dts: allwinner: Add ARM Mali GPU node for H6
Date: Thu, 11 Apr 2019 17:05:19 +0200
Message-ID: <2957024.jOddxINRMN@jernej-laptop>
References: <20190411105720.32357-1-peron.clem@gmail.com> <20190411105720.32357-5-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411105720.32357-5-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

Dne četrtek, 11. april 2019 ob 12:57:16 CEST je Clément Péron napisal(a):
> Add the mali gpu node to the H6 device-tree.
> 
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi index
> e0dc4a05c1ba..196753110434 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -157,6 +157,20 @@
>  			allwinner,sram = <&ve_sram 1>;
>  		};
> 
> +		gpu: gpu@1800000 {
> +			compatible = "allwinner,sun50i-h6-mali",
> +				     "arm,mali-t720";
> +			reg = <0x01800000 0x4000>;
> +			interrupts = <GIC_SPI 84 
IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 85 
IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 83 
IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "job", "mmu", "gpu";
> +			clocks = <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
> +			clock-names = "core", "bus";
> +			resets = <&ccu RST_BUS_GPU>;
> +			status = "disabled";

Usually self sufficient peripherals are enabled by default in DTSI.

> +		};
> +
>  		syscon: syscon@3000000 {
>  			compatible = "allwinner,sun50i-h6-system-
control",
>  				     "allwinner,sun50i-a64-
system-control";
