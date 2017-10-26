From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v9 6/7] dt-bindings: clock: Document qcom,apcs binding
Date: Wed, 25 Oct 2017 21:13:26 -0700
Message-ID: <20171026041326.GJ1575@tuxbook>
References: <20170921164940.20343-1-georgi.djakov@linaro.org>
 <20170921164940.20343-7-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170921164940.20343-7-georgi.djakov@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, jassisinghbrar@gmail.com, robh+dt@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 21 Sep 09:49 PDT 2017, Georgi Djakov wrote:

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

This node describes the "apcs kpss global"-block.

> +		compatible = "qcom,msm8916-apcs-kpss-global";
> +		reg = <0xb011000 0x1000>;
> +		#mbox-cells = <1>;
> +
> +		apcs_clk: apcs_clk {

This node describes that your implementation is split in two different
drivers.

In other words, I think you should add the two clock properties to the
apcs node, rather than adding a subnode. I also think you can make the
mailbox driver implement the clock given the 8916 compatible.

> +			compatible = "qcom,msm8916-apcs-clk";
> +			clocks = <&a53pll>;
> +			#clock-cells = <0>;
> +		};
> +	};

Regards,
Bjorn
