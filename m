From: "Fuzzey, Martin" <mfuzzey@parkeon.com>
Subject: Re: [PATCH 0/2] gpio: Allow userspace export from DT
Date: Wed, 6 May 2015 19:56:05 +0200
Message-ID: <CANh8Qzy7D=O0C7nw_M0LCvE887uxsCjRmvQ8fcKTcf4dJNm7iA@mail.gmail.com>
References: <20150413110515.9681.58848.stgit@localhost> <20150504084925.GB4047@localhost>
 <CACRpkdbFKs8mALw7q2d0EEDkhxKNLgeiFB5TyZ6ZPpfcW-c+oQ@mail.gmail.com> <20150506130615.GB5302@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20150506130615.GB5302@localhost>
Sender: linux-gpio-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 6 May 2015 at 15:06, Johan Hovold <johan@kernel.org> wrote:
>
> On Wed, May 06, 2015 at 09:22:22AM +0200, Linus Walleij wrote:
> > On Mon, May 4, 2015 at 10:49 AM, Johan Hovold <johan@kernel.org> wr=
ote:
> > > On Mon, Apr 13, 2015 at 01:05:15PM +0200, Martin Fuzzey wrote:
> >
> > >> The above means that, in order to export the GPIO to userspace v=
ia
> > >> /sys/class/gpio/export the userspace code must know the exact ha=
rdware and
> > >> kernel version information.
> > >
> > > Not quite. You can still determine the gpio number in the above c=
ases by
> > > walking the sysfs tree to find the chip and it's base. This is th=
e only
> > > way to do this for dynamic buses such as USB.
> >

A problem with that is that the "label" sysfs attribute is not
necessarilly unique (and is even documented as being non unique).
Many drivers just use the chip name as the label so if you have more
than one of them...

Of course if you know the bus and bus address it is possible to find
the associated GPIO base but why should userspace have to know that?
Isn't the whole point of the DT to describe such hardware details?

> > Maybe we should start providing something like an
> > "lsgpio" utility in tools/gpio to do this, just as a hint
> > to userspace people on how things should be done.
>
> I think we should focus on defining a new user-space interface rather
> than make it easier to use the current one (it should really only be
> used for development or one-off hacks IMO).
>

Doesn't the ability to name GPIOs, fix their direction, and "pre
export" them  in the device tree remove most of the warts of the
current interface? (for GPIOs for which it is used in any case)

While I agree that the sysfs GPIO interface is sometimes abused (such
as for LEDs and switches which already have proper kernel drivers)
there are still cases where a full kernel driver doesn't really make
sense (eg a signal to open a parking barrier) - is anyone suggesting
this needs a custom driver or that the LED one should be used  -
setting the heartbeat trigger on that would be interesting .... :)

> > >> This patch series solves both problems by performing the externa=
l
> > >> signal =3D> GPIO mapping in the device tree.
> > >
> > > As Rob already mentioned, what we want is some way to declare pin
> > > functions. These could then be requested from userspace (or used =
in DT,
> > > something which should allow for further refactoring there as wel=
l)
> > > unless a driver has already claimed them.
> >
> > We have the ability to name the GPIO lines (I usually refer to
> > lines rather than pins, as pins are physical and not all GPIOs
> > are, actually) using the array "names" in struct gpio_chip,
> > however this has no DT binding, so maybe people should
> > work on that. These names appear as named line files
> > in sysfs IIRC. Or maybe you're thinking of something else?
>

>
> Yes, something like that. As you mention above, if it was possibly to
> define those names in firmware, even the current sysfs interface woul=
d
> expose the pins as
>
>         /sys/class/gpio/<function>
>
> rather than say /sys/class/gpio/gpio279, thereby solving the gpio-num=
ber
> look-up issue. Well, to actually make the pin available *from* usersp=
ace
> you'd currently still need the number...
>
Indeed that  doesn't solve the how to export it problem.
AFAICT nothing is visible in sysfs until the export has been done.

Martin



--=20
--=20
Martin Fuzzey | Software Expertise
Parc La Fayette - 6 rue Isaac Newton - 25075 Besan=C3=A7on - FR
+33381546880 | +33677158582
mfuzzey@parkeon.com | www.parkeon.com
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
