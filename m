From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 0/9] Add support for the pin controllers on the Marvell
 Armada 7K/8K
Date: Wed, 31 May 2017 11:15:43 +0200
Message-ID: <20170531111543.7c753308@free-electrons.com>
References: <cover.0dd8a92ae74fcec8d0470d0a7016035089e46eed.1495209664.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.0dd8a92ae74fcec8d0470d0a7016035089e46eed.1495209664.git-series.gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Omri Itach <omrii@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Neta Zur Hershkovits <neta@marvell.com>, Shadi Ammouri <shadi@marvell.com>, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello,

On Fri, 19 May 2017 18:04:42 +0200, Gregory CLEMENT wrote:

> Gregory CLEMENT (6):
>   MAINTAINERS: extend mvebu SoC entry with pinctrl drivers
>   pinctrl: dt-bindings: add documentation for AP806 pin controllers
>   pinctrl: dt-bindings: add documentation for CP110 pin controllers
>   pinctrl: mvebu: remove the offset property for regmap
>   arm64: marvell: enable the Armada 7K/8K pinctrl driver
>   arm64: dts: marvell: add pinctrl support for Armada 7K/8K
> 
> Hanna Hawa (2):
>   pinctrl: mvebu: add driver for Armada AP806 pinctrl
>   pinctrl: mvebu: add driver for Armada CP110 pinctrl
> 
> Russell King (1):
>   pinctrl: avoid PLAT_ORION dependency

I have tested the combination of your four series (touching clock,
pinmux and gpio) on Armada 8K MacchiatoBin, and I was able to validate
that the CP110 pinmuxing works as expected.

I used MPP37 and MPP38, which I was able to configure as GPIO or I2C0,
and validate that they are working as GPIOs and as I2C0.

I was however unable to test the AP MPPs due to the lack of access to
such pins.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
