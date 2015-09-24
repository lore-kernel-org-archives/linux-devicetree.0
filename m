From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] gpiolib: gpiod_hog remove separate name argument
Date: Thu, 24 Sep 2015 10:52:55 -0700
Message-ID: <CACRpkdb4EoA_oBSF46eYAZ-fbTEqaf=Q+wsGyKyrQZ9KB2B7cQ@mail.gmail.com>
References: <1440920686-6892-1-git-send-email-mpa@pengutronix.de>
	<1440920686-6892-3-git-send-email-mpa@pengutronix.de>
	<CACRpkdZrXEXtkPpgtrcjqP5jD+M0UOj5Wj69o4zYJQKihsY6Xg@mail.gmail.com>
	<20150924063931.GS32203@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20150924063931.GS32203@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, Chris Read <chrisrfq@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 23, 2015 at 11:39 PM, Markus Pargmann <mpa@pengutronix.de> wrote:

>> - Fixed that but noted that it just alters the call to gpiod_hog()
>>   in of_gpiochip_scan_hogs(), there is a local const char *name that
>>   should be removed too.
>
> The local const char *name is temporarily used in
> of_gpiochip_scan_hogs() to get the name from DT and assign it to the
> descriptor:
>         desc = of_parse_own_gpio(np, &name, &lflags, &dflags);
>         ...
>         else
>                 desc->name = name;

OK the problem is that this series is dependent on the
named GPIOs series. I want this series to stand alone,
because this series is not as controversial, and I want to
merge these initvals first.

Yours,
Linus Walleij
