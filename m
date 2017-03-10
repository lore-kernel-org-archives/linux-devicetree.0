From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [v2, 4/4] dt-bindings: mtd: Add Octal SPI support to Cadence
 QSPI.
Date: Fri, 10 Mar 2017 04:39:27 +0100
Message-ID: <132a4818-11d1-263f-aae4-bac4e76c14c8@gmail.com>
References: <1488959932-6657-1-git-send-email-jartur@cadence.com>
 <1488960326-13858-1-git-send-email-jartur@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488960326-13858-1-git-send-email-jartur-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Artur Jedrysek <jartur-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/08/2017 09:05 AM, Artur Jedrysek wrote:
> This patch updates Cadence QSPI Device Tree documentation to include
> information about new compatible used to indicate, whether or not
> Octal SPI transfers are supported by the device.
> 
> Signed-off-by: Artur Jedrysek <jartur-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
> ---
> Changelog:
> v2: Use new compatible, instead of boolean property, to indicate
> Octal SPI support.
> ---
>  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> index f248056..41d1e98 100644
> --- a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> @@ -1,7 +1,9 @@
>  * Cadence Quad SPI controller
>  
>  Required properties:
> -- compatible : Should be "cdns,qspi-nor".
> +- compatible : Should be "cdns,{qspi|ospi}-nor".

Please explicitly list all compatibles , ie.
Should be "cdns,qspi-nor" or "cdns,ospi-nor".

But I think the ospi is backward compatible with qspi, right ? So the
binding for ospi should list both, ie.
compatible = "cdns,ospi-nor", "cdns,qspi-nor";

> +  Use "cdns,qspi-nor" for Quad SPI controller.
> +  Use "cdns,ospi-nor" for Octal SPI controller.
>  - reg : Contains two entries, each of which is a tuple consisting of a
>  	physical address and length. The first entry is the address and
>  	length of the controller register set. The second entry is the
> 


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
