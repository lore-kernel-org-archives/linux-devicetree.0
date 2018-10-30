Return-Path: <SRS0=ci94=NK=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
References: <CACRpkdYnHGWwOA=KUNRe4VP_jxO8TXG3v4vEJfV58OB6z99JFQ@mail.gmail.com>
 <20181011081646.np2pte7eeohuyhh6@pengutronix.de> <20181011094905.47onipkrzdp25psq@axis.com>
 <1539331329658.80509@axis.com> <20181012090612.63f2p45d24gpilsm@pengutronix.de>
 <20181012092718.dpu6w6rqzknt2cm3@lnxeinarv1.se.axis.com> <20181012094704.mow2nfm7xwdi2a4t@pengutronix.de>
 <CAMRc=McH7taDJXaVTLYZ-1E+hkwxKon6RwjuKzBSgB9LZq7H1w@mail.gmail.com>
 <20181015200331.ux5pb5cohtbjskc6@pengutronix.de> <CAMRc=Mf+PAvG=gb339GNBCQ1yE1+sGyG5zkM86u3im82f-t+Gw@mail.gmail.com>
 <20181018191646.np2mdkcjtrzen65z@pengutronix.de>
In-Reply-To: <20181018191646.np2mdkcjtrzen65z@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Oct 2018 13:45:29 +0100
Message-ID: <CACRpkdbiSrpzhCwu6CdX9+_xqkELgG2HyJG0tmnCKEbwPPd2ng@mail.gmail.com>
Subject: Re: SV: [PATCH RFC] gpio: new driver for a gpio simulator
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rabin Vincent <rabinv@axis.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Einar Vading <einar.vading@axis.com>, Sascha Hauer <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

On Thu, Oct 18, 2018 at 9:16 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> [Bartosz]
> > I do believe that having a single driver will cause less confusion in
> > the future and make it less likely that someone needing another
> > testing future will try to get merged a third separate driver. Linus
> > will have the last word of course but personally I'd like to work
> > towards extending gpio-mockup.
>
> I won't argue here. Iff you think gpio-simulator is good to take without
> merging with gpio-mockup I'm willing to work on the (other) identified
> weaknesses.

We just don't want to have to maintain two synthetic drivers for this.

libgpiod has an extensive set of tests:
https://github.com/brgl/libgpiod/tree/master/tests

If gpio-simulator should replace gpio-mockup, all it needs to do
is pass all these tests without changes. That is the beauty of
test driven development.

However I would have a serious allergic reaction to any
"merge this now fix any tests later" or "not my problem to
pass these tests" approach. A slot-in replacement doing all
that gpio-mockup does and then some would likely be
accepted on the condition that gpio-mockup is deleted
at the same time, as that would prove it is a bigger and
better swiss army knife for GPIO simulation/mockuping.

Yours,
Linus Walleij
