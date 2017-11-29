From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] RFC: net: dsa: Add bindings for Realtek SMI DSAs
Date: Wed, 29 Nov 2017 22:28:44 +0100
Message-ID: <CACRpkdZVXgFMiHpyUqw7ONYDcq6Htn3rTMRaBJkzd6T3WtX36A@mail.gmail.com>
References: <20171105231909.5599-1-linus.walleij@linaro.org>
 <20171105231909.5599-4-linus.walleij@linaro.org> <20171105234831.GA24822@lunn.ch>
 <CACRpkdbzqnbF49yN-SAqLkhufk=R2C=jpdLo-QWmL0zR_+Vj=w@mail.gmail.com> <20171129155627.GD24881@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20171129155627.GD24881@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala@gmail.com>, Roman Yeryomin <roman@advem.lv>, Colin Leitner <colin.leitner@googlemail.com>, Gabor Juhos <juhosg@openwrt.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 29, 2017 at 4:56 PM, Andrew Lunn <andrew@lunn.ch> wrote:
>> I have the phy-handle in the ethernet controller. This RTL8366RB
>> thing is just one big PHY as far as I know.
>
> We don't model switches as PHYs. They are their own device type.  And
> the internal or external PHYs are just normal PHYs in the linux
> model. Meaning their interrupt properties goes in the PHY node in
> device tree, as documented in the phy.txt binding documentation.

I do model the PHYs on the switch as PHYs.
They are using the driver in drivers/phy/realtek.c.

The interrupts are assigned to the PHYs not to the Switch.
Just that the PHYs are on the MDIO bus inside the switch, of
course.

The switch however provides an irqchip to demux the interrupts.

I think there is some misunderstanding in what I'm trying to do..

I have tried learning the DSA ideas by reading e.g. your paper:
https://www.netdevconf.org/2.1/papers/distributed-switch-architecture.pdf

So I try my best to conform with these ideas.

I however have a hard time testing things since I don't really have a
system to compare to. What would be useful is to know how
commands like "ip" and "ifconfig" are used on a typical
say home router.

Yours,
Linus Walleij
