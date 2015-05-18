From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc/fsl: Add FMan best effort port compatible
Date: Mon, 18 May 2015 16:09:18 -0500
Message-ID: <1431983358.27761.11.camel@freescale.com>
References: <1431938519-11343-1-git-send-email-igal.liberman@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431938519-11343-1-git-send-email-igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2015-05-18 at 11:41 +0300, Igal.Liberman wrote:
> From: Igal Liberman <igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> This patch adds a compatible which represents FMan V3 best effort ports.
> FMan best effort port is configured as 10G ports, however, it uses 1G
> hardware.
> 
> Signed-off-by: Igal Liberman <igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  .../devicetree/bindings/powerpc/fsl/fman.txt       |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> index edda55f..c2e3ec3 100644
> --- a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> @@ -166,6 +166,11 @@ PROPERTIES
>  			- "fsl,fman-v3-port-oh" for FManV3 OH ports
>  			- "fsl,fman-v3-port-rx" for FManV3 RX ports
>  			- "fsl,fman-v3-port-tx" for FManV3 TX ports
> +		Optional compatible which can be used in addition to the
> +		compatibles above is:
> +			- "fsl,fman-v3-best-effort-port"
> +		This compatible represents 10G best effort ports:
> +			Port configured as 10G, using 1G hardware.

What does this mean?  If it's using 1G hardware then it's a 1G port,
right?  How can you configure a 1G port to be 10G?

Why is this compatible in addition to others (note that this implies
such ports are 100% backwards compatible with hardware that lacks the
new compatible)?  You'd have the same compatible on rx and tx nodes (I'm
assuming this isn't applicable to oh)?

What are the implications of this that warrant adding a compatible?

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
