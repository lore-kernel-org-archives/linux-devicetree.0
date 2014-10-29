From: Pantelis Antoniou <pantelis.antoniou@gmail.com>
Subject: Re: [RFC Patch] gpio: add GPIO hogging mechanism
Date: Wed, 29 Oct 2014 18:42:48 +0200
Message-ID: <2BA5D07E-B5EF-49E1-BFD2-310A6C5F3FE4@gmail.com>
References: <1413922198-29373-1-git-send-email-bparrot@ti.com> <3D00ADB3-00B3-40A8-8263-444BCADDAC33@gmail.com> <20141029163445.GB29965@ti.com>
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141029163445.GB29965@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Benoit,

> On Oct 29, 2014, at 18:34 , Benoit Parrot <bparrot@ti.com> wrote:
>=20
> Pantelis,
>=20
> Thanks for the feedback.
>=20
> Pantelis Antoniou <pantelis.antoniou@gmail.com> wrote on Wed [2014-Oc=
t-29 10:53:44 +0200]:
>> Hi Benoit,
>>=20
>>> On Oct 21, 2014, at 23:09 , Benoit Parrot <bparrot@ti.com> wrote:
>>>=20
>>> Based on Boris Brezillion work this is a reworked patch
>>> of his initial GPIO hogging mechanism.
>>> This patch provides a way to initally configure specific GPIO
>>> when the gpio controller is probe.
>>>=20
>>> The actual DT scanning to collect the GPIO specific data is perform=
ed
>>> as part of the gpiochip_add().
>>>=20
>>> The purpose of this is to allows specific GPIOs to be configured
>>> without any driver specific code.
>>> This particularly usueful because board design are getting
>>> increassingly complex and given SoC pins can now have upward
>>> of 10 mux values a lot of connections are now dependent on
>>> external IO muxes to switch various modes and combination.
>>>=20
>>> Specific drivers should not necessarily need to be aware of
>>> what accounts to a specific board implementation. This board level
>>> "description" should be best kept as part of the dts file.
>>>=20
>>=20
>> This look like it=E2=80=99s going to the right direction. I have a f=
ew general
>> comments at first.
>>=20
>> 1) It relies on dubious DT binding of having sub-nodes of the
>> gpio device implicitly defining hogs.
>=20
> I think in this instance the nodes are explicitly defining hogs.
> Please clarify. What would you like to see here?
>>=20

Any subnodes are implicitly taken as hog definitions. This is not right=
 because
gpio controllers might have subnodes that they use for another purpose.

>> 2) There is no way for having hogs inserted dynamically as far as I =
can tell, and
>> no way to remove a hog either.
>=20
> The original patch was allowing that but, Linus's review comment sugg=
ested this feature be=20
> part of the gpio-controller's gpiochip_add() hook only.
>=20

If it=E2=80=99s not possible to remove a hog, then it=E2=80=99s no good=
 for my use case in which
the gpios get exported and then removed.

>>=20
>> 3) I=E2=80=99m not very fond of having this being part of the gpio c=
ontroller. This
>> configuration conceptually has little to do with the gpio controller=
 per se,
>> it is more of a board specific thing. Why not come up with a gpio-ho=
g driver that
>> references GPIOs? That way with a single gpio-hog driver instance yo=
u could setup
>> all the GPIO-hogging configuration for all GPIOs on the board, even =
one that
>> lie on different GPIO controllers.
>=20
> Again this follows Linus's review comment.
> I agree that it prevent a centralize spot where all hog would be defi=
ned but it has the advantages of not relying on PROBE_DEFER.
> I mean since all "gpio-hogs" would be defined in a single board dts f=
ile it would not be that hard to figure out the big picture anyways.
>=20

There won=E2=80=99t be a single board dts file if you=E2=80=99re using =
things like overlays.

>>=20
>>=20
>>> Signed-off-by: Benoit Parrot <bparrot@ti.com>
>>> ---
>>> Documentation/devicetree/bindings/gpio/gpio.txt | 33 +++++++++
>>> drivers/gpio/gpiolib-of.c                       | 99 ++++++++++++++=
+++++++++++
>>> drivers/gpio/gpiolib.c                          | 81 ++++++++++++++=
++++++
>>> include/linux/of_gpio.h                         | 11 +++
>>> 4 files changed, 224 insertions(+)
>>>=20
>>=20
>> Regards
>>=20
>> =E2=80=94 Pantelis
>>=20
>=20
> Regards,
> Benoit

Regards

=E2=80=94 Pantelis
