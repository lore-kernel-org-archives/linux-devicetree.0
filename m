From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/4] gpio: aspeed: Add debounce support
Date: Mon, 24 Apr 2017 14:50:35 +0200
Message-ID: <CACRpkdYe7Wvc=stcTqyMXqggo-zpdJYMiK-9DXJfem+P-AWG-w@mail.gmail.com>
References: <20170407125902.15960-1-andrew@aj.id.au> <20170407125902.15960-4-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170407125902.15960-4-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 7, 2017 at 2:59 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Each GPIO in the Aspeed GPIO controller can choose one of four input
> debounce states: to disable debouncing for an input, or select from one
> of three programmable debounce timer values. Each GPIO in a
> four-bank-set is assigned one bit in each of two debounce configuration
> registers dedicated to the set, and selects a debounce state by
> configuring the two bits to select one of the four options.
>
> The limitation on debounce timer values is managed by mapping offsets
> onto a configured timer value and keeping count of the number of users
> a timer has. Timer values are configured on a first-come-first-served
> basis.
>
> A small twist in the hardware design is that the debounce configuration
> register numbering is reversed with respect to the binary representation
> of the debounce timer of interest (i.e. debounce register 1 represents
> bit 1, and debounce register 2 represents bit 0 of the timer numbering).
>
> Tested on an AST2500EVB with additional inspection under QEMU's
> romulus-bmc machine.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied.

Yours,
Linus Walleij
