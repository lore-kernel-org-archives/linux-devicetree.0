From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] serial: fsl-imx-uart: Fix typo in fsl,dte-mode
 description
Date: Thu, 3 Mar 2016 17:38:49 -0600
Message-ID: <20160303233849.GA14288@rob-hp-laptop>
References: <1454701462-4859-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1454701462-4859-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 05, 2016 at 05:44:22PM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> 
> We should say "The uart works in DCE mode".
> 
> Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/serial/fsl-imx-uart.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/fsl-imx-uart.txt b/Documentation/devicetree/bindings/serial/fsl-imx-uart.txt
> index 35ae1fb..ed94c21 100644
> --- a/Documentation/devicetree/bindings/serial/fsl-imx-uart.txt
> +++ b/Documentation/devicetree/bindings/serial/fsl-imx-uart.txt
> @@ -9,7 +9,7 @@ Optional properties:
>  - fsl,uart-has-rtscts : Indicate the uart has rts and cts
>  - fsl,irda-mode : Indicate the uart supports irda mode
>  - fsl,dte-mode : Indicate the uart works in DTE mode. The uart works
> -                  is DCE mode by default.
> +                  in DCE mode by default.
>  
>  Note: Each uart controller should have an alias correctly numbered
>  in "aliases" node.
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
