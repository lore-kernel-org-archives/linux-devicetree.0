From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 6/7] dt-bindings: clock: Document qcom,apcs binding
Date: Tue, 3 Oct 2017 16:41:07 -0500
Message-ID: <20171003214107.4xvk5motoedpnjbr@rob-hp-laptop>
References: <20170921164940.20343-1-georgi.djakov@linaro.org>
 <20170921164940.20343-7-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170921164940.20343-7-georgi.djakov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, jassisinghbrar@gmail.com, bjorn.andersson@linaro.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 21, 2017 at 07:49:39PM +0300, Georgi Djakov wrote:
> Add device-tree binding documentation for the Qualcom APCS clock
> controller. This clock controller is a mux and half-integer divider
> and provides the clock for the application CPU.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,apcs.txt        | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,apcs.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,apcs.txt b/Documentation/devicetree/bindings/clock/qcom,apcs.txt
> new file mode 100644
> index 000000000000..8083bcc33ebe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,apcs.txt
> @@ -0,0 +1,27 @@
> +Qualcomm APCS Clock Controller Binding
> +--------------------------------------
> +The APCS hardware block provides a combined mux and half-integer divider
> +functionality. It is used for a main CPU clock mux on MSM8916 platforms.
> +
> +Required properties :
> +- compatible : shall contain only one of the following:
> +
> +		"qcom,msm8916-apcs-clk"
> +
> +- clocks : shall be the phandle to the main input CPU PLL clock
> +
> +- #clock-cells : must be set to <0>
> +
> +Example:
> +
> +	apcs: mailbox@b011000 {
> +		compatible = "qcom,msm8916-apcs-kpss-global";
> +		reg = <0xb011000 0x1000>;
> +		#mbox-cells = <1>;
> +
> +		apcs_clk: apcs_clk {

Don't use '_' in node names. This can be just "clock".

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>

> +			compatible = "qcom,msm8916-apcs-clk";
> +			clocks = <&a53pll>;
> +			#clock-cells = <0>;
> +		};
> +	};
