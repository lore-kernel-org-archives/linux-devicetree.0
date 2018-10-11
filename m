Return-Path: <SRS0=fNM+=MX=axis.com=vincent.whitchurch@kernel.org>
Date: Thu, 11 Oct 2018 11:49:05 +0200
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: Re: [PATCH RFC] gpio: new driver for a gpio simulator
Message-ID: <20181011094905.47onipkrzdp25psq@axis.com>
References: <20181008101356.5672-1-uwe@kleine-koenig.org>
 <CACRpkdbxJ4htb=Fk+UUo4Vm7HsFCXhJoAbJdfF1sx=QMKX_=8A@mail.gmail.com>
 <20181009191121.r2tgc2oslwcwfhyn@pengutronix.de>
 <CACRpkdYnHGWwOA=KUNRe4VP_jxO8TXG3v4vEJfV58OB6z99JFQ@mail.gmail.com>
 <20181011081646.np2pte7eeohuyhh6@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181011081646.np2pte7eeohuyhh6@pengutronix.de>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

On Thu, Oct 11, 2018 at 10:16:46AM +0200, Uwe Kleine-K�nig wrote:
> @Vincent: What is your usecase? I currently cannot imagine a use case
> that can be done with the mockup driver but not with the simulator.

I just needed a fake GPIO chip with a bunch of pins that I could use
before I got the hardware with a real GPIO expander.  In my case I only
needed to test output so IIRC I didn't use the debugfs interface at all
but instead used ftrace to check that my userspace triggered the correct
operations on the "pins".

So, yes, that would probably have worked just as well with this
simulator instead of the mockup driver.
