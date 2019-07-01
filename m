From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] net: dsa: Change DT bindings for Vitesse VSC73xx switches
Date: Mon, 1 Jul 2019 22:23:30 +0200
Message-ID: <CACRpkdaQhv+4RG8k+QaCE9F3-Oeo8-rjSqGgakr8r2pyOkyoGw@mail.gmail.com>
References: <20190701152723.624-1-paweldembicki@gmail.com> <45ff597a-5090-3874-b43d-5b5f45d2d2f6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <45ff597a-5090-3874-b43d-5b5f45d2d2f6@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Pawel Dembicki <paweldembicki@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev <netdev@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 1, 2019 at 6:44 PM Florian Fainelli <f.fainelli@gmail.com> wrote:

> Take b53 for instance which supports MDIO and SPI by default, and
> optionally memory mapped and SRAB (indirect memory map) accesses, they
> all have the same compatible strings. Whether the switches will appear
> as spi_device, platform_device, or something else is entirely based on
> how the Device Tree is laid out.

That's clever.

Pawel can you restructure the series around this observation?

Yours,
Linus Walleij
