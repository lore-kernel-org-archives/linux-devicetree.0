From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] firmware: qcom: scm: Expose PAS command 10 as
 reset-controller
Date: Tue, 14 Jun 2016 10:48:18 -0700
Message-ID: <20160614174818.GD28218@codeaurora.org>
References: <1465620740-24474-1-git-send-email-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465620740-24474-1-git-send-email-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/10, Bjorn Andersson wrote:
> PAS command 10 is used to assert and deassert the MSS reset via
> TrustZone, expose this as a reset-controller to follow the non-secure
> case where GCC exposes this control.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/firmware/qcom,scm.txt      |  6 ++++
>  drivers/firmware/qcom_scm-32.c                     | 13 +++++++++
>  drivers/firmware/qcom_scm-64.c                     | 17 +++++++++++
>  drivers/firmware/qcom_scm.c                        | 34 ++++++++++++++++++++++
>  drivers/firmware/qcom_scm.h                        |  2 ++

We should add some sort of select for the reset controller
config in SCM?

> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 79bb0b00577e..b0119535c0fb 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -21,6 +21,7 @@
>  
> +
> +static struct reset_control_ops qcom_scm_pas_reset_ops = {

const?

> +	.assert = qcom_scm_pas_reset_assert,
> +	.deassert = qcom_scm_pas_reset_deassert,
> +};
> +
>  static int qcom_scm_probe(struct platform_device *pdev)
>  {
>  	struct qcom_scm *scm;

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
