From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V7 1/3] Documentation: DT: Add entry for Freescale
 LS1043a-RDB board
Date: Mon, 9 Nov 2015 11:24:27 -0600
Message-ID: <20151109172427.GA9733@rob-hp-laptop>
References: <1446153126-6219-1-git-send-email-leoli@freescale.com>
 <1446153126-6219-2-git-send-email-leoli@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1446153126-6219-2-git-send-email-leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mingkai Hu <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Hou Zhiqiang <B48286-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 29, 2015 at 04:12:04PM -0500, Li Yang wrote:
> From: Mingkai Hu <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Signed-off-by: Mingkai Hu <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Hou Zhiqiang <B48286-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> v2-v7: no change

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> 
>  Documentation/devicetree/bindings/arm/fsl.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
> index 34c88b0..752a685 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.txt
> +++ b/Documentation/devicetree/bindings/arm/fsl.txt
> @@ -131,6 +131,10 @@ Example:
>  Freescale ARMv8 based Layerscape SoC family Device Tree Bindings
>  ----------------------------------------------------------------
>  
> +LS1043A ARMv8 based RDB Board
> +Required root node properties:
> +    - compatible = "fsl,ls1043a-rdb", "fsl,ls1043a";
> +
>  LS2080A ARMv8 based Simulator model
>  Required root node properties:
>      - compatible = "fsl,ls2080a-simu", "fsl,ls2080a";
> -- 
> 2.3.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
