From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: orion5x: fix Makefile for linkstation-lschl.dtb
Date: Thu, 02 Feb 2017 14:05:49 +0100
Message-ID: <87wpd8wxn6.fsf@free-electrons.com>
References: <20170202113856.728043-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170202113856.728043-1-arnd-r2nGTMty4D4@public.gmane.org> (Arnd Bergmann's message
        of "Thu, 2 Feb 2017 12:38:33 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Roger Shimizu <rogershimizu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,
 
 On jeu., févr. 02 2017, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:

> The rename of orion5x-lschl.dts needs to be reflected in the Makefile:
>
> make[3]: *** No rule to make target
> 'arch/arm/boot/dts/orion5x-lschl.dtb', needed by '__build'.

Sorry for that, I did a make dtbs but with the wrong config, (mvebu_v7)
:(

The offending patch is in my mvebu/fixes branch that you didn't applied
yet. How do you want to proceed?

Will you applied this patch just after merging tags/mvebu-fixes-4.10-1 ?

Do you want I resubmit a PR with your patch?

In this case I could also squash your patch in the offending patch.

In any case, if needed you can add my

Acked-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks,

Gregory


>
> Fixes: 6cfd3cd8d836 ("ARM: dts: orion5x-lschl: More consistent naming on linkstation series")
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 10eec600cf6b..47208fc5a750 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -633,7 +633,7 @@ dtb-$(CONFIG_ARCH_ORION5X) += \
>  	orion5x-lacie-ethernet-disk-mini-v2.dtb \
>  	orion5x-linkstation-lsgl.dtb \
>  	orion5x-linkstation-lswtgl.dtb \
> -	orion5x-lschl.dtb \
> +	orion5x-linkstation-lschl.dtb \
>  	orion5x-lswsgl.dtb \
>  	orion5x-maxtor-shared-storage-2.dtb \
>  	orion5x-netgear-wnr854t.dtb \
> -- 
> 2.9.0
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
