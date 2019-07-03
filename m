From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 7/7] net: phy: realtek: configure RTL8211E LEDs
Date: Wed, 3 Jul 2019 13:43:02 -0700
Message-ID: <20190703204302.GG250418@google.com>
References: <20190703193724.246854-1-mka@chromium.org>
 <20190703193724.246854-7-mka@chromium.org>
 <20190703201032.GG18473@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190703201032.GG18473@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 03, 2019 at 10:10:32PM +0200, Andrew Lunn wrote:
> > +	for (i = 0; i < count; i++) {
> > +		u32 val;
> > +
> > +		of_property_read_u32_index(dev->of_node,
> > +					   "realtek,led-modes", i, &val);
> 
> Please validate the value, 0 - 7.

ok, will be 0-7 and 0x10000 - 0x10007 (w/ RTL8211E_LINK_ACTIVITY) though.

This is the somewhat quirky part about the property, each value
translates to two registers. This seemed to be the cleanest solution
from the bindings perspective, but I'm open to other suggestions.
