From: ynezz <ynezz@ibawizard.net>
Subject: Re: [PATCH net 0/3] add property "nvmem_macaddr_swap" to swap
 macaddr bytes order
Date: Mon, 13 May 2019 11:35:39 +0200
Message-ID: <20190513082625.GA14498@ibawizard.net>
References: <1557476567-17397-4-git-send-email-fugang.duan@nxp.com>
 <1557476567-17397-3-git-send-email-fugang.duan@nxp.com>
 <1557476567-17397-2-git-send-email-fugang.duan@nxp.com>
 <1557476567-17397-1-git-send-email-fugang.duan@nxp.com>
 <20190510112822.GT81826@meh.true.cz>
 <20190510113155.mvpuhe4yzxdaanei@flea>
 <VI1PR0402MB3600516CFAD9227B0E175DF4FF0F0@VI1PR0402MB3600.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <VI1PR0402MB3600516CFAD9227B0E175DF4FF0F0@VI1PR0402MB3600.eurprd04.prod.outlook.com>
Sender: netdev-owner@vger.kernel.org
To: Andy Duan <fugang.duan@nxp.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>, "davem@davemloft.net" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "john@phrozen.org" <john@phrozen.org>, "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Alban Bedel <albeu@free.fr>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Andy Duan <fugang.duan@nxp.com> [2019-05-13 03:38:32]:

> From: Maxime Ripard <maxime.ripard@bootlin.com> Sent: Friday, May 10, 2019 7:32 PM
> > 
> > It looks to me that it should be abstracted away by the nvmem interface and
> > done at the provider level, not the customer.
> > 
> If to implement add above features like Petr Štetiar described, it should be abstracted
> In nvmem core driver.

Maxime made it clear, that network layer as a consumer of the nvmem provider
doesn't need to know about this byte order swapping details, so this byte
order swapping should be implemented in nvmem as well, as a bonus it doesn't
matter if you're going to swap 3, 6 or whatever other amount of bytes
described by the reg property, so this functionality could be reused which is
always good.

-- ynezz
