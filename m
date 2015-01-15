From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] gpio: max732x: Rewrite IRQ code to use irq_domain API
Date: Thu, 15 Jan 2015 18:03:23 +0100
Message-ID: <CACRpkdbH3xD0LbmkZB-ewc8rzhFmD=2FRMWA_L=Wrv9OxagedQ@mail.gmail.com>
References: <1421156505-16600-1-git-send-email-semen.protsenko@globallogic.com>
	<1421156505-16600-3-git-send-email-semen.protsenko@globallogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421156505-16600-3-git-send-email-semen.protsenko-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Semen Protsenko <semen.protsenko-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Zyngier <maz-20xNzvSXLT6hUMvJH42dtQ@public.gmane.org>, Grygorii Strashko <grygorii.strashko-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org>, Illia Smyrnov <illia.smyrnov-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 13, 2015 at 2:41 PM, Semen Protsenko
<semen.protsenko-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org> wrote:

> Signed-off-by: Semen Protsenko <semen.protsenko-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org>

This makes the code *so* much better so patch applied, naturally.

But...

>  config GPIO_MAX732X
>         tristate "MAX7319, MAX7320-7327 I2C Port Expanders"
>         depends on I2C
> +       select IRQ_DOMAIN

The most modern way would be to take another step and convert the
driver to GPIOLIB_IRQCHIP by stating

select GPIOLIB_IRQCHIP

here.

If you look at other drivers using GPIOLIB_IRQCHIP on an
i2c expander, say gpio-stmpe.c or gpio-tc3589x.c, you
can get a grip on how that works.

So please follow up with a patch converting the driver to
GPIOLIB_IRQCHIP on top of these patches :) if you
have time.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
