Return-Path: <SRS0=Muqj=PT=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
References: <20190103164102.31437-1-thomas.petazzoni@bootlin.com>
 <20190103164102.31437-4-thomas.petazzoni@bootlin.com> <CACRpkdbypbX0-NsSG4DmFCv6hC2gYEQZSUyoKdJbgwiMDZ4yvg@mail.gmail.com>
 <20190111135803.5644f06e@windsurf>
In-Reply-To: <20190111135803.5644f06e@windsurf>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jan 2019 15:38:39 +0100
Message-ID: <CACRpkdakgdOdV7mxwN3447cg2dmdSwBU+tBX2odnjnE8Oj7wjg@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: add core support for pull-up/pull-down configuration
Content-Type: text/plain; charset="UTF-8"
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jan 11, 2019 at 1:58 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Fri, 11 Jan 2019 11:05:03 +0100, Linus Walleij wrote:

> > > +/* Bit 4 express pull up */
> > > +#define GPIO_PULL_UP 16
> > > +
> > > +/* Bit 5 express pull down */
> > > +#define GPIO_PULL_DOWN 32
> >
> > Please use
> > #define GPIO_PULL_UP BIT(5)
> > #define GPIO_PULL_DOWN BIT(6)
(...)
> However, we are in the dt-bindings includes here, and apparently, there
> is no definition for the BIT() macro in those headers.

Ah you nailed it :D

OK keep it like this.

Yours,
Linus Walleij
