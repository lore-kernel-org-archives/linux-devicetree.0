From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Doc: net: dsa: b53: update location of referenced dsa.txt
Date: Thu, 15 Jun 2017 10:04:30 -0700
Message-ID: <2fc14ccc-0fb9-cb84-c279-2dd19848dd87@gmail.com>
References: <20170615170307.15707-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170615170307.15707-1-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/15/2017 10:03 AM, Heinrich Schuchardt wrote:
> The referenced file dsa.txt is located at
> Documentation/devicetree/bindings/net/dsa/dsa.txt
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

Reviewed-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks!

> ---
>  Documentation/devicetree/bindings/net/dsa/b53.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/b53.txt b/Documentation/devicetree/bindings/net/dsa/b53.txt
> index d6c6e41648d4..8ec2ca21adeb 100644
> --- a/Documentation/devicetree/bindings/net/dsa/b53.txt
> +++ b/Documentation/devicetree/bindings/net/dsa/b53.txt
> @@ -34,7 +34,7 @@ Required properties:
>        "brcm,bcm6328-switch"
>        "brcm,bcm6368-switch" and the mandatory "brcm,bcm63xx-switch"
>  
> -See Documentation/devicetree/bindings/dsa/dsa.txt for a list of additional
> +See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list of additional
>  required and optional properties.
>  
>  Examples:
> 


-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
