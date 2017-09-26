From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC] gpio: of: document gpio-init nodes
Date: Wed, 27 Sep 2017 01:57:05 +0200
Message-ID: <CACRpkdbhQF+18YtZk+ctjTOYLaOHjzWH_Y_erNCu2QmGLxqpGw@mail.gmail.com>
References: <20170922204138.29951-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170922204138.29951-1-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 22, 2017 at 10:41 PM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> Sometimes it is desirable to define a "safe" configuration for a GPIO in
> the device tree but let the operating system later still make use of
> this pin.
>
> This might for example be useful to initially configure a debug pin that
> is usually unconnected as output to prevent floating until it is used
> later.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

This makes perfect sense to me, and makes things simple, consistent
and easy to understand for DTS authors.

In my opinion.

But I would like to see some opinion from a DT maintainer, we need to
have some rough consensus on this.

Yours,
Linus Walleij
