From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: always initialize *flags from of_get_named_gpio_flags
Date: Mon, 4 Jan 2016 08:49:30 +0100
Message-ID: <CACRpkdZpax1RKu44nR9qbDjDj32cJpSCvTcdjSknmWVbRSxN3g@mail.gmail.com>
References: <6037371.CvRA1dDj1l@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <6037371.CvRA1dDj1l@wuerfel>
Sender: linux-gpio-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 1, 2016 at 11:40 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> The of_get_named_gpio_flags() function does nothing other than returning
> an error when CONFIG_OF_GPIO is disabled, but that causes spurious
> warnings about possible use of uninitialized variables in any code that
> does not check the of_get_named_gpio_flags() return value before trying
> to use the flags:
>
> drivers/input/misc/rotary_encoder.c: In function 'rotary_encoder_probe':
> drivers/input/misc/rotary_encoder.c:223:28: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
> drivers/power/bq24735-charger.c: In function 'bq24735_charger_probe':
> drivers/power/bq24735-charger.c:227:12: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
> drivers/power/sbs-battery.c: In function 'sbs_probe':
> drivers/power/sbs-battery.c:782:17: warning: 'gpio_flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
>
> This changes the behavior of the inline helper to set the flags to zero
> when OF_GPIO is disabled, to avoid the warnings. In all cases I've
> encountered, we don't actually get to the place that uses the flags
> if CONFIG_OF is disabled because we won't enter the DT parser code.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied!

Yours,
Linus Walleij
