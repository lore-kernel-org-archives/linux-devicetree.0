Return-Path: <SRS0=hijY=MY=axis.com=einar.vading@kernel.org>
Date: Fri, 12 Oct 2018 11:27:18 +0200
From: Einar Vading <einar.vading@axis.com>
Subject: Re: SV: [PATCH RFC] gpio: new driver for a gpio simulator
Message-ID: <20181012092718.dpu6w6rqzknt2cm3@lnxeinarv1.se.axis.com>
References: <20181008101356.5672-1-uwe@kleine-koenig.org>
 <CACRpkdbxJ4htb=Fk+UUo4Vm7HsFCXhJoAbJdfF1sx=QMKX_=8A@mail.gmail.com>
 <20181009191121.r2tgc2oslwcwfhyn@pengutronix.de>
 <CACRpkdYnHGWwOA=KUNRe4VP_jxO8TXG3v4vEJfV58OB6z99JFQ@mail.gmail.com>
 <20181011081646.np2pte7eeohuyhh6@pengutronix.de>
 <20181011094905.47onipkrzdp25psq@axis.com>
 <1539331329658.80509@axis.com>
 <20181012090612.63f2p45d24gpilsm@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181012090612.63f2p45d24gpilsm@pengutronix.de>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Vincent Whitchurch <rabinv@axis.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

On Fri, Oct 12, 2018 at 11:06:12AM +0200, Uwe Kleine-K�nig wrote:
> Would it help to instanciate more than one gpio-simulator?

Hmm, I don't think that would pose a problem. With DT it would be easy to name
the GPIOs and get then get them by name. What gpiochip they are on should not
matter... I think.

Best Regards
Einar
