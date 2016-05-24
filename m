From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V12 2/2] gpio: max77620: add gpio driver for MAX77620/MAX20024
Date: Tue, 24 May 2016 13:15:19 +0200
Message-ID: <CACRpkdbbij7Vj+5EDdb2E4neoGUr7Bk28jhKfFWvETTvyfYu7g@mail.gmail.com>
References: <1463116755-30469-1-git-send-email-ldewangan@nvidia.com>
	<1463116755-30469-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463116755-30469-3-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 13, 2016 at 7:19 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> MAXIM Semiconductor's PMIC, MAX77620/MAX20024 has 8 GPIO
> pins. It also supports interrupts from these pins.
>
> Add GPIO driver for these pins to control via GPIO APIs.
>
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

PS, please add these optional features:

> +       mgpio->gpio_chip.direction_input = max77620_gpio_dir_input;
> +       mgpio->gpio_chip.direction_output = max77620_gpio_dir_output;

Any chance you could send a patch to add a .get_direction() callback?

This is really useful for debugfs and the userspace ABI and I started
to add it to drivers all over the place.

Also you have this:

#define MAX77620_CNFG_GPIO_DRV_MASK             BIT(0)
#define MAX77620_CNFG_GPIO_DRV_PUSHPULL         BIT(0)
#define MAX77620_CNFG_GPIO_DRV_OPENDRAIN        0

So it seems possible to add .set_single_ended() to this driver
as well so it supports native open drain. Please consider this!

I am possibly adding .get_single_ended() to the API this next
kernel cycle as well, but that is for later.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
