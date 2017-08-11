From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] dt-bindings: mt8173-xhci: add generic compatible and
 rename file
Date: Thu, 10 Aug 2017 21:56:17 -0500
Message-ID: <20170811025617.s3wuqlkgjvgc4exi@rob-hp-laptop>
References: <8f0cb0047b2aa195d818ad686cbbceabb3ad91a0.1502170518.git.chunfeng.yun@mediatek.com>
 <ed176bd0af123ad6a94982c628bb70a6a3bf7515.1502170518.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ed176bd0af123ad6a94982c628bb70a6a3bf7515.1502170518.git.chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 08, 2017 at 01:42:52PM +0800, Chunfeng Yun wrote:
> The mt8173-xhci.txt actually holds the bindings for all mediatek
> SoCs with xHCI controller, so add a generic compatible and change
> the name to xhci-mtk.txt to reflect that.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  .../bindings/usb/{mt8173-xhci.txt => xhci-mtk.txt} |   10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>  rename Documentation/devicetree/bindings/usb/{mt8173-xhci.txt => xhci-mtk.txt} (92%)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mt8173-xhci.txt b/Documentation/devicetree/bindings/usb/xhci-mtk.txt
> similarity index 92%
> rename from Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> rename to Documentation/devicetree/bindings/usb/xhci-mtk.txt

mediatek,mtk-xhci.txt

> index 0acfc8a..1ce77c7 100644
> --- a/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/xhci-mtk.txt
> @@ -11,7 +11,9 @@ into two parts.
>  ------------------------------------------------------------------------
>  
>  Required properties:
> - - compatible : should contain "mediatek,mt8173-xhci"
> + - compatible : should be one of
> +	"mediatek,mt8173-xhci" (deprecated, use "mediatek,xhci-mtk" instead),

NAK for same reason.

> +	"mediatek,xhci-mtk"

mediatek,mtk-xhci would be more in line with conventions.

>   - reg : specifies physical base address and size of the registers
>   - reg-names: should be "mac" for xHCI MAC and "ippc" for IP port control
>   - interrupts : interrupt used by the controller
> @@ -68,10 +70,12 @@ usb30: usb@11270000 {
>  
>  In the case, xhci is added as subnode to mtu3. An example and the DT binding
>  details of mtu3 can be found in:
> -Documentation/devicetree/bindings/usb/mt8173-mtu3.txt
> +Documentation/devicetree/bindings/usb/mtu3.txt
>  
>  Required properties:
> - - compatible : should contain "mediatek,mt8173-xhci"
> + - compatible : should be one of
> +	"mediatek,mt8173-xhci" (deprecated, use "mediatek,xhci-mtk" instead),
> +	"mediatek,xhci-mtk"
>   - reg : specifies physical base address and size of the registers
>   - reg-names: should be "mac" for xHCI MAC
>   - interrupts : interrupt used by the host controller
> -- 
> 1.7.9.5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
