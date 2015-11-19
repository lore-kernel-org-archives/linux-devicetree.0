From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-mpp: Add pm8994 mpp support
Date: Thu, 19 Nov 2015 08:47:23 -0600
Message-ID: <20151119144723.GA19266@rob-hp-laptop>
References: <1447807953-11924-1-git-send-email-sboyd@codeaurora.org>
 <1447807953-11924-3-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447807953-11924-3-git-send-email-sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 17, 2015 at 04:52:33PM -0800, Stephen Boyd wrote:
> Update the driver and binding for pm8994-mpp devices.
> 
> Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Cc: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> Cc: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt | 1 +
>  drivers/pinctrl/qcom/pinctrl-spmi-mpp.c                     | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
> index d7803a2a94e9..d74e631e10da 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
> @@ -15,6 +15,7 @@ of PMIC's from Qualcomm.
>  		    "qcom,pm8917-mpp",
>  		    "qcom,pm8921-mpp",
>  		    "qcom,pm8941-mpp",
> +		    "qcom,pm8994-mpp",
>  		    "qcom,pma8084-mpp",
>  
>  - reg:
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> index 9ce0e30e33e8..7b4136a22c5b 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> @@ -907,6 +907,7 @@ static const struct of_device_id pmic_mpp_of_match[] = {
>  	{ .compatible = "qcom,pm8841-mpp" },	/* 4 MPP's */
>  	{ .compatible = "qcom,pm8916-mpp" },	/* 4 MPP's */
>  	{ .compatible = "qcom,pm8941-mpp" },	/* 8 MPP's */
> +	{ .compatible = "qcom,pm8994-mpp" },	/* 8 MPP's */
>  	{ .compatible = "qcom,pma8084-mpp" },	/* 8 MPP's */
>  	{ },
>  };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
