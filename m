From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: allwinner: a64: add R_I2C controller
Date: Wed, 6 Jun 2018 21:32:11 +0200
Message-ID: <20180606193211.4prhpzn2mbuy6eng@flea>
References: <20180606051702.6478-1-anarsoul@gmail.com>
 <20180606051702.6478-2-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180606051702.6478-2-anarsoul@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 05, 2018 at 10:17:00PM -0700, Vasily Khoruzhick wrote:
> From: Icenowy Zheng <icenowy@aosc.io>
> 
> Allwinner A64 has a I2C controller, which is in the R_ MMIO zone and has
> two groups of pinmuxes on PL bank, so it's called R_I2C.
> 
> Add support for this I2C controller and the pinmux which doesn't conflict
> with RSB.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 1b2ef28c42bd..dcf957b2e7c8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -46,6 +46,7 @@
>  #include <dt-bindings/clock/sun8i-r-ccu.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/reset/sun50i-a64-ccu.h>
> +#include <dt-bindings/reset/sun8i-r-ccu.h>
>  
>  / {
>  	interrupt-parent = <&gic>;
> @@ -655,6 +656,18 @@
>  			#reset-cells = <1>;
>  		};
>  
> +		r_i2c: i2c@1f02400 {
> +			compatible = "allwinner,sun50i-a64-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x01f02400 0x400>;
> +			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&r_ccu CLK_APB0_I2C>;
> +			resets = <&r_ccu RST_APB0_I2C>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
>  		r_pio: pinctrl@1f02c00 {
>  			compatible = "allwinner,sun50i-a64-r-pinctrl";
>  			reg = <0x01f02c00 0x400>;
> @@ -666,6 +679,17 @@
>  			interrupt-controller;
>  			#interrupt-cells = <3>;
>  
> +
> +			r_i2c_pins: i2c {
> +				pins = "PL0", "PL1";
> +				function = "s_i2c";
> +			};
> +

We usually don't have pin groups that are not used by any boards. I've
removed it and applied.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
