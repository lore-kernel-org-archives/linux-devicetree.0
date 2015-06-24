From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH 7/9] arm: twr-k70f120m: IOMUX driver for Kinetis SoC
Date: Wed, 24 Jun 2015 12:21:22 +0200
Message-ID: <1435141282.4528.71.camel__21179.833848919$1435141324$gmane$org@tiscali.nl>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
	 <1435094387-20146-8-git-send-email-pawelo@king.net.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435094387-20146-8-git-send-email-pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nathan
Cc: Yuri Tikhonov <yur-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Sergei Poselenov <sposelenov-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Dmitry Cherkassov <d_cherkasov-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Alexander Potashev <aspotashev-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-06-23 at 23:19 +0200, Paul Osmialowski wrote:
> --- a/drivers/pinctrl/freescale/Kconfig
> +++ b/drivers/pinctrl/freescale/Kconfig
 
> +config PINCTRL_KINETIS
> +	bool "Kinetis pinctrl driver"
> +	depends on OF
> +	depends on SOC_K70
> +	select PINMUX
> +	help
> +	  Say Y here to enable the Kinetis pinctrl driver

> --- a/drivers/pinctrl/freescale/Makefile
> +++ b/drivers/pinctrl/freescale/Makefile

> +obj-$(CONFIG_PINCTRL_KINETIS)	+= pinctrl-kinetis.o

> --- /dev/null
> +++ b/drivers/pinctrl/freescale/pinctrl-kinetis.c

> +#include <linux/module.h>

> +static struct pinctrl_desc kinetis_pinctrl_desc = {
> +	[...]
> +	.owner = THIS_MODULE,
> +};

> +static void __exit kinetis_pinctrl_exit(void)
> +{
> +	platform_driver_unregister(&kinetis_pinctrl_driver);
> +}
> +module_exit(kinetis_pinctrl_exit);
> +
> +MODULE_DESCRIPTION("Freescale Kinetis pinctrl driver");
> +MODULE_LICENSE("GPL v2");

pinctrl-kinetis.o can only be built-in, right? But the code uses a few
module specific constructs. Did you mean to make PINCTRL_KINETIS
tristate instead?

Thanks,


Paul Bolle
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
