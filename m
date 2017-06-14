From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH V3 2/3] watchdog: uniphier: add UniPhier watchdog driver
Date: Wed, 14 Jun 2017 12:07:31 +0900
Message-ID: <CAK7LNASq9MxUwDrNeRrg_eNkJbXR2J-9hHKGZe6-DtioO3p4cQ@mail.gmail.com>
References: <1497316499-22254-1-git-send-email-hayashibara.keiji@socionext.com>
 <1497316499-22254-3-git-send-email-hayashibara.keiji@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497316499-22254-3-git-send-email-hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Kiyoshi Owada <owada.kiyoshi-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hayashibara-san


2017-06-13 10:14 GMT+09:00 Keiji Hayashibara
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 52a70ee..2a9d9a6 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -744,6 +744,17 @@ config ZX2967_WATCHDOG
>           To compile this driver as a module, choose M here: the
>           module will be called zx2967_wdt.
>
> +config UNIPHIER_WATCHDOG
> +       tristate "UniPhier watchdog support"
> +       depends on ARCH_UNIPHIER || COMPILE_TEST

This driver relies on syscon_node_to_regmap().
Could you also add "depends on OF && MFD_SYSCON" ?




> +       select WATCHDOG_CORE
> +       help
> +         Say Y here to include support watchdog timer embedded
> +         into the UniPhier system.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called uniphier_wdt.
> +



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
