From: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Subject: Re: NVMEM address DT post processing [Was: Re: [PATCH net 0/3] add
 property "nvmem_macaddr_swap" to swap macaddr bytes order]
Date: Mon, 13 May 2019 11:07:00 +0200
Message-ID: <20190513090700.GW81826@meh.true.cz>
References: <1557476567-17397-4-git-send-email-fugang.duan@nxp.com>
 <1557476567-17397-3-git-send-email-fugang.duan@nxp.com>
 <1557476567-17397-2-git-send-email-fugang.duan@nxp.com>
 <1557476567-17397-1-git-send-email-fugang.duan@nxp.com>
 <20190510112822.GT81826@meh.true.cz>
 <20190510113155.mvpuhe4yzxdaanei@flea>
 <20190511144444.GU81826@meh.true.cz>
 <547abcff-103a-13b8-f42a-c0bd1d910bbc@linaro.org>
Reply-To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <547abcff-103a-13b8-f42a-c0bd1d910bbc@linaro.org>
Sender: netdev-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Andy Duan <fugang.duan@nxp.com>, "davem@davemloft.net" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "john@phrozen.org" <john@phrozen.org>, "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Alban Bedel <albeu@free.fr>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Srinivas Kandagatla <srinivas.kandagatla@linaro.org> [2019-05-13 09:25:55]:

Hi,

> My initial idea was to add compatible strings to the cell so that most of
> the encoding information can be derived from it. For example if the encoding
> representing in your example is pretty standard or vendor specific we could
> just do with a simple compatible like below:

that vendor/compatible list would be quite long[1], there are hundreds of
devices in current OpenWrt tree (using currently custom patch) and probably
dozens currently unsupported (ASCII encoded MAC address in NVMEM). So my goal
is to add some DT functionality which would cover all of these.

> eth1_addr: eth-mac-addr@18a {
> 	compatible = "xxx,nvmem-mac-address";
> 	reg = <0x18a 0x11>;	
> };

while sketching the possible DT use cases I came to the this option as well, it
was very compeling as it would kill two birds with one stone (fix outstanding
MTD/NVMEM OF clash as well[2]), but I think, that it makes more sense to add
this functionality to nvmem core so it could be reused by other consumers, not
just by network layer.

1. https://git.openwrt.org/?p=openwrt%2Fopenwrt.git&a=search&h=HEAD&st=grep&s=mtd-mac-address
2. https://lore.kernel.org/netdev/20190418133646.GA94236@meh.true.cz

-- ynezz
