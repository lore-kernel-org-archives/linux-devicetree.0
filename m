From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 3/4] dt-bindings: gpio: max3191x: Document new driver
Date: Tue, 5 Sep 2017 10:16:24 +0200
Message-ID: <20170905081624.GA15374@wunner.de>
References: <cover.1503319573.git.lukas@wunner.de>
 <7fe7636eecba238d57ab6178cfa3f6b7deca98f1.1503319573.git.lukas@wunner.de>
 <20170823004847.jmkb53xtdmmn6vtf@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170823004847.jmkb53xtdmmn6vtf@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

sorry to bother you again, one more question popped up regarding the
MAX3191x DT bindings:

On Tue, Aug 22, 2017 at 07:48:47PM -0500, Rob Herring wrote:
> On Mon, Aug 21, 2017 at 03:12:00PM +0200, Lukas Wunner wrote:
> > Add device tree bindings for Maxim MAX3191x industrial serializer.
[snip]
> > +Optional properties:
> > + - maxim,nchips:	Number of chips in the daisy-chain (default is 1).

Many I/O chips are daisy-chainable, so I've been wondering if a
common property should be introduced?

The existing gpio-74x164.c uses "registers-number" to convey the number
of chips in the daisy chain.  (Sans vendor prefix, multiple vendors sell
compatible versions of this chip.)

gpio-pisosr.c takes a different approach and calculates the number of
chips in the daisy-chain by taking the common "ngpios" property
(Documentation/devicetree/bindings/gpio/gpio.txt) and dividing it by 8
(which assumes that each chip has 8 inputs).

Thanks,

Lukas
