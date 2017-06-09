From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH] gpio: use "output-active" and "output-inactive" for gpio-hogs
Date: Fri, 9 Jun 2017 15:53:10 +0200
Message-ID: <CACRpkdY2ECd6e=kE3HWOP3xJFUm6VbrF+0Ds10ax7XsybRkQLA@mail.gmail.com>
References: <20170604101049.4592-1-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170604101049.4592-1-uwe@kleine-koenig.org>
Sender: linux-gpio-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 4, 2017 at 12:10 PM, Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.o=
rg> wrote:

>  - input:      A property specifying to set the GPIO direction as input.
> -- output-low  A property specifying to set the GPIO direction as output =
with
> -             the value low.
> -- output-high A property specifying to set the GPIO direction as output =
with
> -             the value high.
> +- output-inactive: A property specifying to set the GPIO direction as ou=
tput
> +             using the inactive level as value.
> +- output-active: A property specifying to set the GPIO direction as outp=
ut
> +             using the active level as value.
> +- output-low  A deprecated alias for "output-inactive".
> +- output-high A deprecated alias for "output-active".

Wouldn't "output-asserted" / "output-deasserted" be more to the point?

If the majority prefers "active" I can live with that too.

Yours,
Linus Walleij
