Return-Path: <SRS0=/LiY=JI=linaro.org=bjorn.andersson@kernel.org>
Date: Fri, 22 Jun 2018 14:00:12 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 5/5] input: pm8941-pwrkey: Add resin entry
Message-ID: <20180622210012.GH3402@tuxbook-pro>
References: <20180618143548.29900-1-vkoul@kernel.org>
 <20180618143548.29900-6-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180618143548.29900-6-vkoul@kernel.org>
To: Vinod Koul <vinod.koul@linaro.org>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon 18 Jun 07:35 PDT 2018, Vinod Koul wrote:

> Since handling is abstracted in this driver, we need to add resin entry
> in id table along with pwrkey_data.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/input/misc/pm8941-pwrkey.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
> index aedb6ea2b50a..913405404a92 100644
> --- a/drivers/input/misc/pm8941-pwrkey.c
> +++ b/drivers/input/misc/pm8941-pwrkey.c
> @@ -29,6 +29,7 @@
>  
>  #define PON_RT_STS			0x10
>  #define  PON_KPDPWR_N_SET		BIT(0)
> +#define  PON_RESIN_N_SET		BIT(1)
>  
>  #define PON_PS_HOLD_RST_CTL		0x5a
>  #define PON_PS_HOLD_RST_CTL2		0x5b
> @@ -39,6 +40,7 @@
>  
>  #define PON_PULL_CTL			0x70
>  #define  PON_KPDPWR_PULL_UP		BIT(1)
> +#define  PON_RESIN_PULL_UP		BIT(0)
>  
>  #define PON_DBC_CTL			0x71
>  #define  PON_DBC_DELAY_MASK		0x7
> @@ -307,8 +309,14 @@ static const struct pm8941_data pwrkey_data = {
>  	.status_bit = PON_KPDPWR_N_SET,
>  };
>  
> +static const struct pm8941_data resin_data = {
> +	.pull_up_bit = PON_RESIN_PULL_UP,
> +	.status_bit = PON_RESIN_N_SET,
> +};
> +
>  static const struct of_device_id pm8941_pwr_key_id_table[] = {
>  	{ .compatible = "qcom,pm8941-pwrkey", .data = &pwrkey_data },
> +	{ .compatible = "qcom,pm8941-resin", .data = &resin_data },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, pm8941_pwr_key_id_table);
> -- 
> 2.14.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
