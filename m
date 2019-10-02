From: Priit Laes <plaes@plaes.org>
Subject: Re: [linux-sunxi] [PATCH v2 04/11] ARM: dts: sun8i: R40: add crypto
 engine node
Date: Wed, 2 Oct 2019 08:08:27 +0000
Message-ID: <20191002080827.GB6347@plaes.org>
References: <20191001184141.27956-1-clabbe.montjoie@gmail.com>
 <20191001184141.27956-5-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191001184141.27956-5-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: catalin.marinas@arm.com, davem@davemloft.net, herbert@gondor.apana.org.au, linux@armlinux.org.uk, mark.rutland@arm.com, mripard@kernel.org, robh+dt@kernel.org, wens@csie.org, will@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Tue, Oct 01, 2019 at 08:41:34PM +0200, Corentin Labbe wrote:
> The Crypto Engine is a hardware cryptographic offloader that supports
> many algorithms.
> It could be found on most Allwinner SoCs.
> 
> This patch enables the Crypto Engine on the Allwinner R40 SoC Device-tree.
> 
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> ---
>  arch/arm/boot/dts/sun8i-r40.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
> index bde068111b85..1fc3297a55ec 100644
> --- a/arch/arm/boot/dts/sun8i-r40.dtsi
> +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
> @@ -266,6 +266,16 @@
>  			#phy-cells = <1>;
>  		};
>  
> +		crypto: crypto-engine@1c15000 {

All the other .dtsi files have `crypto: crypto@...` instead of crypto-engine.

> +			compatible = "allwinner,sun8i-r40-crypto";
> +			reg = <0x01c15000 0x1000>;
> +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_CE>, <&ccu CLK_CE>;
> +			clock-names = "bus", "mod";
> +			resets = <&ccu RST_BUS_CE>;
> +			reset-names = "bus";
> +		};
> +
>  		ehci1: usb@1c19000 {
>  			compatible = "allwinner,sun8i-r40-ehci", "generic-ehci";
>  			reg = <0x01c19000 0x100>;
> -- 
> 2.21.0
> 
> -- 
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/20191001184141.27956-5-clabbe.montjoie%40gmail.com.
