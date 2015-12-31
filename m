From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: mediatek: Modify pinctrl bindings for
 mt2701
Date: Thu, 31 Dec 2015 12:14:54 +0100
Message-ID: <56850E2E.4060101@gmail.com>
References: <1451286546-5920-1-git-send-email-biao.huang@mediatek.com>
 <1451286546-5920-3-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451286546-5920-3-git-send-email-biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Biao Huang <biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 28/12/15 08:09, Biao Huang wrote:
> Signed-off-by: Biao Huang <biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>   .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |    9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>

Reviewed-by: Mathias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
> index 0480bc3..9ffb0b2 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
> @@ -4,10 +4,11 @@ The Mediatek's Pin controller is used to control SoC pins.
>
>   Required properties:
>   - compatible: value should be one of the following.
> -    (a) "mediatek,mt8135-pinctrl", compatible with mt8135 pinctrl.
> -    (b) "mediatek,mt8173-pinctrl", compatible with mt8173 pinctrl.
> -    (c) "mediatek,mt6397-pinctrl", compatible with mt6397 pinctrl.
> -    (d) "mediatek,mt8127-pinctrl", compatible with mt8127 pinctrl.
> +	"mediatek,mt2701-pinctrl", compatible with mt2701 pinctrl.
> +	"mediatek,mt6397-pinctrl", compatible with mt6397 pinctrl.
> +	"mediatek,mt8127-pinctrl", compatible with mt8127 pinctrl.
> +	"mediatek,mt8135-pinctrl", compatible with mt8135 pinctrl.
> +	"mediatek,mt8173-pinctrl", compatible with mt8173 pinctrl.
>   - pins-are-numbered: Specify the subnodes are using numbered pinmux to
>     specify pins.
>   - gpio-controller : Marks the device node as a gpio controller.
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
