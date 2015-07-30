From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC] improve binding for linux,wdt-gpio
Date: Thu, 30 Jul 2015 23:30:39 +0200
Message-ID: <20150730213039.GR15360@pengutronix.de>
References: <1438115628-2819-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1438115628-2819-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

while hacking on the gpio driver I found yet another ambiguity:

On Tue, Jul 28, 2015 at 10:33:48PM +0200, Uwe Kleine-K=F6nig wrote:
> -  - level: Low or high level starts counting WDT timeout,
> -    the opposite level disables the WDT. Active level is determined
> -    by the GPIO flags.
The driver as is does the following when

	gpio =3D <&gpiocontroler 5 GPIO_ACTIVE_LOW>

is specified in the device tree:

	priv->active_low =3D flags & OF_GPIO_ACTIVE_LOW;

So active_low is 1 for us with the above device tree snippet.

Then in the disable callback the driver does:

	gpio_set_value_cansleep(priv->gpio, !priv->active_low);

so the gpio is set to 0 to disable the chip. I would have expected it
the other way round! (Is this only me?) So the documentation should
point that out that the active level of the GPIO is supposed to disable=
 the
chip.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
