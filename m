From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] of: Allow OF to be enabled if COMPILE_TEST to
 increase coverage
Date: Mon, 6 Apr 2015 08:13:07 -0500
Message-ID: <CAL_JsqLQrNEpqWnqP4uDV0x87wERLC50FO-06fYBwLbyYsChpQ@mail.gmail.com>
References: <1428245965-19618-1-git-send-email-geert@linux-m68k.org> <1428245965-19618-2-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428245965-19618-2-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+Pantelis

On Sun, Apr 5, 2015 at 9:59 AM, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> Currently the OF configuration symbol is explicitly selected on
> architectures that support device trees and/or Open Firmware.
> However, there's no technical reason to limit the device tree
> infrastructure to these architectures. Hence allow OF to be enabled when
> compile testing, to increase compile coverage.
>
> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> ---
>  drivers/of/Kconfig | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 7bcaeec876c0c3a5..4c98f14694458794 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -2,7 +2,11 @@ config DTC
>         bool
>
>  config OF
> -       bool
> +       bool "Device Tree and Open Firmware support" if COMPILE_TEST

Actually, I think we want to just make this always visible. There are
now use cases with overlays where we may want to enable DT even if the
architecture is not booting with DT. However, there may be more work
needed to do that.

Rob

> +       help
> +         This option enables the device tree infrastructure.
> +         If is automatically selected by platforms that need it, but can
> +         be enabled manually to increase compile-coverage.
>
>  menu "Device Tree and Open Firmware support"
>         depends on OF
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
