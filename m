From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 4/7] Documentation: fsl-quadspi: Add fsl,ls2080a-dspi
 compatible string
Date: Mon, 7 Mar 2016 12:32:00 -0800
Message-ID: <20160307203200.GW55664@google.com>
References: <1453793041-35868-1-git-send-email-yao.yuan@freescale.com>
 <1453793041-35868-4-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453793041-35868-4-git-send-email-yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, han.xu-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yao.yuan-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 26, 2016 at 03:23:58PM +0800, Yuan Yao wrote:
> new compatible string: "fsl,ls2080a-qspi".

^^ This line doesn't match the subject or the content of the patch.

> Signed-off-by: Yuan Yao <yao.yuan-3arQi8VN3Tc@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> Changed in v4:
> No changes.
> 
> Changed in v3:
> Add the modifier for new compatible string like:
> "fsl,ls2080a-dspi" followed by "fsl,ls2085a-dspi"
> 
> Changed in v2:
> Update my email to <yao.yuan-3arQi8VN3Tc@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt | 5 ++++-

^^ What is this change doing in this series anyway? You're touching MTD
stuff, not SPI stuff, and this string doesn't get used in any driver. Is
this controller somehow related, or is it a separate IP block that
happens to be on some of the same SoCs?

Anyway, you should send this kind of stuff to the SPI list, not the MTD
one.

Regards,
Brian

>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt b/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
> index fa77f87..1ad0fe3 100644
> --- a/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
> +++ b/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
> @@ -1,7 +1,10 @@
>  ARM Freescale DSPI controller
>  
>  Required properties:
> -- compatible : "fsl,vf610-dspi", "fsl,ls1021a-v1.0-dspi", "fsl,ls2085a-dspi"
> +- compatible : "fsl,vf610-dspi", "fsl,ls1021a-v1.0-dspi",
> +		"fsl,ls2085a-dspi"
> +		or
> +		"fsl,ls2080a-dspi" followed by "fsl,ls2085a-dspi"
>  - reg : Offset and length of the register set for the device
>  - interrupts : Should contain SPI controller interrupt
>  - clocks: from common clock binding: handle to dspi clock.
> -- 
> 2.1.0.27.g96db324
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
