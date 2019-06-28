From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 3/8] dt-bindings: pinctrl: aspeed: Convert AST2500
 bindings to json-schema
Date: Fri, 28 Jun 2019 09:46:14 -0600
Message-ID: <CAL_JsqJKF1H6YtFTG-xFhGztdDpMKBihW732Wx6HMUhCw27vNw@mail.gmail.com>
References: <20190628023838.15426-1-andrew@aj.id.au> <20190628023838.15426-4-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190628023838.15426-4-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johnny Huang <johnny_huang@aspeedtech.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 27, 2019 at 8:39 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Convert ASPEED pinctrl bindings to DT schema format using json-schema.
>
> Cc: Johnny Huang <johnny_huang@aspeedtech.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> In v2:
>
> * Enforce function/group names in bindings
> * Move description above properties
> * Simplify specification of compatible
> * Cleanup license specification
>
>  .../pinctrl/aspeed,ast2500-pinctrl.txt        | 119 ----------------
>  .../pinctrl/aspeed,ast2500-pinctrl.yaml       | 134 ++++++++++++++++++
>  2 files changed, 134 insertions(+), 119 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
