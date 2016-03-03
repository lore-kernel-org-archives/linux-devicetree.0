From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH -trivial] devicetree: bindings: ARM: Use "uV" for
 micro-volt
Date: Thu, 3 Mar 2016 17:39:04 -0600
Message-ID: <20160303233904.GA14751@rob-hp-laptop>
References: <1455540282-23619-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455540282-23619-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jiri Kosina <trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 15, 2016 at 01:44:42PM +0100, Geert Uytterhoeven wrote:
> The binding documentation uses both "uVolt" and "uV" for micro-volt.
> Improve consistency by settling on "uV".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/arm/cpus.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
> index ae9be074d09f66d5..afcf50f050ad3f56 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.txt
> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> @@ -250,7 +250,7 @@ nodes to be present and contain the properties described below.
>  		Usage: optional
>  		Value type: <prop-encoded-array>
>  		Definition: A u32 value that represents the running time dynamic
> -			    power coefficient in units of mW/MHz/uVolt^2. The
> +			    power coefficient in units of mW/MHz/uV^2. The
>  			    coefficient can either be calculated from power
>  			    measurements or derived by analysis.
>  
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
