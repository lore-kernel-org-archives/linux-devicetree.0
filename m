From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: Fix gpio to pinmux mapping
Date: Mon, 9 Sep 2019 11:56:37 -0700
Message-ID: <664091a5-7cc0-eeb9-425a-ce39c31b1dfc@broadcom.com>
References: <1568018127-26730-1-git-send-email-rayagonda.kokatanur@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568018127-26730-1-git-send-email-rayagonda.kokatanur@broadcom.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 9/9/19 1:35 AM, Rayagonda Kokatanur wrote:
> There are total of 151 non-secure gpio (0-150) and four
> pins of pinmux (91, 92, 93 and 94) are not mapped to any
> gpio pin, hence update same in DT.
> 
> Fixes: 8aa428cc1e2e ("arm64: dts: Add pinctrl DT nodes for Stingray SOC")
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> ---
>   arch/arm64/boot/dts/broadcom/stingray/stingray-pinctrl.dtsi | 5 +++--
>   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi         | 3 +--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray-pinctrl.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray-pinctrl.dtsi
> index 8a3a770..56789cc 100644
> --- a/arch/arm64/boot/dts/broadcom/stingray/stingray-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/stingray/stingray-pinctrl.dtsi
> @@ -42,13 +42,14 @@
>   
>   		pinmux: pinmux@14029c {
>   			compatible = "pinctrl-single";
> -			reg = <0x0014029c 0x250>;
> +			reg = <0x0014029c 0x26c>;
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			pinctrl-single,register-width = <32>;
>   			pinctrl-single,function-mask = <0xf>;
>   			pinctrl-single,gpio-range = <
> -				&range 0 154 MODE_GPIO
> +				&range 0  91 MODE_GPIO
> +				&range 95 60 MODE_GPIO
>   				>;
>   			range: gpio-range {
>   				#pinctrl-single,gpio-range-cells = <3>;
> diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
> index 71e2e34..0098dfd 100644
> --- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
> @@ -464,8 +464,7 @@
>   					<&pinmux 108 16 27>,
>   					<&pinmux 135 77 6>,
>   					<&pinmux 141 67 4>,
> -					<&pinmux 145 149 6>,
> -					<&pinmux 151 91 4>;
> +					<&pinmux 145 149 6>;
>   		};
>   
>   		i2c1: i2c@e0000 {
> 

Thanks for the fix. Looks good to me!

Reviewed-by: Ray Jui <ray.jui@broadcom.com>
