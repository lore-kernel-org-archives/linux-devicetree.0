From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 3/4] RFC: net: dsa: Add bindings for Realtek SMI DSAs
Date: Wed, 29 Nov 2017 22:56:59 +0100
Message-ID: <20171129215659.GC1706@lunn.ch>
References: <20171105231909.5599-1-linus.walleij@linaro.org>
 <20171105231909.5599-4-linus.walleij@linaro.org>
 <20171105234831.GA24822@lunn.ch>
 <CACRpkdbzqnbF49yN-SAqLkhufk=R2C=jpdLo-QWmL0zR_+Vj=w@mail.gmail.com>
 <20171129155627.GD24881@lunn.ch>
 <CACRpkdZVXgFMiHpyUqw7ONYDcq6Htn3rTMRaBJkzd6T3WtX36A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZVXgFMiHpyUqw7ONYDcq6Htn3rTMRaBJkzd6T3WtX36A@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, Antti =?iso-8859-1?Q?Sepp=E4l=E4?= <a.seppala@gmail.com>, Roman Yeryomin <roman@advem.lv>, Colin Leitner <colin.leitner@googlemail.com>, Gabor Juhos <juhosg@openwrt.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus

> Just that the PHYs are on the MDIO bus inside the switch, of
> course.

I think the problem might be, you are using the DSA provided MDIO bus.
The Marvell switches has a similar setup in terms of interrupts. The
PHY interrupts appear within the switch. So i implemented an interrupt
controller, just the same as you.

The problem is, the DSA provided MDIO bus is not linked to device
tree. So you cannot have phy nodes in device tree associated to it.

What i did for the Marvell driver is that driver itself implements an
MDIO bus (two actually in some chips), and the internal or external
PHYs are placed on the switch drivers MDIO bus, rather than the DSA
MDIO bus. The switch driver MDIO bus links to an mdio node in device
tree. I can then have interrupt properties in the phys on this MDIO
bus in device tree.

What actually might make sense, is to have the DSA MDIO bus look
inside the switches device tree node and see if there is an mdio
node. If so allow dsa_switch_setup() to use of_mdiobus_register()
instead of mdiobus_register().

      Andrew
