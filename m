From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [RFC Patch] gpio: add GPIO hogging mechanism
Date: Wed, 29 Oct 2014 14:36:51 -0500
Message-ID: <20141029193651.GE29965@ti.com>
References: <1413922198-29373-1-git-send-email-bparrot@ti.com>
 <3D00ADB3-00B3-40A8-8263-444BCADDAC33@gmail.com>
 <20141029163445.GB29965@ti.com>
 <2BA5D07E-B5EF-49E1-BFD2-310A6C5F3FE4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2BA5D07E-B5EF-49E1-BFD2-310A6C5F3FE4@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Pantelis Antoniou <pantelis.antoniou@gmail.com> wrote on Wed [2014-Oct-=
29 18:42:48 +0200]:
> Hi Benoit,
>=20
> > On Oct 29, 2014, at 18:34 , Benoit Parrot <bparrot@ti.com> wrote:
> >=20
> > Pantelis,
> >=20
> > Thanks for the feedback.
> >=20
> > Pantelis Antoniou <pantelis.antoniou@gmail.com> wrote on Wed [2014-=
Oct-29 10:53:44 +0200]:
> >> Hi Benoit,
> >>=20
> >>> On Oct 21, 2014, at 23:09 , Benoit Parrot <bparrot@ti.com> wrote:
> >>>=20
> >>> Based on Boris Brezillion work this is a reworked patch
> >>> of his initial GPIO hogging mechanism.
> >>> This patch provides a way to initally configure specific GPIO
> >>> when the gpio controller is probe.
> >>>=20
> >>> The actual DT scanning to collect the GPIO specific data is perfo=
rmed
> >>> as part of the gpiochip_add().
> >>>=20
> >>> The purpose of this is to allows specific GPIOs to be configured
> >>> without any driver specific code.
> >>> This particularly usueful because board design are getting
> >>> increassingly complex and given SoC pins can now have upward
> >>> of 10 mux values a lot of connections are now dependent on
> >>> external IO muxes to switch various modes and combination.
> >>>=20
> >>> Specific drivers should not necessarily need to be aware of
> >>> what accounts to a specific board implementation. This board leve=
l
> >>> "description" should be best kept as part of the dts file.
> >>>=20
> >>=20
> >> This look like it=E2=80=99s going to the right direction. I have a=
 few general
> >> comments at first.
> >>=20
> >> 1) It relies on dubious DT binding of having sub-nodes of the
> >> gpio device implicitly defining hogs.
> >=20
> > I think in this instance the nodes are explicitly defining hogs.
> > Please clarify. What would you like to see here?
> >>=20
>=20
> Any subnodes are implicitly taken as hog definitions. This is not rig=
ht because
> gpio controllers might have subnodes that they use for another purpos=
e.

I think I see what you mean.
Even though "gpio-hog =3D <&phandle>" guarantee that only those sub-nod=
e
are going to be parsed, if a particular gpio-controller has sub-node fo=
r
some other reason then the "hog" related sub-node might be in the way.

Do you know of such an example currently in mainline I can take a look =
at?

>=20
> >> 2) There is no way for having hogs inserted dynamically as far as =
I can tell, and
> >> no way to remove a hog either.
> >=20
> > The original patch was allowing that but, Linus's review comment su=
ggested this feature be=20
> > part of the gpio-controller's gpiochip_add() hook only.
> >=20
>=20
> If it=E2=80=99s not possible to remove a hog, then it=E2=80=99s no go=
od for my use case in which
> the gpios get exported and then removed.

I guess if we add the export feature then that could be possible.
But if I am not mistaken the hog concept was to allow gpio setting
for gpio not belonging to any particular drivers.
If you have gpio which needs to be released then would they fall in
the "own" by a driver category and which case use the exixting method?=20
>=20
> >>=20
> >> 3) I=E2=80=99m not very fond of having this being part of the gpio=
 controller. This
> >> configuration conceptually has little to do with the gpio controll=
er per se,
> >> it is more of a board specific thing. Why not come up with a gpio-=
hog driver that
> >> references GPIOs? That way with a single gpio-hog driver instance =
you could setup
> >> all the GPIO-hogging configuration for all GPIOs on the board, eve=
n one that
> >> lie on different GPIO controllers.
> >=20
> > Again this follows Linus's review comment.
> > I agree that it prevent a centralize spot where all hog would be de=
fined but it has the advantages of not relying on PROBE_DEFER.
> > I mean since all "gpio-hogs" would be defined in a single board dts=
 file it would not be that hard to figure out the big picture anyways.
> >=20
>=20
> There won=E2=80=99t be a single board dts file if you=E2=80=99re usin=
g things like overlays.
I see, I had not consider that.

A generic board level gpio driver would be a different option I guess.

>=20
> >>=20
> >>=20
> >>> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> >>> ---
> >>> Documentation/devicetree/bindings/gpio/gpio.txt | 33 +++++++++
> >>> drivers/gpio/gpiolib-of.c                       | 99 ++++++++++++=
+++++++++++++
> >>> drivers/gpio/gpiolib.c                          | 81 ++++++++++++=
++++++++
> >>> include/linux/of_gpio.h                         | 11 +++
> >>> 4 files changed, 224 insertions(+)
> >>>=20
> >>=20
> >> Regards
> >>=20
> >> =E2=80=94 Pantelis
> >>=20
> >=20
> > Regards,
> > Benoit
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
