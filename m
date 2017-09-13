From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3] clk: qcom: Add spmi_pmic clock divider support
Date: Wed, 13 Sep 2017 12:40:32 -0500
Message-ID: <20170913174032.u33zzo64ipk22vgp@rob-hp-laptop>
References: <1504699207-9568-1-git-send-email-tirupath@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1504699207-9568-1-git-send-email-tirupath@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tirupathi Reddy <tirupath@codeaurora.org>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 06, 2017 at 05:30:07PM +0530, Tirupathi Reddy wrote:
> Clkdiv module provides a clock output on the PMIC with CXO as
> the source. This clock can be routed through PMIC GPIOs. Add
> a device driver to configure this clkdiv module.
> 
> Signed-off-by: Tirupathi Reddy <tirupath@codeaurora.org>
> ---
>  .../bindings/clock/clk-spmi-pmic-div.txt           |  51 +++
>  drivers/clk/qcom/Kconfig                           |   9 +
>  drivers/clk/qcom/Makefile                          |   1 +
>  drivers/clk/qcom/clk-spmi-pmic-div.c               | 342 +++++++++++++++++++++
>  4 files changed, 403 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt
>  create mode 100644 drivers/clk/qcom/clk-spmi-pmic-div.c
> 
> diff --git a/Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt b/Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt
> new file mode 100644
> index 0000000..8b84b32
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt
> @@ -0,0 +1,51 @@
> +Qualcomm Technologies, Inc. SPMI PMIC clock divider (clkdiv)
> +
> +clkdiv configures the clock frequency of a set of outputs on the PMIC.
> +These clocks are typically wired through alternate functions on
> +gpio pins.
> +
> +=======================
> +Properties
> +=======================
> +
> +- compatible
> +	Usage:      required
> +	Value type: <string>
> +	Definition: must be one of:
> +		    "qcom,spmi-clkdiv"

If this is not a fallback, drop it.

> +		    "qcom,pm8998-clkdiv"
> +
> +- reg
> +	Usage:      required
> +	Value type: <prop-encoded-array>
> +	Definition: Addresses and sizes for the memory of this CLKDIV
> +		    peripheral.
> +
> +- clocks:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: reference to the xo clock.
> +
> +- clock-names:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: must be "xo".

Missing #clock-cells

> +
> +=======
> +Example
> +=======
> +
> +pm8998_clk_divs: qcom,clkdiv@5b00 {

clock@5b00

> +	compatible = "qcom,pm8998-clkdiv";
> +	reg = <0x5b00>;
> +	#clock-cells = <1>;
> +	clocks = <&xo_board>;
> +	clock-names = "xo";
> +
> +	assigned-clocks = <&pm8998_clk_divs 1>,
> +			  <&pm8998_clk_divs 2>,
> +			  <&pm8998_clk_divs 3>;
> +	assigned-clock-rates = <9600000>,
> +			       <9600000>,
> +			       <9600000>;
> +};
