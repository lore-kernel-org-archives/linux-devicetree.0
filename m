From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 6/7] MIPS: BMIPS: Add BCM6362 support
Date: Thu, 4 Aug 2016 12:48:25 -0500
Message-ID: <20160804174825.GA1169@rob-hp-laptop>
References: <1470218310-2978-6-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470218310-2978-6-git-send-email-noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 03, 2016 at 11:58:29AM +0200, Álvaro Fernández Rojas wrote:
> BCM6362 is a BMIPS4350 SoC which needs the same fixup as BCM6368 in order to
> enable SMP support.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mips/brcm/soc.txt | 2 +-
>  arch/mips/bmips/setup.c                             | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.txt b/Documentation/devicetree/bindings/mips/brcm/soc.txt
> index 65bc572..e4e1cd9 100644
> --- a/Documentation/devicetree/bindings/mips/brcm/soc.txt
> +++ b/Documentation/devicetree/bindings/mips/brcm/soc.txt
> @@ -4,7 +4,7 @@ Required properties:
>  
>  - compatible: "brcm,bcm3368", "brcm,bcm3384", "brcm,bcm33843"
>                "brcm,bcm3384-viper", "brcm,bcm33843-viper"
> -              "brcm,bcm6328", "brcm,bcm6358", "brcm,bcm6368",
> +              "brcm,bcm6328", "brcm,bcm6358", "brcm,bcm6362", "brcm,bcm6368",

Same comment on this.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>                "brcm,bcm63168", "brcm,bcm63268",
>                "brcm,bcm7125", "brcm,bcm7346", "brcm,bcm7358", "brcm,bcm7360",
>                "brcm,bcm7362", "brcm,bcm7420", "brcm,bcm7425"
> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
> index 4fbd2f1..bde62bc 100644
> --- a/arch/mips/bmips/setup.c
> +++ b/arch/mips/bmips/setup.c
> @@ -115,6 +115,7 @@ static const struct bmips_quirk bmips_quirk_list[] = {
>  	{ "brcm,bcm33843-viper",	&bcm3384_viper_quirks		},
>  	{ "brcm,bcm6328",		&bcm6328_quirks			},
>  	{ "brcm,bcm6358",		&bcm6358_quirks			},
> +	{ "brcm,bcm6362",		&bcm6368_quirks			},
>  	{ "brcm,bcm6368",		&bcm6368_quirks			},
>  	{ "brcm,bcm63168",		&bcm6368_quirks			},
>  	{ "brcm,bcm63268",		&bcm6368_quirks			},
> -- 
> 2.1.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
