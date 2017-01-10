From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 3/4] ARM: dts: stm32: stm32f7: Enable clocks for STM32F746
 boards
Date: Tue, 10 Jan 2017 11:14:30 +0100
Message-ID: <2c699f28-f554-e48a-34a0-e356f0bf7e2c@st.com>
References: <1483711165-17149-1-git-send-email-gabriel.fernandez@st.com>
 <1483711165-17149-4-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1483711165-17149-4-git-send-email-gabriel.fernandez@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: gabriel.fernandez@st.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org, andrea.merello@gmail.com, radoslaw.pietrzyk@gmail.com
Cc: devicetree@vger.kernel.org, amelie.delaunay@st.com, kernel@stlinux.com, olivier.bideau@st.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, ludovic.barre@st.com
List-Id: devicetree@vger.kernel.org

Hi Gabriel

On 01/06/2017 02:59 PM, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>
> This patch enables clocks for STM32F746 boards.
>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---

In commit header, "stm32f7" is not usefull.


>  arch/arm/boot/dts/stm32f746.dtsi | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
> index f321ffe..e05e131 100644
> --- a/arch/arm/boot/dts/stm32f746.dtsi
> +++ b/arch/arm/boot/dts/stm32f746.dtsi
> @@ -43,6 +43,7 @@
>  #include "skeleton.dtsi"
>  #include "armv7-m.dtsi"
>  #include <dt-bindings/pinctrl/stm32f746-pinfunc.h>
> +#include <dt-bindings/clock/stm32fx-clock.h>

This patch depends on another series not yet merged (maybe "[PATCH-next 
... is a better header ?

>
>  / {
>  	clocks {
> @@ -51,6 +52,24 @@
>  			compatible = "fixed-clock";
>  			clock-frequency = <0>;
>  		};
> +
> +		clk-lse {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <32768>;
> +		};
> +
> +		clk-lsi {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +		};
> +
> +		clk_i2s_ckin: clk-i2s-ckin {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <48000000>;
> +		};
>  	};
>
>  	soc {
> @@ -178,6 +197,11 @@
>  			interrupts = <1>, <2>, <3>, <6>, <7>, <8>, <9>, <10>, <23>, <40>, <41>, <42>, <62>, <76>;
>  		};
>
> +		pwrcfg: power-config@40007000 {
> +			compatible = "syscon";
> +			reg = <0x40007000 0x400>;
> +		};
> +
>  		pin-controller {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> @@ -291,9 +315,10 @@
>
>  		rcc: rcc@40023800 {
>  			#clock-cells = <2>;
> -			compatible = "st,stm32f42xx-rcc", "st,stm32-rcc";
> +			compatible = "st,stm32f746-rcc", "st,stm32-rcc";
>  			reg = <0x40023800 0x400>;
> -			clocks = <&clk_hse>;
> +			clocks = <&clk_hse>, <&clk_i2s_ckin>;
> +			st,syscfg = <&pwrcfg>;
>  		};
>  	};
>  };
>
