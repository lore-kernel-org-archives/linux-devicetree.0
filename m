From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 6/7] dt-bindings: qcom_spmi: Document pms405 support
Date: Thu, 13 Jun 2019 08:36:33 -0700
Message-ID: <20190613153633.GF6792@builder>
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
 <20190613142416.8985-1-jeffrey.l.hugo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613142416.8985-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu 13 Jun 07:24 PDT 2019, Jeffrey Hugo wrote:

> From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
> 
> The PMS405 supports 5 SMPS and 13 LDO regulators.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  .../regulator/qcom,spmi-regulator.txt         | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> index ba94bc2d407a..19cffb239094 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> @@ -10,6 +10,7 @@ Qualcomm SPMI Regulators
>  			"qcom,pm8941-regulators"
>  			"qcom,pm8994-regulators"
>  			"qcom,pmi8994-regulators"
> +			"qcom,pms405-regulators"
>  
>  - interrupts:
>  	Usage: optional
> @@ -111,6 +112,29 @@ Qualcomm SPMI Regulators
>  	Definition: Reference to regulator supplying the input pin, as
>  		    described in the data sheet.
>  
> +- vdd_s1-supply:
> +- vdd_s2-supply:
> +- vdd_s3-supply:
> +- vdd_s4-supply:
> +- vdd_s5-supply:
> +- vdd_l1-supply:
> +- vdd_l2-supply:
> +- vdd_l3-supply:
> +- vdd_l4-supply:
> +- vdd_l5-supply:
> +- vdd_l6-supply:
> +- vdd_l7-supply:
> +- vdd_l8-supply:
> +- vdd_l9-supply:
> +- vdd_l10-supply:
> +- vdd_l11-supply:
> +- vdd_l12-supply:
> +- vdd_l13-supply:

No, the supply pins are as follows:

- vdd_l1_l2-supply:
- vdd_l3_l8-supply:
- vdd_l4-supply:
- vdd_l5_l6-supply:
- vdd_l10_l11_l12_l13-supply:
- vdd_l7-supply:
- vdd_l9-supply:
- vdd_s1-supply:
- vdd_s2-supply:
- vdd_s3-supply:
- vdd_s4-supply:
- vdd_s5-supply:


Regards,
Bjorn

> +	Usage: optional (pms405 only)
> +	Value type: <phandle>
> +	Definition: Reference to regulator supplying the input pin, as
> +		    described in the data sheet.
> +
>  - qcom,saw-reg:
>  	Usage: optional
>  	Value type: <phandle>
> -- 
> 2.17.1
> 
