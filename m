From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v10 5/6] dt-bindings: mailbox: qcom: Document the APCS
 clock binding
Date: Mon, 4 Dec 2017 21:49:14 -0800
Message-ID: <20171205054914.GH28761@minitux>
References: <20171201170224.25053-1-georgi.djakov@linaro.org>
 <20171201170224.25053-6-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171201170224.25053-6-georgi.djakov@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, jassisinghbrar@gmail.com, robh@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 01 Dec 09:02 PST 2017, Georgi Djakov wrote:

> Update the binding documentation for APCS to mention that the APCS
> hardware block also expose a clock controller functionality.
> 
> The APCS clock controller is a mux and half-integer divider. It has the
> main CPU PLL as an input and provides the clock for the application CPU.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Nice!

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  .../bindings/mailbox/qcom,apcs-kpss-global.txt         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> index fb961c310f44..16964f0c1773 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> @@ -15,12 +15,21 @@ platforms.
>  	Usage: required
>  	Value type: <prop-encoded-array>
>  	Definition: must specify the base address and size of the global block
> +- clocks:
> +	Usage: required if #clocks-cells property is present
> +	Value type: <phandle>
> +	Definition: phandle to the input PLL, which feeds the APCS mux/divider
>  
>  - #mbox-cells:
>  	Usage: required
>  	Value type: <u32>
>  	Definition: as described in mailbox.txt, must be 1
>  
> +- #clock-cells:
> +	Usage: optional
> +	Value type: <u32>
> +	Definition: as described in clock.txt, must be 0
> +
>  
>  = EXAMPLE
>  The following example describes the APCS HMSS found in MSM8996 and part of the
> @@ -44,3 +53,12 @@ GLINK RPM referencing the "rpm_hlos" doorbell therein.
>  		mbox-names = "rpm_hlos";
>  	};
>  
> +Below is another example of the APCS binding on MSM8916 platforms:
> +
> +	apcs: mailbox@b011000 {
> +		compatible = "qcom,msm8916-apcs-kpss-global";
> +		reg = <0xb011000 0x1000>;
> +		#mbox-cells = <1>;
> +		clocks = <&a53pll>;
> +		#clock-cells = <0>;
> +	};
