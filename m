From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: gpio: aspeed: Update documentation
 with ast2600 controllers
Date: Wed, 11 Sep 2019 11:03:59 +0100
Message-ID: <CACRpkdY1Rk6vPihZkpKC9hya9ixQcqg9PG9rEpM3kSY0kxwsjg@mail.gmail.com>
References: <20190906062547.13264-1-rashmica.g@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190906062547.13264-1-rashmica.g@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rashmica Gupta <rashmica.g@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 6, 2019 at 7:25 AM Rashmica Gupta <rashmica.g@gmail.com> wrote:

> The ast2600 is a new generation of SoC from ASPEED. Similarly to the
> ast2400 and ast2500, it has a GPIO controller for it's 3.3V GPIO pins.
> Additionally, it has a GPIO controller for 36 1.8V GPIO pins.  We use
> the ngpio property to differentiate between these controllers.
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>

The changes are uncontroversial (uses just standard GPIO
ngpios and adds a compatible) so patch applied.

Yours,
Linus Walleij
