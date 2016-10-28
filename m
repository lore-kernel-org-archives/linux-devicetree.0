From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 2/6] dt-bindings: qcom: clocks: Add msm8994 clock bindings
Date: Thu, 27 Oct 2016 17:08:11 -0700
Message-ID: <20161028000811.GI26139@codeaurora.org>
References: <1477394221-30963-1-git-send-email-jeremymc@redhat.com>
 <1477394221-30963-3-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477394221-30963-3-git-send-email-jeremymc@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jeremy McNicoll <jeremymc@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, andy.gross@linaro.org, arnd@arndb.de, bjorn.andersson@linaro.org, mark.rutland@arm.com, michael.scott@linaro.org
List-Id: devicetree@vger.kernel.org

On 10/25, Jeremy McNicoll wrote:
> Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.txt         |   2 +
>  include/dt-bindings/clock/qcom,gcc-msm8994.h       | 145 +++++++++++++++++++++
>  2 files changed, 147 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8994.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> index 3cf4421..58c7e76 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> @@ -14,6 +14,8 @@ Required properties :
>  			"qcom,gcc-msm8974"
>  			"qcom,gcc-msm8974pro"
>  			"qcom,gcc-msm8974pro-ac"
> +			"qcom,gcc-msm8994"
> +			"qcom,gcc-msm8994v2"

Just drop the v2 and treat it like gcc-msm8994.

>  			"qcom,gcc-msm8996"
>  			"qcom,gcc-mdm9615"
>  

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
