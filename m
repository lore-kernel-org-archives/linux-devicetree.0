From: Chris Moore <moore-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v2 02/18] arm64: dts: amlogic: Sort Makefile
Date: Sun, 14 May 2017 06:28:48 +0200
Message-ID: <2e9efe9b-6bfe-ab69-8811-c85e1a8ec9f9@free.fr>
References: <20170513143337.14278-1-afaerber@suse.de>
 <20170513143337.14278-3-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170513143337.14278-3-afaerber-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 13/05/2017 à 16:33, Andreas Färber a écrit :
> Sort the .dtb files alphabetically to make clear where to add new ones.
>
> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
> ---
>   v1 -> v2:
>   * Rebased (new boards added)
>   * Extended commit message
>   
>   arch/arm64/boot/dts/amlogic/Makefile | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index b9ad2db7398b..14fa27ccd589 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -7,15 +7,15 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-vega-s95-meta.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-vega-s95-telos.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-wetek-hub.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-wetek-play2.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-hwacom-amazetv.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-khadas-vim.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p230.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p231.dtb

s905d should be before s905x if you are imposing alphabetical order.

> -dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-hwacom-amazetv.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxm-nexbox-a1.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q200.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q201.dtb
> -dtb-$(CONFIG_ARCH_MESON) += meson-gxm-nexbox-a1.dtb
>   
>   always		:= $(dtb-y)
>   subdir-y	:= $(dts-dirs)


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
