Return-Path: <SRS0=K8HD=M6=bgdev.pl=brgl@kernel.org>
MIME-Version: 1.0
References: <CACRpkdbxJ4htb=Fk+UUo4Vm7HsFCXhJoAbJdfF1sx=QMKX_=8A@mail.gmail.com>
 <20181009191121.r2tgc2oslwcwfhyn@pengutronix.de> <CACRpkdYnHGWwOA=KUNRe4VP_jxO8TXG3v4vEJfV58OB6z99JFQ@mail.gmail.com>
 <20181011081646.np2pte7eeohuyhh6@pengutronix.de> <20181011094905.47onipkrzdp25psq@axis.com>
 <1539331329658.80509@axis.com> <20181012090612.63f2p45d24gpilsm@pengutronix.de>
 <20181012092718.dpu6w6rqzknt2cm3@lnxeinarv1.se.axis.com> <20181012094704.mow2nfm7xwdi2a4t@pengutronix.de>
 <CAMRc=McH7taDJXaVTLYZ-1E+hkwxKon6RwjuKzBSgB9LZq7H1w@mail.gmail.com> <20181015200331.ux5pb5cohtbjskc6@pengutronix.de>
In-Reply-To: <20181015200331.ux5pb5cohtbjskc6@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Oct 2018 17:03:42 +0200
Message-ID: <CAMRc=Mf+PAvG=gb339GNBCQ1yE1+sGyG5zkM86u3im82f-t+Gw@mail.gmail.com>
Subject: Re: SV: [PATCH RFC] gpio: new driver for a gpio simulator
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Rabin Vincent <rabinv@axis.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Einar Vading <einar.vading@axis.com>, Sascha Hauer <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

pon., 15 pa=C5=BA 2018 o 22:03 Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
>
> On Mon, Oct 15, 2018 at 11:54:22AM +0200, Bartosz Golaszewski wrote:
> > pt., 12 pa=C5=BA 2018 o 11:47 Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
> > >
> > > On Fri, Oct 12, 2018 at 11:27:18AM +0200, Einar Vading wrote:
> > > > On Fri, Oct 12, 2018 at 11:06:12AM +0200, Uwe Kleine-K=C3=B6nig wro=
te:
> > > > > Would it help to instanciate more than one gpio-simulator?
> > > >
> > > > Hmm, I don't think that would pose a problem. With DT it would be e=
asy to name
> > > > the GPIOs and get then get them by name. What gpiochip they are on =
should not
> > > > matter... I think.
> > >
> > > The only downside is that you cannot atomically set GPIOs on differen=
t
> > > chips. I didn't try to use naming, but maybe the gpio framework is go=
od
> > > enough that it just works.
> >
> > If I understand correctly the main difference between gpio-mockup and
> > gpio-simulator is that simulating interrupts on input lines would
> > happen by changing the value of connected output GPIO lines.
>
> Not only for input lines. What is done with gpio-mockup via debugfs is
> done for gpio-simulator with the gpio functions on the other side.
>
> > I started using gpio-mockup for testing of both libgpiod and GPIO user
> > API some time ago. I initially thought about doing the exact same
> > thing with interrupts but figured that if we want to test the user API
> > then we'd better not be actually using it since we won't know where
> > the eventual bugs will actually come from - i.e. when testing reading
> > line events, let's not be using the output API from the other side,
> > but rather something not linked to GPIO in any way - debugfs in this
> > case.
>
> I wouldn't take this as a reason to not use GPIO stuff for the "other
> side". On the contrary, I'd see it as an advantage as this way you test
> setting an output on one side and generating an event on the other side
> in a single test. And if it's broken and needs debugging there are the
> normal trace mechanisms.
>
> > That being said: I have nothing against extending gpio-mockup with
> > this feature - I actually like it. I guess having a single module
> > param that would create a second corresponding gpiochip for every
> > standard one would be enough? I could have the numbering starting
> > right after the standard chips and a special label too. However I
> > don't really see a need to have two separate testing drivers for a
> > single subsystem. Is there anything in the way mockup is implemented
> > that stops you from reusing it?
>
> An advantage of my simulator over gpio-mockup (as mentioned already
> earlier) is that both sides are available as GPIOs in the kernel. So I
> could connect a rotary-encoder input device to an device that mimics a
> rotary-encoder.
>

Sure!

> > Please note that libgpiod extensively uses gpio-mockup for testing so
> > there's now way we're getting rid of it anytime soon.
>
> From my POV in order of preference, we'd do the following:
>
> a) take gpio-simulator in parallel to gpio-mockup
> b) take gpio-simulator and drop gpio-mockup
> c) merge the two
>
> I think c) is ugly because it complicates the combined driver which
> takes away much of the beauty and simplicity I see in at least the
> gpio-simulator. (I don't know the mockup driver good enough to judge
> here, but on my few looks it looked more complicated which might be
> subjective.)
>

Every single developer likes to start from scratch and implement his
own ideal solution but that's usually the worst decision[1]. Also:
it's harder to read code than to write it. The mockup driver works
fine. It's also reasonably clean as far as code goes. I didn't write
it from scratch either -  it had existed for some time before I took
it over and made it into something I could use with libgpiod. Check
git blame.

> Also there are a few issues I see in the mockup driver (which are not
> implied by the architecture and so are fixable):
>
>  - I think it's racy because there is no locking (ditto for the irq
>    simulator).

Yes, it's fixable - I didn't need locking since usually there's only
one user at any given time. For irq_sim - I don't think we need any
locking here but I may take a second look at the irq subsystem.

>  - Each write to the event file generates an irq, so there is no way to
>    test level sensitive irqs.

Can't it be fixed by extending the driver with your solution?

>  - SPDX header claims GPL-2.0+, MODULE_LICENCE claims GPL-v2 only.
>  - The debugfs interface doesn't give complete control over the gpios.
>

Good point. The license boilerplate before SPDX also says GPL-2.0 or
later. I guess we need to fix MODULE_LICENSE.

> Of course there is no *need* to have two virtual gpio devices, but I
> don't see a big reason not to have two anyhow.
>

I do believe that having a single driver will cause less confusion in
the future and make it less likely that someone needing another
testing future will try to get merged a third separate driver. Linus
will have the last word of course but personally I'd like to work
towards extending gpio-mockup.

Best regards,
Bartosz Golaszewski

> Best regards
> Uwe
>
> --
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  =
|

[1] https://www.joelonsoftware.com/2000/04/06/things-you-should-never-do-pa=
rt-i/
