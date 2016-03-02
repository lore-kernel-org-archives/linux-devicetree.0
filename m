From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/2] doc: dt: add documentation for lpc1850-creg-clk
 driver
Date: Wed, 2 Mar 2016 11:31:07 -0600
Message-ID: <20160302173107.GA1227@rob-hp-laptop>
References: <1456351460-15483-1-git-send-email-manabian@gmail.com>
 <1456351460-15483-3-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456351460-15483-3-git-send-email-manabian@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Joachim Eastwood <manabian@gmail.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 24, 2016 at 11:04:20PM +0100, Joachim Eastwood wrote:
> Add DT binding documentation for lpc1850-creg-clk driver.
> 
> Signed-off-by: Joachim Eastwood <manabian@gmail.com>
> ---
>  .../devicetree/bindings/clock/lpc1850-creg-clk.txt | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/lpc1850-creg-clk.txt

One typo, otherwise:

Acked-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/clock/lpc1850-creg-clk.txt b/Documentation/devicetree/bindings/clock/lpc1850-creg-clk.txt
> new file mode 100644
> index 000000000000..4e13586d083c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/lpc1850-creg-clk.txt
> @@ -0,0 +1,52 @@
> +* NXP LPC1850 CREG clocks
> +
> +The NXP LPC18xx/43xx CREG (Configuration Registers) block contains
> +control registers for two low speed clocks. One of the clocks is a
> +32 kHz oscillator driver with power up/down and clock gating. Next
> +is a fixed divider that creates a 1 kHz clock from the 32 kHz osc.
> +
> +These clocks are used by the RTC and the Event Router peripherials.
> +The 32 kHz can also be routed to other peripherials to enable low
> +power modes.
> +
> +This binding uses the common clock binding:
> +    Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +Required properties:
> +- compatible:
> +	Should be "nxp,lpc1850-creg-clk"
> +- #clock-cells:
> +	Shall have value <1>.
> +- clocks:
> +	Shall contain a phandle to the fixed 32 kHz crystall.

s/crystall/crystal/

> +
> +The creg-clk node must be a child of the creg syscon node.
> +
> +The following clocks are available from the clock node.
> +
> +Clock ID	Name
> +   0		 1 kHz clock
> +   1		32 kHz Oscillator
> +
> +Example:
> +soc {
> +	creg: syscon@40043000 {
> +		compatible = "nxp,lpc1850-creg", "syscon", "simple-mfd";
> +		reg = <0x40043000 0x1000>;
> +
> +		creg_clk: clock-controller {
> +			compatible = "nxp,lpc1850-creg-clk";
> +			clocks = <&xtal32>;
> +			#clock-cells = <1>;
> +		};
> +
> +		...
> +	};
> +
> +	rtc: rtc@40046000 {
> +		...
> +		clocks = <&creg_clk 0>, <&ccu1 CLK_CPU_BUS>;
> +		clock-names = "rtc", "reg";
> +		...
> +	};
> +};
> -- 
> 1.8.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
