From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: qcom_spmi: Document PM8005 regulators
Date: Tue, 21 May 2019 10:26:39 -0700
Message-ID: <20190521172639.GB2085@tuxbook-pro>
References: <20190521164932.14265-1-jeffrey.l.hugo@gmail.com>
 <20190521165244.14321-1-jeffrey.l.hugo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190521165244.14321-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, agross@kernel.org, david.brown@linaro.org, jcrouse@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 21 May 09:52 PDT 2019, Jeffrey Hugo wrote:

> Document the dt bindings for the PM8005 regulators which are usually used
> for VDD of standalone blocks on a SoC like the GPU.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  .../devicetree/bindings/regulator/qcom,spmi-regulator.txt     | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> index 406f2e570c50..ba94bc2d407a 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> @@ -4,6 +4,7 @@ Qualcomm SPMI Regulators
>  	Usage: required
>  	Value type: <string>
>  	Definition: must be one of:
> +			"qcom,pm8005-regulators"
>  			"qcom,pm8841-regulators"
>  			"qcom,pm8916-regulators"
>  			"qcom,pm8941-regulators"
> @@ -120,6 +121,9 @@ The regulator node houses sub-nodes for each regulator within the device. Each
>  sub-node is identified using the node's name, with valid values listed for each
>  of the PMICs below.
>  
> +pm8005:
> +	s1, s2, s3, s4
> +
>  pm8841:
>  	s1, s2, s3, s4, s5, s6, s7, s8
>  
> -- 
> 2.17.1
> 
