From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] ARM: socfpga: dts: Add a ciu clock node for sdmmc
Date: Mon, 13 Apr 2015 10:10:37 +0200
Message-ID: <73wq1g30ua.fsf@unicorn.hi.pengutronix.de>
References: <1428699386-2622-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1428699386-2622-1-git-send-email-dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
Cc: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, setka-3PjVBYxTQDg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Hi!

dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org writes:
> From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>
> The CIU(Card Interface Unit) clock is used by the dw_mmc IP to clock an SD
> card. The ciu_clk is the sdmmc_clk passed through a fixed divider of 4. This patch
> adds the ciu_clk node and makes the sdmmc_clk it's parent.
>
> Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
>  arch/arm/boot/dts/socfpga.dtsi | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
> index d9176e6..25418ee 100644
> --- a/arch/arm/boot/dts/socfpga.dtsi
> +++ b/arch/arm/boot/dts/socfpga.dtsi
> @@ -451,6 +451,14 @@
>  						clk-phase = <0 135>;
>  					};
>  
> +					ciu_clk: ciu_clk {
> +						#clock-cells = <0>;
> +						compatible = "altr,socfpga-gate-clk";
> +						clocks = <&sdmmc_clk>;
> +						clk-gate = <0xa0 8>;
> +						fixed-divider = <4>;
> +					};
> +

Hm, is this correct? The clk-gate at 0xa0 is for the SDMMC_CLK, no?
Also, maybe the clock should be named "sdmmc_clk_divided" like in the
datasheet, so it is easier to find.

>  					nand_x_clk: nand_x_clk {
>  						#clock-cells = <0>;
>  						compatible = "altr,socfpga-gate-clk";
> @@ -635,7 +643,7 @@
>  			fifo-depth = <0x400>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> -			clocks = <&l4_mp_clk>, <&sdmmc_clk>;
> +			clocks = <&l4_mp_clk>, <&ciu_clk>;
>  			clock-names = "biu", "ciu";
>  		};
>  

Regards,
Steffen

-- 
Pengutronix e.K.                           | Steffen Trumtrar            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
