From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1] of/irq: do irq resolution in platform_get_irq_byname()
Date: Wed, 11 Jun 2014 16:04:14 +0200
Message-ID: <CACRpkdadSYFG-KaVYmUnf+gKzFKgEQBhABK7RWVgUv=sX-Up-g@mail.gmail.com>
References: <1400582523-22684-1-git-send-email-grygorii.strashko@ti.com>
	<20140523080333.66720C4176E@trevor.secretlab.ca>
	<CAGa+x85mOHtNAj-UHgK2_z8zWAF=qwFcRcUgHTR-byNiX7heHA@mail.gmail.com>
	<CAL_JsqLm3wfVS+au+JUbhBhxz=LuVpepH6GxabCQhPowhbw77g@mail.gmail.com>
	<20140528071855.GJ4227@lee--X1>
	<CACRpkdYgkEOjLamYu5uKSgs3iTNJ-w5XkbeygKjRdR-bNdETfg@mail.gmail.com>
	<CAGb2v64f8Wju6dtVuVN2x=9YVGA-=RXozzhpJZNspKZ05f=jtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGb2v64f8Wju6dtVuVN2x=9YVGA-=RXozzhpJZNspKZ05f=jtA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 28, 2014 at 10:49 AM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:

> Log says musb is wrestling control over some pins with some other driver:
>
> [    1.441497] pinctrl-nomadik soc:pinctrl: pin GPIO256_AF28 already
> requested by a03e0000.usb_per5; cannot claim for musb-hdrc.0.auto
> [    1.453369] pinctrl-nomadik soc:pinctrl: pin-256 (musb-hdrc.0.auto)
> status -22
> [    1.460571] pinctrl-nomadik soc:pinctrl: could not request pin 256
> (GPIO256_AF28) from group usb_a_1  on device pinctrl-nomadik
> [    1.472076] musb-hdrc musb-hdrc.0.auto: Error applying setting,
> reverse things back
> [    1.479827] HS USB OTG: no transceiver configured
> [    1.484558] musb-hdrc musb-hdrc.0.auto: musb_init_controller failed
> with status -517
> [    1.492309] platform musb-hdrc.0.auto: Driver musb-hdrc requests
> probe deferral
> [    1.500183] pinctrl-nomadik soc:pinctrl: pin GPIO256_AF28 already
> requested by a03e0000.usb_per5; cannot claim for musb-hdrc.0.auto
> [    1.512023] pinctrl-nomadik soc:pinctrl: pin-256 (musb-hdrc.0.auto)
> status -22
> [    1.519226] pinctrl-nomadik soc:pinctrl: could not request pin 256
> (GPIO256_AF28) from group usb_a_1  on device pinctrl-nomadik
> [    1.530731] musb-ux500 musb-hdrc.0.auto: Error applying setting,
> reverse things back
> [    1.539184] pinctrl-nomadik soc:pinctrl: pin GPIO256_AF28 already
> requested by a03e0000.usb_per5; cannot claim for musb-hdrc.1.auto
> [    1.551025] pinctrl-nomadik soc:pinctrl: pin-256 (musb-hdrc.1.auto)
> status -22
> [    1.558258] pinctrl-nomadik soc:pinctrl: could not request pin 256
> (GPIO256_AF28) from group usb_a_1  on device pinctrl-nomadik
> [    1.569732] musb-hdrc musb-hdrc.1.auto: Error applying setting,
> reverse things back
> [    1.577453] HS USB OTG: no transceiver configured
>
> [ .. repeats until the end .. ]
>
> I think this is not related to this patch.

No that is fixed i this patch:
http://marc.info/?l=linux-usb&m=140239049219096&w=2

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
