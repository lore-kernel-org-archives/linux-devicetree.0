From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] clk: stm32h7: Add stm32h743 clock driver
Date: Mon, 3 Apr 2017 09:39:58 -0500
Message-ID: <20170403143958.gi7vyhianzetnxz2@rob-hp-laptop>
References: <1490778502-23651-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490778502-23651-1-git-send-email-gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gabriel.fernandez-qxv4g6HH51o@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, radoslaw.pietrzyk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, olivier.bideau-qxv4g6HH51o@public.gmane.org, amelie.delaunay-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 29, 2017 at 11:08:22AM +0200, gabriel.fernandez-qxv4g6HH51o@public.gmane.org wrote:
> From: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
> 
> This patch enables clocks for STM32H743 boards.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
> 
> Just for the MFD changes:
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> v2:
>   - rename compatible string "stm32,pll" into "stm32h7-pll"
>   - suppress "st,pllrge" property
>   - suppress "st, frac-status" property
>   - change management of "st,frac"  property
> 	0 : enable 0 pll integer mode 
> 	other values : enable pll in fractional mode (value is
> 	the fractional factor)
> ---
>  .../devicetree/bindings/clock/st,stm32h7-rcc.txt   |  151 ++
>  drivers/clk/Makefile                               |    1 +
>  drivers/clk/clk-stm32h7.c                          | 1610 ++++++++++++++++++++
>  include/dt-bindings/clock/stm32h7-clks.h           |  165 ++
>  include/dt-bindings/mfd/stm32h7-rcc.h              |  137 ++
>  5 files changed, 2064 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt
>  create mode 100644 drivers/clk/clk-stm32h7.c
>  create mode 100644 include/dt-bindings/clock/stm32h7-clks.h
>  create mode 100644 include/dt-bindings/mfd/stm32h7-rcc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt b/Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt
> new file mode 100644
> index 0000000..5f54f64
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt
> @@ -0,0 +1,151 @@
> +STMicroelectronics STM32H7 Reset and Clock Controller
> +=====================================================
> +
> +The RCC IP is both a reset and a clock controller.
> +
> +Please refer to clock-bindings.txt for common clock controller binding usage.
> +Please also refer to reset.txt for common reset controller binding usage.
> +
> +Required properties:
> +- compatible: Should be:
> +  "st,stm32h743-rcc"
> +
> +- reg: should be register base and length as documented in the
> +  datasheet
> +
> +- #reset-cells: 1, see below
> +
> +- #clock-cells : from common clock binding; shall be set to 1
> +
> +- clocks: External oscillator clock phandle
> +  - high speed external clock signal (HSE)
> +  - low speed external clock signal (LSE)
> +  - external I2S clock (I2S_CKIN)
> +
> +- st,syscfg: phandle for pwrcfg, mandatory to disable/enable backup domain
> +  write protection (RTC clock).
> +
> +- pll x node: Allow to register a pll with specific parameters.
> +  Please see PLL section below.
> +
> +Example:
> +
> +	rcc: rcc@58024400 {
> +		#reset-cells = <1>;
> +		#clock-cells = <2>
> +		compatible = "st,stm32h743-rcc", "st,stm32-rcc";
> +		reg = <0x58024400 0x400>;
> +		clocks = <&clk_hse>, <&clk_lse>, <&clk_i2s_ckin>;
> +
> +		st,syscfg = <&pwrcfg>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		vco1@0 {
> +			#clock-cells = <0>;
> +			compatible = "stm32h7-pll";
> +			reg = <0>;
> +		};
> +
> +		vco2@1 {
> +			#clock-cells = <0>;
> +			compatible = "stm32h7-pll";
> +			reg = <1>;
> +			st,clock-div = <2>;
> +			st,clock-mult = <40>;
> +			st,frac = <0>;
> +			st,vcosel = <1>;
> +		};
> +		vco3@2 {
> +			#clock-cells = <0>;
> +			compatible = "stm32h7-pll";
> +			reg = <2>;
> +			st,clock-div = <2>;
> +			st,clock-mult = <40>;
> +			st,frac = <1024>;
> +			st,vcosel = <1>;
> +		};
> +	};
> +
> +
> +STM32H7 PLL
> +-----------
> +
> +The VCO of STM32 PLL could be reprensented like this:
> +
> +  Vref    ---------       --------
> +    ---->| / DIVM  |---->| x DIVN | ------> VCO
> +          ---------       --------
> +		             ^
> +			     |
> +	                  -------
> +		         | FRACN |
> +		          -------
> +
> +When the PLL is configured in integer mode:
> +- VCO = ( Vref / DIVM ) * DIVN
> +
> +When the PLL is configured in fractional mode:
> +- VCO = ( Vref / DIVM ) * ( DIVN + FRACN / 2^13)
> +
> +
> +Required properties for pll node:
> +- compatible: Should be:
> +  "stm32h7-pll"

stm,stm32h7-pll

With that,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> +
> +- #clock-cells: from common clock binding; shall be set to 0
> +- reg: Should be the pll number.
> +
> +Optional properties:
> +- st,clock-div:  DIVM division factor       : <1..63>
> +- st,clock-mult: DIVN multiplication factor : <4..512>
> +
> +- st,frac:
> +   - 0 Pll is configured in integer mode
> +   - <1..8191> Pll is configure in fractional mode and the value is
> +     the part of the multiplication factor.
> +
> +- st,vcosel: VCO selection
> +  - 0: Wide VCO range:192 to 836 MHz
> +  - 1: Medium VCO range:150 to 420 MHz
> +
> +The peripheral clock consumer should specify the desired clock by
> +having the clock ID in its "clocks" phandle cell.
> +
> +All available clocks are defined as preprocessor macros in
> +dt-bindings/clock/stm32h7-clks.h header and can be used in device
> +tree sources.
> +
> +Example:
> +
> +		timer5: timer@40000c00 {
> +			compatible = "st,stm32-timer";
> +			reg = <0x40000c00 0x400>;
> +			interrupts = <50>;
> +			clocks = <&rcc TIM5_CK>;
> +
> +		};
> +
> +Specifying softreset control of devices
> +=======================================
> +
> +Device nodes should specify the reset channel required in their "resets"
> +property, containing a phandle to the reset device node and an index specifying
> +which channel to use.
> +The index is the bit number within the RCC registers bank, starting from RCC
> +base address.
> +It is calculated as: index = register_offset / 4 * 32 + bit_offset.
> +Where bit_offset is the bit offset within the register.
> +
> +For example, for CRC reset:
> +  crc = AHB4RSTR_offset / 4 * 32 + CRCRST_bit_offset = 0x88 / 4 * 32 + 19 = 1107
> +
> +All available preprocessor macros for reset are defined dt-bindings//mfd/stm32h7-rcc.h
> +header and can be used in device tree sources.
> +
> +example:
> +
> +	timer2 {
> +		resets	= <&rcc STM32H7_APB1L_RESET(TIM2)>;
> +	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
