From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next RFC V1 5/5] net: mdio: Add a driver for InES
 time stamping IP core.
Date: Sat, 24 Mar 2018 21:51:52 -0700
Message-ID: <20180325045151.kq7mjopjwzo6w2vw@localhost>
References: <e9def53dd0f751d7f5e3df47e604d7ccb6020159.1521656774.git.richardcochran@gmail.com>
 <20180321193315.GR24516@lunn.ch>
 <20180321213636.2mmfveu2vg5qbwpp@localhost>
 <20180321214436.GX24516@lunn.ch>
 <20180321215729.engnoxpaympvvdc5@localhost>
 <20180321221652.GZ24516@lunn.ch>
 <20180321224702.cbcq3wckmojsrgjf@localhost>
 <20180321235007.GA28402@lunn.ch>
 <20180324171219.vh6wcxbem3hyhkuu@localhost>
 <20180324184858.GF31941@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180324184858.GF31941@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 24, 2018 at 07:48:58PM +0100, Andrew Lunn wrote:
> As far as i can see, you have three basic problems:
> 
> 1) How do you associate the PTP device to the netdev?
> 2) How do you get the information you need to configure the PTP device

Yes, yes.

> 3) How do you limit the MAC/PHY to what the PTP device can do.

Hm, I don't think this is important.
 
> phylib does have all this information. It is phylib that calls the MAC
> with link speed information. When the MAC connects to the PHY, it
> passes the MII mode, and when the PHY requests the MII mode changes,
> phylib knows. The MAC has to call phy_init_eee() to see if the PHY is
> EEE capable. phylib also tells the MAC what speeds the PHY is capable
> off, so it is in the position to mask out speeds the PTP device does
> not support, etc.

Right, so phylib can operate on phydev->attached_dev->mdiots;

> So i really think you need to cleanly integrate into phylib and
> phylink.

So I think I've done that, more or less, but I'd like to hear your
ideas on how to make it cleaner...

Thanks,
Richard
