From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: mediatek: add xHCI & usb phy for
 mt8173
Date: Wed, 22 Jul 2015 21:11:50 +0300
Message-ID: <55AFDCE6.2060608@cogentembedded.com>
References: <1437573945-31586-1-git-send-email-chunfeng.yun@mediatek.com>
 <1437573945-31586-6-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437573945-31586-6-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Felipe Balbi <balbi@ti.com>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, John Crispin <blogic@openwrt.org>, Daniel Kurtz <djkurtz@chromium.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 07/22/2015 05:05 PM, Chunfeng Yun wrote:

> add xHCI and phy drivers for MT8173-EVB

> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 15 ++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi    | 31 +++++++++++++++++++++++++++++
>   2 files changed, 46 insertions(+)

> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> index f433c21..202b2b9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> @@ -13,6 +13,7 @@
>    */
>
>   /dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
>   #include "mt8173.dtsi"
>
>   / {
> @@ -32,6 +33,15 @@
>   	};
>
>   	chosen { };
> +
> +	usb_p1_vbus: fixedregulator@0 {

    Just "regulator@0" please. This is more in line with what ePAPR requires 
from the node names.

> +		compatible = "regulator-fixed";
> +		regulator-name = "usb_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&pio 130 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
>   };
>
>   &pwrap {
[...]
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 0696f8f..aa1ecc7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
[...]
> @@ -393,6 +394,36 @@
>   			#size-cells = <0>;
>   			status = "disabled";
>   		};
> +
> +		usb: usb30@11270000 {

    ePAPR standardizes the name "usb" for such nodes, please fix.

[...]

MBR, Sergei
