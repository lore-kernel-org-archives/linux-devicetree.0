From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/6] gpio: mvebu: switch to regmap for register access
Date: Tue, 23 May 2017 11:16:52 +0200
Message-ID: <CACRpkdb5MkLrp-vVZupsBHL4wkwWS2JVWk5DaTB1VSn9XHNYaQ@mail.gmail.com>
References: <cover.e10718b9c0f9fdd07327ae14e213be8da5b1f7ef.1495210061.git-series.gregory.clement@free-electrons.com>
 <d3d38eb9cec70544aeedcc76a29e3372ea5683e8.1495210061.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <d3d38eb9cec70544aeedcc76a29e3372ea5683e8.1495210061.git-series.gregory.clement@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>, Nadav Haklai <nadavh@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Omri Itach <omrii@marvell.com>, Shadi Ammouri <shadi@ma>
List-Id: devicetree@vger.kernel.org

On Fri, May 19, 2017 at 6:09 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> In order to be able to use this driver with the Armada 7K/8K SoCs, we
> need to use the regmap to access the registers. Indeed for these new SoCs,
> the gpio node will be part of a syscon.
>
> [gregory.clement@free-electrons.com:
>  - fixed merge conflcit from 4.10 to 4.12-rc1
>  - added a commit log]
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Patch applied.

Yours,
Linus Walleij
