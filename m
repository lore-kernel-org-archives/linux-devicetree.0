From: Matthias Brugger_0 <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: mt8135: Add pinctrl/GPIO/EINT node for mt8135.
Date: Thu, 30 Apr 2015 18:09:02 +0200
Message-ID: <7612069.RRCsOqAebC@ubix>
References: <1430213037-23831-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430213037-23831-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Tuesday, April 28, 2015 05:23:56 PM Yingjoe Chen wrote:
> From: Hongzhou Yang <hongzhou.yang@mediatek.com>
> 
> 
> Matthias,
> 
> Since mt8135 pinctrl node patch is not in v4.1-rc1, I'd like to make some
> minor change to follow dts convention.
> 
> Let me know what you think.
> Thanks.
> 
> Joe.C
> 
> ---8<--------------------------------------------------------------------
> Add pinctrl,GPIO and EINT node to mt8135.dtsi.
> 
> Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/boot/dts/mt8135-pinfunc.h | 1302
> ++++++++++++++++++++++++++++++++++++ arch/arm/boot/dts/mt8135.dtsi      |  
> 31 +
>  2 files changed, 1333 insertions(+)
>  create mode 100644 arch/arm/boot/dts/mt8135-pinfunc.h
> 
> diff --git a/arch/arm/boot/dts/mt8135-pinfunc.h
> b/arch/arm/boot/dts/mt8135-pinfunc.h new file mode 100644
> index 0000000..5a60987
> --- /dev/null
> +++ b/arch/arm/boot/dts/mt8135-pinfunc.h
[...]
> diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
> index 2c5c4da..d6c1f14 100644
> --- a/arch/arm/boot/dts/mt8135.dtsi
> +++ b/arch/arm/boot/dts/mt8135.dtsi
> @@ -17,6 +17,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/reset-controller/mt8135-resets.h>
>  #include "skeleton64.dtsi"
> +#include "mt8135-pinfunc.h"
> 
>  / {
>  	compatible = "mediatek,mt8135";
> @@ -141,6 +142,36 @@
>  			clock-names = "spi", "wrap";
>  		};
> 
> +		/* Provide regmap for pinctrl driver */

I think from the DTS it is quite clear for what the node is used for.
Please delete the comment.

> +		syscfg_pctl_a: syscfg_pctl_a@10005000 {
> +			compatible = "mediatek,mt8135-pctl-a-syscfg", "syscon";
> +			reg = <0 0x10005000 0 0x1000>;
> +		};
> +
> +		/* Provide regmap for pinctrl driver */

Same here.

> +		syscfg_pctl_b: syscfg_pctl_b@1020c000 {
> +			compatible = "mediatek,mt8135-pctl-b-syscfg", "syscon";
> +			reg = <0 0x1020c000 0 0x1000>;
> +		};

Please sort the nodes by it's address.

Cheers,
Matthias
