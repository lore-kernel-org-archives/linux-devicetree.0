From: Pantelis Antoniou <pantelis.antoniou@gmail.com>
Subject: Re: [RFC Patch] gpio: add GPIO hogging mechanism
Date: Wed, 29 Oct 2014 10:53:44 +0200
Message-ID: <3D00ADB3-00B3-40A8-8263-444BCADDAC33@gmail.com>
References: <1413922198-29373-1-git-send-email-bparrot@ti.com>
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1413922198-29373-1-git-send-email-bparrot@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Benoit,

> On Oct 21, 2014, at 23:09 , Benoit Parrot <bparrot@ti.com> wrote:
>=20
> Based on Boris Brezillion work this is a reworked patch
> of his initial GPIO hogging mechanism.
> This patch provides a way to initally configure specific GPIO
> when the gpio controller is probe.
>=20
> The actual DT scanning to collect the GPIO specific data is performed
> as part of the gpiochip_add().
>=20
> The purpose of this is to allows specific GPIOs to be configured
> without any driver specific code.
> This particularly usueful because board design are getting
> increassingly complex and given SoC pins can now have upward
> of 10 mux values a lot of connections are now dependent on
> external IO muxes to switch various modes and combination.
>=20
> Specific drivers should not necessarily need to be aware of
> what accounts to a specific board implementation. This board level
> "description" should be best kept as part of the dts file.
>=20

This look like it=E2=80=99s going to the right direction. I have a few =
general
comments at first.

1) It relies on dubious DT binding of having sub-nodes of the
gpio device implicitly defining hogs.

2) There is no way for having hogs inserted dynamically as far as I can=
 tell, and
no way to remove a hog either.

3) I=E2=80=99m not very fond of having this being part of the gpio cont=
roller. This
configuration conceptually has little to do with the gpio controller pe=
r se,
it is more of a board specific thing. Why not come up with a gpio-hog d=
river that
references GPIOs? That way with a single gpio-hog driver instance you c=
ould setup
all the GPIO-hogging configuration for all GPIOs on the board, even one=
 that
lie on different GPIO controllers.


> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
> Documentation/devicetree/bindings/gpio/gpio.txt | 33 +++++++++
> drivers/gpio/gpiolib-of.c                       | 99 ++++++++++++++++=
+++++++++
> drivers/gpio/gpiolib.c                          | 81 ++++++++++++++++=
++++
> include/linux/of_gpio.h                         | 11 +++
> 4 files changed, 224 insertions(+)
>=20

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
