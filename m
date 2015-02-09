From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: gpio-pxa: getting GPIOs by devicetree phandle broken
Date: Mon, 9 Feb 2015 15:11:23 +0900
Message-ID: <CAAVeFu+yf6Wf6MspiDLiWwQkMwMvimNa0SpMK_yO_9X07UecEw@mail.gmail.com>
References: <CAOjnSCajhwdRVZUO99KL-9PF6HitZen04MoLKoDUDr_5=iS7kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAOjnSCajhwdRVZUO99KL-9PF6HitZen04MoLKoDUDr_5=iS7kw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Tyler Hall <tylerwhall@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Mack <zonque@gmail.com>, Hans Holmberg <hans.holmberg@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Howard Cochran <cochran@lexmark.com>, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: devicetree@vger.kernel.org

Adding Robert who reported the same thing.

On Sat, Feb 7, 2015 at 6:28 AM, Tyler Hall <tylerwhall@gmail.com> wrote:
> Hi,
>
> Commit 7b8792b ("gpiolib: of: Correct error handling in
> of_get_named_gpiod_flags") seems to break the ability to use DT
> bindings to reference this driver's GPIOs by phandle for banks above
> the first.
>
> The issue is that gpio-pxa registers multiple gpio chips - one for
> each bank - but they're all associated with the same DT node. The new
> behavior in of_gpiochip_find_and_xlate() causes gpiochip_find() to
> bail after the first chip matches and its xlate function fails.
> Previously it would try all chips associated with the phandle and
> pxa_gpio_of_xlate() would fail until it was called with the correct
> gpiochip.
>
> I think the new behavior of of_gpiochip_find_and_xlate() is reasonable,
> so I see a couple ways of fixing gpio-pxa.
>
> 1. Require child nodes in DT for each bank

This would break DT compatibility.

> 2. Refactor gpio-pxa to only register one gpiochip

Sounds better, especially since this would reflect the hardware more
accurately. One DT node should translate into one GPIO chip. The
problem is that I'm afraid several other drivers are doing the same
thing and thus are now similarly broken.

The following is also likely to work as a workaround, but I would not
go as far as saying this should be taken as a fix. Hans, since you
wrote 7b8792b, could we have your input on this?

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 08261f2b3a82..a09095531b00 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -45,14 +45,16 @@ static int of_gpiochip_find_and_xlate(struct
gpio_chip *gc, void *data)
                return false;

        ret = gc->of_xlate(gc, &gg_data->gpiospec, gg_data->flags);
-       if (ret < 0) {
+       if (ret == -EPROBE_DEFER) {
                /* We've found the gpio chip, but the translation failed.
                 * Return true to stop looking and return the translation
                 * error via out_gpio
                 */
                gg_data->out_gpio = ERR_PTR(ret);
                return true;
-        }
+       } else if (ret < 0) {
+               return false;
+       }

        gg_data->out_gpio = gpiochip_get_desc(gc, ret);
        return true;
