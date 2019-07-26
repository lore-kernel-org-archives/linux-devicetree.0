From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next 3/3] dt-bindings: net: ethernet: Update mt7622
 docs and dts to reflect the new phylink API
Date: Fri, 26 Jul 2019 14:19:05 +0100
Message-ID: <20190726131905.GP1330@shell.armlinux.org.uk>
References: <20190724192411.20639-1-opensource@vdorst.com>
 <20190725193123.GA32542@lunn.ch>
 <20190726071956.Horde.s4rfuzovwXB-d3LnV0PLRc8@www.vdorst.com>
 <20190726131604.GA18223@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190726131604.GA18223@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>, netdev@vger.kernel.org, frank-w@public-files.de, sean.wang@mediatek.com, f.fainelli@gmail.com, davem@davemloft.net, matthias.bgg@gmail.com, vivien.didelot@gmail.com, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 26, 2019 at 03:16:04PM +0200, Andrew Lunn wrote:
> Are you sure it is using SGMII and not 2500BaseX? Can you get access
> to the signalling word? SGMII is supposed to indicate to the MAC what
> speed it is using, via inband signalling. So there should not be any
> need for a fixed-link. 2500BaseX however does not have such
> signalling, so there would need to be a fixed link.
> 
> Maybe we should really consider what phy-mode = "sgmii"; means. Should
> this include the overclocked 2.5G speed, or should we add a 2500sgmii
> link mode?

Note that Documentation/networking/phy.rst now contains definitions
for SGMII, 1000BASE-X and 2500BASE-X.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
