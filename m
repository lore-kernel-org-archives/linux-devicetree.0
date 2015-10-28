From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 3/3] ARM: dts: BCM63xx: Add ARMPLL device tree nodes
Date: Wed, 28 Oct 2015 16:40:40 -0700
Message-ID: <56315CF8.8070904@gmail.com>
References: <1445990177-27474-1-git-send-email-f.fainelli@gmail.com> <1445990177-27474-4-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1445990177-27474-4-git-send-email-f.fainelli@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-clk@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, jonmason@broadcom.com, sboyd@codeaurora.org, mturquette@baylibre.com, linux@arm.linux.org.uk, sbranden@broadcom.com, rjui@broadcom.com
List-Id: devicetree@vger.kernel.org

On 27/10/15 16:56, Florian Fainelli wrote:
> Add the ARM PLL controller which comes standard with the Cortex-A9 found
> on the BCM63138 SoCs. This is the same controller as the one found in
> the Broadcom iProc architecture, however, we have a separate compatible
> string to indicate the integration difference.
> 
> While at it, properly rename references to the 50Mhz clock which is in
> fact a crystal/oscillator and updates references to it.

The periph_clk is actually the correct one, and is different from the
oscillator, I will resubmit these patches shortly to better match the
chip clocking.

> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> No changes in v2 or v3
> 
>  arch/arm/boot/dts/bcm63138.dtsi | 39 +++++++++++++++++++++++++++++----------
>  1 file changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/bcm63138.dtsi b/arch/arm/boot/dts/bcm63138.dtsi
> index 34cd64051250..c146325eebdb 100644
> --- a/arch/arm/boot/dts/bcm63138.dtsi
> +++ b/arch/arm/boot/dts/bcm63138.dtsi
> @@ -43,17 +43,29 @@
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -		arm_timer_clk: arm_timer_clk {
> +		osc: oscillator {
>  			#clock-cells = <0>;
>  			compatible = "fixed-clock";
> -			clock-frequency = <500000000>;
> +			clock-frequency = <50000000>;
> +			clock-output-names = "periph";
>  		};
>  
> -		periph_clk: periph_clk {
> +		/* peripheral clock for system timer */
> +		axi_clk: axi_clk {
>  			#clock-cells = <0>;
> -			compatible = "fixed-clock";
> -			clock-frequency = <50000000>;
> -			clock-output-names = "periph";
> +			compatible = "fixed-factor-clock";
> +			clocks = <&armpll>;
> +			clock-div = <2>;
> +			clock-mult = <1>;
> +		};
> +
> +		/* APB bus clock */
> +		apb_clk: apb_clk {
> +			#clock-cells = <0>;
> +			compatible = "fixed-factor-clock";
> +			clocks = <&armpll>;
> +			clock-div = <4>;
> +			clock-mult = <1>;
>  		};
>  	};
>  
> @@ -93,14 +105,14 @@
>  			compatible = "arm,cortex-a9-global-timer";
>  			reg = <0x1e200 0x20>;
>  			interrupts = <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&arm_timer_clk>;
> +			clocks = <&axi_clk>;
>  		};
>  
>  		local_timer: local-timer@1e600 {
>  			compatible = "arm,cortex-a9-twd-timer";
>  			reg = <0x1e600 0x20>;
>  			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&arm_timer_clk>;
> +			clocks = <&axi_clk>;
>  		};
>  
>  		twd_watchdog: watchdog@1e620 {
> @@ -109,6 +121,13 @@
>  			interrupts = <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		armpll: armpll {
> +			#clock-cells = <0>;
> +			compatible = "brcm,bcm63138-armpll";
> +			clocks = <&osc>;
> +			reg = <0x20000 0xf00>;
> +		};
> +
>  		pmb0: reset-controller@4800c0 {
>  			compatible = "brcm,bcm63138-pmb";
>  			reg = <0x4800c0 0x10>;
> @@ -138,7 +157,7 @@
>  			compatible = "brcm,bcm6345-uart";
>  			reg = <0x600 0x1b>;
>  			interrupts = <GIC_SPI 32 0>;
> -			clocks = <&periph_clk>;
> +			clocks = <&osc>;
>  			clock-names = "periph";
>  			status = "disabled";
>  		};
> @@ -147,7 +166,7 @@
>  			compatible = "brcm,bcm6345-uart";
>  			reg = <0x620 0x1b>;
>  			interrupts = <GIC_SPI 33 0>;
> -			clocks = <&periph_clk>;
> +			clocks = <&osc>;
>  			clock-names = "periph";
>  			status = "disabled";
>  		};
> 


-- 
Florian
