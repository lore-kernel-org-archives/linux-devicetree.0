From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: pinctrl: aspeed: Document AST2600 pinmux
Date: Mon, 29 Jul 2019 17:40:17 -0600
Message-ID: <CAL_Jsq+0f=jWJ2QTNzi+pmvzTpVacbP_C0zgpOwTumwJU7Gh=w@mail.gmail.com>
References: <20190729055604.13239-1-andrew@aj.id.au> <20190729055604.13239-2-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729055604.13239-2-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Ryan Chen <ryanchen.aspeed@gmail.com>, Johnny Huang <johnny_huang@aspeedtech.com>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 28, 2019 at 11:56 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The AST260 differs from the 2400 and 2500 in that it supports multiple
> groups for a subset of functions.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> ---
> v2:
> * Avoid patternProperties for fixed strings
> * Don't needlessly quote strings
> ---
>  .../pinctrl/aspeed,ast2600-pinctrl.yaml       | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
