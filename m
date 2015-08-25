From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 1/6] ARM: dts: ifc6410: Add pwrseq support for WLAN
Date: Tue, 25 Aug 2015 14:33:13 -0700
Message-ID: <55DCDF19.4070901@codeaurora.org>
References: <1439903069-19752-1-git-send-email-srinivas.kandagatla@linaro.org> <1439903212-19931-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439903212-19931-1-git-send-email-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/18/2015 06:06 AM, Srinivas Kandagatla wrote:
> @@ -10,6 +11,20 @@
>   		serial1 = &gsbi6_serial;
>   	};
>   
> +	pwrseq {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;

Why do we need any of these three properties?

> +		compatible = "simple-bus";
> +
> +		sdcc4_pwrseq: sdcc4_pwrseq {
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&wlan_default_gpios>;
> +			compatible = "mmc-pwrseq-simple";
> +			reset-gpios = <&pm8921_gpio 43 GPIO_ACTIVE_LOW>;

Especially because this node doesn't have a reg property.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
