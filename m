From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 4/8] net: phy: dp83867: Rework delay rgmii
 delay handling
Date: Wed, 22 May 2019 20:54:00 +0200
Message-ID: <20190522185400.GB7281@lunn.ch>
References: <20190522184255.16323-1-tpiepho@impinj.com>
 <20190522184255.16323-4-tpiepho@impinj.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190522184255.16323-4-tpiepho@impinj.com>
Sender: netdev-owner@vger.kernel.org
To: Trent Piepho <tpiepho@impinj.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 22, 2019 at 06:43:23PM +0000, Trent Piepho wrote:
> The code was assuming the reset default of the delay control register
> was to have delay disabled.  This is what the datasheet shows as the
> register's initial value.  However, that's not actually true: the
> default is controlled by the PHY's pin strapping.
> 
> If the interface mode is selected as RX or TX delay only, insure the
> other direction's delay is disabled.
> 
> If the interface mode is just "rgmii", with neither TX or RX internal
> delay, one might expect that the driver should disable both delays.  But
> this is not what the driver does.  It leaves the setting at the PHY's
> strapping's default.  And that default, for no pins with strapping
> resistors, is to have delay enabled and 2.00 ns.
> 
> Rather than change this behavior, I've kept it the same and documented
> it.  No delay will most likely not work and will break ethernet on any
> board using "rgmii" mode.  If the board is strapped to have a delay and
> is configured to use "rgmii" mode a warning is generated that "rgmii-id"
> should have been used.
> 
> Also validate the delay values and fail if they are not in range.
> 
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
