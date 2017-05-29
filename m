From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: mediatek: add bindings for MediaTek
 MT7622 SoC
Date: Mon, 29 May 2017 17:11:16 +0200
Message-ID: <cf8fabea-8eb1-6a28-0e8e-cfc3087f5fb5@gmail.com>
References: <cover.1496061587.git.sean.wang@mediatek.com>
 <9b4e201f8f9ad11be98f22ccc3022b4e5d76a681.1496061587.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9b4e201f8f9ad11be98f22ccc3022b4e5d76a681.1496061587.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 29/05/17 14:56, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> This adds dt-binding documentation for MediaTek MT7622 SoC
> which currently only includes basic items such as ARM CPU,
> MediaTek SYSIRQ and UART.
> 
> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>   Documentation/devicetree/bindings/arm/mediatek.txt                    | 4 ++++
>   .../devicetree/bindings/interrupt-controller/mediatek,sysirq.txt      | 3 ++-
>   Documentation/devicetree/bindings/serial/mtk-uart.txt                 | 1 +
>   3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
> index c860b24..fc68570 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek.txt
> @@ -12,6 +12,7 @@ compatible: Must contain one of
>      "mediatek,mt6592"
>      "mediatek,mt6755"
>      "mediatek,mt6795"
> +   "mediatek,mt7622"
>      "mediatek,mt7623"
>      "mediatek,mt8127"
>      "mediatek,mt8135"
> @@ -38,6 +39,9 @@ Supported boards:
>   - Evaluation board for MT6795(Helio X10):
>       Required root node properties:
>         - compatible = "mediatek,mt6795-evb", "mediatek,mt6795";
> +- Reference board variant 1 for MT7622:
> +    Required root node properties:
> +      - compatible = "mediatek,mt7622-rfb1", "mediatek,mt7622";
>   - Evaluation board for MT7623:
>       Required root node properties:
>         - compatible = "mediatek,mt7623-evb", "mediatek,mt7623";
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> index a89c03b..eda1183 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> @@ -1,4 +1,4 @@
> -+Mediatek 65xx/67xx/81xx sysirq
> ++Mediatek MT65xx/MT67xx/MT762x/MT81xx sysirq
>   
>   Mediatek SOCs sysirq support controllable irq inverter for each GIC SPI
>   interrupt.
> @@ -15,6 +15,7 @@ Required properties:
>   	"mediatek,mt6582-sysirq"
>   	"mediatek,mt6580-sysirq"
>   	"mediatek,mt6577-sysirq"
> +	"mediatek,mt7622-sysirq"
>   	"mediatek,mt2701-sysirq"

This file is a mess and I posted some cleanups on the mailinglist. No 
need for you to resubmit. If the DT maintainers are fine with my 
cleanups, I cann change the line accordingly.

Regards,
Matthias

>   - interrupt-controller : Identifies the node as an interrupt controller
>   - #interrupt-cells : Use the same format as specified by GIC in arm,gic.txt.
> diff --git a/Documentation/devicetree/bindings/serial/mtk-uart.txt b/Documentation/devicetree/bindings/serial/mtk-uart.txt
> index 0015c72..daa1eef 100644
> --- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
> +++ b/Documentation/devicetree/bindings/serial/mtk-uart.txt
> @@ -8,6 +8,7 @@ Required properties:
>     * "mediatek,mt6589-uart" for MT6589 compatible UARTS
>     * "mediatek,mt6755-uart" for MT6755 compatible UARTS
>     * "mediatek,mt6795-uart" for MT6795 compatible UARTS
> +  * "mediatek,mt7622-uart" for MT7622 compatible UARTS
>     * "mediatek,mt7623-uart" for MT7623 compatible UARTS
>     * "mediatek,mt8127-uart" for MT8127 compatible UARTS
>     * "mediatek,mt8135-uart" for MT8135 compatible UARTS
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
