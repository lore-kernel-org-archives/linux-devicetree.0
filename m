From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 3/4] net: dsa: LAN9303: add I2C managed mode support
Date: Tue, 11 Apr 2017 16:32:57 +0200
Message-ID: <20170411143257.GH27307@lunn.ch>
References: <20170411072259.15356-1-jbe@pengutronix.de>
 <20170411072259.15356-4-jbe@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170411072259.15356-4-jbe@pengutronix.de>
Sender: netdev-owner@vger.kernel.org
To: Juergen Borleis <jbe@pengutronix.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, f.fainelli@gmail.com, kernel@pengutronix.de, vivien.didelot@savoirfairelinux.com, davem@davemloft.net, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

On Tue, Apr 11, 2017 at 09:22:58AM +0200, Juergen Borleis wrote:
> In this mode the switch device and the internal phys will be managed via
> I2C interface. The MDIO interface is still supported, but for the
> (emulated) CPU port only.
> 
> Signed-off-by: Juergen Borleis <jbe@pengutronix.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
