From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: aspeed: Add g4 USB functions
Date: Wed, 2 Aug 2017 10:36:00 +0200
Message-ID: <CACRpkda3gjXZnYAQUmH-tc_GXWLS_ymwrTpUb-ZQ1KQDadWCGg@mail.gmail.com>
References: <20170718052453.14316-1-andrew@aj.id.au> <20170718052453.14316-2-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170718052453.14316-2-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ryan Chen <ryan_chen@aspeedtech.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 18, 2017 at 7:24 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> The AST2400 contains several USB controllers:
>
> * USB 1.1 Host Controller
> * USB 2.0 Host Controller
> * USB 2.0 Virtual Hub
> * USB 1.1 HID Controller
>
> Pins for three ports are routed to the three controllers such that:
>
> * Port 1 is a dedicated USB 1.1 host port
> * Port 2 is shared between the USB 1.1 host and HID controllers
> * Port 3 is shared between the USB 2.0 host and Hub controllers
>
> As the pins for port 1 are fixed function there is no associated mux
> function or group described in the bindings. Ports 2 and 3 are muxed as
> above, and the table below describes the mapping between pinmux function
> names and ports:
>
> Port  | USB Version  | USB Mode  | Mux Function
> ------|--------------|-----------|-------------
> 1     | 1.1          | Host      | -
> 2     | 1.1          | Host      | USB11H2
> 2     | 1.1          | HID       | USB11D1
> 3     | 2.0          | Host      | USB2H1
> 3     | 2.0          | Device    | USB2D1
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> v1 -> v2:
>
> * Updated the commit message to clarify HID details

Patch applied.

Yours,
Linus Walleij
