From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sunxi: h3/h5 :Add DAI nodes
Date: Sun, 03 Sep 2017 18:35:06 +0200
Message-ID: <2581170.20QKPVRcId@jernej-laptop>
References: <20170903150806.3451-1-codekipper@gmail.com>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBQG6WDGQKGQEW3CJBWI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170903150806.3451-1-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Marcus!

Dne nedelja, 03. september 2017 ob 17:08:06 CEST je codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 
napisal(a):
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Add the new DAI blocks to the device tree. I2S0 and I2S1 are for
> connecting to an external codec whereas I2S2 is used for HDMI
> audio.
> 
> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 39
> ++++++++++++++++++++++++++++++++++++++ 1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> b/arch/arm/boot/dts/sunxi-h3-h5.dtsi index 11240a8313c2..cf6fcc857324
> 100644
> --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> @@ -450,6 +450,45 @@
>  			status = "disabled";
>  		};
> 
> +		i2s0: i2s@01c22000 {
> +			#sound-dai-cells = <0>;
> +			compatible = "allwinner,sun8i-h3-i2s";
> +			reg = <0x01c22000 0x400>;
> +			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_I2S0>, <&ccu CLK_I2S0>;
> +			clock-names = "apb", "mod";
> +			dmas = <&dma 3>, <&dma 3>;
> +			resets = <&ccu RST_BUS_I2S0>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +
> +		i2s1: i2s@01c22400 {
> +			#sound-dai-cells = <0>;
> +			compatible = "allwinner,sun8i-h3-i2s";
> +			reg = <0x01c22400 0x400>;
> +			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_I2S1>, <&ccu CLK_I2S1>;
> +			clock-names = "apb", "mod";
> +			dmas = <&dma 4>, <&dma 4>;
> +			resets = <&ccu RST_BUS_I2S1>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +
> +		i2s2: i2s@01c22800 {
> +			#sound-dai-cells = <0>;
> +			compatible = "allwinner,sun8i-h3-i2s";
> +			reg = <0x01c22800 0x400>;
> +			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_I2S2>, <&ccu CLK_I2S2>;
> +			clock-names = "apb", "mod";
> +			dmas = <&dma 5>, <&dma 5>;
> +			resets = <&ccu RST_BUS_I2S2>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +

I don't want to be a pain, but shouldn't we skip this one for now? It is only 
for HDMI and has different capabilities (8 channels supported and slighlty 
different formula to calculate oversample rate.

Best regards,
Jernej
