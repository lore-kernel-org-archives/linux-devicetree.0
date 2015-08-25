From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: qcom: add mdio bus on IPQ806x/AP148
Date: Mon, 24 Aug 2015 17:22:57 -0700
Message-ID: <20150825002257.GA19120@codeaurora.org>
References: <1440006802-2415-1-git-send-email-mathieu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1440006802-2415-1-git-send-email-mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Olivari <mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/19, Mathieu Olivari wrote:
> diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> index 6886d09..d73df24 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> +++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> @@ -19,8 +19,9 @@
>  		};
>  	};
>  
> -	alias {
> +	aliases {

Good catch!

>  		serial0 = &uart4;
> +		mdio-gpio0 = &mdio0;
>  	};
>  
>  	chosen {
> @@ -93,5 +103,24 @@
>  		sata@29000000 {
>  			status = "ok";
>  		};
> +
> +		mdio0: mdio {

This node should be at the root level, not inside the soc node.

> +			compatible = "virtual,mdio-gpio";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			gpios = <&qcom_pinmux 1 0 &qcom_pinmux 0 0>;
> +			pinctrl-0 = <&mdio0_pins>;
> +			pinctrl-names = "default";
> +
> +			phy0: ethernet-phy@0 {
> +				device_type = "ethernet-phy";
> +				reg = <0>;
> +			};
> +
> +			phy4: ethernet-phy@4 {
> +				device_type = "ethernet-phy";
> +				reg = <4>;
> +			};
> +		};
>  	};
>  };

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
