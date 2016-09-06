From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/3] arm64: dts: berlin4ct: add missing unit name to /soc
 node
Date: Tue, 6 Sep 2016 11:22:08 +0100
Message-ID: <20160906102208.GB1425@leverpostej>
References: <20160906085557.4019-1-jszhang@marvell.com>
 <20160906085557.4019-2-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160906085557.4019-2-jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 06, 2016 at 04:55:55PM +0800, Jisheng Zhang wrote:
> This patch fixes the following DTC warning with W=1:
> 
> "Node /soc has a reg or ranges property, but no unit name"
> 
> Signed-off-by: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>

The node is only compatible with simple-bus, and so shouldn't have a
reg.

Why not remove the reg?

Mark

> ---
>  arch/arm64/boot/dts/marvell/berlin4ct.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> index 099ad93..2d6f91f 100644
> --- a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> +++ b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> @@ -134,7 +134,7 @@
>  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>  	};
>  
> -	soc {
> +	soc@f7000000 {
>  		compatible = "simple-bus";
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> -- 
> 2.9.3
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
