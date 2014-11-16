From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv2 4/8] arm: mvebu: use recently introduced uart label for
 stdout-path
Date: Sun, 16 Nov 2014 22:02:33 +0100
Message-ID: <20141116210233.GI15870@lunn.ch>
References: <cover.1416158990.git.arno@natisbad.org>
 <8b2c3e42793a9276e7b8ded0623675b95a5f68c2.1416158990.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8b2c3e42793a9276e7b8ded0623675b95a5f68c2.1416158990.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Nov 16, 2014 at 06:37:25PM +0100, Arnaud Ebalard wrote:
> 
> Now that labels for uartX are available in Marvell Armada .dtsi files,
> this patch replaces the "/soc/internal-regs/serial@12000" found in
> armada-xp-lenovo-ix4-300d.dts file for stdout-path property by the more
> concise &uart0.
> 
> Suggested-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>

Acked-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

Thanks for the patch

       Andrew

> ---
>  arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
> index 469cf7137595..cccf54784c4c 100644
> --- a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
> +++ b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
> @@ -22,7 +22,7 @@
>  
>  	chosen {
>  		bootargs = "console=ttyS0,115200 earlyprintk";
> -		stdout-path = "/soc/internal-regs/serial@12000";
> +		stdout-path = &uart0;
>  	};
>  
>  	memory {
> -- 
> 2.1.1
> 
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
