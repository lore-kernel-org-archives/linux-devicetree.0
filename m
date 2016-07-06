From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH] gpio: document how to order GPIO controllers
Date: Wed, 06 Jul 2016 09:54:03 +0200
Message-ID: <7356797.MVQep4sf2D@ws-stein>
References: <1467355333-8813-1-git-send-email-u.kleine-koenig@pengutronix.de> <20160705140546.GA10601@rob-hp-laptop> <20160705180447.GP16643@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160705180447.GP16643@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, kernel@pengutronix.de, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tuesday 05 July 2016 20:04:47, Uwe Kleine-K=F6nig wrote:
> That is we have:
>=20
> 	Hardware name | software gpiochip
> 	    GPIO4     |      gpiochip0
> 	    GPIO3     |      gpiochip1
> 	    GPIO1     |      gpiochip2
> 	    GPIO2     |	     gpiochip3
>=20
> I bet that's the probe order because when sorted by address (and so
> by order in the device tree) we have exactly this ordering. (Compare
> with $(grep gpio@ arch/arm/boot/dts/imx25.dtsi).)

This is rather straight forward and rather simple for controller intern=
al GPIO=20
controllers but when using GPIO expanders both on SPI and I2C thing wil=
l get=20
much more volatile especially on SMP systems. What would be the correct=
=20
"order" here? Unless they are cascaded they are independent and there i=
s no=20
such thing as an order. Probe order _is_ unpredictable so they will var=
y on=20
different boots. Having 4 internal GPIO controllers which creates 4 gpi=
ochips=20
with more or less fixed names is rather a special case. Dunno if they m=
ight=20
change on a SMP system. Can a driver probe be called multiple times=20
simultaneously? Well, when drivers are used as modules I think things a=
re even=20
more unpredictable.

> For a new interface this is OK, still I predict users will complain i=
f
> the numbers used don't match naturally the hardware names. And IMHO t=
hey
> are right.

Given the fact that hardware names and gpiochip number relation is not =
fixed=20
IMHO the simplest way to identify them is using the DT label. You need =
them=20
anyway to identify them in DT itself at other places why not using this=
 on=20
Linux userspace too? So gpiochip[0-9]* should still be created but usin=
g udev=20
you can create appropriate symlinks with more recognizable names.

Best regards,
Alexander

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
