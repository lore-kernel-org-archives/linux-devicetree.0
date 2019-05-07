From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net] dt-bindings: net: Fix a typo in the phy-mode list
 for ethernet bindings
Date: Tue, 7 May 2019 18:02:08 +0200
Message-ID: <20190507160208.GF25013@lunn.ch>
References: <20190507153555.18545-1-maxime.chevallier@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190507153555.18545-1-maxime.chevallier@bootlin.com>
Sender: netdev-owner@vger.kernel.org
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, thomas.petazzoni@bootlin.com, gregory.clement@bootlin.com
List-Id: devicetree@vger.kernel.org

On Tue, May 07, 2019 at 05:35:55PM +0200, Maxime Chevallier wrote:
> The phy_mode "2000base-x" is actually supposed to be "1000base-x", even
> though the commit title of the original patch says otherwise.
> 
> Fixes: 55601a880690 ("net: phy: Add 2000base-x, 2500base-x and rxaui modes")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
