From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH v2 1/3] dt-bindings: add compatible string for Allwinner
 V3s SoC
Date: Mon, 04 Sep 2017 16:32:02 +0800
Message-ID: <69e65e1018ccb64573ad7ec864ab9fa5@aosc.io>
References: <20170822052322.15338-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170822052322.15338-1-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

在 2017-08-22 13:23，Icenowy Zheng 写道：
> The compatible string for Allwinner V3s SoC used to be missing.
> 
> Add it to the binding document.
> 
> Fixes: b074fede01c0 ("arm: sunxi: add support for V3s SoC")
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

Maxime, Chen-Yu, ping.

Could you queue this patchset to 4.15?

> ---
>  Documentation/devicetree/bindings/arm/sunxi.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt
> b/Documentation/devicetree/bindings/arm/sunxi.txt
> index d2c46449b4eb..f35c6ada5a65 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.txt
> +++ b/Documentation/devicetree/bindings/arm/sunxi.txt
> @@ -14,6 +14,7 @@ using one of the following compatible strings:
>    allwinner,sun8i-a83t
>    allwinner,sun8i-h2-plus
>    allwinner,sun8i-h3
> +  allwinner,sun8i-v3s
>    allwinner,sun9i-a80
>    allwinner,sun50i-a64
>    nextthing,gr8
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
