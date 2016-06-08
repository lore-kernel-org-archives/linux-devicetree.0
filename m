From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Documentation/devicetree: document cavium-pip
 rx-delay/tx-delay properties
Date: Wed, 8 Jun 2016 14:18:42 -0500
Message-ID: <20160608191842.GA19860@rob-hp-laptop>
References: <1465079042-22499-1-git-send-email-aaro.koskinen@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465079042-22499-1-git-send-email-aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Cc: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jun 05, 2016 at 01:24:02AM +0300, Aaro Koskinen wrote:
> Document cavium-pip rx-delay/tx-delay properties. Currently the board
> specific values need to be hardcoded in the platform code, which we
> want to avoid when moving to DT-only booting.
> 
> Signed-off-by: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/net/cavium-pip.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/cavium-pip.txt b/Documentation/devicetree/bindings/net/cavium-pip.txt
> index 7dbd158..edbf411 100644
> --- a/Documentation/devicetree/bindings/net/cavium-pip.txt
> +++ b/Documentation/devicetree/bindings/net/cavium-pip.txt
> @@ -37,6 +37,10 @@ Properties for PIP port which is a child the PIP interface:
>  
>  - phy-handle: Optional, see ethernet.txt file in the same directory.
>  
> +- rx-delay: Delay value for RGMII receive clock. Optional. Disabled if 0.
> +
> +- tx-delay: Delay value for RGMII transmit clock. Optional. Disabled if 0.

What are the units? Use standard unit suffix if in ns, us, etc.

> +
>  Example:
>  
>  	pip@11800a0000000 {
> -- 
> 2.7.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
