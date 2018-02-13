From: Gregory CLEMENT <gregory.clement-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 6/9] ARM: dts: kirkwood: Fix "debounce-interval" property misspelling
Date: Tue, 13 Feb 2018 17:17:42 +0100
Message-ID: <87d118q2xl.fsf@bootlin.com>
References: <1518531335-5170-1-git-send-email-geert+renesas@glider.be>
        <1518531335-5170-7-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518531335-5170-7-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org> (Geert
        Uytterhoeven's message of "Tue, 13 Feb 2018 15:15:32 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,
 
 On mar., févr. 13 2018, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org> wrote:

> "debounce_interval" was never supported.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied on mvebu/fixes with the Reviewed-by flag from Andrew Lunn

Thanks,

Gregory

> ---
> Please apply to your tree when appropriate.
>
>  arch/arm/boot/dts/kirkwood-pogoplug-series-4.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/kirkwood-pogoplug-series-4.dts b/arch/arm/boot/dts/kirkwood-pogoplug-series-4.dts
> index 5ce220ac9611fa78..5aa4669ae2548a8c 100644
> --- a/arch/arm/boot/dts/kirkwood-pogoplug-series-4.dts
> +++ b/arch/arm/boot/dts/kirkwood-pogoplug-series-4.dts
> @@ -35,7 +35,7 @@
>  		pinctrl-names = "default";
>  
>  		eject {
> -			debounce_interval = <50>;
> +			debounce-interval = <50>;
>  			wakeup-source;
>  			linux,code = <KEY_EJECTCD>;
>  			label = "Eject Button";
> -- 
> 2.7.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
