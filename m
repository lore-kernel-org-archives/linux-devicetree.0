From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH] mailbox: qcom: Add QCS404 APPS Global compatible
Date: Thu, 20 Sep 2018 09:17:03 -0700
Message-ID: <20180920161703.GC2350@vkoul-mobl>
References: <20180920014408.14645-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180920014408.14645-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 19-09-18, 18:44, Bjorn Andersson wrote:
> Add support for the QCS404 APPS Global block with IPC register at offset
> 8.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt        | 1 +
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c                          | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> index 6e8a9ab0fdae..1232fc9fc709 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> @@ -11,6 +11,7 @@ platforms.
>  		    "qcom,msm8916-apcs-kpss-global",
>  		    "qcom,msm8996-apcs-hmss-global"
>  		    "qcom,msm8998-apcs-hmss-global"
> +		    "qcom,qcs404-apcs-apps-global"
>  		    "qcom,sdm845-apss-shared"
>  
>  - reg:
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index 333ed4a9d4b8..aed23ac9550d 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -126,6 +126,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>  	{ .compatible = "qcom,msm8916-apcs-kpss-global", .data = (void *)8 },
>  	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = (void *)16 },
>  	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = (void *)8 },
> +	{ .compatible = "qcom,qcs404-apcs-apps-global", .data = (void *)8 },
>  	{ .compatible = "qcom,sdm845-apss-shared", .data = (void *)12 },
>  	{}
>  };
> -- 
> 2.18.0

-- 
~Vinod
