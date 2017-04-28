From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 29/30] dt-bindings: add vendor prefix for bananapi
Date: Fri, 28 Apr 2017 15:37:27 -0500
Message-ID: <20170428203727.m6jm5w6nb2iirxih@rob-hp-laptop>
References: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
 <1493198774-4478-30-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1493198774-4478-30-git-send-email-sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 26, 2017 at 05:26:13PM +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Banana Pi team in Sinovoip Co., Limited which are dedicated to
> design and manufacture open hardware product.
> 
> Website: http://www.banana-pi.org/
> 
> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index ec0bfb9..8ca0f3c 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -44,6 +44,7 @@ avia	avia semiconductor
>  avic	Shanghai AVIC Optoelectronics Co., Ltd.
>  axentia	Axentia Technologies AB
>  axis	Axis Communications AB
> +bananapi Banana Pi SINOVOP CO., LIMITED

s/SINOVOP/SINOVOIP/ 


>  boe	BOE Technology Group Co., Ltd.
>  bosch	Bosch Sensortec GmbH
>  boundary	Boundary Devices Inc.
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
