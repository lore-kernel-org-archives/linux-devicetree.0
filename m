From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 2/5] dt-bindings: clock: renesas,r9a06g032-sysctrl:
 documentation
Date: Wed, 20 Jun 2018 09:43:44 -0600
Message-ID: <20180620154344.GA32205@rob-hp-laptop>
References: <1528973829-25493-1-git-send-email-michel.pollet@bp.renesas.com>
 <1528973829-25493-3-git-send-email-michel.pollet@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1528973829-25493-3-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michel Pollet <michel.pollet@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, phil.edworthy@renesas.com, Michel Pollet <buserror+upstream@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 14, 2018 at 11:56:31AM +0100, Michel Pollet wrote:
> The Renesas R9A06G032 SYSCTRL node description.
> 
> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> ---
>  .../bindings/clock/renesas,r9a06g032-sysctrl.txt   | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt

One nit, otherwise:

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt
> new file mode 100644
> index 0000000..f6cb5e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt
> @@ -0,0 +1,44 @@
> +* Renesas R9A06G032 SYSCTRL
> +
> +Required Properties:
> +
> +  - compatible: Must be:
> +    - "renesas,r9a06g032-sysctrl"
> +  - reg: Base address and length of the SYSCTRL IO block.
> +  - #clock-cells: Must be 1
> +  - clocks: References to the parent clocks:
> +	- external 40mhz crystal.
> +	- external (optional) 32.768khz
> +	- external (optional) jtag input
> +	- external (optional) RGMII_REFCLK
> +  - clock-names: Must be:
> +        clock-names = "mclk", "rtc", "jtag", "rgmii_ref_ext";
> +
> +Examples
> +--------
> +
> +  - SYSCTRL node:
> +
> +	sysctrl: system-controller@4000c000 {
> +		compatible = "renesas,r9a06g032-sysctrl";
> +		reg = <0x4000c000 0x1000>;
> +		status = "okay";

Don't show status in examples.

> +		#clock-cells = <1>;
> +
> +		clocks = <&ext_mclk>, <&ext_rtc_clk>,
> +				<&ext_jtag_clk>, <&ext_rgmii_ref>;
> +		clock-names = "mclk", "rtc", "jtag", "rgmii_ref_ext";
> +	};
> +
> +  - Other nodes can use the clocks provided by SYSCTRL as in:
> +
> +	#include <dt-bindings/clock/r9a06g032-sysctrl.h>
> +	uart0: serial@40060000 {
> +		compatible = "snps,dw-apb-uart";
> +		reg = <0x40060000 0x400>;
> +		interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +		reg-shift = <2>;
> +		reg-io-width = <4>;
> +		clocks = <&sysctrl R9A06G032_CLK_UART0>;
> +		clock-names = "baudclk";
> +	};
> -- 
> 2.7.4
> 
