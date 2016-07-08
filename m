From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Permissions for GPIOs [Was: [PATCH] gpio: document how to order
 GPIO controllers]
Date: Fri, 8 Jul 2016 13:25:40 +0200
Message-ID: <CACRpkdbr1kpaEq-CAcv0HL5w7QC2KSBuuJ+bUWbX2ZVRknZZWw@mail.gmail.com>
References: <1467355333-8813-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20160705140546.GA10601@rob-hp-laptop> <20160705180447.GP16643@pengutronix.de>
 <CACRpkdbH+KRXbxFdfyAE44fBNctK4cWV+KRLwQBTzSGLvLMEDg@mail.gmail.com>
 <20160706102750.GH23470@localhost> <CACRpkdZhx3yTbtuj-ZTP+mtUSr4uxL4bHtu8jVZOoxrUy6=iYw@mail.gmail.com>
 <1467814334.2472.154.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467814334.2472.154.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 6, 2016 at 4:12 PM, Jan L=C3=BCbbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wro=
te:

> This discussion caused me remember a concern regarding the chardev
> interface: Is it still be possible to give specific users/groups acce=
ss
> to individual GPIOs? This is currently possible in the sysfs interfac=
e
> with chown/chmod. I don't see how per-GPIO permissions would translat=
e
> to a per-gpiochip device.

It is not possible because it is a different model. The /dev/gpiochipN
is similar to /dev/sda for example, either you access the whole device
file not parts of it.

I think the old sysfs wrongly gives people the impression that this is
needed just because it happens to have one value per file, I can't thin=
k
of a usecase for it.

It's a bit like if we had a sysfs or similar that could give you write
permissions to just certain blocks of a disk or something using chmod.
I don't see anyone needing that other than in theory.

> Am I overlooking some better way to give non-root users granular acce=
ss
> to GPIOs? Or is that intentionally out of scope for the chardev
> interface?

Intentionally out of scope I don't know, nobody raised it during review=
,
and I have never seen a real-world usecase.

Are there any distributions out there that ship with something like ude=
v
files that actually go to the trouble of setting up different permissio=
ns
on GPIO sysfs files, or are we talking about hacks in a lab or even
just theoretical issues?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
