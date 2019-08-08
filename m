From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v1 1/2] clk: qcom: Add DT bindings for SC7180 gcc clock
 controller
Date: Thu, 8 Aug 2019 10:33:26 +0530
Message-ID: <20190808050326.GK12733@vkoul-mobl.Dlink>
References: <20190807181301.15326-1-tdas@codeaurora.org>
 <20190807181301.15326-2-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190807181301.15326-2-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Taniya Das <tdas@codeaurora.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette =?iso-8859-1?Q?=A0?= <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
List-Id: devicetree@vger.kernel.org

On 07-08-19, 23:43, Taniya Das wrote:
> Add compatible string and the include file for gcc clock
> controller for SC7180.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.txt    |   1 +
>  include/dt-bindings/clock/qcom,gcc-sc7180.h   | 155 ++++++++++++++++++
>  2 files changed, 156 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sc7180.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> index 8661c3cd3ccf..18d95467cb36 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> @@ -23,6 +23,7 @@ Required properties :
>  			"qcom,gcc-sdm630"
>  			"qcom,gcc-sdm660"
>  			"qcom,gcc-sdm845"
> +			"qcom,gcc-sc7180"

I don't see parent clocks listed here please add them as well

-- 
~Vinod
