From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 5/5] arm: dts: Add pinctrl/GPIO/EINT node for mt2701
Date: Thu, 31 Dec 2015 12:23:57 +0100
Message-ID: <5685104D.7070008@gmail.com>
References: <1451286546-5920-1-git-send-email-biao.huang@mediatek.com>
 <1451286546-5920-6-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1451286546-5920-6-git-send-email-biao.huang@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Biao Huang <biao.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, srv_heupstream@mediatek.com, yingjoe.chen@mediatek.com, hongzhou.yang@mediatek.com, erin.lo@mediatek.com
List-Id: devicetree@vger.kernel.org



On 28/12/15 08:09, Biao Huang wrote:
> Add pinctrl and GPIO node to mt2701.dtsi
>
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   arch/arm/boot/dts/mt2701.dtsi |   19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Linus, will you take this patch through your branch?

> diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
> index dc02f76..bd88ae9 100644
> --- a/arch/arm/boot/dts/mt2701.dtsi
> +++ b/arch/arm/boot/dts/mt2701.dtsi
> @@ -17,6 +17,7 @@
>   #include <dt-bindings/clock/mt2701-clk.h>
>   #include <dt-bindings/reset-controller/mt2701-resets.h>
>   #include "skeleton64.dtsi"
> +#include "mt2701-pinfunc.h"
>
>   / {
>   	compatible = "mediatek,mt2701";
> @@ -99,6 +100,24 @@
>   		#reset-cells = <1>;
>   	};
>
> +	pio: pinctrl@10005000 {
> +		compatible = "mediatek,mt2701-pinctrl";
> +		reg = <0 0x1000b000 0 0x1000>;
> +		mediatek,pctl-regmap = <&syscfg_pctl_a>;
> +		pins-are-numbered;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	syscfg_pctl_a: syscfg@10005000 {
> +		compatible = "mediatek,mt2701-pctl-a-syscfg", "syscon";
> +		reg = <0 0x10005000 0 0x1000>;
> +	};
> +
>   	watchdog: watchdog@10007000 {
>   		compatible = "mediatek,mt2701-wdt",
>   			     "mediatek,mt6589-wdt";
>
