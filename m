From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] ARM: dts: qcom: msm8974-hammerhead: add WiFi support
Date: Wed, 28 Nov 2018 15:07:27 -0800
Message-ID: <20181128230727.GC24969@minitux>
References: <20181104215034.3677-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181104215034.3677-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
List-Id: devicetree@vger.kernel.org

On Sun 04 Nov 13:50 PST 2018, Brian Masney wrote:

> From: Jonathan Marek <jonathan@marek.ca>
> 
> This patch adds WiFi support to the LG Nexus 5 (hammerhead) phone.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> [masneyb@onstation.org: Enabled wlan_regulator_pin and wlan_sleep_clk_pin]
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> index fe2b5524a679..7fad5a48d4a3 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> @@ -221,6 +221,20 @@
>  			};
>  		};
>  	};
> +
> +	vreg_wlan: wlan-regulator {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "wl-reg";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&msmgpio 26 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlan_regulator_pin>;
> +	};
>  };
>  
>  &soc {
> @@ -253,6 +267,20 @@
>  			};
>  		};
>  
> +		sdhc2_pin_a: sdhc2-pin-active {
> +			clk {
> +				pins = "sdc2_clk";
> +				drive-strength = <6>;
> +				bias-disable;
> +			};
> +
> +			cmd-data {
> +				pins = "sdc2_cmd", "sdc2_data";
> +				drive-strength = <6>;
> +				bias-pull-up;
> +			};
> +		};
> +
>  		i2c3_pins: i2c3 {
>  			mux {
>  				pins = "gpio10", "gpio11";
> @@ -324,6 +352,32 @@
>  		pinctrl-0 = <&sdhc1_pin_a>;
>  	};
>  
> +	sdhci@f98a4900 {
> +		status = "ok";
> +
> +		max-frequency = <100000000>;
> +		bus-width = <4>;
> +		non-removable;
> +		vmmc-supply = <&vreg_wlan>;
> +		vqmmc-supply = <&pm8941_s3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sdhc2_pin_a>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		bcrmf@1 {
> +			compatible = "brcm,bcm4339-fmac", "brcm,bcm4329-fmac";
> +			reg = <1>;
> +
> +			brcm,drive-strength = <10>;
> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&wlan_sleep_clk_pin>;
> +		};
> +	};
> +
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  		input-name = "gpio-keys";
> @@ -463,6 +517,22 @@
>  				output-high;
>  				line-name = "otg-gpio";
>  			};
> +
> +			wlan_sleep_clk_pin: wl-sleep-clk {
> +				pins = "gpio16";
> +				function = "func2";
> +
> +				output-high;
> +				power-source = <PM8941_GPIO_S3>;
> +			};
> +
> +			wlan_regulator_pin: wl-reg-active {
> +				pins = "gpio17";
> +				function = "normal";
> +
> +				bias-disable;
> +				power-source = <PM8941_GPIO_S3>;
> +			};
>  		};
>  	};
>  };
> -- 
> 2.17.2
> 
