From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 08/12] ARM: dts: dragonboard-600c: add pcie support
Date: Tue, 29 Mar 2016 07:39:58 -0700
Message-ID: <20160329143958.GL8929@tuxbot>
References: <1458762366-9233-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1458762471-9676-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1458762471-9676-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 23 Mar 12:47 PDT 2016, Srinivas Kandagatla wrote:

> This patch adds pcie and regulators required to get on board ATL1C
> ethernet working.
> ---

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

>  .../arm/boot/dts/qcom-apq8064-dragonboard-600c.dts | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts b/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts
> index 5374510..d3e6193 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts
> @@ -20,6 +20,16 @@
>  			regulator-type = "voltage";
>  			regulator-boot-on;
>  		};
> +
> +		/* on board fixed 3.3v supply */
> +		vcc3v3: vcc3v3 {
> +			compatible = "regulator-fixed";
> +			regulator-name = "VCC3V3";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-always-on;
> +		};
> +
>  	};
>  
>  	soc {
> @@ -31,6 +41,18 @@
>  					bias-disable;
>  				};
>  			};
> +
> +			pcie_pins: pcie_pinmux {
> +				mux {
> +					pins = "gpio27";
> +					function = "gpio";
> +				};
> +				conf {
> +					pins = "gpio27";
> +					drive-strength = <12>;
> +					bias-disable;
> +				};
> +			};
>  		};
>  
>  		rpm@108000 {
> @@ -109,6 +131,10 @@
>  					regulator-max-microvolt = <1900000>;
>  					bias-pull-down;
>  				};
> +
> +				lvs6 {
> +					bias-pull-down;
> +				};
>  			};
>  		};
>  
> @@ -135,6 +161,16 @@
>  			};
>  		};
>  
> +		pci@1b500000 {
> +			status = "okay";
> +			vdda-supply = <&pm8921_s3>;
> +			vdda_phy-supply = <&pm8921_lvs6>;
> +			vdda_refclk-supply = <&vcc3v3>;
> +			pinctrl-0 = <&pcie_pins>;
> +			pinctrl-names = "default";
> +			perst-gpio = <&tlmm_pinmux 27 GPIO_ACTIVE_LOW>;
> +		};
> +
>  		/* OTG */
>  		phy@12500000 {
>  			status		= "okay";
> -- 
> 2.5.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
