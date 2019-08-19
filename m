From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3] arm64: dts: ls1088a: fix gpio node
Date: Mon, 19 Aug 2019 15:20:06 +0200
Message-ID: <20190819132004.GJ5999@X250>
References: <20190815103016.23125-1-hui.song_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190815103016.23125-1-hui.song_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hui Song <hui.song_1@nxp.com>
Cc: Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 15, 2019 at 06:30:16PM +0800, Hui Song wrote:
> From: Song Hui <hui.song_1@nxp.com>
> 
> Update the nodes to include little-endian

So the commit log needs an update as well?

Shawn

> property to be consistent with the hardware
> and add ls1088a gpio specify compatible.
> 
> Signed-off-by: Song Hui <hui.song_1@nxp.com>
> ---
> Changes in v3:
> 	- delete the attribute of little-endian.
> Changes in v2:
> 	- update the subject.
> 	
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index dfbead4..ff669c8 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -269,7 +269,7 @@
>  		};
>  
>  		gpio0: gpio@2300000 {
> -			compatible = "fsl,qoriq-gpio";
> +			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
>  			reg = <0x0 0x2300000 0x0 0x10000>;
>  			interrupts = <0 36 IRQ_TYPE_LEVEL_HIGH>;
>  			little-endian;
> @@ -280,7 +280,7 @@
>  		};
>  
>  		gpio1: gpio@2310000 {
> -			compatible = "fsl,qoriq-gpio";
> +			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
>  			reg = <0x0 0x2310000 0x0 0x10000>;
>  			interrupts = <0 36 IRQ_TYPE_LEVEL_HIGH>;
>  			little-endian;
> @@ -291,7 +291,7 @@
>  		};
>  
>  		gpio2: gpio@2320000 {
> -			compatible = "fsl,qoriq-gpio";
> +			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
>  			reg = <0x0 0x2320000 0x0 0x10000>;
>  			interrupts = <0 37 IRQ_TYPE_LEVEL_HIGH>;
>  			little-endian;
> @@ -302,7 +302,7 @@
>  		};
>  
>  		gpio3: gpio@2330000 {
> -			compatible = "fsl,qoriq-gpio";
> +			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
>  			reg = <0x0 0x2330000 0x0 0x10000>;
>  			interrupts = <0 37 IRQ_TYPE_LEVEL_HIGH>;
>  			little-endian;
> -- 
> 2.9.5
> 
