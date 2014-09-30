From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: DT: apq8064: Add usb host support.
Date: Mon, 29 Sep 2014 22:17:29 -0700
Message-ID: <20140930051728.GI28481@sonymobile.com>
References: <1411982044-7873-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1411982100-7964-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411982100-7964-1-git-send-email-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon 29 Sep 02:15 PDT 2014, Srinivas Kandagatla wrote:

> This patch adds device tree nodes to support two usb hosts on APQ8064
> SOC.
> 

Sorry for not looking at the entire series before answering patch 1.
I still think you should add all the regulators in the first patch anyways.

> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -263,6 +263,91 @@
>  			#address-cells	= <1>;
>  			#size-cells	= <0>;
>  
> +			pm8921_s3: pm8921-s3 {
> +				compatible	= "qcom,rpm-pm8921-smps";
> +				reg		= <QCOM_RPM_PM8921_SMPS3>;
> +
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1400000>;
> +				qcom,boot-load 		= <49360>;

As it was unclear how to handle load in the driver I dropped boot-load for now.
Please leave it out until someone have added it to the driver.

> +				qcom,switch-mode-frequency = <3200000>;
> +				regulator-always-on;
> +			};
> +
> +			pm8921_l3: pm8921-l3 {
> +				compatible	= "qcom,rpm-pm8921-pldo";
> +				reg		= <QCOM_RPM_PM8921_LDO3>;
> +
> +				regulator-min-microvolt = <3050000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +				qcom,boot-load = <50000>;

Dito

> +			};
> +
> +			pm8921_l23: pm8921-l23 {
> +				compatible	= "qcom,rpm-pm8921-pldo";
> +				reg		= <QCOM_RPM_PM8921_LDO23>;
> +
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1800000>;
> +				qcom,boot-load = <50000>;

Dito

> +				regulator-always-on;

Why are all these "always-on"?

> +			};
> +
> +		};
> +
>  
>  		/* Temporary fixed regulator */
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
