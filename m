From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/5] powerpc/mpc85xx: Update TMU device tree node for
 T1040/T1042
Date: Mon, 24 Oct 2016 16:36:55 +0800
Message-ID: <20161024083654.GB30578@tiger>
References: <1475995626-14049-1-git-send-email-hongtao.jia@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1475995626-14049-1-git-send-email-hongtao.jia-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jia Hongtao <hongtao.jia-3arQi8VN3Tc@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, scott.wood-3arQi8VN3Tc@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Oct 09, 2016 at 02:47:02PM +0800, Jia Hongtao wrote:
> From: Hongtao Jia <hongtao.jia-3arQi8VN3Tc@public.gmane.org>
> 
> SoC compatible string and endianness property are added according to the
> new bindings.

The commit log doesn't seem to match the actual changes.  Same for patch
2/5.

Shawn

> 
> Signed-off-by: Jia Hongtao <hongtao.jia-3arQi8VN3Tc@public.gmane.org>
> ---
> Changes for V2:
> * Rebase on latest linux-next tree (next-20161006).
> 
>  arch/powerpc/boot/dts/fsl/t1040si-post.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
> index 44e399b..145c7f4 100644
> --- a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
> @@ -526,7 +526,7 @@
>  
>  				       0x00030000 0x00000012
>  				       0x00030001 0x0000001d>;
> -		#thermal-sensor-cells = <0>;
> +		#thermal-sensor-cells = <1>;
>  	};
>  
>  	thermal-zones {
> @@ -534,7 +534,7 @@
>  			polling-delay-passive = <1000>;
>  			polling-delay = <5000>;
>  
> -			thermal-sensors = <&tmu>;
> +			thermal-sensors = <&tmu 2>;
>  
>  			trips {
>  				cpu_alert: cpu-alert {
> -- 
> 2.1.0.27.g96db324
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
