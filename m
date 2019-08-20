From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: Document the parent clocks
Date: Mon, 19 Aug 2019 22:06:23 -0700
Message-ID: <20190820050623.GI26807@tuxbook-pro>
References: <20190819073947.17258-1-vkoul@kernel.org>
 <20190819073947.17258-2-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190819073947.17258-2-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 19 Aug 00:39 PDT 2019, Vinod Koul wrote:

> With clock parent data scheme we must specify the parent clocks for the
> rpmhcc nodes. So describe the parent clock for rpmhcc in the bindings.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt b/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> index 3c007653da31..8b97968f9c88 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> @@ -9,6 +9,9 @@ Required properties :
>  - compatible : shall contain "qcom,sdm845-rpmh-clk"
>  
>  - #clock-cells : must contain 1
> +- clocks: a list of phandles and clock-specifier pairs,
> +	  one for each entry in clock-names.
> +- clock-names: Parent board clock: "xo".
>  
>  Example :
>  
> -- 
> 2.20.1
> 
