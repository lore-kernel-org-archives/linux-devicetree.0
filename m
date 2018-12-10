From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH V2 RESEND 2/2] net: dsa: ksz: Add reset GPIO handling
Date: Mon, 10 Dec 2018 15:39:03 +0100
Message-ID: <20181210143903.GF4660@lunn.ch>
References: <20181210134306.8786-1-marex@denx.de>
 <20181210134306.8786-3-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181210134306.8786-3-marex@denx.de>
Sender: netdev-owner@vger.kernel.org
To: Marek Vasut <marex@denx.de>
Cc: netdev@vger.kernel.org, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, Woojung.Huh@microchip.com, UNGLinuxDriver@microchip.com, devicetree@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Tristram Ha <Tristram.Ha@microchip.com>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 10, 2018 at 02:43:06PM +0100, Marek Vasut wrote:
> Add code to handle optional reset GPIO in the KSZ switch driver. The switch
> has a reset GPIO line which can be controlled by the CPU, so make sure it is
> configured correctly in such setups.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
