From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM: davinci_all_defconfig: enable dumb vga-dac drm bridge
Date: Tue, 3 Jan 2017 10:03:32 +0100
Message-ID: <CAMpxmJVy34eLEGrrdo2TqPU=GSXi3YV2TJphbz1K3gHjatq7Cw@mail.gmail.com>
References: <1480065182-7095-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480065182-7095-1-git-send-email-bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2016-11-25 10:13 GMT+01:00 Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>:
> This enables the dumb-vga-dac driver by default for davinci boards.
>
> The driver is needed for tilcdc support on da850-lcdk board.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/configs/davinci_all_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
> index b5e978f..ab1bf18 100644
> --- a/arch/arm/configs/davinci_all_defconfig
> +++ b/arch/arm/configs/davinci_all_defconfig
> @@ -127,6 +127,8 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
>  CONFIG_REGULATOR_TPS6507X=y
>  CONFIG_DRM=m
>  CONFIG_DRM_TILCDC=m
> +CONFIG_DRM_BRIDGE=y
> +CONFIG_DRM_DUMB_VGA_DAC=m
>  CONFIG_FB=y
>  CONFIG_FIRMWARE_EDID=y
>  CONFIG_FB_DA8XX=y
> --
> 2.9.3
>

Hi Sekhar,

ping for this patch - it's been stuck on the list since November. I
suppose it got lost in your queue.

Thanks,
Bartosz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
