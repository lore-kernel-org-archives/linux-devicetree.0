From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [RFC PATCH 4/6] dt-bindings: update mvneta binding document
Date: Wed, 5 Dec 2018 11:00:09 +0000
Message-ID: <20181205110009.GQ30658@n2100.armlinux.org.uk>
References: <20181112122933.GD30658@n2100.armlinux.org.uk>
 <E1gMBMs-00089t-Fd@rmk-PC.armlinux.org.uk>
 <20181203235455.GA5851@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181203235455.GA5851@bogus>
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 03, 2018 at 05:54:55PM -0600, Rob Herring wrote:
> On Mon, Nov 12, 2018 at 12:31:02PM +0000, Russell King wrote:
> > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> 
> Needs a better subject and a commit msg.

Hmm, not sure why it didn't contain:

"dt-bindings: net: mvneta: add phys property

Add an optional phys property to the mvneta binding documentation for
the common phy.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>"

as the commit message.  With the correct commit message, are you happy
with it?

> 
> > ---
> >  Documentation/devicetree/bindings/net/marvell-armada-370-neta.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/marvell-armada-370-neta.txt b/Documentation/devicetree/bindings/net/marvell-armada-370-neta.txt
> > index bedcfd5a52cd..691f886cfc4a 100644
> > --- a/Documentation/devicetree/bindings/net/marvell-armada-370-neta.txt
> > +++ b/Documentation/devicetree/bindings/net/marvell-armada-370-neta.txt
> > @@ -19,7 +19,7 @@
> >    "marvell,armada-370-neta" and 9800B for others.
> >  - clock-names: List of names corresponding to clocks property; shall be
> >    "core" for core clock and "bus" for the optional bus clock.
> > -
> > +- phys: comphy for the ethernet port, see ../phy/phy-bindings.txt
> >  
> >  Optional properties (valid only for Armada XP/38x):
> >  
> > -- 
> > 2.7.4
> > 

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
