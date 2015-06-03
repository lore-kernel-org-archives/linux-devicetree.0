From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 2/3] of: make CONFIG_OF user selectable
Date: Wed, 3 Jun 2015 08:40:35 +0200
Message-ID: <CAMuHMdXoku-fg-HM4B62b=VqiwGxVA-H8zDLJQ0+vH72Wm9kEw@mail.gmail.com>
References: <1433285204-4307-1-git-send-email-robh@kernel.org>
	<1433285204-4307-3-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433285204-4307-3-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Wed, Jun 3, 2015 at 12:46 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> With the addition of overlays, it is now plausible to use DT on any arch
> and without an arch using it at boot time. It is also desirable to
> expand the compile coverage of the DT code. Make CONFIG_OF user
> selectable by converting the menu to menuconfig.

Thanks!

> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Acked-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
with one minor docu nit below.

> ---
>  drivers/of/Kconfig | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 07bb3c8..415b51d 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -1,11 +1,10 @@
>  config DTC
>         bool
>
> -config OF
> -       bool
> +menuconfig OF
> +       bool "Device Tree and Open Firmware support"

This needs a help text. In "[PATCH 1/3] of: Allow OF to be enabled if
COMPILE_TEST to increase coverage", I had:

+         This option enables the device tree infrastructure.
+         If is automatically selected by platforms that need it, but can
+         be enabled manually to increase compile-coverage.

Feel free to adapt...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
