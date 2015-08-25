From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 3/6] ARM: dts: apq8064-ifc6410: add notify led support.
Date: Tue, 25 Aug 2015 14:36:01 -0700
Message-ID: <55DCDFC1.4010803@codeaurora.org>
References: <1439903069-19752-1-git-send-email-srinivas.kandagatla@linaro.org> <1439903409-20233-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1439903409-20233-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: agross@codeaurora.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/18/2015 06:10 AM, Srinivas Kandagatla wrote:
> diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> index b1f9ddb..08daafe 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> @@ -221,6 +221,18 @@
>   			status = "okay";
>   		};
>   
> +		leds {
> +			compatible = "gpio-leds";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&notify_led>;
> +
> +			led@1 {
> +				label = "apq8064:green:user1";
> +				gpios = <&pm8921_gpio 18 GPIO_ACTIVE_HIGH>;
> +				default-state = "on";
> +			};
> +		};

Wrong place. Should be in root, not soc node.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
