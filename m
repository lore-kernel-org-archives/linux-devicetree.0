From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH 3/5] gpio: gpiolib: Add chardev support for
 maintaining GPIO values on reset
Date: Tue, 31 Oct 2017 10:59:55 +0100
Message-ID: <CACRpkdZzr3JHo=AEZejXn0nw0mZo02OWFmmTiUBjgr+bH+NOAw@mail.gmail.com>
References: <20171020033727.21557-1-andrew@aj.id.au> <20171020033727.21557-4-andrew@aj.id.au>
 <CACRpkdY4F-ocFxomLEsVyGA0odGooWysQq5MHi9qwUt6E_VDzA@mail.gmail.com>
 <1508490173.24322.53.camel@aj.id.au> <20171025081454.4avrf57mf33khu7c@localhost.localdomain>
 <1508976339.13477.5.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508976339.13477.5.camel@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Michael Welling <mwelling@emacinc.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 26, 2017 at 2:05 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> I feel that taking this argument to its logical conclusion leads to
> never exporting any GPIOs to userspace and doing everything in the
> kernel.

That is very much how I feel about things anyways.
In a recent presentation:
https://dflund.se/~triad/papers/GPIO-for-Engineers-and-Makers.pdf

I had the following text:

The Rules of Linux Userspace GPIO
1. You do not access GPIOs from userspace
2. YOU DO NOT ACCESS GPIOS FROM USERSPACE
3. Read Documentation/gpio/drivers-on-gpio.txt
4. Use the character device

> If userspace has exported the GPIO and is managing its state,
> then it can *already* cause very weird hardware behaviour if set wrong.
> The fact that userspace is controlling the GPIO state and not the
> kernel already says that the kernel doesn't know how to manage it, so
> why not expose the option for userspace to set the persistence, given
> that it should know what it's doing?

People do need to access GPIOs from userspace for things
like one-off makerspace projects, relays on factory lines,
fire alarms, door openers etc etc.

One-off projects is fine, the user likely has an idea about the
whole system that is comprehensive. They use the random
raspberry Pi (etc) development board for this. OK.

When we are talking about adding GPIO in mass-market goods
such as phones and tablets and laptops userspace GPIO
access become more and more dubious.

Yours,
Linus Walleij
