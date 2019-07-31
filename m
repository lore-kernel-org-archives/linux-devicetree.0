From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH net-next v2 1/4] dt-bindings: net: Add aspeed,ast2600-mdio binding
Date: Wed, 31 Jul 2019 12:00:59 -0600
Message-ID: <CAL_JsqLu2M7qnO08kHbgheNCN1+Lis0shrjfnphMbkSJKRs7=A@mail.gmail.com>
References: <20190731053959.16293-1-andrew@aj.id.au> <20190731053959.16293-2-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731053959.16293-2-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: netdev <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 30, 2019 at 11:39 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The AST2600 splits out the MDIO bus controller from the MAC into its own
> IP block and rearranges the register layout. Add a new binding to
> describe the new hardware.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> ---
> v2:
> * aspeed: Utilise mdio.yaml
> * aspeed: Drop status from example
> ---
>  .../bindings/net/aspeed,ast2600-mdio.yaml     | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
