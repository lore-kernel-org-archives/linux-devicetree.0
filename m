From: Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/3] MAINTAINERS: Add entry for the Nuvoton NPCM architecture
Date: Mon, 4 Sep 2017 17:25:11 +0300
Message-ID: <CAP6Zq1husO0G+Prjn4Fge8icDhfO-kw0TdHDZ=wxFcpagD-6VA@mail.gmail.com>
References: <20170831225400.19756-1-brendanhiggins@google.com> <20170831225400.19756-4-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170831225400.19756-4-brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 1 September 2017 at 01:54, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> Add maintainers and reviewers for the Nuvoton NPCM architecture.
>
> Signed-off-by: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---
>  MAINTAINERS | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 44cb004c765d..67064bf11904 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1598,6 +1598,19 @@ F:       drivers/pinctrl/nomadik/
>  F:     drivers/i2c/busses/i2c-nomadik.c
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
>
> +ARM/NUVOTON NPCM ARCHITECTURE
> +M:     Avi Fishman <avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +M:     Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +R:     Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> +R:     Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> +L:     openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org (moderated for non-subscribers)
> +S:     Maintained
> +F:     arch/arm/mach-npcm/
> +F:     arch/arm/boot/dts/nuvoton-npcm*
> +F:     include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
> +F:     drivers/*/*npcm*
> +F:     Documentation/*/*npcm*
> +
>  ARM/NUVOTON W90X900 ARM ARCHITECTURE
>  M:     Wan ZongShun <mcuos.com-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  L:     linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
> --
> 2.14.1.581.gf28d330327-goog
>

Reviewed-by: Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Reviewed-by: Avi Fishman <avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Avi Fishman <avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
