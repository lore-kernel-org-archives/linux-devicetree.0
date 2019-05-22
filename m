From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 6/8] net: phy: dp83867: IO impedance is not
 dependent on RGMII delay
Date: Wed, 22 May 2019 21:03:10 +0200
Message-ID: <20190522190310.GD7281@lunn.ch>
References: <20190522184255.16323-1-tpiepho@impinj.com>
 <20190522184255.16323-6-tpiepho@impinj.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190522184255.16323-6-tpiepho@impinj.com>
Sender: netdev-owner@vger.kernel.org
To: Trent Piepho <tpiepho@impinj.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 22, 2019 at 06:43:25PM +0000, Trent Piepho wrote:
> The driver would only set the IO impedance value when RGMII internal
> delays were enabled.  There is no reason for this.  Move the IO
> impedance block out of the RGMII delay block.
> 
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
