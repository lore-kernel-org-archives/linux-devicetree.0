From: "Andrew Jeffery" <andrew@aj.id.au>
Subject: Re: [PATCH] ARM: dts: aspeed: g4: add video engine support
Date: Wed, 29 May 2019 10:52:36 +0930
Message-ID: <c0e01b11-5ea2-42d1-be67-2998809e310c@www.fastmail.com>
References: <20190527112753.1681-1-a.filippov@yadro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527112753.1681-1-a.filippov@yadro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Alexander A. Filippov" <a.filippov@yadro.com>, linux-aspeed@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On Mon, 27 May 2019, at 20:58, Alexander Filippov wrote:
> Add a node to describe the video engine and VGA scratch registers on
> AST2400.
> 
> These changes were copied from aspeed-g5.dtsi
> 
> Signed-off-by: Alexander Filippov <a.filippov@yadro.com>

Ugh, I should really sort out the bmc-misc stuff, I don't like to see it propagate
in its current form. That's not your problem though, and I hope to address it in
the near future.

For the OpenBMC kernel tree:

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 62 ++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index 6011692df15a..adc1804918df 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -168,6 +168,10 @@
>  					compatible = "aspeed,g4-pinctrl";
>  				};
>  
> +				vga_scratch: scratch {
> +					compatible = "aspeed,bmc-misc";
> +				};
> +
>  				p2a: p2a-control {
>  					compatible = "aspeed,ast2400-p2a-ctrl";
>  					status = "disabled";
> @@ -195,6 +199,16 @@
>  				reg = <0x1e720000 0x8000>;	// 32K
>  			};
>  
> +			video: video@1e700000 {
> +				compatible = "aspeed,ast2400-video-engine";
> +				reg = <0x1e700000 0x1000>;
> +				clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
> +					 <&syscon ASPEED_CLK_GATE_ECLK>;
> +				clock-names = "vclk", "eclk";
> +				interrupts = <7>;
> +				status = "disabled";
> +			};
> +
>  			gpio: gpio@1e780000 {
>  				#gpio-cells = <2>;
>  				gpio-controller;
> @@ -1408,6 +1422,54 @@
>  	};
>  };
>  
> +&vga_scratch {
> +	dac_mux {
> +		offset = <0x2c>;
> +		bit-mask = <0x3>;
> +		bit-shift = <16>;
> +	};
> +	vga0 {
> +		offset = <0x50>;
> +		bit-mask = <0xffffffff>;
> +		bit-shift = <0>;
> +	};
> +	vga1 {
> +		offset = <0x54>;
> +		bit-mask = <0xffffffff>;
> +		bit-shift = <0>;
> +	};
> +	vga2 {
> +		offset = <0x58>;
> +		bit-mask = <0xffffffff>;
> +		bit-shift = <0>;
> +	};
> +	vga3 {
> +		offset = <0x5c>;
> +		bit-mask = <0xffffffff>;
> +		bit-shift = <0>;
> +	};
> +	vga4 {
> +		offset = <0x60>;
> +		bit-mask = <0xffffffff>;
> +		bit-shift = <0>;
> +	};
> +	vga5 {
> +		offset = <0x64>;
> +		bit-mask = <0xffffffff>;
> +		bit-shift = <0>;
> +	};
> +	vga6 {
> +		offset = <0x68>;
> +		bit-mask = <0xffffffff>;
> +		bit-shift = <0>;
> +	};
> +	vga7 {
> +		offset = <0x6c>;
> +		bit-mask = <0xffffffff>;
> +		bit-shift = <0>;
> +	};
> +};
> +
>  &sio_regs {
>  	sio_2b {
>  		offset = <0xf0>;
> -- 
> 2.20.1
> 
>
