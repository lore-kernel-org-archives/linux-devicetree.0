From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 01/14] dt-bindings: pinctrl: qcom-pmic-gpio: add
 qcom,pmi8998-gpio binding
Date: Mon, 14 Jan 2019 16:28:18 -0800
Message-ID: <20190115002818.GH9278@minitux>
References: <20190113154716.5145-1-masneyb@onstation.org>
 <20190113154716.5145-2-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190113154716.5145-2-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: linus.walleij@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun 13 Jan 07:47 PST 2019, Brian Masney wrote:

> Add support for the PMI8998 GPIO variant to the Qualcomm PMIC GPIO
> binding document.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> This is a new patch introduced in V4.
> 
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> index 759aa1732e48..7f64a7e92c28 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> @@ -19,6 +19,7 @@ PMIC's from Qualcomm.
>  		    "qcom,pm8998-gpio"
>  		    "qcom,pma8084-gpio"
>  		    "qcom,pmi8994-gpio"
> +		    "qcom,pmi8998-gpio"
>  		    "qcom,pms405-gpio"
>  
>  		    And must contain either "qcom,spmi-gpio" or "qcom,ssbi-gpio"
> -- 
> 2.17.2
> 
