From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 3/8] clk: lochnagar: Add initial binding documentation
Date: Mon, 26 Nov 2018 14:16:45 -0600
Message-ID: <20181126201645.GA2094@bogus>
References: <20181120141631.18949-1-ckeepax@opensource.cirrus.com>
 <20181120141631.18949-3-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181120141631.18949-3-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lee.jones@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, broonie@kernel.org, linus.walleij@linaro.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 20, 2018 at 02:16:26PM +0000, Charles Keepax wrote:
> Lochnagar is an evaluation and development board for Cirrus
> Logic Smart CODEC and Amp devices. It allows the connection of
> most Cirrus Logic devices on mini-cards, as well as allowing
> connection of various application processor systems to provide a
> full evaluation platform. This driver supports the board
> controller chip on the Lochnagar board.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  .../devicetree/bindings/clock/cirrus,lochnagar.txt | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt b/Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt
> new file mode 100644
> index 000000000000..c1b5478d5432
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt
> @@ -0,0 +1,89 @@
> +Cirrus Logic Lochnagar Audio Development Board
> +
> +Lochnagar is an evaluation and development board for Cirrus Logic
> +Smart CODEC and Amp devices. It allows the connection of most Cirrus
> +Logic devices on mini-cards, as well as allowing connection of
> +various application processor systems to provide a full evaluation
> +platform.  Audio system topology, clocking and power can all be
> +controlled through the Lochnagar, allowing the device under test
> +to be used in a variety of possible use cases.
> +
> +This binding document describes the binding for the clock portion of
> +the driver.
> +
> +Also see these documents for generic binding information:
> +  [1] Clock : ../clock/clock-bindings.txt
> +
> +And these for relevant defines:
> +  [2] include/dt-bindings/clock/lochnagar.h
> +
> +This binding must be part of the Lochnagar MFD binding:
> +  [3] ../mfd/cirrus,lochnagar.txt
> +
> +Required properties:
> +
> +  - compatible : One of the following strings:
> +                 "cirrus,lochnagar1-clk"
> +                 "cirrus,lochnagar2-clk"

What's the 1 vs. 2?

> +
> +  - #clock-cells : Must be 1. The first cell indicates the clock
> +    number, see [2] for available clocks and [1].
> +
> +Optional properties:
> +
> +  - clocks : Must contain an entry for each clock in clock-names.
> +  - clock-names : May contain entries for each of the following
> +    clocks:
> +     - ln-cdc-clkout : Output clock from CODEC card.
> +     - ln-dsp-clkout : Output clock from DSP card.
> +     - ln-gf-mclk1,ln-gf-mclk2,ln-gf-mclk3,ln-gf-mclk4 : Optional
> +       input audio clocks from host system.
> +     - ln-psia1-mclk, ln-psia2-mclk : Optional input audio clocks from
> +       external connector.
> +     - ln-spdif-clkout : Optional input audio clock from SPDIF.
> +     - ln-adat-clkout : Optional input audio clock from ADAT.
> +     - ln-pmic-32k : On board fixed regulator.

regulator?

> +     - ln-clk-12m : On board fixed regulator.
> +     - ln-clk-11m : On board fixed regulator.
> +     - ln-clk-24m : On board fixed regulator.
> +     - ln-clk-22m : On board fixed regulator.
> +     - ln-usb-clk-24m : On board fixed regulator.
> +     - ln-usb-clk-12m : On board fixed regulator.
> +
> +  - assigned-clocks : A list of Lochnagar clocks to be reparented, see
> +    [2] for available clocks.
> +  - assigned-clock-parents : Parents to be assigned to the clocks
> +    listed in "assigned-clocks".
> +
> +Optional sub-nodes:
> +
> +  - fixed-clock nodes may be registered for the following on board clocks:
> +     - ln-pmic-32k : 32768 kHz
> +     - ln-clk-12m : 12288000 kHz
> +     - ln-clk-11m : 11298600 kHz
> +     - ln-clk-24m : 24576000 kHz
> +     - ln-clk-22m : 22579200 kHz
> +     - ln-usb-clk-24m : 24576000 kHz
> +     - ln-usb-clk-12m : 12288000 kHz
> +
> +Example:
> +
> +lochnagar-clk {
> +	compatible = "cirrus,lochnagar2-clk";
> +
> +	#clock-cells = <1>;
> +
> +	clocks = <&clk-audio>, <&clk_pmic>;
> +	clock-names = "ln-gf-mclk2", "ln-pmic-32k";
> +
> +	assigned-clocks = <&lochnagar-clk LOCHNAGAR_CDC_MCLK1>,
> +			  <&lochnagar-clk LOCHNAGAR_CDC_MCLK2>;
> +	assigned-clock-parents = <&clk-audio>,
> +				 <&clk-pmic>;
> +
> +	clk-pmic: clk-pmic {

This isn't really any relationship to the parent and I think shouldn't 
be a sub-node.

> +		compatible = "fixed-clock";
> +		clock-cells = <0>;
> +		clock-frequency = <32768>;
> +	};
> +};
> -- 
> 2.11.0
> 
