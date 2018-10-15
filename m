Return-Path: <SRS0=ua4M=M3=bgdev.pl=brgl@kernel.org>
MIME-Version: 1.0
References: <20181008101356.5672-1-uwe@kleine-koenig.org> <CACRpkdbxJ4htb=Fk+UUo4Vm7HsFCXhJoAbJdfF1sx=QMKX_=8A@mail.gmail.com>
 <20181009191121.r2tgc2oslwcwfhyn@pengutronix.de> <CACRpkdYnHGWwOA=KUNRe4VP_jxO8TXG3v4vEJfV58OB6z99JFQ@mail.gmail.com>
 <20181011081646.np2pte7eeohuyhh6@pengutronix.de> <20181011094905.47onipkrzdp25psq@axis.com>
 <1539331329658.80509@axis.com> <20181012090612.63f2p45d24gpilsm@pengutronix.de>
 <20181012092718.dpu6w6rqzknt2cm3@lnxeinarv1.se.axis.com> <20181012094704.mow2nfm7xwdi2a4t@pengutronix.de>
In-Reply-To: <20181012094704.mow2nfm7xwdi2a4t@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 15 Oct 2018 11:54:22 +0200
Message-ID: <CAMRc=McH7taDJXaVTLYZ-1E+hkwxKon6RwjuKzBSgB9LZq7H1w@mail.gmail.com>
Subject: Re: SV: [PATCH RFC] gpio: new driver for a gpio simulator
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Einar Vading <einar.vading@axis.com>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Rabin Vincent <rabinv@axis.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

pt., 12 pa=C5=BA 2018 o 11:47 Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
>
> On Fri, Oct 12, 2018 at 11:27:18AM +0200, Einar Vading wrote:
> > On Fri, Oct 12, 2018 at 11:06:12AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > Would it help to instanciate more than one gpio-simulator?
> >
> > Hmm, I don't think that would pose a problem. With DT it would be easy =
to name
> > the GPIOs and get then get them by name. What gpiochip they are on shou=
ld not
> > matter... I think.
>
> The only downside is that you cannot atomically set GPIOs on different
> chips. I didn't try to use naming, but maybe the gpio framework is good
> enough that it just works.
>
> Best regards
> Uwe
>
> --
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  =
|

Sorry for the late reply, I was travelling last week.

If I understand correctly the main difference between gpio-mockup and
gpio-simulator is that simulating interrupts on input lines would
happen by changing the value of connected output GPIO lines.

I started using gpio-mockup for testing of both libgpiod and GPIO user
API some time ago. I initially thought about doing the exact same
thing with interrupts but figured that if we want to test the user API
then we'd better not be actually using it since we won't know where
the eventual bugs will actually come from - i.e. when testing reading
line events, let's not be using the output API from the other side,
but rather something not linked to GPIO in any way - debugfs in this
case.

That being said: I have nothing against extending gpio-mockup with
this feature - I actually like it. I guess having a single module
param that would create a second corresponding gpiochip for every
standard one would be enough? I could have the numbering starting
right after the standard chips and a special label too. However I
don't really see a need to have two separate testing drivers for a
single subsystem. Is there anything in the way mockup is implemented
that stops you from reusing it?

Please note that libgpiod extensively uses gpio-mockup for testing so
there's now way we're getting rid of it anytime soon.

Best regards,
Bartosz Golaszewski
