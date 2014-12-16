From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: kirkwood: enable phy driver for SATA
 controller on 88f6192
Date: Tue, 16 Dec 2014 09:19:22 +0100
Message-ID: <20141216081922.GA1450@lunn.ch>
References: <20141215203724.GA22936@anne>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141215203724.GA22936@anne>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Evgeni Dobrev <evgeni-c3HRhe8yoGxdzLpqerNdyw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 15, 2014 at 09:37:24PM +0100, Evgeni Dobrev wrote:
> This patch enables the phy drivers for the SATA controller on Marvell's 88f6192. Without them it is not possible to use SATA drives attached to this processor.
> 
> Signed-off-by: Evgeni Dobrev <evgeni-c3HRhe8yoGxdzLpqerNdyw@public.gmane.org>

Acked-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

This should also go to stable.

     Andrew


> ---
>  arch/arm/boot/dts/kirkwood-6192.dtsi |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/kirkwood-6192.dtsi b/arch/arm/boot/dts/kirkwood-6192.dtsi
> index dd81508..bed2dec 100644
> --- a/arch/arm/boot/dts/kirkwood-6192.dtsi
> +++ b/arch/arm/boot/dts/kirkwood-6192.dtsi
> @@ -66,6 +66,8 @@
>  			interrupts = <21>;
>  			clocks = <&gate_clk 14>, <&gate_clk 15>;
>  			clock-names = "0", "1";
> +                        phys = <&sata_phy0>, <&sata_phy1>;
> +                        phy-names = "port0", "port1";
>  			status = "disabled";
>  		};
>  
> -- 
> 1.7.10.4
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
