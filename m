From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH net-next 2/3] net: phy: add amlogic g12a mdio mux support
Date: Sat, 16 Mar 2019 18:02:45 +0100
Message-ID: <13432d537f671c8065693b7e53348f812e8bbc04.camel@baylibre.com>
References: <20190314140135.19184-1-jbrunet@baylibre.com>
         <20190314140135.19184-3-jbrunet@baylibre.com>
         <20190316025448.GD29548@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190316025448.GD29548@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, Kevin Hilman <khilman@baylibre.com>, netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 2019-03-16 at 03:54 +0100, Andrew Lunn wrote:
> On Thu, Mar 14, 2019 at 03:01:34PM +0100, Jerome Brunet wrote:
> > > +static int _g12a_enable_internal_mdio(struct g12a_mdio_mux *priv)
> 
> You would generally use the _ prefix when you have a locked and an
> unlocked version. I don't see anything like this here. So please drop
> the _ .
> 

will do

> Nice to see the generic clock framework being used. I just wonder if
> this is the correct place to have this clock code. Can it be made part
> of the SoC clock code?

the PLL is local to this particular device.

In 'Soc clock code' (driver/clk/meson in this case) we usually put clock
controllers. Those controllers feeds the different devices of the SoC but we
tends some more clock elements in the consumer device

Usually, it is just a few mux, dividers and gates (like in
drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c) but in this case, we have
a PLL. IMO, it belongs here. Do you see a problem with this ?

Jerome

> 
>     Andrew
