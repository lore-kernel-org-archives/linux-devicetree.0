From: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v3 02/14] ARM: dts: sunxi: h3/h5: Fix i2c2 register
 address
Date: Wed, 01 Aug 2018 21:11:05 +0800
Message-ID: <1c12672d56b1e97aa594d2938ea9a36b5c0a98e0.camel@aosc.io>
References: <20170926072234.27481-1-clabbe.montjoie@gmail.com>
         <20170926072234.27481-3-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170926072234.27481-3-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, maxime.ripard@free-electrons.com, wens@csie.org, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

在 2017-09-26二的 09:22 +0200，Corentin Labbe写道：
> The unit address and register address does not match.
> This patch fix the register address with the good one.
> 
> Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>

This patch should be backported.

Older LTS also needs patches, but the patch needs to be refactored to
suite the versions.

Cc: stable@vger.kernel.org # 4.14

> ---
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> index b37ed3461229..289f2cd06dfe 100644
> --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> @@ -632,7 +632,7 @@
>  
>  		i2c2: i2c@1c2b400 {
>  			compatible = "allwinner,sun6i-a31-i2c";
> -			reg = <0x01c2b000 0x400>;
> +			reg = <0x01c2b400 0x400>;
>  			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&ccu CLK_BUS_I2C2>;
>  			resets = <&ccu RST_BUS_I2C2>;
