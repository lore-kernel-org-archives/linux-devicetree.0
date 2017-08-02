From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: aspeed: Add g5 USB functions
Date: Wed, 2 Aug 2017 10:36:58 +0200
Message-ID: <CACRpkdYEqM36pGpRSiAVeV92TgQUP4nYgadPNm-Sf-so9+t+rw@mail.gmail.com>
References: <20170718052453.14316-1-andrew@aj.id.au> <20170718052453.14316-3-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170718052453.14316-3-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ryan Chen <ryan_chen@aspeedtech.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 18, 2017 at 7:24 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> The Aspeed AST2500 SoC contains a number of USB controllers:
>
> * USB 1.1 Host Controller
> * USB 2.0 Host Controller (x2)
> * USB 2.0 Virtual Hub
> * USB 2.0 Device Controller
> * USB 1.1 HID Controller
>
> The controllers are exposed via two USB ports with functionality muxed
> as required. The following table illustrates the relationships between
> the ports and the controllers via the mux function names:
>
> Port  | USB Version  | USB Mode     | Mux Function
> ------|--------------|--------------|-------------
> A     | 2.0          | Virtual Hub  | USB2AD
> A     | 2.0          | Host         | USB2AH
> B     | 1.1          | HID          | USB11BHID
> B     | 2.0          | Device       | USB2BD
> B     | 2.0          | Host         | USB2BH
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> v1 -> v2:

Patch applied.

Yours,
Linus Walleij
