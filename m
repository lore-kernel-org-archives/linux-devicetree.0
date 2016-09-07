From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 6/8] pinctrl: Add pinctrl-aspeed-g4 driver
Date: Wed, 7 Sep 2016 16:53:13 +0200
Message-ID: <CACRpkdYGHfsxXrFmoQ8vHq8af12ZMatYwHaBcXXNXVqSKK=1cw@mail.gmail.com>
References: <20160830075427.11493-1-andrew@aj.id.au> <20160830075427.11493-7-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160830075427.11493-7-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 30, 2016 at 9:54 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> A subset of the pins and functions are exposed. The selection of
> functions and pins is driven by the development of OpenBMC[1] on the
> AST2400 SoC, particularly around booting the OpenPOWER Palmetto
> development machine.
>
> [1] https://github.com/openbmc/docs
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Patch applied.

Yours,
Linus Walleij
