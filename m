From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 3/7] net: phy: icplus: keep all ip101a_g functions
 together
Date: Sun, 18 Nov 2018 18:04:13 +0100
Message-ID: <20181118170413.GC5591@lunn.ch>
References: <20181117182007.14791-1-martin.blumenstingl@googlemail.com>
 <20181117182007.14791-4-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181117182007.14791-4-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 17, 2018 at 07:20:03PM +0100, Martin Blumenstingl wrote:
> This simply moves ip101a_g_config_init right above
> ip101a_g_config_intr so all functions for the ICPlus IP101A/G PHYs are
> grouped together.
> No functional changes.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
