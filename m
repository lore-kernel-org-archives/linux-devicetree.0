From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH] soc: qcom: smd-rpm: Add QCS404 compatible
Date: Thu, 20 Sep 2018 09:18:13 -0700
Message-ID: <20180920161813.GE2350@vkoul-mobl>
References: <20180920014540.14894-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180920014540.14894-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 19-09-18, 18:45, Bjorn Andersson wrote:
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt | 1 +
>  drivers/soc/qcom/smd-rpm.c                                  | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
> index 89e1cb9212f6..ec95705ba692 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
> @@ -23,6 +23,7 @@ resources.
>  		    "qcom,rpm-msm8916"
>  		    "qcom,rpm-msm8974"
>  		    "qcom,rpm-msm8998"
> +		    "qcom,rpm-qcs404"
>  
>  - qcom,smd-channels:
>  	Usage: required
> diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
> index 93517ed83355..b8e63724a49d 100644
> --- a/drivers/soc/qcom/smd-rpm.c
> +++ b/drivers/soc/qcom/smd-rpm.c
> @@ -227,6 +227,7 @@ static const struct of_device_id qcom_smd_rpm_of_match[] = {
>  	{ .compatible = "qcom,rpm-msm8974" },
>  	{ .compatible = "qcom,rpm-msm8996" },
>  	{ .compatible = "qcom,rpm-msm8998" },
> +	{ .compatible = "qcom,rpm-qcs404" },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, qcom_smd_rpm_of_match);
> -- 
> 2.18.0

-- 
~Vinod
