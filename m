From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 3/4] net: macb: Drop nvmem_get_mac_address usage
Date: Sun, 28 Apr 2019 23:36:40 +0200
Message-ID: <20190428213640.GB10772@lunn.ch>
References: <1556456002-13430-1-git-send-email-ynezz@true.cz>
 <1556456002-13430-4-git-send-email-ynezz@true.cz>
 <20190428165637.GJ23059@lunn.ch>
 <20190428210814.GA346@meh.true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190428210814.GA346@meh.true.cz>
Sender: netdev-owner@vger.kernel.org
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Alban Bedel <albeu@free.fr>
List-Id: devicetree@vger.kernel.org

> so if I understand this correctly, it probably means, that this approach with
> modified of_get_mac_address is dead end as current of_get_mac_address users
> don't expect and handle possible -EPROBE_DEFER error, so I would need to
> change all the current users, which is nonsense.

Hi Petr

I would not say it is dead, it just needs a bit more work.

The current users should always be checking for a NULL pointer.  You
just need to change that to !IS_ERR(). You can then return
ERR_PTR(-PROBE_DEFER) from the NVMEM operation.

And i agree, wrapping this all up inside of_get_mac_address() is the
correct way to do this.

     Andrew
