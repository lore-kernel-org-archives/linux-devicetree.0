From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] firmware: qcom: scm: Add sdm660 soc compatible
Date: Mon, 24 Sep 2018 10:43:41 -0700
Message-ID: <20180924174341.GN1367@tuxbook-pro>
References: <20180811162453.10930-1-ctatlor97@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180811162453.10930-1-ctatlor97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Craig Tatlor <ctatlor97@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Sricharan R <sricharan@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat 11 Aug 09:24 PDT 2018, Craig Tatlor wrote:

> Add the compatible for SDM660.
> This does not need clocks to do scm calls
> 
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>

Andy picked my clock-rework patch for the scm driver, so we can now do:

	compatible = "qcom,scm-sdm660", "qcom,scm";

and get the desired result.


Please respin your patch without the code update.

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
>  drivers/firmware/qcom_scm.c                             | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> index fcf6979c0b6d..499608fcc864 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> @@ -11,6 +11,7 @@ Required properties:
>   * "qcom,scm-msm8660" for MSM8660 platforms
>   * "qcom,scm-msm8690" for MSM8690 platforms
>   * "qcom,scm-msm8996" for MSM8996 platforms
> + * "qcom,scm-sdm660" for SDM660 platforms
>   * "qcom,scm-ipq4019" for IPQ4019 platforms
>   * "qcom,scm" for later processors (MSM8916, APQ8084, MSM8974, etc)
>  - clocks: One to three clocks may be required based on compatible.
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index e778af766fae..ee113ceb5d41 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -603,6 +603,9 @@ static const struct of_device_id qcom_scm_dt_match[] = {
>  	{ .compatible = "qcom,scm-msm8996",
>  	  .data = NULL, /* no clocks */
>  	},
> +	{ .compatible = "qcom,scm-sdm660",
> +	  .data = NULL, /* no clocks */
> +	},
>  	{ .compatible = "qcom,scm-ipq4019",
>  	  .data = NULL, /* no clocks */
>  	},
> -- 
> 2.18.0
> 
