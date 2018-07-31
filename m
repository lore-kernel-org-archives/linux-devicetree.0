Return-Path: <SRS0=f8up=KP=gmail.com=dmitry.torokhov@kernel.org>
Date: Mon, 30 Jul 2018 23:13:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v6 3/3] input: pm8941-pwrkey: Add resin entry
Message-ID: <20180731061342.GA114542@dtor-ws>
References: <20180731044807.16878-1-vkoul@kernel.org>
 <20180731044807.16878-4-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180731044807.16878-4-vkoul@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-input@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Vinod,

On Tue, Jul 31, 2018 at 10:18:07AM +0530, Vinod Koul wrote:
> Since handling is abstracted in this driver, we need to add resin entry
> in id table along with pwrkey_data.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

I added "qcom,pm8941-resin" to the binding doc and applied. Thank you.

> ---
>  drivers/input/misc/pm8941-pwrkey.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
> index 2047e34c0982..6547a57f5222 100644
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
> @@ -306,8 +308,14 @@ static const struct pm8941_data pwrkey_data = {
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

-- 
Dmitry
