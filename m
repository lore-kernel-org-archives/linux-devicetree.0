From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 1/3] clk: qcom: Add A53 PLL support
Date: Wed, 9 Nov 2016 12:24:36 -0600
Message-ID: <20161109182436.yd5d6kpwtl4miyqf@rob-hp-laptop>
References: <20161031145526.5023-1-georgi.djakov@linaro.org>
 <20161031145526.5023-2-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161031145526.5023-2-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 31, 2016 at 04:55:24PM +0200, Georgi Djakov wrote:
> Add support for the PLL, which generates the higher range of CPU
> frequencies on MSM8916 platforms.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,a53pll.txt      | 20 +++++
>  drivers/clk/qcom/Kconfig                           |  9 +++
>  drivers/clk/qcom/Makefile                          |  1 +
>  drivers/clk/qcom/a53-pll.c                         | 94 ++++++++++++++++++++++
>  4 files changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53pll.txt
>  create mode 100644 drivers/clk/qcom/a53-pll.c
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.txt b/Documentation/devicetree/bindings/clock/qcom,a53pll.txt
> new file mode 100644
> index 000000000000..6a8c03bfbcb5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.txt
> @@ -0,0 +1,20 @@
> +MSM8916 A53 PLL Binding
> +---------------
> +The A53 PLL on MSM8916 platforms is the main CPU PLL used for frequencies
> +above 1GHz.
> +
> +Required properties :
> +- compatible : Shall contain only one of the following:
> +
> +		"qcom,a53pll-msm8916"

Generally, the ordering is <vendor>,<soc>-<block>.

> +
> +- reg : shall contain base register location and length
> +- #clock-cells : must be set to <0>
> +
> +Example:
> +
> +	a53pll: a53pll@b016000 {

clock@...

> +		compatible = "qcom,a53pll-msm8916";
> +		reg = <0x0b016000 0x40>;
> +		#clock-cells = <0>;
> +	};
