From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 2/2] ARM: dts: vf610-zii-dev: use XAUI for DSA link
 ports
Date: Wed, 13 Dec 2017 14:59:40 -0500 (EST)
Message-ID: <20171213.145940.179880807681742911.davem@davemloft.net>
References: <E1eOgsp-0001Ab-9x@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <E1eOgsp-0001Ab-9x@rmk-PC.armlinux.org.uk>
Sender: netdev-owner@vger.kernel.org
To: rmk+kernel@armlinux.org.uk
Cc: andrew@lunn.ch, f.fainelli@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, netdev@vger.kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, shawnguo@kernel.org, stefan@agner.ch, vivien.didelot@savoirfairelinux.com
List-Id: devicetree@vger.kernel.org

From: Russell King <rmk+kernel@armlinux.org.uk>
Date: Tue, 12 Dec 2017 09:29:51 +0000

> Use XAUI rather than XGMII for DSA link ports, as this is the interface
> mode that the switches actually use. XAUI is the 4 lane bus with clock
> per direction, whereas XGMII is a 32 bit bus with clock.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
> This must be applied along with patch 1 to avoid breakage.

Applied.
