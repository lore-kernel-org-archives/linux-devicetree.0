From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 13/15] net: phy: adin: configure downshift on
 config_init
Date: Thu, 8 Aug 2019 22:39:32 +0200
Message-ID: <20190808203932.GP27917@lunn.ch>
References: <20190808123026.17382-1-alexandru.ardelean@analog.com>
 <20190808123026.17382-14-alexandru.ardelean@analog.com>
 <420c8e15-3361-a722-4ad1-3c448b1d3bc1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <420c8e15-3361-a722-4ad1-3c448b1d3bc1@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandru Ardelean <alexandru.ardelean@analog.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Aug 08, 2019 at 09:38:40PM +0200, Heiner Kallweit wrote:
> On 08.08.2019 14:30, Alexandru Ardelean wrote:
> > Down-speed auto-negotiation may not always be enabled, in which case the
> > PHY won't down-shift to 100 or 10 during auto-negotiation.
> > 
> > This change enables downshift and configures the number of retries to
> > default 8 (maximum supported value).
> > 
> > The change has been adapted from the Marvell PHY driver.
> > 
> Instead of a fixed downshift setting (like in the Marvell driver) you
> may consider to implement the ethtool phy-tunable ETHTOOL_PHY_DOWNSHIFT.

Hi Alexandru

Upps, sorry, my bad.

I looked at marvell_set_downshift(), and assumed it was connected to
the phy-tunable. I have patches somewhere which does that. But they
have not made it into mainline yet.

> See the Aquantia PHY driver for an example.

Yes, that does have all the tunable stuff.

     Andrew
