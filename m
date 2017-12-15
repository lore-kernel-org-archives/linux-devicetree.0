From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 0/2] Add SFF module support
Date: Fri, 15 Dec 2017 13:23:35 -0500 (EST)
Message-ID: <20171215.132335.1190371629732457057.davem@davemloft.net>
References: <20171214102712.GP10595@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20171214102712.GP10595@n2100.armlinux.org.uk>
Sender: netdev-owner@vger.kernel.org
To: linux@armlinux.org.uk
Cc: andrew@lunn.ch, f.fainelli@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Russell King - ARM Linux <linux@armlinux.org.uk>
Date: Thu, 14 Dec 2017 10:27:13 +0000

> Add support for SFF modules.  SFF modules are similar to SFP modules,
> but they have fewer control signals, and are soldered down rather than
> pluggable.
> 
> They also have different IDs in the EEPROM to identify as soldered down
> SFF modules.

Series applied.
