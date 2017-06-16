From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 5/9] pinctrl: mvebu: add driver for Armada AP806 pinctrl
Date: Fri, 16 Jun 2017 11:23:07 +0200
Message-ID: <CACRpkdZ6Fkt=7y0mgEDv9h_=eh7yhb9JrZnGUSE=RO1w8Z-OAg@mail.gmail.com>
References: <cover.d003a5e862e6d732d901a61d1765a349c9a89eef.1497281623.git-series.gregory.clement@free-electrons.com>
 <a557c9f9a37ed42b8b2fa850c58a3bd82c45644a.1497281623.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a557c9f9a37ed42b8b2fa850c58a3bd82c45644a.1497281623.git-series.gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>, Nadav Haklai <nadavh@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Omri Itach <omrii@marvell.com>, Shadi Ammouri <shadi@marvell.com>, Hanna Hawa <hannah@marvell>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 12, 2017 at 5:34 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> From: Hanna Hawa <hannah@marvell.com>
>
> This commit adds a pinctrl driver for the pin-muxing controller found in
> the AP806 part of the Marvell Armada 7K and 8K SoCs. Its register
> interface is compatible with the one used by previous mvebu pin
> controllers, so the common logic in drivers/pinctrl/mvebu/pinctrl-mvebu.c
> is used.
>
> Signed-off-by: Hanna Hawa <hannah@marvell.com>
> Reviewed-by: Shadi Ammouri <shadi@marvell.com>
> [updated for mvebu pinctrl changes
>  - converted to simple_mmio
>  - removed unimplemented .remove function
>  - removed DTS description
>   - converted  to use syscon/regmap
>  --rmk]
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Patch applied.

Yours,
Linus Walleij
