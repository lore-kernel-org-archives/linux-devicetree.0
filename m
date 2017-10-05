From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 12/12] dt-bindings: usb: mtu3: remove optional pinctrls
Date: Thu, 5 Oct 2017 17:33:25 -0500
Message-ID: <20171005223325.ryvu6ifjgcj5scf4@rob-hp-laptop>
References: <fe8df8503f602586bcea4b1598eb09678b1525e3.1506509658.git.chunfeng.yun@mediatek.com>
 <ec8e65205c6e0a83850e11c030ed440d7b9be2e8.1506509659.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ec8e65205c6e0a83850e11c030ed440d7b9be2e8.1506509659.git.chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 28, 2017 at 08:17:20AM +0800, Chunfeng Yun wrote:
> Remove optional pinctrls due to using FORCE/RG_IDDIG to implement
> manual switch function.

Another not backwards compatible change. Please explain why that is 
okay.

> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/mediatek,mtu3.txt      |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
> index 49c982b..b2271d8 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
> @@ -30,9 +30,10 @@ Optional properties:
>  	when supports dual-role mode.
>   - vbus-supply : reference to the VBUS regulator, needed when supports
>  	dual-role mode.
> - - pinctl-names : a pinctrl state named "default" must be defined,
> -	"id_float" and "id_ground" are optinal which depends on
> -	"mediatek,enable-manual-drd"
> + - pinctrl-names : a pinctrl state named "default" is optional, and need be
> +	defined if auto drd switch is enabled, that means the property dr_mode
> +	is set as "otg", and meanwhile the property "mediatek,enable-manual-drd"
> +	is not set.
>   - pinctrl-0 : pin control group
>  	See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>  
> -- 
> 1.7.9.5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
