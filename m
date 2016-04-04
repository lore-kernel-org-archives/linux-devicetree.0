From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 14/16] arm64: dts: hikey: Add hi655x pmic dts node
Date: Mon, 4 Apr 2016 00:16:53 -0500
Message-ID: <20160404051653.GU17806@rob-hp-laptop>
References: <1459589383-16914-1-git-send-email-guodong.xu@linaro.org>
 <1459589383-16914-15-git-send-email-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459589383-16914-15-git-send-email-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guodong Xu <guodong.xu@linaro.org>
Cc: xuwei5@hisilicon.com, mark.rutland@arm.com, grant.likely@secretlab.ca, linus.walleij@linaro.org, arnd.bergmann@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kong.kongxinwei@hisilicon.com, Chen Feng <puck.chen@hisilicon.com>, Fei Wang <w.f@huawei.com>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 02, 2016 at 05:29:41PM +0800, Guodong Xu wrote:
> From: Chen Feng <puck.chen@hisilicon.com>
> 
> Add the mfd hi655x dts node and regulator support on
> hi6220 platform.
> 
> Signed-off-by: Chen Feng <puck.chen@hisilicon.com>
> Signed-off-by: Fei Wang <w.f@huawei.com>
> Signed-off-by: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Reviewed-by: Haojian Zhuang <haojian.zhuang@linaro.org>
> Reviewed-by: Guodong Xu <guodong.xu@linaro.org>
> ---
>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 87 ++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> index 28bc646..a6dffa8 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> @@ -6,6 +6,7 @@
>   */
>  
>  /dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
>  
>  #include "hi6220.dtsi"
>  #include "hikey-gpio.dtsi"
> @@ -104,6 +105,92 @@
>  			default-state = "off";
>  		};
>  	};
> +
> +	pmic: pmic@f8000000 {
> +		compatible = "hisilicon,hi655x-pmic";
> +		reg = <0x0 0xf8000000 0x0 0x1000>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		pmic-gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
> +		status = "okay";
> +
> +		regulators {
> +			ldo2: LDO2@a21 {

@a21 is not a unit address. Please drop these.

> +				regulator-name = "LDO2_2V8";
> +				regulator-min-microvolt = <2500000>;
> +				regulator-max-microvolt = <3200000>;
> +				regulator-enable-ramp-delay = <120>;
> +			};
> +
> +			ldo7: LDO7@a26 {
