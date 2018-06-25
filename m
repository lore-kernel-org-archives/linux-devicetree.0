Return-Path: <SRS0=aW75=JL=linaro.org=bjorn.andersson@kernel.org>
Date: Sun, 24 Jun 2018 23:08:07 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: power: reset: Add qcom pon binding
Message-ID: <20180625060807.GA1376@tuxbook-pro>
References: <20180625050938.4700-1-vkoul@kernel.org>
 <20180625050938.4700-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180625050938.4700-2-vkoul@kernel.org>
To: Vinod Koul <vinod.koul@linaro.org>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Sun 24 Jun 22:09 PDT 2018, Vinod Koul wrote:

> The Power On driver for Qcom PM 8xxx is a MFD supporting pwrkey and
> resin along with the Android reboot-mode.
> Add the binding describing this.
> 
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  .../devicetree/bindings/power/reset/qcom,pon.txt   | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> 
> diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.txt b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> new file mode 100644
> index 000000000000..0dc24c9b93d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> @@ -0,0 +1,45 @@
> +Qualcomm PON Driver
> +
> +The Power On driver for Qualcomm PM8xxx is MFD supporting pwrkey and
> +resin along with the Android reboot-mode.
> +
> +This DT node has pwrkey and resin as sub nodes.
> +
> +Required Properties:
> +-compatible: "qcom,pm8916-pon"
> +-reg: Specifies the physical address of the pon register
> +
> +Optional subnodes:
> +-prwrkey: Specifies the subnode pwrkey and should follow the
> + qcom,pm8xxx-pwrkey.txt description.
> +-resin: Specifies the subnode resin and should follow the
> + qcom,pm8xxx-pwrkey.txt description.
> +
> +The rest of the properties should follow the generic reboot-mode description
> +found in reboot-mode.txt
> +
> +Example:
> +
> +	pon@800 {
> +		compatible = "qcom,pm8916-pon";
> +
> +		reg = <0x800>;
> +		mode-bootloader = <0x2>;
> +		mode-recovery = <0x1>;
> +
> +		pwrkey {
> +			compatible = "qcom,pm8941-pwrkey";
> +			interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
> +			debounce = <15625>;
> +			bias-pull-up;
> +			linux,code = <KEY_POWER>;
> +		};
> +
> +		resin {
> +			compatible = "qcom,pm8941-resin";
> +			interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> +			debounce = <15625>;
> +			bias-pull-up;
> +			linux,code = <KEY_VOLUMEDOWN>;
> +		};
> +	};
> -- 
> 2.14.4
> 
