From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [RFC Patch] gpio: add GPIO hogging mechanism
Date: Wed, 29 Oct 2014 11:34:45 -0500
Message-ID: <20141029163445.GB29965@ti.com>
References: <1413922198-29373-1-git-send-email-bparrot@ti.com>
 <3D00ADB3-00B3-40A8-8263-444BCADDAC33@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3D00ADB3-00B3-40A8-8263-444BCADDAC33@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Pantelis,

Thanks for the feedback.

Pantelis Antoniou <pantelis.antoniou@gmail.com> wrote on Wed [2014-Oct-=
29 10:53:44 +0200]:
> Hi Benoit,
>=20
> > On Oct 21, 2014, at 23:09 , Benoit Parrot <bparrot@ti.com> wrote:
> >=20
> > Based on Boris Brezillion work this is a reworked patch
> > of his initial GPIO hogging mechanism.
> > This patch provides a way to initally configure specific GPIO
> > when the gpio controller is probe.
> >=20
> > The actual DT scanning to collect the GPIO specific data is perform=
ed
> > as part of the gpiochip_add().
> >=20
> > The purpose of this is to allows specific GPIOs to be configured
> > without any driver specific code.
> > This particularly usueful because board design are getting
> > increassingly complex and given SoC pins can now have upward
> > of 10 mux values a lot of connections are now dependent on
> > external IO muxes to switch various modes and combination.
> >=20
> > Specific drivers should not necessarily need to be aware of
> > what accounts to a specific board implementation. This board level
> > "description" should be best kept as part of the dts file.
> >=20
>=20
> This look like it=E2=80=99s going to the right direction. I have a fe=
w general
> comments at first.
>=20
> 1) It relies on dubious DT binding of having sub-nodes of the
> gpio device implicitly defining hogs.

I think in this instance the nodes are explicitly defining hogs.
Please clarify. What would you like to see here?
>=20
> 2) There is no way for having hogs inserted dynamically as far as I c=
an tell, and
> no way to remove a hog either.

The original patch was allowing that but, Linus's review comment sugges=
ted this feature be=20
part of the gpio-controller's gpiochip_add() hook only.

>=20
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

Again this follows Linus's review comment.
I agree that it prevent a centralize spot where all hog would be define=
d but it has the advantages of not relying on PROBE_DEFER.
I mean since all "gpio-hogs" would be defined in a single board dts fil=
e it would not be that hard to figure out the big picture anyways.

>=20
>=20
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> > Documentation/devicetree/bindings/gpio/gpio.txt | 33 +++++++++
> > drivers/gpio/gpiolib-of.c                       | 99 ++++++++++++++=
+++++++++++
> > drivers/gpio/gpiolib.c                          | 81 ++++++++++++++=
++++++
> > include/linux/of_gpio.h                         | 11 +++
> > 4 files changed, 224 insertions(+)
> >=20
>=20
> Regards
>=20
> =E2=80=94 Pantelis
>=20

Regards,
Benoit
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
