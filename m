From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH 2/6] pinctrl: sunxi: add allwinner A33 PIO
 controller support
Date: Mon, 11 May 2015 09:22:16 +0200
Message-ID: <1431328936.2398.67.camel@x220>
References: <1431240383-12763-1-git-send-email-vishnupatekar0510@gmail.com>
	 <1431240383-12763-3-git-send-email-vishnupatekar0510@gmail.com>
Reply-To: pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJLF25T6MIBBL5RYGVAKGQE5IG6N7Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1431240383-12763-3-git-send-email-vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 2015-05-10 at 12:16 +0530, Vishnu Patekar wrote:
> --- a/drivers/pinctrl/sunxi/Kconfig
> +++ b/drivers/pinctrl/sunxi/Kconfig

> +

(Unneeded white line.)

> +config PINCTRL_SUN8I_A33
> +	def_bool MACH_SUN8I
> +	select PINCTRL_SUNXI_COMMON

> --- a/drivers/pinctrl/sunxi/Makefile
> +++ b/drivers/pinctrl/sunxi/Makefile

> +obj-$(CONFIG_PINCTRL_SUN8I_A33)		+= pinctrl-sun8i-a33.o

PINCTRL_SUN8I_A33 is a bool symbol, so pinctrl-sun8i-a33.o will never be
part of a module, right?

> --- /dev/null
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-a33.c
> @@ -0,0 +1,513 @@

> +#include <linux/module.h>

> +MODULE_DEVICE_TABLE(of, sun8i_a33_pinctrl_match);
> +
> +static struct platform_driver sun8i_a33_pinctrl_driver = {
> +	.probe	= sun8i_a33_pinctrl_probe,
> +	.driver	= {
> +		.name		= "sun8i-a33-pinctrl",
> +		.of_match_table	= sun8i_a33_pinctrl_match,
> +	},
> +};
> +module_platform_driver(sun8i_a33_pinctrl_driver);

(The series starting at https://lkml.org/lkml/2015/5/10/131 would allow
to use builtin_platform_driver() for  built-in only code.)

> +MODULE_AUTHOR("Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>");
> +MODULE_DESCRIPTION("Allwinner a33 pinctrl driver");
> +MODULE_LICENSE("GPL");

This adds some module specific boilerplate. Was it perhaps your
intention to make PINCTRL_SUN8I_A33 a tristate symbol? If I understand
Maxime correctly drivers like these can be made modular (see
https://lkml.org/lkml/2015/5/9/96 ).

Thanks,


Paul Bolle
