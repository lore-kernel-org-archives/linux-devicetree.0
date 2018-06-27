Return-Path: <SRS0=M3sW=JN=linaro.org=bjorn.andersson@kernel.org>
Date: Wed, 27 Jun 2018 10:26:41 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 5/6] dt-bindings: power: reset: qcom: Add resin binding
Message-ID: <20180627172641.GL1860@tuxbook-pro>
References: <20180627115301.21330-1-vkoul@kernel.org>
 <20180627115301.21330-6-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180627115301.21330-6-vkoul@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed 27 Jun 04:53 PDT 2018, Vinod Koul wrote:

> Resin is similar to pwrkey, add the description and example
> for resin bindings
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/input/qcom,pm8941-pwrkey.txt       |  1 +
>  Documentation/devicetree/bindings/power/reset/qcom,pon.txt | 14 ++++++++++++--
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
> index bf719396eadd..34ab5763f494 100644
> --- a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
> +++ b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
> @@ -7,6 +7,7 @@ PROPERTIES
>  	Value type: <string>
>  	Definition: must be one of:
>  		    "qcom,pm8941-pwrkey"
> +		    "qcom,pm8941-resin"
>  
>  - reg:
>  	Usage: required
> diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.txt b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> index f32cdd358267..651491bb63b7 100644
> --- a/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> +++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> @@ -1,9 +1,9 @@
>  Qualcomm PON Device
>  
>  The Power On device for Qualcomm PM8xxx is MFD supporting pwrkey
> -along with the Android reboot-mode.
> +and resin along with the Android reboot-mode.
>  
> -This DT node has pwrkey as sub node.
> +This DT node has pwrkey and resin as sub nodes.
>  
>  Required Properties:
>  -compatible: "qcom,pm8916-pon"
> @@ -12,6 +12,8 @@ Required Properties:
>  Optional subnode:
>  -pwrkey: Specifies the subnode pwrkey and should follow the
>   qcom,pm8941-pwrkey.txt description.
> +-resin: Specifies the subnode resin and should follow the
> + qcom,pm8xxx-pwrkey.txt description.
>  
>  The rest of the properties should follow the generic reboot-mode description
>  found in reboot-mode.txt
> @@ -32,4 +34,12 @@ Example:
>  			bias-pull-up;
>  			linux,code = <KEY_POWER>;
>  		};
> +
> +		resin {
> +			compatible = "qcom,pm8941-resin";
> +			interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> +			debounce = <15625>;
> +			bias-pull-up;
> +			linux,code = <KEY_VOLUMEDOWN>;
> +		};
>  	};
> -- 
> 2.14.4
> 
