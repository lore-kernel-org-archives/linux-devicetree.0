From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v4 1/6] dt/bindings: bman: Add phandle to the portals
Date: Wed, 3 Dec 2014 22:51:14 -0600
Message-ID: <1417668674.15957.243.camel@freescale.com>
References: <1417600964-24647-1-git-send-email-Emilian.Medve@Freescale.com>
	 <1417600964-24647-2-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417600964-24647-2-git-send-email-Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2014-12-03 at 04:02 -0600, Emil Medve wrote:
> This supports SoC(s) with multiple BMan instances
> 
> Signed-off-by: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/soc/fsl/bman.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/bman.txt b/Documentation/devicetree/bindings/soc/fsl/bman.txt
> index 9f80bf8..4fc4a6e 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/bman.txt
> +++ b/Documentation/devicetree/bindings/soc/fsl/bman.txt
> @@ -36,6 +36,11 @@ are located at offsets 0xbf8 and 0xbfc
>  	Value type:	<prop-encoded-array>
>  	Definition:	Standard property. The error interrupt
>  
> +- fsl,bman-portals
> +	Usage:		Required
> +	Value type:	<phandle>
> +	Definition:	Phandle to this BMan's instance portals

s/BMan's instance/BMan instance's/

Likewise for QMan

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
