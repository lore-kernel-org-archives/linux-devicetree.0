From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 3/4] RFC: net: dsa: Add bindings for Realtek SMI DSAs
Date: Wed, 29 Nov 2017 16:56:27 +0100
Message-ID: <20171129155627.GD24881@lunn.ch>
References: <20171105231909.5599-1-linus.walleij@linaro.org>
 <20171105231909.5599-4-linus.walleij@linaro.org>
 <20171105234831.GA24822@lunn.ch>
 <CACRpkdbzqnbF49yN-SAqLkhufk=R2C=jpdLo-QWmL0zR_+Vj=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbzqnbF49yN-SAqLkhufk=R2C=jpdLo-QWmL0zR_+Vj=w@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, Antti =?iso-8859-1?Q?Sepp=E4l=E4?= <a.seppala@gmail.com>, Roman Yeryomin <roman@advem.lv>, Colin Leitner <colin.leitner@googlemail.com>, Gabor Juhos <juhosg@openwrt.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> I have the phy-handle in the ethernet controller. This RTL8366RB
> thing is just one big PHY as far as I know.

Hi Linus

We don't model switches as PHYs. They are their own device type.  And
the internal or external PHYs are just normal PHYs in the linux
model. Meaning their interrupt properties goes in the PHY node in
device tree, as documented in the phy.txt binding documentation.

       Andrew
