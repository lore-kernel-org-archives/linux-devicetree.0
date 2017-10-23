From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 6/6] ARM: dts: imx53-tx53: Fix 'ethernet-phy@0' node
 with unit name and no reg property
Date: Mon, 23 Oct 2017 08:38:10 +0800
Message-ID: <20171023003808.GC8700@dragon>
References: <1508514507-30736-1-git-send-email-marco.franchi@nxp.com>
 <1508514507-30736-6-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1508514507-30736-6-git-send-email-marco.franchi-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 20, 2017 at 01:48:27PM -0200, Marco Franchi wrote:
> The following build warning is seen with W=1:
> 
> Warning (unit_address_vs_reg): Node /soc/aips@60000000/ethernet@63fec000/ethernet-phy@0 has a unit name, but no reg property
> 
> Fix this warning by adding reg property from such node.
> 
> Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>

I'm not sure if you tested the change, but I'm seeing the following
warning.

Warning (reg_format): "reg" property in
/soc/aips@60000000/ethernet@63fec000/ethernet-phy@0 has invalid length
(4 bytes) (#address-cells == 2, #size-cells == 1)

Shawn

> ---
> Changes since v2:
> -change message log
> -add reg property
>  arch/arm/boot/dts/imx53-tx53.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/imx53-tx53.dtsi b/arch/arm/boot/dts/imx53-tx53.dtsi
> index 76e7186..61ecd13 100644
> --- a/arch/arm/boot/dts/imx53-tx53.dtsi
> +++ b/arch/arm/boot/dts/imx53-tx53.dtsi
> @@ -226,6 +226,7 @@
>  	status = "okay";
>  
>  	phy0: ethernet-phy@0 {
> +		reg = <0>;
>  		interrupts-extended = <&gpio2 4 IRQ_TYPE_EDGE_FALLING>;
>  		device_type = "ethernet-phy";
>  	};
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
