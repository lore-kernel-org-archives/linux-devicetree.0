From: Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing-djzkFPsfvsizQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v7 4/6] ARM: meson: Add SMP bringup code for Meson8 and
 Meson8b
Date: Sat, 28 Oct 2017 23:08:41 +0200
Message-ID: <20171028210841.GQ2750@otheros>
References: <20170917164523.6970-5-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170917164523.6970-5-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Emiliano Ingrassia <ingrassia-rBIjXPeIPFWU+1/U8MakDg@public.gmane.org>, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index 47d3a1ab08d2..82faa958ab88 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -147,6 +147,7 @@ textofs-$(CONFIG_SA1111) := 0x00208000
>  endif
>  textofs-$(CONFIG_ARCH_MSM8X60) := 0x00208000
>  textofs-$(CONFIG_ARCH_MSM8960) := 0x00208000
> +textofs-$(CONFIG_ARCH_MESON) := 0x00208000
>  textofs-$(CONFIG_ARCH_AXXIA) := 0x00308000
>  
> # Machine directory name.  This list is sorted alphanumerically

Due to the observations made/explained here [0], would it make
sense to put this diff into an extra patch? With a
"Fixes: 4a69fcd3a108 ("ARM: meson: Add DTS for Odroid-C1 and Tronfy MXQ boards")"
and "Reported-by: Emiliano Ingrassia <ingrassia-rBIjXPeIPFWU+1/U8MakDg@public.gmane.org>"
maybe?

Regards, Linus

[0]: https://lkml.org/lkml/2017/10/28/148
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
