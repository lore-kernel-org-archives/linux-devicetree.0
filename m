From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] gpio: Use __gpiod_request directly
Date: Mon, 21 Sep 2015 14:41:37 -0700
Message-ID: <CACRpkdbSMZxBafCnZ5VYd+k=_4gVob6Xu1kOdvhuO0GyV1M+dw@mail.gmail.com>
References: <1440920686-6892-1-git-send-email-mpa@pengutronix.de>
	<1440920686-6892-2-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1440920686-6892-2-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, chrisrfq@gmail.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 30, 2015 at 12:44 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> There is no reason to find out chip and hwnum to use to request a gpio
> and get another gpio descriptor. We already have the descriptor we want
> to use so we can directly use it.
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

Patch applied with Uwe's ACK.

Yours,
Linus Walleij
