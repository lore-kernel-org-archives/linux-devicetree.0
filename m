From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next 3/3] net: dsa: mt7530: Add support for port 5
Date: Sat, 27 Jul 2019 19:53:15 +0100
Message-ID: <20190727185315.GU1330@shell.armlinux.org.uk>
References: <20190724192549.24615-1-opensource@vdorst.com>
 <20190724192549.24615-4-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190724192549.24615-4-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Cc: netdev@vger.kernel.org, frank-w@public-files.de, sean.wang@mediatek.com, f.fainelli@gmail.com, davem@davemloft.net, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 24, 2019 at 09:25:49PM +0200, René van Dorst wrote:
> Adding support for port 5.
> 
> Port 5 can muxed/interface to:
> - internal 5th GMAC of the switch; can be used as 2nd CPU port or as
>   extra port with an external phy for a 6th ethernet port.
> - internal PHY of port 0 or 4; Used in most applications so that port 0
>   or 4 is the WAN port and interfaces with the 2nd GMAC of the SOC.

...

> @@ -1381,15 +1506,19 @@ static void mt7530_phylink_validate(struct dsa_switch *ds, int port,
>  	phylink_set_port_modes(mask);
>  	phylink_set(mask, Autoneg);
>  
> -	if (state->interface != PHY_INTERFACE_MODE_TRGMII) {
> +	if (state->interface == PHY_INTERFACE_MODE_TRGMII) {
> +		phylink_set(mask, 1000baseT_Full);
> +	} else {
>  		phylink_set(mask, 10baseT_Half);
>  		phylink_set(mask, 10baseT_Full);
>  		phylink_set(mask, 100baseT_Half);
>  		phylink_set(mask, 100baseT_Full);
> -		phylink_set(mask, 1000baseT_Half);
> -	}
>  
> -	phylink_set(mask, 1000baseT_Full);
> +		if (state->interface != PHY_INTERFACE_MODE_MII) {
> +			phylink_set(mask, 1000baseT_Half);
> +			phylink_set(mask, 1000baseT_Full);
> +		}
> +	}

As port 5 could use an external PHY, and it supports gigabit speeds,
consider that the PHY may provide not only copper but also fiber
connectivity, so port 5 should probably also have 1000baseX modes
too, which would allow such a PHY to bridge the switch to fiber.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
