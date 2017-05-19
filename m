From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH 5/6] gpio: mvebu: Add support for the Armada 7K/8K SoCs
Date: Fri, 19 May 2017 17:27:36 +0100
Message-ID: <20170519162736.GU22219@n2100.armlinux.org.uk>
References: <cover.e10718b9c0f9fdd07327ae14e213be8da5b1f7ef.1495210061.git-series.gregory.clement@free-electrons.com>
 <54efbdfb0a9800b2c72c6fa1d945c87182b242b4.1495210061.git-series.gregory.clement@free-electrons.com>
 <20170519162410.GT22219@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170519162410.GT22219@n2100.armlinux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Alexandre Courbot <gnurou@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linus.walleij@linaro.org>, Omri Itach <omrii@marvell.com>, linux-kernel@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Neta Zur Hershkovits <neta@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Shadi Ammouri <shadi@marvell.com>, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, May 19, 2017 at 05:24:10PM +0100, Russell King - ARM Linux wrote:
> On Fri, May 19, 2017 at 06:09:24PM +0200, Gregory CLEMENT wrote:
> > The Armada 7K and 8K SoCs use the same gpio controller as most of the
> > other mvebu SoCs. However, the main difference is that the GPIO
> > controller is part of a bigger system controller, and a syscon is used to
> > control the overall system controller. Therefore, the driver needs to be
> > adjusted to retrieve the regmap of the syscon to access registers, and
> > account for the fact that registers are located at a certain offset
> > within the regmap.
> > 
> > This commit add the support of the syscon and introduce a new variant for
> > this case.
> 
> Do you really need all this complexity of merging what seems to be two
> GPIO devices into one for DT purposes?  The device itself appears to be
> two instances of the orion-gpio controller, one at 0x100 into the
> system controller and a second one at 0x140.
> 
> If you instantiate two orion-gpio controllers, then you don't need to
> add the "mvchip->offset" stuff.
> 
> I'd also say that it was the more correct approach, rather than adding
> more complexity to GPIO drivers to support whatever incarnation comes
> next.

Hmm, in fact, mvebu->offset always appears to be zero in this driver,
so I think the changes that add this member are entirely rendundant to
the function of this patch.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
