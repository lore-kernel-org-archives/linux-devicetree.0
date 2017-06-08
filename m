From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 09/11] gpio: dt-bindings: Add documentation for gpio
 controllers on Armada 7K/8K
Date: Thu, 8 Jun 2017 09:18:04 -0500
Message-ID: <20170608141804.fm72esb5lpbqcp4m@rob-hp-laptop>
References: <cover.8fe5f7c62a787452878ca071fa00b953e96988ef.1496413293.git-series.gregory.clement@free-electrons.com>
 <7b92aabfb7309eb0b138c149cc3fc61e8f64cd61.1496413293.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7b92aabfb7309eb0b138c149cc3fc61e8f64cd61.1496413293.git-series.gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, Nadav Haklai <nadavh@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Omri Itach <omrii@marvell.com>, Shadi Ammouri <shadi@marvell.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 02, 2017 at 04:23:16PM +0200, Gregory CLEMENT wrote:
> Document the device tree binding for the gpio controllers found on the
> Marvell Armada 7K and Armada 8K SoCs.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt  | 20 ++++++++++++++++++++
>  Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt | 24 +++++++++++++++++++++++-
>  Documentation/devicetree/bindings/gpio/gpio-mvebu.txt                      | 24 +++++++++++++++++-------
>  3 files changed, 60 insertions(+), 8 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
