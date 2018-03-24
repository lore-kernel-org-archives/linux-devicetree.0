Return-Path: <SRS0=ztFR=GO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:41168 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752579AbeCXStF (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 24 Mar 2018 14:49:05 -0400
Date: Sat, 24 Mar 2018 19:48:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next RFC V1 5/5] net: mdio: Add a driver for InES
 time stamping IP core.
Message-ID: <20180324184858.GF31941@lunn.ch>
References: <cover.1521656774.git.richardcochran@gmail.com>
 <e9def53dd0f751d7f5e3df47e604d7ccb6020159.1521656774.git.richardcochran@gmail.com>
 <20180321193315.GR24516@lunn.ch>
 <20180321213636.2mmfveu2vg5qbwpp@localhost>
 <20180321214436.GX24516@lunn.ch>
 <20180321215729.engnoxpaympvvdc5@localhost>
 <20180321221652.GZ24516@lunn.ch>
 <20180321224702.cbcq3wckmojsrgjf@localhost>
 <20180321235007.GA28402@lunn.ch>
 <20180324171219.vh6wcxbem3hyhkuu@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180324171219.vh6wcxbem3hyhkuu@localhost>
Sender: devicetree-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

On Sat, Mar 24, 2018 at 10:12:19AM -0700, Richard Cochran wrote:
> On Thu, Mar 22, 2018 at 12:50:07AM +0100, Andrew Lunn wrote:
> > How clever is this device? Can it tell the difference between
> > 1000Base-X and SGMII? Can it figure out that the MAC is repeating
> > every bit 100 times and so has dropped to 10Mbits? Does it understand
> > EEE? Does it need to know if RGMII or RGMII-ID is being used?
> 
> This device isn't configurable at run time for any of those AFAICT.
> Those decisions are made when the IP core is synthesized as part of
> the HW design.

Hi Richard

Should we be designing an API for this specific device, or should we
think of the general case?

The general case would be a device which passes through MII signals,
and has some sort of control interface.

The control interface could be MMIO as here, MDIO, I2C, SPI, etc.

The MII interfaces could be MII, RMII, GMII, RGMII, SGMII, QSGMII,
XGMII, etc. Generally, a device which can do GMII can also do RGMII,
etc.

The device probably needs to know about the MII bus. If it is
synthesized as part of the hardware design, it might be able to get
this information directly from the MAC IP core. An external device
probably needs to be told. Especially when it comes to RGII, where the
clocking is 'interesting'.

As you already said, you need to know link speed. Do we want to be
able to restrict the MAC to specific link speeds? The Marvell MACs can
do a 2.5Gbps SGMII, by speeding up the clock. I can image a PTP device
not supporting this, the MII breaks, but PHY looks happy. To limit
this cleanly, you at least need to mask out the unsupported auto-neg
offered speeds.

With EEE there is probably two cases:

1) The PTP device understands it, but needs to be told it has been enabled.
2) The PTP device breaks when EEE is enabled, so EEE needs to be disabled.

To me, 1) seems pretty unlikely. But 2) is possible. Disabling EEE
again means changing the auto-neg parameters, so that EEE is not
offered.

As far as i can see, you have three basic problems:

1) How do you associate the PTP device to the netdev?
2) How do you get the information you need to configure the PTP device
3) How do you limit the MAC/PHY to what the PTP device can do.

For 1) you need some sort of phandle, either in the MAC, or the PHY
section of device tree. There is currently no generic code for
handling MAC OF nodes. phylib however does do all the generic work for
PHY nodes in DT.

2) you can get some of the information you need via notifiers. e.g,
NETDEV_CHANGE tells you something has happen, up/down, etc. But i'm
not sure it is 100% reliable. A PHY might be able to do 1G->100M
without going down and back up again, so you don't get a NETDEV_CHANGE
event. There is no notification of how the MII bus is being used.  So
i think notifiers is probably not the best bet.

phylib does have all this information. It is phylib that calls the MAC
with link speed information. When the MAC connects to the PHY, it
passes the MII mode, and when the PHY requests the MII mode changes,
phylib knows. The MAC has to call phy_init_eee() to see if the PHY is
EEE capable. phylib also tells the MAC what speeds the PHY is capable
off, so it is in the position to mask out speeds the PTP device does
not support, etc.

So i really think you need to cleanly integrate into phylib and
phylink.

	Andrew
