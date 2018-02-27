Return-Path: <SRS0=zzru=FV=armlinux.org.uk=linux+robh+dt=kernel.org@kernel.org>
Date: Tue, 27 Feb 2018 15:52:18 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: [PATCH net-next 0/4] SFP updates
Message-ID: <20180227155218.GT9418@n2100.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Included in this series are a further few updates for SFP support:

- Adding support for Fiberstore's non-standard BiDi modules operating
  at 1310nm/1550nm wavelengths rather than the 1000BASE-BX standard of
  1310nm/1490nm.
- Adding support for negotiating the PHY interface mode with the MAC,
  so that modules supporting faster speeds and Gigabit ethernet work
  with Gigabit-only MACs.
- Adding support for high power (>1W) SFP modules.

 Documentation/devicetree/bindings/net/sff,sfp.txt |   5 +
 drivers/net/phy/phylink.c                         |  33 +++--
 drivers/net/phy/sfp-bus.c                         | 162 ++++++++++------------
 drivers/net/phy/sfp.c                             | 150 +++++++++++++++++---
 include/linux/sfp.h                               |  18 +--
 5 files changed, 243 insertions(+), 125 deletions(-)

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
