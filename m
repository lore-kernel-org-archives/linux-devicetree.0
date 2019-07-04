From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] net: dsa: Change DT bindings for Vitesse VSC73xx switches
Date: Thu, 4 Jul 2019 09:05:03 +0200
Message-ID: <CACRpkdb5LonYLpbOHj=Oo8Z7XjVUWoO0CuhOokxfSoY_fRinPw@mail.gmail.com>
References: <20190703171924.31801-1-paweldembicki@gmail.com> <20190703171924.31801-2-paweldembicki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703171924.31801-2-paweldembicki@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Dembicki <paweldembicki@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev <netdev@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 3, 2019 at 7:21 PM Pawel Dembicki <paweldembicki@gmail.com> wrote:

> This commit introduce how to use vsc73xx platform driver.
>
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

Nice!

> +If Platform driver is used, the device tree node is an platform device so it
> +must reside inside a platform bus device tree node.

I would write something like "when connected to a memory bus, and
used in memory-mapped I/O mode, a platform device is used to represent
the vsc73xx" so it is clear what is going on.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
