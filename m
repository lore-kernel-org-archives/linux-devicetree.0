From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v5 10/13] net: phy: adin: implement PHY subsystem
 software reset
Date: Fri, 16 Aug 2019 15:19:52 +0200
Message-ID: <20190816131952.GA307@lunn.ch>
References: <20190816131011.23264-1-alexandru.ardelean@analog.com>
 <20190816131011.23264-11-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190816131011.23264-11-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, Aug 16, 2019 at 04:10:08PM +0300, Alexandru Ardelean wrote:
> The ADIN PHYs supports 4 types of reset:
> 1. The standard PHY reset via BMCR_RESET bit in MII_BMCR reg
> 2. Reset via GPIO
> 3. Reset via reg GeSftRst (0xff0c) & reload previous pin configs
> 4. Reset via reg GeSftRst (0xff0c) & request new pin configs
> 
> Resets 2, 3 & 4 are almost identical, with the exception that the crystal
> oscillator is available during reset for 2.
> 
> This change implements subsystem software reset via the GeSftRst and
> reloading the previous pin configuration (so reset number 3).
> This will also reset the PHY core regs (similar to reset 1).
> 
> Since writing bit 1 to reg GeSftRst is self-clearing, the only thing that
> can be done, is to write to that register, wait a specific amount of time
> (10 milliseconds should be enough) and try to read back and check if there
> are no errors on read. A busy-wait-read won't work well, and may sometimes
> work or not work.
> 
> In case phylib is configured to also do a reset via GPIO, the ADIN PHY may
> be reset twice when the PHY device registers, but that isn't a problem,
> since it's being done on boot (or PHY device register).
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
