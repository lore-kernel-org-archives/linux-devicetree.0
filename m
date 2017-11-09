From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: mfd: mc13xxx: Remove obsolete property
Date: Thu, 9 Nov 2017 08:56:53 +0000
Message-ID: <20171109085653.hbmjw5f4rbou6f7x@dell>
References: <1505922711-22070-1-git-send-email-fabio.estevam@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1505922711-22070-1-git-send-email-fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 20 Sep 2017, Fabio Estevam wrote:

> The 'fsl,spi-num-chipselects' property is obsolete according to 
> Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt, so remove
> it from the example.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/mc13xxx.txt | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/mc13xxx.txt b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
> index 39ba414..ac235fe 100644
> --- a/Documentation/devicetree/bindings/mfd/mc13xxx.txt
> +++ b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
> @@ -113,7 +113,6 @@ MC13892 regulators:
>  Examples:
>  
>  ecspi@70010000 { /* ECSPI1 */
> -	fsl,spi-num-chipselects = <2>;
>  	cs-gpios = <&gpio4 24 0>, /* GPIO4_24 */
>  		   <&gpio4 25 0>; /* GPIO4_25 */
>  

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
