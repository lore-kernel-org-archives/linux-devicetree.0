From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: soc: Add supplies for Mediatek SCPSYS
 unit
Date: Mon, 30 Nov 2015 10:52:28 -0600
Message-ID: <20151130165228.GA30957@rob-hp-laptop>
References: <1448880100-23396-1-git-send-email-s.hauer@pengutronix.de>
 <1448880100-23396-2-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1448880100-23396-2-git-send-email-s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dawei.Chien-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 30, 2015 at 11:41:39AM +0100, Sascha Hauer wrote:
> The power domains in the SCPSYS unit are supplied by regulators. Add the
> properties for them to the binding document.
> 
> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/soc/mediatek/scpsys.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> index a6c8afc..e8f15e3 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> +++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> @@ -21,6 +21,18 @@ Required properties:
>  		      These are the clocks which hardware needs to be enabled
>  		      before enabling certain power domains.
>  
> +Optional properties:
> +- vdec-supply: Power supply for the vdec power domain
> +- venc-supply: Power supply for the venc power domain
> +- isp-supply: Power supply for the isp power domain
> +- mm-supply: Power supply for the mm power domain
> +- venc_lt-supply: Power supply for the venc_lt power domain
> +- audio-supply: Power supply for the audio power domain
> +- usb-supply: Power supply for the usb power domain
> +- mfg_async-supply: Power supply for the mfg_async power domain
> +- mfg_2d-supply: Power supply for the mfg_2d power domain
> +- mfg-supply: Power supply for the mfg power domain
> +
>  Example:
>  
>  	scpsys: scpsys@10006000 {
> -- 
> 2.6.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
