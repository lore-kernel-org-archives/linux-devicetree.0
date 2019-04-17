From: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Subject: Re: [PATCH] of_net: add mtd-mac-address support to
 of_get_mac_address()
Date: Wed, 17 Apr 2019 18:06:00 +0200
Message-ID: <20190417160600.GD79403@meh.true.cz>
References: <1555445100-30936-1-git-send-email-ynezz@true.cz>
 <20190417080614.edt25ynuvae5fn64@flea>
Reply-To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190417080614.edt25ynuvae5fn64@flea>
Sender: netdev-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
List-Id: devicetree@vger.kernel.org

Maxime Ripard <maxime.ripard@bootlin.com> [2019-04-17 10:06:14]:

> NVMEM is supported by of_net already

Well, not anymore:

 commit afa64a72b862a7a9d04f8d07fba632eaf06b23f8
 Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
 Date:   Fri Nov 30 09:20:59 2018 +0100

    of: net: kill of_get_nvmem_mac_address()

Now, I'm really confused.

Documentation/devicetree/bindings/net/ethernet.txt states following:

 - nvmem-cells: phandle, reference to an nvmem node for the MAC address;
 - nvmem-cell-names: string, should be "mac-address" if nvmem is to be used;

which is actually misleading and confusing. There are only two ethernet
drivers in the tree cadence and davinci which support this properties. Well
there's nixge, but this one is special, because it has renamed `mac-address`
to `address` with it's own implementation in `nixge_get_nvmem_address`.

All other ethernet drivers (and few others) simply use `of_get_mac_address`
which doesn't support NVMEM and the documented nvmem-cells* properties.

> so it doesn't look really necessary to create additional properties that
> cover the same use case.

NVMEM could be reused for this purpose and it seems like a way to go, probably
if we could wire `nvmem_get_mac_address` into `of_get_mac_address` and find a
way how to handle the remaining use cases currently not handled in NVMEM:

 * MAC address (octet/byte) incrementation (already handled by the proposed patch)
 * MAC address stored as ascii/text (0090FEC9CBE4 and 00:90:FE:C9:CB:E4
   formats) which is currently missing but would be nice to have

I can prepare patches for that, just don't want to waste more time then really
necessary, so it would really help me if someone could tell me how this should
be implemented in NVMEM and I'll simply do it in this acceptable way and call
it a day.

Thanks!

-- ynezz
