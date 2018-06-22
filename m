Return-Path: <SRS0=/LiY=JI=linaro.org=bjorn.andersson@kernel.org>
Date: Fri, 22 Jun 2018 13:59:24 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 3/5] dt-bindings: Input: Add additional property to qcom
 pwrkey
Message-ID: <20180622205924.GG3402@tuxbook-pro>
References: <20180618143548.29900-1-vkoul@kernel.org>
 <20180618143548.29900-4-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180618143548.29900-4-vkoul@kernel.org>
To: Vinod Koul <vinod.koul@linaro.org>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon 18 Jun 07:35 PDT 2018, Vinod Koul wrote:

> Pwrkey and reset have similar properties so add additional
> property for linux,code to use the code for sending events.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
> index 07bf55f6e0b9..bf719396eadd 100644
> --- a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
> +++ b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
> @@ -32,6 +32,14 @@ PROPERTIES
>  	Definition: presence of this property indicates that the KPDPWR_N pin
>  		    should be configured for pull up.
>  
> +- linux,code:
> +	Usage: optional
> +	Value type: <u32>
> +	Definition: The input key-code associated with the power key.
> +		    Use the linux event codes defined in
> +		    include/dt-bindings/input/linux-event-codes.h
> +		    When property is omitted KEY_POWER is assumed.
> +
>  EXAMPLE
>  
>  	pwrkey@800 {
> @@ -40,4 +48,5 @@ EXAMPLE
>  		interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
>  		debounce = <15625>;
>  		bias-pull-up;
> +		linux,code = <KEY_POWER>;
>  	};
> -- 
> 2.14.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
