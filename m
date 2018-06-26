From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Introduce QCOM LPASS clock
 bindings
Date: Tue, 26 Jun 2018 13:53:36 -0600
Message-ID: <20180626195336.GA25448@rob-hp-laptop>
References: <1528961943-12506-1-git-send-email-tdas@codeaurora.org>
 <1528961943-12506-2-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1528961943-12506-2-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Taniya Das <tdas@codeaurora.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rohit Kumar <rohitkr@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 14, 2018 at 01:09:02PM +0530, Taniya Das wrote:
> Add device tree bindings for Low Power Audio subsystem clock controller for
> Qualcomm Technology Inc's SDM845 SoCs.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,lpasscc.txt     | 46 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,lpass-sdm845.h      | 18 +++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
>  create mode 100644 include/dt-bindings/clock/qcom,lpass-sdm845.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt b/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
> new file mode 100644
> index 0000000..16cabc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
> @@ -0,0 +1,46 @@
> +Qualcomm LPASS Clock Controller Binding
> +-----------------------------------------------
> +
> +Required properties :
> +- compatible	: shall contain "qcom,sdm845-lpasscc"
> +- #clock-cells	: from common clock binding, shall contain 1.
> +
> +Note that #address-cells, #size-cells, and ranges shall be present to ensure
> +the lpasscc can address the various lpass cc registers.
> +
> +Child Node Properties :
> +The Low Pass Audio clock controller would need to define the following child
> +nodes with the properties.
> +- compatible	: shall contain all of the below for clocks in each LPASS domain
> +			"qcom,sdm845-lpass-gcc",
> +			"qcom,sdm845-lpass-cc",
> +			"qcom,sdm845-lpass-qdsp6ss"
> +- reg		: shall contain base register address and size,

I can't really see any reason to have these child nodes. Just put 3 
entries in reg in the parent.

Rob
