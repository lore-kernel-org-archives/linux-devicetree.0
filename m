From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 1/7] dt-bindings: net: Add bindings for Realtek PHYs
Date: Mon, 8 Jul 2019 23:13:48 +0200
Message-ID: <20190708211348.GA17857@lunn.ch>
References: <20190708192459.187984-1-mka@chromium.org>
 <20190708192459.187984-2-mka@chromium.org>
 <20190708194615.GH9027@lunn.ch>
 <20190708200136.GM250418@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190708200136.GM250418@google.com>
Sender: netdev-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 08, 2019 at 01:01:36PM -0700, Matthias Kaehlcke wrote:
> On Mon, Jul 08, 2019 at 09:46:15PM +0200, Andrew Lunn wrote:
> > On Mon, Jul 08, 2019 at 12:24:53PM -0700, Matthias Kaehlcke wrote:
> > > Add the 'realtek,eee-led-mode-disable' property to disable EEE
> > > LED mode on Realtek PHYs that support it.
> > > 
> > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > > ---
> > > TODO: adapt PHY core to deal with optional compatible strings
> > 
> > Yes. Does this even work at the moment? I would expect
> > of_mdiobus_child_is_phy() to return false, indicating the device is
> > not actually a PHY.
> 
> Indeed, it currently doesn't work atm. I found that removing the check
> for dev->of_node in of_mdiobus_link_mdiodev() helps, but I imagine
> doing (only) this might have undesired side-effects.

O.K.

Please put RFC in patches like this which don't actually work and so
should not be merged. We don't want David accidentally merging them!

       Andrew
