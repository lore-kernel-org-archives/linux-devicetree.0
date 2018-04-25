From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: mailbox: Add APSS shared binding for
 SDM845 SoCs
Date: Wed, 25 Apr 2018 09:26:50 -0700
Message-ID: <20180425162650.GG18510@minitux>
References: <20180425143803.11260-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180425143803.11260-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>
Cc: andy.gross@linaro.org, mark.rutland@arm.com, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, jassisinghbrar@gmail.com, will.deacon@arm.com, catalin.marinas@arm.com
List-Id: devicetree@vger.kernel.org

On Wed 25 Apr 07:38 PDT 2018, Sibi Sankar wrote:

> Include SDM845 APSS shared to the list of possible bindings
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> index 16964f0c1773..8ea0f12b8d0b 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> @@ -10,6 +10,7 @@ platforms.
>  	Definition: must be one of:
>  		    "qcom,msm8916-apcs-kpss-global",
>  		    "qcom,msm8996-apcs-hmss-global"
> +		    "qcom,sdm845-apss-shared"
>  
>  - reg:
>  	Usage: required
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
