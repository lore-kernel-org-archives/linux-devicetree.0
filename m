From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH][v2] dt-bindings: ifc: Update endianness usage
Date: Wed, 29 Nov 2017 20:37:19 -0800
Message-ID: <bbe95e2f-19c1-ba51-a1e2-22eb2f1d1cbc@gmail.com>
References: <1512013344-4042-1-git-send-email-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512013344-4042-1-git-send-email-prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 11/29/2017 07:42 PM, Prabhakar Kushwaha wrote:
> IFC controller version < 2.0 support IFC register access as
> big endian. These controller version also require IFC NOR signals to
> be connected in reverse order with NOR flash.
> 
> IFC >= 2.0 is other way around.
> 
> So updating IFC binding to take care of both using endianness field.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
> ---
> Changes for v2: updated subject
> 
>  Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
> index 89427b0..824a2ca 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
> @@ -18,8 +18,10 @@ Properties:
>                interrupt (NAND_EVTER_STAT).  If there is only one,
>                that interrupt reports both types of event.
>  
> -- little-endian : If this property is absent, the big-endian mode will
> -                  be in use as default for registers.
> +- little-endian or big-endin : It represents how IFC registers  to be accessed.

			^==== big-endian (there is a typo)

-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
