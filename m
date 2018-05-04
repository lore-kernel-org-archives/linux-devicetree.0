From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] mfd: qcom-spmi-pmic: Add support for
 pm8005,pm8998,pmi8998
Date: Fri, 4 May 2018 16:45:59 -0700
Message-ID: <20180504234559.GW18510@minitux>
References: <20180502163535.208548-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180502163535.208548-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Lee Jones <lee.jones@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 02 May 09:35 PDT 2018, Stephen Boyd wrote:

> Add the compatibles and PMIC ids for the pm8005, pm8998, and pmi8998
> PMICS found on MSM8998 and SDM845 based platforms.
> 
> Cc: <devicetree@vger.kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org> 
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
> 
> Changes from v1:
>  * Picked up review tags
>  * Reordered lists to be based on id numbers

Not the color I would have picked for the shed ;)

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> 
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt | 3 +++
>  drivers/mfd/qcom-spmi-pmic.c                             | 6 ++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> index 6ac06c1b9aec..143706222a51 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> @@ -29,6 +29,9 @@ Required properties:
>                     "qcom,pm8916",
>                     "qcom,pm8004",
>                     "qcom,pm8909",
> +                   "qcom,pm8998",
> +                   "qcom,pmi8998",
> +                   "qcom,pm8005",
>                     or generalized "qcom,spmi-pmic".
>  - reg:             Specifies the SPMI USID slave address for this device.
>                     For more information see:
> diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
> index 2022bdfa7ab4..e2e95de649a4 100644
> --- a/drivers/mfd/qcom-spmi-pmic.c
> +++ b/drivers/mfd/qcom-spmi-pmic.c
> @@ -39,6 +39,9 @@
>  #define PM8916_SUBTYPE		0x0b
>  #define PM8004_SUBTYPE		0x0c
>  #define PM8909_SUBTYPE		0x0d
> +#define PM8998_SUBTYPE		0x14
> +#define PMI8998_SUBTYPE		0x15
> +#define PM8005_SUBTYPE		0x18
>  
>  static const struct of_device_id pmic_spmi_id_table[] = {
>  	{ .compatible = "qcom,spmi-pmic", .data = (void *)COMMON_SUBTYPE },
> @@ -55,6 +58,9 @@ static const struct of_device_id pmic_spmi_id_table[] = {
>  	{ .compatible = "qcom,pm8916",    .data = (void *)PM8916_SUBTYPE },
>  	{ .compatible = "qcom,pm8004",    .data = (void *)PM8004_SUBTYPE },
>  	{ .compatible = "qcom,pm8909",    .data = (void *)PM8909_SUBTYPE },
> +	{ .compatible = "qcom,pm8998",    .data = (void *)PM8998_SUBTYPE },
> +	{ .compatible = "qcom,pmi8998",   .data = (void *)PMI8998_SUBTYPE },
> +	{ .compatible = "qcom,pm8005",    .data = (void *)PM8005_SUBTYPE },
>  	{ }
>  };
>  
> -- 
> Sent by a computer through tubes
> 
