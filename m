From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] media: platform: rcar_imr: add IMR-LSX3 support
Date: Thu, 23 Mar 2017 21:16:32 -0500
Message-ID: <20170324021632.xp3xnrgklqdeixq6@rob-hp-laptop>
References: <20170316190000.216761731@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170316190000.216761731-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 16, 2017 at 09:59:50PM +0300, Sergei Shtylyov wrote:
> Add support for the image renderer light SRAM extended 3 (IMR-LSX3) found
> only in the R-Car V2H (R8A7792) SoC.  It differs  from IMR-LX4 in that it
> supports only planar video formats but can use the video capture data for
> the textures.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> 
> ---
> This patch  is against the 'media_tree.git' repo's 'master' branch plus the
> latest version of  the Renesas IMR driver...
> 
> Changes in version 2:
> - renamed *enum* 'imr_gen' to 'imr_type' and the *struct* field of this type
>   from 'gen' to 'type';
> - rename *struct* 'imr_type' to 'imr_info' and the fields/variables of this type
>   from 'type' to 'info';
> - added comments to IMR-LX4 only CMRCR2 bits;
> - added IMR type check to the WTS instruction writing to CMRCCR2.
> 
>  Documentation/devicetree/bindings/media/rcar_imr.txt |   11 +

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/media/platform/rcar_imr.c                    |  106 +++++++++++++++----
>  2 files changed, 97 insertions(+), 20 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
