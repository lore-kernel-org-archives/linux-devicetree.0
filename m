From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/4] net: dsa: vsc73xx: Split vsc73xx driver
Date: Thu, 4 Jul 2019 09:08:30 +0200
Message-ID: <CACRpkdZR6K24U7fag9VOhZR60LPASKXiyPPG8yNcJUjqaE=Ggg@mail.gmail.com>
References: <20190703171924.31801-1-paweldembicki@gmail.com> <20190703171924.31801-3-paweldembicki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190703171924.31801-3-paweldembicki@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Pawel Dembicki <paweldembicki@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev <netdev@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 3, 2019 at 7:21 PM Pawel Dembicki <paweldembicki@gmail.com> wrote:

> This driver (currently) only takes control of the switch chip over
> SPI and configures it to route packages around when connected to a
> CPU port. But Vitesse chip support also parallel interface.
>
> This patch split driver into two parts: core and spi. It is required
> for add support to another managing interface.
>
> Tested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

That's a nice and clean split.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
