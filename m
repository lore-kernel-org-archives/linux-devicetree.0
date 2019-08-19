From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v6 1/4] dt-bindings: net: phy: Add subnode for LED
 configuration
Date: Mon, 19 Aug 2019 02:29:51 +0200
Message-ID: <20190819002951.GA8981@lunn.ch>
References: <20190813191147.19936-1-mka@chromium.org>
 <20190813191147.19936-2-mka@chromium.org>
 <20190816201338.GA1646@bug>
 <20190816220411.GX250418@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190816220411.GX250418@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Pavel Machek <pavel@ucw.cz>, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 16, 2019 at 03:04:11PM -0700, Matthias Kaehlcke wrote:
> On Fri, Aug 16, 2019 at 10:13:38PM +0200, Pavel Machek wrote:
> > Hi!
> > 
> > Please Cc led mailing lists on led issues.
> 
> sorry for missing this
> 
> > On Tue 2019-08-13 12:11:44, Matthias Kaehlcke wrote:
> > > The LED behavior of some Ethernet PHYs is configurable. Add an
> > > optional 'leds' subnode with a child node for each LED to be
> > > configured. The binding aims to be compatible with the common
> > > LED binding (see devicetree/bindings/leds/common.txt).
> > > 
> > > A LED can be configured to be:
> > > 
> > > - 'on' when a link is active, some PHYs allow configuration for
> > >   certain link speeds
> > >   speeds
> > > - 'off'
> > > - blink on RX/TX activity, some PHYs allow configuration for
> > >   certain link speeds
> > > 
> > > For the configuration to be effective it needs to be supported by
> > > the hardware and the corresponding PHY driver.
> > > 
> > > Suggested-by: Andrew Lunn <andrew@lunn.ch>
> > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > 
> > > @@ -173,5 +217,20 @@ examples:
> > >              reset-gpios = <&gpio1 4 1>;
> > >              reset-assert-us = <1000>;
> > >              reset-deassert-us = <2000>;
> > > +
> > > +            leds {
> > > +                #address-cells = <1>;
> > > +                #size-cells = <0>;
> > > +
> > > +                led@0 {
> > > +                    reg = <0>;
> > > +                    linux,default-trigger = "phy-link-1g";
> > > +                };
> > 
> > Because this affects us.
> > 
> > Is the LED software controllable?
> 
> it might be for certain PHYs, integration with the LED framework is
> not part of this series.
> 
> > Or can it do limited subset of triggers you listed?
> 
> it depends on the PHY. The one in this series (RTL8211E) only supports
> a limited subset of the listed triggers.

Hi Pavel

At the moment, there is no integration with the LED
subsystem. However, i would like to be prepared for it in the
future. It will also require some extensions to the LED subsystem.
These triggers are hardware triggers. We would need to add support for
LED trigger offload to the hardware, not have Linux blink the LED in
software. Plus we need per LED triggers, not only global triggers.
Most Ethernet PHYs also allow on/off state to be set, so they could be
software controllable, and support the generic triggers Linux has.

It has been on my mind to do this for a while, but i've never had the
time. It should also be applicable to other subsystems which have
hardware to blink LEDs. Some serial ports can control LEDs for Rx/Tx
and flow control. Maybe disk/RAID controllers are configuration how
they blink there LEDs?

      Andrew
