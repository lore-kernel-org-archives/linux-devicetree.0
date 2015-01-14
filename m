From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC] pinctrl: at91
Date: Wed, 14 Jan 2015 13:26:16 +0100
Message-ID: <CACRpkda9wTPcRy6nRGP08rDpHV=tRyYVuD80TeO2zFGzX+aJcg@mail.gmail.com>
References: <CACRpkdbkUUzVVMp14szY+vGNd+d+8bL066STh_XMGud-UsFBqA@mail.gmail.com>
	<1418637470-5839-1-git-send-email-ludovic.desroches@atmel.com>
	<54943933.60102@atmel.com>
	<20150106093706.GC26982@ldesroches-Latitude-E6320>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150106093706.GC26982@ldesroches-Latitude-E6320>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 6, 2015 at 10:37 AM, Ludovic Desroches
<ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:

> Usage of of_gpiochip_add() only solves my issue about gpio but not about
> pinctrl stuff, I still need a patch to manage the case when we have a gap if
> a gpio controller is not enabled to not break the pin naming, etc.

This has been the topic of many threads today.
I assume you are talking about keeping GPIO numbers
consistent.

- My suggestion is to add alias handling of the GPIO chips
  to the core so they can be probed in the right order.

- For consistency in sysfs use the "names" array in
  struct gpio_chip so you can search for a symbolic
  name in sysfs and don't have to rely on fragile stuff
  like GPIO numbers.

- Partake in the development of a new GPIO ABI
  that does not use the global GPIO numberspace.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
