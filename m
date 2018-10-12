Return-Path: <SRS0=hijY=MY=axis.com=einar.vading@kernel.org>
From: Einar Vading <einar.vading@axis.com>
Subject: SV: [PATCH RFC] gpio: new driver for a gpio simulator
Date: Fri, 12 Oct 2018 08:02:09 +0000
Message-ID: <1539331329658.80509@axis.com>
References: <20181008101356.5672-1-uwe@kleine-koenig.org>
 <CACRpkdbxJ4htb=Fk+UUo4Vm7HsFCXhJoAbJdfF1sx=QMKX_=8A@mail.gmail.com>
 <20181009191121.r2tgc2oslwcwfhyn@pengutronix.de>
 <CACRpkdYnHGWwOA=KUNRe4VP_jxO8TXG3v4vEJfV58OB6z99JFQ@mail.gmail.com>
 <20181011081646.np2pte7eeohuyhh6@pengutronix.de>,<20181011094905.47onipkrzdp25psq@axis.com>
In-Reply-To: <20181011094905.47onipkrzdp25psq@axis.com>
Content-Language: sv-SE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Vincent Whitchurch <rabinv@axis.com>, =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

Since I was just evaluating the mockup driver to use in a test setup I'll g=
ive my 2 cents.=0A=
=0A=
The benefit of the simulator is that we get the possibility to, if I unders=
tand correctly, monitor an input for changes on the connected output. Sure,=
 we could also use ftrace but I like the idea of having the two connected G=
PIOs. As a matter of fact I was just thinking about implementing something =
that gave the same functionality for the mockup driver.=0A=
=0A=
What I like from the mockup driver is the possibility to have *many* gpios =
on the same chip. We currently have a MCU I/O expander that gives us 110+ g=
pios. So for us 64 GPIOs is really not enough.=0A=
=0A=
So neither driver works out of the box for us right now but both looks very=
 promising.=0A=
=0A=
Best Regards=0A=
Einar=0A=
________________________________________=0A=
Fr=E5n: linux-gpio-owner@vger.kernel.org <linux-gpio-owner@vger.kernel.org>=
 f=F6r Vincent Whitchurch <rabinv@axis.com>=0A=
Skickat: den 11 oktober 2018 11:49=0A=
Till: Uwe Kleine-K=F6nig=0A=
Kopia: Linus Walleij; Bartosz Golaszewski; Mark Rutland; open list:OPEN FIR=
MWARE AND FLATTENED DEVICE TREE BINDINGS; open list:GPIO SUBSYSTEM; Rob Her=
ring; Sascha Hauer=0A=
=C4mne: Re: [PATCH RFC] gpio: new driver for a gpio simulator=0A=
=0A=
On Thu, Oct 11, 2018 at 10:16:46AM +0200, Uwe Kleine-K=F6nig wrote:=0A=
> @Vincent: What is your usecase? I currently cannot imagine a use case=0A=
> that can be done with the mockup driver but not with the simulator.=0A=
=0A=
I just needed a fake GPIO chip with a bunch of pins that I could use=0A=
before I got the hardware with a real GPIO expander.  In my case I only=0A=
needed to test output so IIRC I didn't use the debugfs interface at all=0A=
but instead used ftrace to check that my userspace triggered the correct=0A=
operations on the "pins".=0A=
=0A=
So, yes, that would probably have worked just as well with this=0A=
simulator instead of the mockup driver.=0A=
