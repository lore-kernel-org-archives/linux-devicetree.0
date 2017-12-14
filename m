From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: [PATCH 0/2] Add SFF module support
Date: Thu, 14 Dec 2017 10:27:13 +0000
Message-ID: <20171214102712.GP10595@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for SFF modules.  SFF modules are similar to SFP modules,
but they have fewer control signals, and are soldered down rather than
pluggable.

They also have different IDs in the EEPROM to identify as soldered down
SFF modules.

 Documentation/devicetree/bindings/net/sff,sfp.txt | 10 ++-
 drivers/net/phy/sfp.c                             | 78 +++++++++++++++++++----
 include/linux/sfp.h                               |  1 +
 3 files changed, 72 insertions(+), 17 deletions(-)

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
