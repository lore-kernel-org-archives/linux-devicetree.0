From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: mfd: mc13xxx: Add the unit address to sysled
Date: Mon, 4 Dec 2017 09:07:21 +0000
Message-ID: <20171204090721.tgffux64kv3hecaq@dell>
References: <1512165086-25512-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1512165086-25512-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 01 Dec 2017, Fabio Estevam wrote:

> From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> 
> As the 'reg' property is mandatory in the subnodes, improve the
> example by adding the unit address to the sysled node.
> 
> This prevents the following build warning with W=1:
> 
> Node /soc/aips@70000000/spba@70000000/ecspi@70010000/pmic@0/leds/sysled0 has a reg or ranges property, but no unit name
> 
> Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/mc13xxx.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Why do I have 2 identical patches in my inbox?

> diff --git a/Documentation/devicetree/bindings/mfd/mc13xxx.txt b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
> index ac235fe..8261ea7 100644
> --- a/Documentation/devicetree/bindings/mfd/mc13xxx.txt
> +++ b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
> @@ -130,7 +130,7 @@ ecspi@70010000 { /* ECSPI1 */
>  			#size-cells = <0>;
>  			led-control = <0x000 0x000 0x0e0 0x000>;
>  
> -			sysled {
> +			sysled@3 {
>  				reg = <3>;
>  				label = "system:red:live";
>  				linux,default-trigger = "heartbeat";

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
