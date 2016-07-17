From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] gpio: document how to order GPIO controllers
Date: Sun, 17 Jul 2016 17:03:09 -0500
Message-ID: <20160717220309.GA22711@rob-hp-laptop>
References: <1467355333-8813-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20160705140546.GA10601@rob-hp-laptop>
 <20160705180447.GP16643@pengutronix.de>
 <CACRpkdbH+KRXbxFdfyAE44fBNctK4cWV+KRLwQBTzSGLvLMEDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbH+KRXbxFdfyAE44fBNctK4cWV+KRLwQBTzSGLvLMEDg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <kernel@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 06, 2016 at 11:34:37AM +0200, Linus Walleij wrote:
> On Tue, Jul 5, 2016 at 8:04 PM, Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > [Rob]:
>=20
> >> Like SPI and I2C, I'm against further abuse of aliases for this pu=
rpose
> >> [1].
>=20
> So what about the usecase for serial ports, where we use this
> to make sure the console come out where we want it? Is that
> also considered abuse or legitimate use? Note: I'm not trying to be
> snarky, I'm trying to understand what is the right and wrong use
> of alias. I'm confused about it right now :(

I guess it comes down to how ingrained the usage of any numbering is.=20
=46or consoles, it was pretty important to maintain numbering and no=20
alternative. But now with stdout-path that is less important. Perhaps i=
f=20
you have inittab with tty devices, then it is still needed.

So I guess I would summarize the requirement to be only cases needing t=
o=20
maintain numbering for existing userspace. The only users really caring=
=20
about this have been on N900.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
