From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC Patch] gpio: add GPIO hogging mechanism
Date: Mon, 3 Nov 2014 10:43:46 +0100
Message-ID: <CACRpkda-HbKmN_RisHpWRV4bquwpBsd4RgaA5pW0qXrhYChRYA@mail.gmail.com>
References: <1413922198-29373-1-git-send-email-bparrot@ti.com>
	<3D00ADB3-00B3-40A8-8263-444BCADDAC33@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <3D00ADB3-00B3-40A8-8263-444BCADDAC33@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@gmail.com>
Cc: Benoit Parrot <bparrot@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 29, 2014 at 9:53 AM, Pantelis Antoniou
<pantelis.antoniou@gmail.com> wrote:

> 3) I=E2=80=99m not very fond of having this being part of the gpio co=
ntroller. This
> configuration conceptually has little to do with the gpio controller =
per se,
> it is more of a board specific thing. Why not come up with a gpio-hog=
 driver that
> references GPIOs? That way with a single gpio-hog driver instance you=
 could setup
> all the GPIO-hogging configuration for all GPIOs on the board, even o=
ne that
> lie on different GPIO controllers.

You have a point. But it's vital that we set up hogs at the same time a=
s the
gpio_chip is probed, not later, or there may be a race as to who
gets the GPIO line, and that should be avoided at any cost.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
