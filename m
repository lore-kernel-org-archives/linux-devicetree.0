From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 07/12] ARM: dts: dragonboard-600c: add usb support
Date: Tue, 29 Mar 2016 07:39:17 -0700
Message-ID: <20160329143917.GK8929@tuxbot>
References: <1458762366-9233-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1458762465-9630-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1458762465-9630-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 23 Mar 12:47 PDT 2016, Srinivas Kandagatla wrote:

> This patch adds usb host and otg support on board with required
> regulators.
> 

Please fold the regulators into the regulator patch instead.

For the rest:

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../arm/boot/dts/qcom-apq8064-dragonboard-600c.dts | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts b/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts
> index a977314..5374510 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts
> @@ -60,6 +60,12 @@
>  					bias-pull-down;
>  				};
>  
> +				s3 {
> +					regulator-min-microvolt = <1000000>;
> +					regulator-max-microvolt = <1400000>;
> +					qcom,switch-mode-frequency = <4800000>;
> +				};
> +
>  				s4 {
>  					regulator-min-microvolt	= <1800000>;
>  					regulator-max-microvolt	= <1800000>;
> @@ -74,6 +80,18 @@
>  					qcom,switch-mode-frequency = <3200000>;
>  				 };
>  
> +				l3 {
> +					regulator-min-microvolt = <3050000>;
> +					regulator-max-microvolt = <3300000>;
> +					bias-pull-down;
> +				};
> +
> +				l4 {
> +					regulator-min-microvolt = <1000000>;
> +					regulator-max-microvolt = <1800000>;
> +					bias-pull-down;
> +				};
> +
>  				l5 {
>  					regulator-min-microvolt = <2750000>;
>  					regulator-max-microvolt = <3000000>;
> @@ -85,6 +103,12 @@
>  					regulator-max-microvolt = <2950000>;
>  					bias-pull-down;
>  				};
> +
> +				l23 {
> +					regulator-min-microvolt = <1700000>;
> +					regulator-max-microvolt = <1900000>;
> +					bias-pull-down;
> +				};
>  			};
>  		};
>  
> @@ -111,6 +135,46 @@
>  			};
>  		};
>  
> +		/* OTG */
> +		phy@12500000 {
> +			status		= "okay";
> +			dr_mode		= "peripheral";
> +			vddcx-supply	= <&pm8921_s3>;
> +			v3p3-supply	= <&pm8921_l3>;
> +			v1p8-supply	= <&pm8921_l4>;
> +		};
> +
> +		phy@12520000 {
> +			status		= "okay";
> +			vddcx-supply	= <&pm8921_s3>;
> +			v3p3-supply	= <&pm8921_l3>;
> +			v1p8-supply	= <&pm8921_l23>;
> +		};
> +
> +		phy@12530000 {
> +			status		= "okay";
> +			vddcx-supply	= <&pm8921_s3>;
> +			v3p3-supply	= <&pm8921_l3>;
> +			v1p8-supply	= <&pm8921_l23>;
> +		};
> +
> +		gadget@12500000 {
> +			status = "okay";
> +		};
> +
> +		/* OTG */
> +		usb@12500000 {
> +			status = "okay";
> +		};
> +
> +		usb@12520000 {
> +			status = "okay";
> +		};
> +
> +		usb@12530000 {
> +			status = "okay";
> +		};
> +
>  		amba {
>  			/* eMMC */
>  			sdcc@12400000 {
> -- 
> 2.5.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
