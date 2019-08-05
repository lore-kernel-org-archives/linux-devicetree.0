From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 11/16] net: phy: adin: PHY reset mechanisms
Date: Mon, 5 Aug 2019 17:15:00 +0200
Message-ID: <20190805151500.GP24275@lunn.ch>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com>
 <20190805165453.3989-12-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190805165453.3989-12-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Aug 05, 2019 at 07:54:48PM +0300, Alexandru Ardelean wrote:
> The ADIN PHYs supports 4 types of reset:
> 1. The standard PHY reset via BMCR_RESET bit in MII_BMCR reg
> 2. Reset via GPIO
> 3. Reset via reg GeSftRst (0xff0c) & reload previous pin configs
> 4. Reset via reg GeSftRst (0xff0c) & request new pin configs
> 
> Resets 2 & 4 are almost identical, with the exception that the crystal
> oscillator is available during reset for 2.
> 
> Resetting via GeSftRst or via GPIO is useful when doing a warm reboot. If
> doing various settings via phytool or ethtool, the sub-system registers
> don't reset just via BMCR_RESET.
> 
> This change implements resetting the entire PHY subsystem during probe.
> During PHY HW init (phy_hw_init() logic) the PHY core regs will be reset
> again via BMCR_RESET. This will also need to happen during a PM resume.

phylib already has support for GPIO reset. So if possible, you should
not repeat that code here.

What is the difference between a GPIO reset, and a GPIO reset followed
by a subsystem soft reset?

   Andrew
