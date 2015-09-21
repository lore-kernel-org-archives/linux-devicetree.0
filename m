From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] gpiolib: gpiod_hog remove separate name argument
Date: Mon, 21 Sep 2015 16:28:48 -0700
Message-ID: <CACRpkdZrXEXtkPpgtrcjqP5jD+M0UOj5Wj69o4zYJQKihsY6Xg@mail.gmail.com>
References: <1440920686-6892-1-git-send-email-mpa@pengutronix.de>
	<1440920686-6892-3-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1440920686-6892-3-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, chrisrfq@gmail.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 30, 2015 at 12:44 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> The gpio name is now stored in the gpio descriptor, so we can simply use
> that instead of an argument to the function.
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

Several problems with this patch:

- Does not apply to v4.3-rc1
- Fixed that but noted that it just alters the call to gpiod_hog()
  in of_gpiochip_scan_hogs(), there is a local const char *name that
  should be removed too.
- Looking at of_get_gpio_hog() it is unclear to me that .name
  is set in the gpio_desc as desired. Please check this.

  Crucial code looks like this:

    if (name && of_property_read_string(np, "line-name", name))
        *name = np->name;

  i.e. is the line-name really propagated to gpiod->name?
  Are you sure you have tested this with a DTS using line-name
  and verified that it propagates properly?

Yours,
Linus Walleij
