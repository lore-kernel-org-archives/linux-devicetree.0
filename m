From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: ls1028a: fix gpio nodes
Date: Mon, 12 Aug 2019 15:47:17 +0200
Message-ID: <20190812134716.GF27041@X250>
References: <20190805065700.7601-1-hui.song_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190805065700.7601-1-hui.song_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hui Song <hui.song_1@nxp.com>, Li Yang <leoyang.li@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 05, 2019 at 02:57:00PM +0800, Hui Song wrote:
> From: Song Hui <hui.song_1@nxp.com>
> 
> Update the nodes to include little-endian
> property to be consistent with the hardware.
> 
> Signed-off-by: Song Hui <hui.song_1@nxp.com>

@Leo, looks good?

Shawn

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index aef5b06..7ccbbfc 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -277,33 +277,36 @@
>  		};
>  
>  		gpio1: gpio@2300000 {
> -			compatible = "fsl,qoriq-gpio";
> +			compatible = "fsl,ls1028a-gpio","fsl,qoriq-gpio";
>  			reg = <0x0 0x2300000 0x0 0x10000>;
>  			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
>  			gpio-controller;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> +			little-endian;
>  		};
>  
>  		gpio2: gpio@2310000 {
> -			compatible = "fsl,qoriq-gpio";
> +			compatible = "fsl,ls1028a-gpio","fsl,qoriq-gpio";
>  			reg = <0x0 0x2310000 0x0 0x10000>;
>  			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
>  			gpio-controller;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> +			little-endian;
>  		};
>  
>  		gpio3: gpio@2320000 {
> -			compatible = "fsl,qoriq-gpio";
> +			compatible = "fsl,ls1028a-gpio","fsl,qoriq-gpio";
>  			reg = <0x0 0x2320000 0x0 0x10000>;
>  			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
>  			gpio-controller;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> +			little-endian;
>  		};
>  
>  		usb0: usb@3100000 {
> -- 
> 2.9.5
> 
