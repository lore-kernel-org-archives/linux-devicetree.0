From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: rcar_vin: Reverse SoC part
 number list
Date: Tue, 28 Nov 2017 14:34:59 +0100
Message-ID: <20171128133459.GI23832@bigcity.dyn.berto.se>
References: <1510856571-30281-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1510856571-30281-2-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1510856571-30281-2-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2017-11-16 18:22:48 +0000, Fabrizio Castro wrote:
> Change the sorting of the part numbers from descending to ascending to
> match with other documentation.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> Reviewed-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>

Acked-by: Niklas Söderlund <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>

> ---
> v1->v2:
> * new patch triggered by Geert's comment, see the below link for details:
>   https://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg121992.html
> 
>  Documentation/devicetree/bindings/media/rcar_vin.txt | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/rcar_vin.txt
> index 6e4ef8c..98931f5 100644
> --- a/Documentation/devicetree/bindings/media/rcar_vin.txt
> +++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
> @@ -6,14 +6,14 @@ family of devices. The current blocks are always slaves and suppot one input
>  channel which can be either RGB, YUYV or BT656.
>  
>   - compatible: Must be one or more of the following
> -   - "renesas,vin-r8a7795" for the R8A7795 device
> -   - "renesas,vin-r8a7794" for the R8A7794 device
> -   - "renesas,vin-r8a7793" for the R8A7793 device
> -   - "renesas,vin-r8a7792" for the R8A7792 device
> -   - "renesas,vin-r8a7791" for the R8A7791 device
> -   - "renesas,vin-r8a7790" for the R8A7790 device
> -   - "renesas,vin-r8a7779" for the R8A7779 device
>     - "renesas,vin-r8a7778" for the R8A7778 device
> +   - "renesas,vin-r8a7779" for the R8A7779 device
> +   - "renesas,vin-r8a7790" for the R8A7790 device
> +   - "renesas,vin-r8a7791" for the R8A7791 device
> +   - "renesas,vin-r8a7792" for the R8A7792 device
> +   - "renesas,vin-r8a7793" for the R8A7793 device
> +   - "renesas,vin-r8a7794" for the R8A7794 device
> +   - "renesas,vin-r8a7795" for the R8A7795 device
>     - "renesas,rcar-gen2-vin" for a generic R-Car Gen2 compatible device.
>     - "renesas,rcar-gen3-vin" for a generic R-Car Gen3 compatible device.
>  
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
