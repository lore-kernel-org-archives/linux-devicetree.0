From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: fix bias-pull,up typo
Date: Tue, 16 May 2017 17:24:51 -0700
Message-ID: <20170517002451.GC12920@tuxbook>
References: <20170516201120.32145-1-chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170516201120.32145-1-chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue 16 May 13:11 PDT 2017, Christian Lamparter wrote:

> This patch fixes a shared typo in several qcom pinctrl dt-bindings.
> 
> Signed-off-by: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

Thanks

Acked-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
> index a7bde64798c7..8f07bcc4e59b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
> @@ -37,7 +37,7 @@ information about e.g. the mux function.
>  The following generic properties as defined in pinctrl-bindings.txt are valid
>  to specify in a pin configuration subnode:
>  
> - pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-strength,
> + pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-strength,
>   output-low, output-high.
>  
>  Non-empty subnodes must specify the 'pins' property.
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
> index bac627d619e6..4b1c583c51e9 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
> @@ -39,7 +39,7 @@ information about e.g. the mux function.
>  
>  The following generic properties as defined in pinctrl-bindings.txt are valid
>  to specify in a pin configuration subnode:
> - pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-strength.
> + pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-strength.
>  
>  Non-empty subnodes must specify the 'pins' property.
>  Note that not all properties are valid for all pins.
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt
> index 6e88e91feb11..fade9b9d158c 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt
> @@ -37,7 +37,7 @@ information about e.g. the mux function.
>  The following generic properties as defined in pinctrl-bindings.txt are valid
>  to specify in a pin configuration subnode:
>  
> - pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-strength,
> + pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-strength,
>   output-low, output-high.
>  
>  Non-empty subnodes must specify the 'pins' property.
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt
> index df9a838ec5f9..08f9ab2ed6fe 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt
> @@ -37,7 +37,7 @@ information about e.g. the mux function.
>  The following generic properties as defined in pinctrl-bindings.txt are valid
>  to specify in a pin configuration subnode:
>  
> - pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-strength,
> + pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-strength,
>   output-low, output-high.
>  
>  Non-empty subnodes must specify the 'pins' property.
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt
> index 453bd7c76d6b..e93bfa2872b5 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt
> @@ -36,7 +36,7 @@ information about e.g. the mux function.
>  
>  The following generic properties as defined in pinctrl-bindings.txt are valid
>  to specify in a pin configuration subnode:
> - pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-strength.
> + pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-strength.
>  
>  Non-empty subnodes must specify the 'pins' property.
>  Note that not all properties are valid for all pins.
> -- 
> 2.11.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
