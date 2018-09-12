From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] ARM: dts: r9a06g032: Correct UART and add all other
 UARTs
Date: Wed, 12 Sep 2018 11:20:39 +0200
Message-ID: <20180912092035.lhzlebd6rh72yjgj@verge.net.au>
References: <20180910160254.3882-1-phil.edworthy@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180910160254.3882-1-phil.edworthy@renesas.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 10, 2018 at 05:02:54PM +0100, Phil Edworthy wrote:
> - UART0 was missing the bus clock ("apb_pclk").
> - Now that the relevant rzn1 bindings have been added, replace the Synopsys
>   compat string with the rzn1 strings.

Perhaps: Use recently accepted r9a06g032 and rzn1 compat strings.

> - Add all the other UARTs.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

The above notwithstanding this looks good to me but I will wait to see if
there are other reviews before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> v2:
>  - Keep the "snps,dw-apb-uart" fallback for uarts 0..2 as these are unmodified
>    peripherals.
> ---
>  arch/arm/boot/dts/r9a06g032.dtsi | 83 ++++++++++++++++++++++++++++++--
>  1 file changed, 80 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
> index 3e45375b79aa..eaf94976ed6d 100644
> --- a/arch/arm/boot/dts/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/r9a06g032.dtsi
> @@ -78,13 +78,90 @@
>  		};
>  
>  		uart0: serial@40060000 {
> -			compatible = "snps,dw-apb-uart";
> +			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart", "snps,dw-apb-uart";
>  			reg = <0x40060000 0x400>;
>  			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
>  			reg-shift = <2>;
>  			reg-io-width = <4>;
> -			clocks = <&sysctrl R9A06G032_CLK_UART0>;
> -			clock-names = "baudclk";
> +			clocks = <&sysctrl R9A06G032_CLK_UART0>, <&sysctrl R9A06G032_HCLK_UART0>;
> +			clock-names = "baudclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@40061000 {
> +			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart", "snps,dw-apb-uart";
> +			reg = <0x40061000 0x400>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&sysctrl R9A06G032_CLK_UART1>, <&sysctrl R9A06G032_HCLK_UART1>;
> +			clock-names = "baudclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@40062000 {
> +			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart", "snps,dw-apb-uart";
> +			reg = <0x40062000 0x400>;
> +			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&sysctrl R9A06G032_CLK_UART2>, <&sysctrl R9A06G032_HCLK_UART2>;
> +			clock-names = "baudclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		uart3: serial@50000000 {
> +			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
> +			reg = <0x50000000 0x400>;
> +			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&sysctrl R9A06G032_CLK_UART3>, <&sysctrl R9A06G032_HCLK_UART3>;
> +			clock-names = "baudclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		uart4: serial@50001000 {
> +			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
> +			reg = <0x50001000 0x400>;
> +			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&sysctrl R9A06G032_CLK_UART4>, <&sysctrl R9A06G032_HCLK_UART4>;
> +			clock-names = "baudclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		uart5: serial@50002000 {
> +			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
> +			reg = <0x50002000 0x400>;
> +			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&sysctrl R9A06G032_CLK_UART5>, <&sysctrl R9A06G032_HCLK_UART5>;
> +			clock-names = "baudclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		uart6: serial@50003000 {
> +			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
> +			reg = <0x50003000 0x400>;
> +			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&sysctrl R9A06G032_CLK_UART6>, <&sysctrl R9A06G032_HCLK_UART6>;
> +			clock-names = "baudclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		uart7: serial@50004000 {
> +			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
> +			reg = <0x50004000 0x400>;
> +			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&sysctrl R9A06G032_CLK_UART7>, <&sysctrl R9A06G032_HCLK_UART7>;
> +			clock-names = "baudclk", "apb_pclk";
>  			status = "disabled";
>  		};
>  
> -- 
> 2.17.1
> 
