From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] dt-bindings: mt8173-mtu3: add generic compatible and
 rename file
Date: Thu, 10 Aug 2017 21:54:10 -0500
Message-ID: <20170811025410.65jvjmji4gfnmm6l@rob-hp-laptop>
References: <8f0cb0047b2aa195d818ad686cbbceabb3ad91a0.1502170518.git.chunfeng.yun@mediatek.com>
 <121eaec8845c62383701d4fdfe9649335937f025.1502170518.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <121eaec8845c62383701d4fdfe9649335937f025.1502170518.git.chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 08, 2017 at 01:42:51PM +0800, Chunfeng Yun wrote:
> The mt8173-mtu3.txt actually holds the bindings for all mediatek
> SoCs with usb3 DRD IP, so add a generic compatible and change the
> name to mtu3.txt.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  .../bindings/usb/{mt8173-mtu3.txt => mtu3.txt}     |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/usb/{mt8173-mtu3.txt => mtu3.txt} (95%)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mt8173-mtu3.txt b/Documentation/devicetree/bindings/usb/mtu3.txt
> similarity index 95%
> rename from Documentation/devicetree/bindings/usb/mt8173-mtu3.txt
> rename to Documentation/devicetree/bindings/usb/mtu3.txt
> index 1d7c3bc..832741d 100644
> --- a/Documentation/devicetree/bindings/usb/mt8173-mtu3.txt
> +++ b/Documentation/devicetree/bindings/usb/mtu3.txt

mediatek,mtu3.txt

> @@ -1,7 +1,9 @@
>  The device node for Mediatek USB3.0 DRD controller
>  
>  Required properties:
> - - compatible : should be "mediatek,mt8173-mtu3"
> + - compatible : should be one of
> +	"mediatek,mt8173-mtu3" (deprecated, use "mediatek,mtu3" instead),

NAK. You can add generic compatibles, but you need SoC specific ones in 
addition.

> +	"mediatek,mtu3"
>   - reg : specifies physical base address and size of the registers
>   - reg-names: should be "mac" for device IP and "ippc" for IP port control
>   - interrupts : interrupt used by the device IP
> @@ -44,7 +46,7 @@ Optional properties:
>  Sub-nodes:
>  The xhci should be added as subnode to mtu3 as shown in the following example
>  if host mode is enabled. The DT binding details of xhci can be found in:
> -Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> +Documentation/devicetree/bindings/usb/xhci-mtk.txt

This should be in the patch that renames this file.

>  
>  Example:
>  ssusb: usb@11271000 {
> -- 
> 1.7.9.5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
