From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] gpio: dwapb: Use human understandable gpio numbering.
Date: Thu, 16 Jul 2015 09:50:44 +0200
Message-ID: <CACRpkdY+prqSeohT5BEoOKS6sfXdFTA6ZzuKzH4GSPX5jcjgzA@mail.gmail.com>
References: <cover.1435777856.git.rcochran@linutronix.de>
	<d6b5ce85a17164970d454583560e07f7aed7b8ca.1435777856.git.rcochran@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d6b5ce85a17164970d454583560e07f7aed7b8ca.1435777856.git.rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 1, 2015 at 9:34 PM, Richard Cochran
<richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> The system-on-chips using this IP core have well defined gpio numbers.
> Instead of using random numbers, this patch lets the device tree specify
> the correct gpio numbering.
>
> Signed-off-by: Richard Cochran <rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
(...)
> +- snps,base : The base gpio number.

NACK. And it has been NACKed before again and again, search
the mailinglist for repetitive answers.

The GPIO numbers inside the Linux kernel are Linux specific and
have nothing to do with the hardware numbers. If they sometimes
match it is a lucky coincidence. The same goes for IRQ numbers
in the kernel FWIW.

So this "binding" has nothing to do with describing the hardware,
which device tree is for. If it ever comes to exist it needs to be
a "linux-*" property. But I doubt it will.

We are working to remove dependency on them by introducing GPIO
descriptors and thinking heavily about how to handle the userspace
sysfs ABI moving forward. But for the ABI the numbers just need to
be stable, not intuitive.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
